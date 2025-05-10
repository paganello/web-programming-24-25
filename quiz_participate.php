<?php

/**
 * Pagina di partecipazione al Quiz.
 * 
 * Questa pagina permette agli utenti di partecipare a un quiz esistente.
 */

include 'includes/header.php';
require_once 'config/database.php';

// Controllo se l'utente è loggato.
if (!isset($_SESSION['user']) || !isset($_SESSION['user']['nomeUtente'])) {
    header('Location: auth_login.php');
    exit;
}

// Controllo se l'ID del quiz è stato fornito.
if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    header('Location: index.php');
    exit;
}

$quiz_id = (int) $_GET['id'];
$user = $_SESSION['user']['nomeUtente'];
$today = date('Y-m-d');

try {
    // --- Verifica partecipazione ---
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

    // --- Recupero domande ---
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
        shuffle($question['answers']);
    }
    unset($question);

    shuffle($questions);

} catch (PDOException $e) {
    die("Errore DB: " . $e->getMessage());
}

$i = 0;
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
                            Domanda <?php $i++;
                            $j = 0;
                            echo $i; ?>: <?php echo htmlspecialchars($question['testo']); ?>
                        </div>

                        <div class="answer-options">
                            <?php foreach ($question['answers'] as $answer): ?>
                                <div class="answer-option">
                                    <label>
                                        <input type="checkbox" name="answers[<?php echo $question['numero']; ?>][]"
                                            value="<?php $j++;
                                            echo $i; ?>">
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