<?php
/**
 * Pagina di visualizzazione dettagliata di un quiz.
 *
 * Questa pagina mostra i dettagli di un quiz specifico, comprese le domande e le risposte.
 * Design migliorato con interfaccia moderna e responsive.
 */
include 'includes/header.php'; // IMPORTANTE: Assicurati che questo file includa i link a style.css e Font Awesome
require_once 'config/database.php';

// Controllo se l'ID del quiz è stato fornito
if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    header('Location: index.php');
    exit;
}

$quiz_id = (int) $_GET['id'];
$quiz = null;
$questions = [];
$quiz_status = '';
$status_text = '';
$status_icon = 'question-circle'; // Icona di default

try {
    // Recupero informazioni sul quiz
    $sql_quiz = "SELECT q.*, u.nome, u.cognome
                 FROM Quiz q
                 JOIN Utente u ON q.creatore = u.nomeUtente
                 WHERE q.codice = :quiz_id";
    $stmt_quiz = $pdo->prepare($sql_quiz);
    $stmt_quiz->execute(['quiz_id' => $quiz_id]);
    $quiz = $stmt_quiz->fetch(PDO::FETCH_ASSOC);
    
    if (!$quiz) {
        // Potresti voler mostrare una pagina 404 o un messaggio più specifico
        header('Location: index.php'); 
        exit;
    }
    
    // Controllo se l'utente può partecipare
    $today = date('Y-m-d');
    $can_participate = isset($_SESSION['user']) && ($quiz['dataInizio'] <= $today && $quiz['dataFine'] >= $today);
    
    // Stato del quiz (per badge)
    if ($quiz['dataInizio'] > $today) {
        $quiz_status = 'pending';
        $status_text = 'In attesa';
        $status_icon = 'clock';
    } elseif ($quiz['dataFine'] < $today) {
        $quiz_status = 'expired';
        $status_text = 'Scaduto';
        $status_icon = 'calendar-times';
    } else {
        $quiz_status = 'available';
        $status_text = 'Disponibile';
        $status_icon = 'check-circle';
    }
    
    // Recupero tutte le domande del quiz
    $sql_questions = "SELECT * FROM Domanda WHERE quiz = :quiz_id ORDER BY numero";
    $stmt_questions = $pdo->prepare($sql_questions);
    $stmt_questions->execute(['quiz_id' => $quiz_id]);
    $questions_data = $stmt_questions->fetchAll(PDO::FETCH_ASSOC); // Rinomino per chiarezza
    
    foreach ($questions_data as $i => $question_item) { // Rinomino per chiarezza
        // Carica le risposte
        $sql_answers = "SELECT * FROM Risposta WHERE quiz = :quiz_id AND domanda = :domanda_numero ORDER BY numero";
        $stmt_answers = $pdo->prepare($sql_answers);
        $stmt_answers->execute([
            'quiz_id' => $quiz_id,
            'domanda_numero' => $question_item['numero']
        ]);
        $question_item['answers'] = $stmt_answers->fetchAll(PDO::FETCH_ASSOC);
        $questions[] = $question_item; // Aggiungo la domanda processata all'array finale
    }

} catch (PDOException $e) {
    // In produzione, logga l'errore e mostra un messaggio generico all'utente
    error_log("Errore DB in quiz_detail.php: " . $e->getMessage());
    die("Si è verificato un errore nel caricamento dei dati del quiz. Si prega di riprovare più tardi o contattare l'assistenza.");
}
?>

