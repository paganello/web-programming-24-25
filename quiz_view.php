<?php
/**
 * Pagina di Visualizzazione Dettagli Quiz (Anteprima).
 *
 * Questa pagina mostra i dettagli completi di un quiz, incluse le sue domande
 * e le relative opzioni di risposta. Fornisce anche informazioni sullo stato
 * del quiz (disponibile, in attesa, scaduto) e un pulsante per partecipare
 * se le condizioni sono soddisfatte.
 */

// Include l'header comune (gestisce session_start, config DB, CSS, etc.).
include 'includes/header.php';

// Include il file di configurazione del database per la connessione.
require_once 'config/database.php';

// --- Validazione ID Quiz ---
// Verifica che l'ID del quiz sia presente nella query string e sia un numero valido.
// Se non valido, reindirizza all'index (o a una pagina di errore).
if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    header('Location: index.php');
    exit;
}
$quiz_id = (int) $_GET['id']; // ID del quiz da visualizzare.

// Inizializzazione variabili per i dati del quiz e stato.
$quiz = null;                   // Dati del quiz.
$questions = [];                // Array delle domande con le loro risposte.
$questions_data = [];           // Dati grezzi delle domande (usato per controllo).
$quiz_status = '';              // Stato del quiz (es. 'available', 'pending', 'expired').
$status_text = '';              // Testo descrittivo dello stato.
$status_icon = 'question-circle'; // Icona Font Awesome per lo stato.

try {
    // --- Recupero Dati del Quiz dal Database ---
    // Seleziona i dettagli del quiz e le informazioni del creatore.
    $sql_quiz = "SELECT q.*, u.nome, u.cognome
                 FROM Quiz q
                 JOIN Utente u ON q.creatore = u.nomeUtente
                 WHERE q.codice = :quiz_id";
    $stmt_quiz = $pdo->prepare($sql_quiz);
    $stmt_quiz->execute(['quiz_id' => $quiz_id]);
    $quiz = $stmt_quiz->fetch(PDO::FETCH_ASSOC); // Recupera i dati del quiz.

    // Se il quiz è stato trovato:
    if ($quiz) {
        // --- Recupero Domande del Quiz ---
        $sql_questions_load = "SELECT * FROM Domanda WHERE quiz = :quiz_id ORDER BY numero ASC";
        $stmt_questions_load = $pdo->prepare($sql_questions_load);
        $stmt_questions_load->execute(['quiz_id' => $quiz_id]);
        $questions_data = $stmt_questions_load->fetchAll(PDO::FETCH_ASSOC); // Dati grezzi delle domande.

        // Se ci sono domande, recupera le relative opzioni di risposta.
        if (!empty($questions_data)) {
            foreach ($questions_data as $question_item) {
                // Per ogni domanda, seleziona le sue opzioni di risposta.
                $sql_answers = "SELECT * FROM Risposta WHERE quiz = :quiz_id AND domanda = :domanda_numero ORDER BY numero ASC";
                $stmt_answers = $pdo->prepare($sql_answers);
                $stmt_answers->execute([
                    'quiz_id' => $quiz_id,
                    'domanda_numero' => $question_item['numero']
                ]);
                $question_item['answers'] = $stmt_answers->fetchAll(PDO::FETCH_ASSOC); // Aggiunge le risposte all'array della domanda.
                $questions[] = $question_item; // Aggiunge la domanda (con le sue risposte) all'array finale.
            }
        }

        // --- Determinazione dello Stato del Quiz (Disponibile, In Attesa, Scaduto) ---
        $today = date('Y-m-d'); // Data odierna.
        $user_logged_in = isset($_SESSION['user']); // Verifica se l'utente è loggato.
        // Condizione per poter partecipare: utente loggato, quiz attivo e con domande.
        $can_participate = $user_logged_in &&
                           ($quiz['dataInizio'] <= $today && $quiz['dataFine'] >= $today) &&
                           !empty($questions_data);

        // Imposta lo stato, il testo e l'icona in base alle date del quiz.
        if ($quiz['dataInizio'] > $today) { // Quiz non ancora iniziato.
            $quiz_status = 'pending';
            $status_text = 'Prossimamente'; // Testo più user-friendly
            $status_icon = 'clock';
        } elseif ($quiz['dataFine'] < $today) { // Quiz scaduto.
            $quiz_status = 'expired';
            $status_text = 'Scaduto';
            $status_icon = 'calendar-times';
        } else { // Quiz attualmente disponibile.
            $quiz_status = 'available';
            $status_text = 'Disponibile';
            $status_icon = 'check-circle';
        }
    }

} catch (PDOException $e) { // Gestione errori database.
    error_log("Errore DB in quiz_view.php (ID: $quiz_id): " . $e->getMessage());
    // Mostra un messaggio di errore generico e termina l'esecuzione.
    die("<div class='container' style='padding-top:20px;'><div class='alert alert-danger'>Si è verificato un errore nel caricamento dei dati del quiz. Si prega di riprovare più tardi o contattare l'assistenza.</div></div>");
}
?>

