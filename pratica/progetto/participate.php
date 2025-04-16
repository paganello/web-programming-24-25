<?php

/**
 * Pagina di partecipazione ai quiz
 * 
 * Questa pagina permette agli utenti di partecipare a un quiz specifico.
 * Funzionalità implementate:
 * - Visualizzazione delle domande del quiz
 * - Form per la selezione delle risposte
 * - Controllo in tempo reale delle risposte (opzionale)
 * - Invio delle risposte e registrazione della partecipazione
 * - Timer per quiz a tempo limitato (se implementato)
 * - Visualizzazione del punteggio al termine del quiz
 */

include 'includes/header.php';

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

$quiz_id = $_GET['id'];
$user = $_SESSION['user']['nomeUtente'];
$conn = connectDB();

// Verifica se il quiz esiste e se è disponibile
$today = date('Y-m-d');
$sql = "SELECT * FROM Quiz WHERE codice = ? AND dataInizio <= ? AND dataFine >= ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("iss", $quiz_id, $today, $today);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 0) {
    $conn->close();
    $_SESSION['error'] = "Quiz non disponibile o non esistente.";
    header('Location: index.php');
    exit;
}

$quiz = $result->fetch_assoc();
$stmt->close();

// Verifica se l'utente ha già partecipato a questo quiz
$sql = "SELECT * FROM Partecipazione WHERE utente = ? AND quiz = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("si", $user, $quiz_id);
$stmt->execute();
$result = $stmt->get_result();
$has_participated = $result->num_rows > 0;
$stmt->close();

// Se non ha già partecipato, crea una nuova partecipazione
$participation_id = null;
if (!$has_participated) {
    $sql = "INSERT INTO Partecipazione (utente, quiz, data) VALUES (?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sis", $user, $quiz_id, $today);
    $stmt->execute();
    $participation_id = $conn->insert_id;
    $stmt->close();
} else {
    $participation = $result->fetch_assoc();
    $participation_id = $participation['codice'];
    
    // Verifica se ha già inviato risposte
    $sql = "SELECT * FROM RispostaUtenteQuiz WHERE partecipazione = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $participation_id);
    $stmt->execute();
    $result = $stmt->get_result();
    $has_answers = $result->num_rows > 0;
    $stmt->close();
    
    if ($has_answers) {
        $conn->close();
        $_SESSION['error'] = "Hai già partecipato a questo quiz.";
        header('Location: results.php?participation=' . $participation_id);
        exit;
    }
}

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
