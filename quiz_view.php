<?php

/**
 * Pagina di visualizzazione dettagliata di un quiz.
 * 
 * Questa pagina mostra i dettagli di un quiz specifico, comprese le domande e le risposte.
 */

include 'includes/header.php';
require_once 'config/database.php';

// Controllo se l'ID del quiz è stato fornito.
if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    header('Location: index.php');
    exit;
}

$quiz_id = (int) $_GET['id'];

try {
    $sql = "SELECT q.*, u.nome, u.cognome 
            FROM Quiz q 
            JOIN Utente u ON q.creatore = u.nomeUtente 
            WHERE q.codice = :quiz_id";
    $stmt = $pdo->prepare($sql);
    $stmt->execute(['quiz_id' => $quiz_id]);
    $quiz = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$quiz) {
        header('Location: index.php');
        exit;
    }

    // Controllo se l'utente può partecipare.
    $today = date('Y-m-d');
    $can_participate = isset($_SESSION['user']) && $quiz['dataFine'] >= $today;

    // Recupero tutte le domande del quiz.
    $sql = "SELECT * FROM Domanda WHERE quiz = :quiz_id ORDER BY numero";
    $stmt = $pdo->prepare($sql);
    $stmt->execute(['quiz_id' => $quiz_id]);
    $questions = $stmt->fetchAll(PDO::FETCH_ASSOC);

    foreach ($questions as $i => $question) {
        // Carica le risposte.
        $sql = "SELECT * FROM Risposta WHERE quiz = :quiz AND domanda = :domanda ORDER BY numero";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'quiz' => $quiz_id,
            'domanda' => $question['numero']
        ]);
        $questions[$i]['answers'] = $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

} catch (PDOException $e) {
    die("Errore DB: " . $e->getMessage());
}
?>

<div class="main-content">
    <div class="content">
        <a href="index.php" class="btn">⟵ Torna alla Home</a>
        <h1><?php echo htmlspecialchars($quiz['titolo']); ?></h1>

        <div class="card">
            <div class="card-content">
                <p><strong>Creato da:</strong> <?php echo htmlspecialchars($quiz['nome'] . ' ' . $quiz['cognome']); ?>
                </p>
                <p><strong>Disponibile dal:</strong> <?php echo date('d/m/Y', strtotime($quiz['dataInizio'])); ?>
                    <strong>al:</strong> <?php echo date('d/m/Y', strtotime($quiz['dataFine'])); ?></p>

                <?php if ($can_participate): ?>
                    <br />
                    <p>
                        <a href="quiz_participate.php?id=<?php echo $quiz_id; ?>" class="btn">Partecipa al Quiz</a>
                    </p>
                <?php elseif (!isset($_SESSION['user'])): ?>
                    <p>
                        Effettua il <a href="auth_login.php">login</a> per partecipare a questo quiz.
                    </p>
                <?php elseif ($quiz['dataFine'] < $today): ?>
                    <p>
                        Questo quiz non è più disponibile.
                    </p>
                <?php endif; ?>
            </div>
        </div>

        <h2>Anteprima delle Domande</h2>

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
                                <?php echo htmlspecialchars($answer['testo']); ?>
                            </div>
                        <?php endforeach; ?>
                    </div>
                </div>
            <?php endforeach; ?>
        <?php endif; ?>
    </div>
</div>

<?php include 'includes/footer.php'; ?>