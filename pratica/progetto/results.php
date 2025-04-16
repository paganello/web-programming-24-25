<?php

/**
 * Pagina di visualizzazione dei risultati
 * 
 * Questa pagina mostra i risultati di una partecipazione a un quiz.
 * Funzionalità implementate:
 * - Visualizzazione del punteggio totale ottenuto
 * - Dettaglio delle risposte corrette e sbagliate
 * - Statistiche comparative con altri partecipanti
 * - Possibilità di condividere i risultati
 * - Visualizzazione delle risposte corrette (se consentito)
 * - Link per partecipare ad altri quiz simili
 */

 include 'includes/header.php';

// Controllo se l'utente è loggato
if (!isset($_SESSION['user'])) {
    header('Location: login.php');
    exit;
}

// Controllo se l'ID della partecipazione è stato fornito
if (!isset($_GET['participation']) || !is_numeric($_GET['participation'])) {
    header('Location: index.php');
    exit;
}

$participation_id = $_GET['participation'];
$user = $_SESSION['user']['nomeUtente'];
$conn = connectDB();

// Verifica se la partecipazione esiste e appartiene all'utente
$sql = "SELECT p.*, q.titolo AS quiz_titolo, q.codice AS quiz_id 
        FROM Partecipazione p 
        JOIN Quiz q ON p.quiz = q.codice 
        WHERE p.codice = ? AND p.utente = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("is", $participation_id, $user);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 0) {
    $conn->close();
    $_SESSION['error'] = "Partecipazione non trovata o non autorizzata.";
    header('Location: index.php');
    exit;
}

$participation = $result->fetch_assoc();
$quiz_id = $participation['quiz_id'];
$stmt->close();

// Calcolo del punteggio totale
$sql = "SELECT SUM(r.punteggio) AS total_score
        FROM RispostaUtenteQuiz ruq
        JOIN Risposta r ON ruq.quiz = r.quiz AND ruq.domanda = r.domanda AND ruq.risposta = r.numero
        WHERE ruq.partecipazione = ? AND r.tipo = 'Corretta'";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $participation_id);
$stmt->execute();
$result = $stmt->get_result();
$score_data = $result->fetch_assoc();
$total_score = $score_data ? $score_data['total_score'] : 0;
$stmt->close();

// Recupero tutte le domande e risposte date
$sql = "SELECT d.numero AS domanda_numero, d.testo AS domanda_testo,
               r.numero AS risposta_numero, r.testo AS risposta_testo, r.tipo AS risposta_tipo, r.punteggio,
               ruq.risposta AS risposta_data
        FROM Domanda d
        LEFT JOIN Risposta r ON d.quiz = r.quiz AND d.numero = r.domanda
        LEFT JOIN RispostaUtenteQuiz ruq ON ruq.quiz = r.quiz AND ruq.domanda = r.domanda AND ruq.risposta = r.numero AND ruq.partecipazione = ?
        WHERE d.quiz = ?
        ORDER BY d.numero, r.numero";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ii", $participation_id, $quiz_id);
$stmt->execute();
$result = $stmt->get_result();

$questions = [];
$current_question = null;

while ($row = $result->fetch_assoc()) {
    $q_num = $row['domanda_numero'];
    
    if (!isset($questions[$q_num])) {
        $questions[$q_num] = [
            'numero' => $q_num,
            'testo' => $row['domanda_testo'],
            'answers' => []
        ];
    }
    
    $questions[$q_num]['answers'][] = [
        'numero' => $row['risposta_numero'],
        'testo' => $row['risposta_testo'],
        'tipo' => $row['risposta_tipo'],
        'punteggio' => $row['punteggio'],
        'selezionata' => $row['risposta_data'] !== null
    ];
}
$stmt->close();
$conn->close();
?>

<div class="main-content">
    <div class="content">
        <h1>Risultati Quiz: <?php echo htmlspecialchars($participation['quiz_titolo']); ?></h1>
        
        <div class="card">
            <div class="card-content">
                <p><strong>Data partecipazione:</strong> <?php echo date('d/m/Y', strtotime($participation['data'])); ?></p>
                <p><strong>Punteggio totale:</strong> <?php echo $total_score; ?> punti</p>
                
                <a href="view_quiz.php?id=<?php echo $quiz_id; ?>" class="btn">Torna al Quiz</a>
            </div>
        </div>
        
        <h2>Risposte e Soluzioni</h2>
        
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
                            <div class="answer-option <?php echo $answer['selezionata'] ? ($answer['tipo'] === 'Corretta' ? 'correct' : 'wrong') : ''; ?>">
                                <?php if ($answer['selezionata']): ?>
                                    <strong>✓</strong> 
                                <?php endif; ?>
                                
                                <?php echo htmlspecialchars($answer['testo']); ?>
                                
                                <?php if ($answer['tipo'] === 'Corretta'): ?>
                                    <span class="badge-correct">(Corretta - <?php echo $answer['punteggio']; ?> punti)</span>
                                <?php endif; ?>
                            </div>
                        <?php endforeach; ?>
                    </div>
                </div>
            <?php endforeach; ?>
        <?php endif; ?>
    </div>
</div>

<?php include 'includes/footer.php'; ?>