<!-- Contenuto principale della pagina di visualizzazione quiz -->
<div class="main-content"> <!-- Questo potrebbe essere .container main-content-page-padding per coerenza -->
    <div class="content"> <!-- Contenitore interno per il contenuto effettivo -->
        <?php if ($quiz): // Se il quiz è stato trovato e caricato ?>
            <!-- Header con titolo del quiz e badge di stato -->
            <div class="quiz-detail-header">
                <h1><?php echo htmlspecialchars($quiz['titolo'], ENT_QUOTES, 'UTF-8'); ?></h1>
                <span class="status-badge <?php echo htmlspecialchars($quiz_status, ENT_QUOTES, 'UTF-8'); ?>">
                    <i class="fas fa-<?php echo htmlspecialchars($status_icon, ENT_QUOTES, 'UTF-8'); ?>"></i>
                    <?php echo htmlspecialchars($status_text, ENT_QUOTES, 'UTF-8'); ?>
                </span>
            </div>

            <!-- Card con i dettagli informativi del quiz -->
            <div class="quiz-detail-card">
                <div class="quiz-info-grid"> <!-- Griglia per visualizzare le info del quiz -->
                    <div class="quiz-info-item">
                        <i class="fas fa-user"></i> <!-- Icona creatore -->
                        <div>
                            <span class="info-label">Creato da</span>
                            <span class="info-value"><?php echo htmlspecialchars($quiz['nome'] . ' ' . $quiz['cognome'], ENT_QUOTES, 'UTF-8'); ?></span>
                        </div>
                    </div>
                    <div class="quiz-info-item">
                        <i class="fas fa-calendar-alt"></i> <!-- Icona data inizio -->
                        <div>
                            <span class="info-label">Data di inizio</span>
                            <span class="info-value"><?php echo date('d/m/Y', strtotime($quiz['dataInizio'])); ?></span>
                        </div>
                    </div>
                    <div class="quiz-info-item">
                        <i class="fas fa-calendar-check"></i> <!-- Icona data fine -->
                        <div>
                            <span class="info-label">Data di fine</span>
                            <span class="info-value"><?php echo date('d/m/Y', strtotime($quiz['dataFine'])); ?></span>
                        </div>
                    </div>
                    <?php if (!empty($quiz['descrizione'])): // Mostra descrizione solo se presente ?>
                        <div class="quiz-info-item quiz-description"> <!-- Classe per eventuale layout a colonna intera -->
                            <i class="fas fa-info-circle"></i>
                            <div>
                                <span class="info-label">Descrizione</span>
                                <span class="info-value"><?php echo nl2br(htmlspecialchars($quiz['descrizione'], ENT_QUOTES, 'UTF-8')); ?></span>
                            </div>
                        </div>
                    <?php endif; ?>
                </div> <!-- fine .quiz-info-grid -->

                <!-- Contenitore per il bottone di azione (Partecipa) o messaggi informativi -->
                <?php
                // Visualizza il bottone "Partecipa" solo se l'utente può partecipare.
                if (isset($can_participate) && $can_participate):
                ?>
                    <div class="quiz-action-container">
                        <a href="quiz_participate.php?id=<?php echo $quiz_id; ?>" class="btn btn-participate">
                            <i class="fas fa-play-circle"></i> Partecipa al Quiz
                        </a>
                    </div>
                <?php // Messaggi alternativi se non si può partecipare:
                // Utente non loggato, quiz disponibile ma senza domande.
                elseif (isset($user_logged_in) && !$user_logged_in && $quiz_status === 'available' && !empty($questions_data)): ?>
                    <div class="quiz-action-container login-prompt">
                        <p>
                            <i class="fas fa-lock"></i>
                            Effettua il <a href="auth_login.php?redirect=quiz_view.php?id=<?php echo $quiz_id; ?>" class="text-link">login</a> per partecipare a questo quiz.
                        </p>
                    </div>
                <?php // Quiz non ancora iniziato.
                elseif ($quiz_status === 'pending'): ?>
                    <div class="quiz-action-container pending-notice">
                        <p>
                            <i class="fas fa-clock"></i>
                            Questo quiz non è ancora iniziato. Sarà disponibile dal
                            <?php echo date('d/m/Y', strtotime($quiz['dataInizio'])); ?>.
                        </p>
                    </div>
                <?php // Quiz scaduto.
                elseif ($quiz_status === 'expired'): ?>
                    <div class="quiz-action-container expired-notice">
                        <p>
                            <i class="fas fa-exclamation-circle"></i>
                            Questo quiz è scaduto il <?php echo date('d/m/Y', strtotime($quiz['dataFine'])); ?> e non è più disponibile per la partecipazione.
                        </p>
                    </div>
                <?php // Utente loggato, quiz disponibile ma senza domande.
                elseif (isset($user_logged_in) && $user_logged_in && $quiz_status === 'available' && empty($questions_data)): ?>
                    <div class="quiz-action-container no-questions-prompt">
                        <p>
                            <i class="fas fa-info-circle"></i>
                            Questo quiz è disponibile ma non contiene domande al momento. Non è possibile partecipare.
                        </p>
                    </div>
                <?php // Quiz non disponibile per altri motivi (e utente non loggato, caso meno probabile qui).
                elseif (isset($user_logged_in) && !$user_logged_in && $quiz_status !== 'available' && $quiz_status !== ''): ?>
                    <div class="quiz-action-container info-notice">
                        <p>
                            <i class="fas fa-info-circle"></i>
                            Questo quiz non è attualmente disponibile per la partecipazione.
                        </p>
                    </div>
                <?php endif; ?>
            </div> <!-- fine .quiz-detail-card -->
        <?php else: // Se $quiz è null (quiz non trovato) ?>
            <div class="alert alert-warning" role="alert">
                Dettagli del quiz non disponibili o quiz non trovato (ID: <?php echo htmlspecialchars($quiz_id, ENT_QUOTES, 'UTF-8'); ?>).
            </div>
            <p class="text-align-center padding-vertical-medium"><a href="index.php" class="btn">Torna alla Home</a></p>
        <?php endif; // Fine controllo $quiz ?>

        <?php if ($quiz): // Mostra la sezione anteprima domande solo se il quiz esiste ?>
        <div class="questions-preview-section"> <!-- Sezione per l'anteprima delle domande -->
            <h2><i class="fas fa-list-ul"></i> Anteprima delle Domande</h2>
            <?php if (empty($questions)): // Se non ci sono domande associate al quiz ?>
            <div class="no-questions-notice"> <!-- Messaggio "nessuna domanda" -->
                <i class="fas fa-info-circle"></i>
                <p>Nessuna domanda disponibile per l'anteprima di questo quiz al momento.</p>
            </div>
            <?php else: // Se ci sono domande, visualizzale come accordion ?>
            <div class="questions-accordion"> <!-- Contenitore per l'accordion delle domande -->
                <?php
                $numeroDomandaVisualizzato = 1; // Contatore per il numero visualizzato della domanda.
                 foreach ($questions as $index => $question): // $index è 0-based. ?>
                <!-- Card per ogni domanda, con gestione stato aperto/chiuso per accordion -->
                <div class="question-card <?php echo ($index === 0 && count($questions) > 1) ? 'open' : (count($questions) === 1 ? 'open' : ''); ?>">
                    <div class="question-header" role="button" tabindex="0" 
                         aria-expanded="<?php echo ($index === 0 && count($questions) > 1) ? 'true' : (count($questions) === 1 ? 'true' : 'false'); ?>" 
                         aria-controls="question-content-<?php echo $index; ?>">
                        <span class="question-number">Domanda <?php echo $numeroDomandaVisualizzato; ?></span>
                        <div class="question-toggle"><i class="fas fa-chevron-down"></i></div> <!-- Icona toggle (freccia) -->
                    </div>
                    <!-- Contenuto collassabile della domanda -->
                    <div class="question-content-wrapper" id="question-content-<?php echo $index; ?>" 
                         <?php echo !($index === 0 || count($questions) === 1) ? 'style="max-height: 0px;"' : ''; ?> >
                        <div class="question-text"> <!-- Testo della domanda -->
                            <?php echo nl2br(htmlspecialchars($question['testo'], ENT_QUOTES, 'UTF-8')); ?>
                        </div>
                        <?php if (!empty($question['answers'])): // Se ci sono opzioni di risposta ?>
                        <ul class="answer-options"> <!-- Lista delle opzioni di risposta -->
                            <?php foreach ($question['answers'] as $answer): ?>
                            <li class="answer-option">
                                <span class="option-marker"><?php echo chr(65 + $answer['numero'] -1); ?>.</span> <!-- Lettera opzione (A, B, C...) -->
                                <span class="option-text"><?php echo htmlspecialchars($answer['testo'], ENT_QUOTES, 'UTF-8'); ?></span>
                            </li>
                            <?php endforeach; ?>
                        </ul>
                        <?php else: // Se non ci sono opzioni di risposta per questa domanda ?>
                        <p class="no-answers-notice">Nessuna opzione di risposta fornita per questa domanda.</p>
                        <?php endif; ?>
                    </div> <!-- fine .question-content-wrapper -->
                </div> <!-- fine .question-card -->
                <?php
                $numeroDomandaVisualizzato++; // Incrementa contatore domanda.
                endforeach; // Fine loop domande ?>
            </div> <!-- fine .questions-accordion -->
            <?php endif; // Fine controllo empty($questions) ?>
        </div> <!-- fine .questions-preview-section -->
        <?php endif; // Fine blocco if ($quiz) per la sezione domande ?>
    </div> <!-- fine .content -->
</div> <!-- fine .main-content -->

<?php 
// Include il footer HTML comune.
// Assicurarsi che footer.php includa jQuery e main.js per la funzionalità accordion.
include 'includes/footer.php'; 
?>
<!-- La chiusura del tag </body> è in footer.php -->