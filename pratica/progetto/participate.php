<?php

/**
 * Pagina di partecipazione ai quiz (versione con PDO)
 */

include 'includes/header.php';
require_once 'config/database.php'; // Assicurati che qui venga definito $pdo

// Controllo se l'utente è loggato
if (!isset($_SESSION['user'])) {
    header('Location: login.php');
    exit;
}

// Controllo se l'ID del quiz è stato fornito
if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    header('Location: index.php');
    exit;
}

$quiz_id = (int) $_GET['id'];
$user = $_SESSION['user']['nomeUtente'];
$today = date('Y-m-d');

try {
    // Verifica se il quiz esiste e se è disponibile
    $sql = "SELECT * FROM Quiz WHERE codice = :id AND dataInizio <= :today AND dataFine >= :today";
    $stmt = $pdo->prepare($sql);
    $stmt->execute(['id' => $quiz_id, 'today' => $today]);
    $quiz = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$quiz) {
        $_SESSION['error'] = "Quiz non disponibile o non esistente.";
        header('Location: index.php');
        exit;
    }

    // Verifica se l'utente ha già partecipato
    $sql = "SELECT * FROM Partecipazione WHERE utente = :utente AND quiz = :quiz";
    $stmt = $pdo->prepare($sql);
    $stmt->execute(['utente' => $user, 'quiz' => $quiz_id]);
    $participation = $stmt->fetch(PDO::FETCH_ASSOC);
    $has_participated = $participation !== false;

    $participation_id = null;

    if (!$has_participated) {
        // Inserisce la partecipazione
        $sql = "INSERT INTO Partecipazione (utente, quiz, data) VALUES (:utente, :quiz, :data)";
        $stmt = $pdo->prepare($sql);
        $stmt->execute(['utente' => $user, 'quiz' => $quiz_id, 'data' => $today]);
        $participation_id = $pdo->lastInsertId();
    } else {
        $participation_id = $participation['codice'];

        // Verifica se ci sono già risposte
        $sql = "SELECT COUNT(*) FROM RispostaUtenteQuiz WHERE partecipazione = :partecipazione";
        $stmt = $pdo->prepare($sql);
        $stmt->execute(['partecipazione' => $participation_id]);
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
    $stmt->execute(['quiz' => $quiz_id]);
    $questions = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Per ogni domanda, recupero le risposte
    foreach ($questions as &$question) {
        $sql = "SELECT * FROM Risposta WHERE quiz = :quiz AND domanda = :domanda ORDER BY numero";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'quiz' => $quiz_id,
            'domanda' => $question['numero']
        ]);
        $question['answers'] = $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

} catch (PDOException $e) {
    die("Errore DB: " . $e->getMessage());
}
?>

<div class="main-content">
    <div class="content">
        <h1>Partecipazione al Quiz: <?php echo htmlspecialchars($quiz['titolo']); ?></h1>
        
        <form id="participate-form">
            <input type="hidden" name="participation_id" value="<?php echo $participation_id; ?>">
            <input type="hidden" name="quiz_id" value="<?php echo $quiz_id; ?>">
            
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
