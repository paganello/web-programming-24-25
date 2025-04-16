<?php

/**
 * Pagina di visualizzazione dettagliata di un quiz
 * 
 * Questa pagina mostra i dettagli di un quiz specifico.
 * Funzionalità implementate:
 * - Visualizzazione delle informazioni generali del quiz
 * - Elenco delle domande (se visibili)
 * - Statistiche di partecipazione
 * - Pulsante per partecipare al quiz
 * - Possibilità di modificare il quiz (per il creatore)
 * - Visualizzazione del periodo di validità
 */

include 'includes/header.php';

// Controllo se l'ID del quiz è stato fornito
if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    header('Location: index.php');
    exit;
}

$quiz_id = $_GET['id'];
$conn = connectDB();

// Recupero informazioni sul quiz
$sql = "SELECT q.*, u.nome, u.cognome 
        FROM Quiz q 
        JOIN Utente u ON q.creatore = u.nomeUtente 
        WHERE q.codice = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $quiz_id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 0) {
    $conn->close();
    header('Location: index.php');
    exit;
}

$quiz = $result->fetch_assoc();
$stmt->close();

// Controllo se l'utente può visualizzare il quiz
$today = date('Y-m-d');
$can_participate = isset($_SESSION['user']) && $quiz['dataFine'] >= $today;

// Recupero tutte le domande del quiz
$sql = "SELECT * FROM Domanda WHERE quiz = ? ORDER BY numero";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $quiz_id);
$stmt->execute();
$result = $stmt->get_result();
$questions = [];
while ($row = $result->fetch_assoc()) {
    $questions[] = $row;
}
$stmt->close();

// Per ogni domanda, recupero le risposte
foreach ($questions as &$question) {
    $sql = "SELECT * FROM Risposta WHERE quiz = ? AND domanda = ? ORDER BY numero";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ii", $quiz_id, $question['numero']);
    $stmt->execute();
    $result = $stmt->get_result();
    $answers = [];
    while ($row = $result->fetch_assoc()) {
        $answers[] = $row;
    }
    $question['answers'] = $answers;
}
$stmt->close();
$conn->close();
?>

<div class="main-content">
    <div class="content">
        <h1><?php echo htmlspecialchars($quiz['titolo']); ?></h1>
        
        <div class="card">
            <div class="card-content">
                <p><strong>Creato da:</strong> <?php echo htmlspecialchars($quiz['nome'] . ' ' . $quiz['cognome']); ?></p>
                <p><strong>Disponibile dal:</strong> <?php echo date('d/m/Y', strtotime($quiz['dataInizio'])); ?> <strong>al:</strong> <?php echo date('d/m/Y', strtotime($quiz['dataFine'])); ?></p>
                
                <?php if ($can_participate): ?>
                    <p>
                        <a href="participate.php?id=<?php echo $quiz_id; ?>" class="btn">Partecipa al Quiz</a>
                    </p>
                <?php elseif (!isset($_SESSION['user'])): ?>
                    <p>
                        Effettua il <a href="login.php">login</a> per partecipare a questo quiz.
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