<div class="main-content">
    <div class="content">
        <?php /* Se hai un breadcrumb, inseriscilo qui, ad esempio:
        <nav class="breadcrumb-nav" aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.php"><i class="fas fa-home"></i> Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Dettagli Quiz</li>
            </ol>
        </nav>
        */ ?>

        <?php if ($quiz): // Controlla se $quiz è stato caricato prima di usarlo ?>
        <div class="quiz-detail-header">
            <h1><?php echo htmlspecialchars($quiz['titolo']); ?></h1>
            <span class="status-badge <?php echo htmlspecialchars($quiz_status); ?>">
                <i class="fas fa-<?php echo htmlspecialchars($status_icon); ?>"></i>
                <?php echo htmlspecialchars($status_text); ?>
            </span>
        </div>
        
        <div class="quiz-detail-card">
            <div class="quiz-info-grid">
                <div class="quiz-info-item">
                    <i class="fas fa-user"></i>
                    <div>
                        <span class="info-label">Creato da</span>
                        <span class="info-value"><?php echo htmlspecialchars($quiz['nome'] . ' ' . $quiz['cognome']); ?></span>
                    </div>
                </div>
                
                <div class="quiz-info-item">
                    <i class="fas fa-calendar-alt"></i>
                    <div>
                        <span class="info-label">Data di inizio</span>
                        <span class="info-value"><?php echo date('d/m/Y', strtotime($quiz['dataInizio'])); ?></span>
                    </div>
                </div>
                
                <div class="quiz-info-item">
                    <i class="fas fa-calendar-check"></i>
                    <div>
                        <span class="info-label">Data di fine</span>
                        <span class="info-value"><?php echo date('d/m/Y', strtotime($quiz['dataFine'])); ?></span>
                    </div>
                </div>
                
                <?php if (!empty($quiz['descrizione'])): ?>
                <div class="quiz-info-item quiz-description">
                    <i class="fas fa-info-circle"></i>
                    <div>
                        <span class="info-label">Descrizione</span>
                        <span class="info-value"><?php echo nl2br(htmlspecialchars($quiz['descrizione'])); ?></span>
                    </div>
                </div>
                <?php endif; ?>
            </div>
            
            <?php if ($can_participate): ?>
            <div class="quiz-action-container">
                <a href="quiz_participate.php?id=<?php echo $quiz_id; ?>" class="btn btn-participate">
                    <i class="fas fa-play-circle"></i> Partecipa al Quiz
                </a>
            </div>
            <?php elseif (!isset($_SESSION['user'])): ?>
            <div class="quiz-action-container login-prompt">
                <p>
                    <i class="fas fa-lock"></i>
                    Effettua il <a href="auth_login.php" class="text-link">login</a> per partecipare a questo quiz.
                </p>
            </div>
            <?php elseif ($quiz_status === 'pending'): ?>
            <div class="quiz-action-container pending-notice">
                 <p>
                    <i class="fas fa-clock"></i>
                    Questo quiz non è ancora iniziato. Sarà disponibile dal <?php echo date('d/m/Y', strtotime($quiz['dataInizio'])); ?>.
                </p>
            </div>
            <?php elseif ($quiz_status === 'expired'): ?>
            <div class="quiz-action-container expired-notice">
                <p>
                    <i class="fas fa-exclamation-circle"></i>
                    Questo quiz è scaduto il <?php echo date('d/m/Y', strtotime($quiz['dataFine'])); ?> e non è più disponibile.
                </p>
            </div>
            <?php endif; ?>
        </div>
        <?php else: ?>
            <p class="no-results">Dettagli del quiz non disponibili.</p>
        <?php endif; // Fine controllo $quiz ?>

        <div class="questions-preview-section">
            <h2><i class="fas fa-list-ul"></i> Anteprima delle Domande</h2>
            
            <?php if (empty($questions)): ?>
            <div class="no-questions-notice">
                <i class="fas fa-info-circle"></i>
                <p>Nessuna domanda disponibile per questo quiz al momento.</p>
            </div>
            <?php else: ?>
            <div class="questions-accordion">
                <?php
                $numeroDomandaVisualizzato = 1;
                 foreach ($questions as $index => $question): ?>
                <div class="question-card open">
                    <div class="question-header" role="button" tabindex="0" aria-expanded="true" aria-controls="question-content-<?php echo $index; ?>">
                        <span class="question-number">Domanda <?php echo $numeroDomandaVisualizzato; ?></span>
                        <div class="question-toggle"><i class="fas fa-chevron-down"></i></div>
                    </div>
                    <div class="question-content-wrapper" id="question-content-<?php echo $index; ?>">
                        <div class="question-text">
                            <?php echo nl2br(htmlspecialchars($question['testo'])); ?>
                        </div>
                        <?php if (!empty($question['answers'])): ?>
                        <ul class="answer-options">
                            <?php foreach ($question['answers'] as $answer): ?>
                            <li class="answer-option">
                                <span class="option-marker"><?php echo chr(64 + $answer['numero']); ?>.</span>
                                <span class="option-text"><?php echo htmlspecialchars($answer['testo']); ?></span>
                            </li>
                            <?php endforeach; ?>
                        </ul>
                        <?php else: ?>
                        <p class="no-answers-notice">Nessuna opzione di risposta fornita per questa domanda.</p>
                        <?php endif; ?>
                    </div>
                </div>
                <?php
                $numeroDomandaVisualizzato++;
                endforeach; ?>
            </div>
            <?php endif; ?>
        </div>
    </div><!-- /.content -->
</div><!-- /.main-content -->

<?php include 'includes/footer.php'; ?>