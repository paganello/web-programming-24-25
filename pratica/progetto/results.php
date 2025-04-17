<?php

/**
 * Pagina di visualizzazione dei risultati di un quiz
 * 
 * Questa pagina mostra i risultati di un quiz a cui l'utente ha partecipato.
 * Funzionalità principali:
 * - Recupero dei dettagli della partecipazione
 * - Calcolo del punteggio totale
 * - Visualizzazione delle domande e delle risposte date
 * - Evidenziazione delle risposte corrette e sbagliate
 */

include 'includes/header.php';
require_once 'config/database.php'; // Assicurati che venga creato $pdo

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

$participation_id = (int) $_GET['participation'];
$user = $_SESSION['user']['nomeUtente'];

try {
    // Verifica partecipazione
    $sql = "SELECT p.*, q.titolo AS quiz_titolo, q.codice AS quiz_id 
            FROM Partecipazione p 
            JOIN Quiz q ON p.quiz = q.codice 
            WHERE p.codice = :id AND p.utente = :utente";
    $stmt = $pdo->prepare($sql);
    $stmt->execute(['id' => $participation_id, 'utente' => $user]);
    $participation = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$participation) {
        $_SESSION['error'] = "Partecipazione non trovata o non autorizzata.";
        header('Location: index.php');
        exit;
    }

    $quiz_id = $participation['quiz_id'];

    // Calcolo del punteggio totale
    $sql = "SELECT SUM(r.punteggio) AS total_score
            FROM RispostaUtenteQuiz ruq
            JOIN Risposta r ON ruq.quiz = r.quiz AND ruq.domanda = r.domanda AND ruq.risposta = r.numero
            WHERE ruq.partecipazione = :id AND r.tipo = 'Corretta'";
    $stmt = $pdo->prepare($sql);
    $stmt->execute(['id' => $participation_id]);
    $score_data = $stmt->fetch(PDO::FETCH_ASSOC);
    $total_score = isset($score_data['total_score']) && $score_data['total_score'] !== NULL ? $score_data['total_score'] : 0;

    // Recupero tutte le domande e risposte date
    $sql = "SELECT d.numero AS domanda_numero, d.testo AS domanda_testo,
                   r.numero AS risposta_numero, r.testo AS risposta_testo, r.tipo AS risposta_tipo, r.punteggio,
                   ruq.risposta AS risposta_data
            FROM Domanda d
            LEFT JOIN Risposta r ON d.quiz = r.quiz AND d.numero = r.domanda
            LEFT JOIN RispostaUtenteQuiz ruq ON ruq.quiz = r.quiz AND ruq.domanda = r.domanda AND ruq.risposta = r.numero AND ruq.partecipazione = :partecipazione
            WHERE d.quiz = :quiz
            ORDER BY d.numero, r.numero";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([
        'partecipazione' => $participation_id,
        'quiz' => $quiz_id
    ]);

    $questions = [];

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
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

} catch (PDOException $e) {
    die("Errore DB: " . $e->getMessage());
}
?>

<div class="main-content">
    <div class="content">
        <h1>Risultati Quiz: <?php echo htmlspecialchars($participation['quiz_titolo']); ?></h1>

        <div class="card">
            <div class="card-content">
                <p><strong>Data partecipazione:</strong> <?php echo date('d/m/Y', strtotime($participation['data'])); ?>
                </p>
                <p><strong>Punteggio totale:</strong> <?php echo $total_score; ?> punti</p>

                <a href="quiz_view.php?id=<?php echo $quiz_id; ?>" class="btn">Torna al Quiz</a>
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
                            <div
                                class="answer-option <?php echo $answer['selezionata'] ? ($answer['tipo'] === 'Corretta' ? 'correct' : 'wrong') : ''; ?>">
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