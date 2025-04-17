<?php

/**
 * Partecipazione al Quiz
 * 
 * Questo script gestisce la partecipazione degli utenti a un quiz.
 * Funzionalità principali:
 * - Controlla se l'utente è loggato, se il quiz è disponibile e se l'utente ha già partecipato.
 * - Recupera le domande e le risposte associate al quiz.
 * - Mostra il form per la partecipazione al quiz.
 * - Invia le risposte al server per la registrazione.
 */
include 'includes/header.php';
require_once 'config/database.php';

if (!isset($_SESSION['user']) || !isset($_SESSION['user']['nomeUtente'])) {
    header('Location: login.php');
    exit;
}

if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    header('Location: index.php');
    exit;
}

$quiz_id = (int) $_GET['id'];
$user = $_SESSION['user']['nomeUtente'];
$today = date('Y-m-d');

try {
    // Verifica se il quiz esiste e se è disponibile
    $sql = "SELECT * FROM Quiz WHERE codice = :id AND dataInizio <= :oggi1 AND dataFine >= :oggi2";
    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':id', $quiz_id, PDO::PARAM_INT);
    $stmt->bindParam(':oggi1', $today, PDO::PARAM_STR);
    $stmt->bindParam(':oggi2', $today, PDO::PARAM_STR);
    $stmt->execute();
    $quiz = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$quiz) {
       $_SESSION['error'] = "Quiz non disponibile o non esistente.";
       header('Location: index.php');
       exit;
    }

    // Verifica se l'utente ha già partecipato
    $sql = "SELECT * FROM Partecipazione WHERE utente = :utente AND quiz = :quiz";
    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':utente', $user, PDO::PARAM_STR);
    $stmt->bindParam(':quiz', $quiz_id, PDO::PARAM_INT);
    $stmt->execute();
    $participation = $stmt->fetch(PDO::FETCH_ASSOC);
    $has_participated = $participation !== false;

    $participation_id = null;

    if (!$has_participated) {
        // Inserisce la partecipazione
        $sql = "INSERT INTO Partecipazione (utente, quiz, data) VALUES (:utente, :quiz, :data)";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':utente', $user, PDO::PARAM_STR);
        $stmt->bindParam(':quiz', $quiz_id, PDO::PARAM_INT);
        $stmt->bindParam(':data', $today, PDO::PARAM_STR);
        $stmt->execute();
        $participation_id = $pdo->lastInsertId();
    } else {
        $participation_id = $participation['codice'];

        // Verifica se ci sono già risposte
        $sql = "SELECT COUNT(*) FROM RispostaUtenteQuiz WHERE partecipazione = :partecipazione";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':partecipazione', $participation_id, PDO::PARAM_INT);
        $stmt->execute();
        $has_answers = $stmt->fetchColumn() > 0;

        if ($has_answers) {
            $_SESSION['error'] = "Hai già partecipato a questo quiz.";
            header("Location: results.php?participation=$participation_id");
            exit;
        }
    }

    // Recupero le domande
    $sql = "SELECT * FROM Domanda WHERE quiz = :quiz ORDER BY numero";
    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':quiz', $quiz_id, PDO::PARAM_INT);
    $stmt->execute();
    $questions = $stmt->fetchAll(PDO::FETCH_ASSOC);

    foreach ($questions as &$question) {
        $sql = "SELECT * FROM Risposta WHERE quiz = :quiz AND domanda = :domanda ORDER BY numero";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':quiz', $quiz_id, PDO::PARAM_INT);
        $stmt->bindParam(':domanda', $question['numero'], PDO::PARAM_INT);
        $stmt->execute();
        $question['answers'] = $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    unset($question);

} catch (PDOException $e) {
    die("Errore DB: " . $e->getMessage());
}
?>


<div class="main-content">
    <div class="content">
        <h1>Partecipazione al Quiz: <?php echo htmlspecialchars($quiz['titolo']); ?></h1>
        
        <form id="participate-form">
            <input type="hidden" name="participation_id" value="<?php echo $participation_id; ?>">
            <input type="hidden" name="idQuiz" value="<?php echo $quiz_id; ?>">
            
            <?php if (empty($questions)): ?>
                <p>Nessuna domanda trovata per questo quiz.</p>
            <?php else: ?>
                <?php foreach ($questions as $question): ?>
                    <div class="question-item">
                        <div class="question-text">
                            Domanda <?php echo $question['numero']; ?>: <?php echo htmlspecialchars($question['testo']); ?>
                        </div>
                        
                        <div class="answer-options">
                            <?php foreach ($question['answers'] as $answer): ?>
                                <div class="answer-option">
                                    <label>
                                        <input type="checkbox" name="answers[<?php echo $question['numero']; ?>][]" value="<?php echo $answer['numero']; ?>">
                                        <?php echo htmlspecialchars($answer['testo']); ?>
                                    </label>
                                </div>
                            <?php endforeach; ?>
                        </div>
                    </div>
                <?php endforeach; ?>
                
                <div class="form-group">
                    <button type="submit" class="btn">Invia Risposte</button>
                </div>
            <?php endif; ?>
        </form>
    </div>
</div>

<?php include 'includes/footer.php'; ?>
