<?php
/**
 * Pagina di Partecipazione al Quiz.
 *
 * Questa pagina permette a un utente autenticato di partecipare attivamente
 * a un quiz, visualizzando le domande e selezionando le risposte.
 * Esegue controlli per verificare che l'utente non abbia già partecipato,
 * che il quiz sia valido e attualmente disponibile.
 */

// Include l'header comune (gestisce session_start, config DB, CSS, etc.).
include 'includes/header.php';

// Include il file di configurazione del database per la connessione.
require_once 'config/database.php';

// Assicura che la sessione sia attiva (può essere ridondante se header.php lo fa).
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// --- Controllo Autenticazione Utente ---
// Se l'utente non è loggato, salva un messaggio di errore in sessione
// e reindirizza alla pagina di login.
if (!isset($_SESSION['user']) || !isset($_SESSION['user']['nomeUtente'])) {
    $_SESSION['error_message'] = "Devi effettuare il login per partecipare ai quiz.";
    header('Location: auth_login.php');
    exit;
}

// --- Validazione ID Quiz ---
// Verifica che l'ID del quiz sia presente nella query string e sia un numero valido.
// Se non valido, salva un messaggio in sessione e reindirizza all'index.
if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    $_SESSION['info_message'] = "ID del quiz non specificato o non valido.";
    header('Location: index.php');
    exit;
}
$quiz_id = (int) $_GET['id']; // ID del quiz da partecipare.
$user_name = $_SESSION['user']['nomeUtente']; // Nome utente loggato.
$today = date('Y-m-d'); // Data odierna per controlli di validità del quiz.

// Inizializzazione variabili per la pagina.
$error_message_page = null; // Messaggio di errore specifico per questa pagina.
$quiz = null;               // Dati del quiz.
$questions = [];            // Array delle domande del quiz.
$quiz_details_for_error = null; // Dettagli quiz per messaggi di errore specifici.

try {
    // --- Controllo Partecipazione Esistente ---
    // Verifica se l'utente ha già partecipato a questo quiz.
    $participation_check_sql = "SELECT codice FROM Partecipazione WHERE utente = :nomeUtente AND quiz = :quizId";
    $part_check_stmt = $pdo->prepare($participation_check_sql);
    $part_check_stmt->bindParam(':nomeUtente', $user_name, PDO::PARAM_STR);
    $part_check_stmt->bindParam(':quizId', $quiz_id, PDO::PARAM_INT);
    $part_check_stmt->execute();
    if ($part_check_stmt->fetch()) {
        // Se ha già partecipato, reindirizza alla pagina delle sue partecipazioni.
        $_SESSION['info_message'] = "Hai già partecipato a questo quiz. Puoi vedere i tuoi risultati nella sezione 'Le Mie Partecipazioni'.";
        header('Location: quiz_participations.php');
        exit;
    }

    // --- Recupero Dati Quiz ---
    // Seleziona il quiz solo se è attualmente valido (data inizio <= oggi E data fine >= oggi).
    $sql_quiz = "SELECT * FROM Quiz WHERE codice = :id AND dataInizio <= :oggiDataInizio AND dataFine >= :oggiDataFine";
    $stmt_quiz = $pdo->prepare($sql_quiz);
    $stmt_quiz->bindParam(':id', $quiz_id, PDO::PARAM_INT);
    $stmt_quiz->bindParam(':oggiDataInizio', $today, PDO::PARAM_STR);
    $stmt_quiz->bindParam(':oggiDataFine', $today, PDO::PARAM_STR);
    $stmt_quiz->execute();
    $quiz = $stmt_quiz->fetch(PDO::FETCH_ASSOC); // Recupera i dati del quiz.

    // Se il quiz non viene trovato (o non è attivo):
    if (!$quiz) {
        // Prova a recuperare i dettagli del quiz (anche se non attivo) per fornire un messaggio più specifico.
        $check_existence_sql = "SELECT titolo, dataInizio, dataFine FROM Quiz WHERE codice = :id";
        $check_stmt = $pdo->prepare($check_existence_sql);
        $check_stmt->bindParam(':id', $quiz_id, PDO::PARAM_INT);
        $check_stmt->execute();
        $quiz_details_for_error = $check_stmt->fetch(PDO::FETCH_ASSOC);

        // Determina il titolo da visualizzare nel messaggio di errore/info.
        $quiz_title_display = 'ID '.htmlspecialchars($quiz_id, ENT_QUOTES, 'UTF-8');
        if ($quiz_details_for_error && !empty($quiz_details_for_error['titolo'])) {
            $quiz_title_display = htmlspecialchars($quiz_details_for_error['titolo'], ENT_QUOTES, 'UTF-8');
        }
        // NOTA: La condizione elseif ($quiz && ...) qui sotto è logicamente irraggiungibile se !$quiz è true.

        // Imposta il messaggio appropriato in sessione e reindirizza.
        if (!$quiz_details_for_error) { // Quiz non esistente.
            $_SESSION['error_message'] = "Quiz con ID ".htmlspecialchars($quiz_id, ENT_QUOTES, 'UTF-8')." non trovato.";
        } elseif ($quiz_details_for_error['dataInizio'] > $today) { // Quiz non ancora iniziato.
            $_SESSION['info_message'] = "Il quiz \"".$quiz_title_display."\" non è ancora iniziato. Sarà disponibile dal ".date('d/m/Y', strtotime($quiz_details_for_error['dataInizio'])).".";
        } elseif ($quiz_details_for_error['dataFine'] < $today) { // Quiz scaduto.
            $_SESSION['info_message'] = "Il quiz \"".$quiz_title_display."\" è terminato il ".date('d/m/Y', strtotime($quiz_details_for_error['dataFine']))." e non accetta più partecipazioni.";
        } else { // Altro caso (raro se la query principale è corretta).
            $_SESSION['error_message'] = "Quiz non disponibile (".$quiz_title_display.").";
        }
        header('Location: index.php'); // Reindirizza alla home page.
        exit;
    }

    // --- Recupero Domande e Risposte del Quiz ---
    // Seleziona le domande del quiz, ordinate per numero.
    $sql_domande = "SELECT * FROM Domanda WHERE quiz = :quiz ORDER BY numero";
    $stmt_domande = $pdo->prepare($sql_domande);
    $stmt_domande->bindParam(':quiz', $quiz_id, PDO::PARAM_INT);
    $stmt_domande->execute();
    $questions = $stmt_domande->fetchAll(PDO::FETCH_ASSOC); // Array di domande.

    // Se il quiz non ha domande, imposta un messaggio di errore per la pagina.
    if (empty($questions)) {
        $error_message_page = "Questo quiz non ha ancora domande associate. Torna più tardi o contatta il creatore del quiz.";
    } else {
        // Per ogni domanda, recupera le relative opzioni di risposta in ordine casuale.
        foreach ($questions as &$question_data) { // Usa '&' per modificare l'array $questions direttamente.
            $sql_risposte = "SELECT * FROM Risposta WHERE quiz = :quiz AND domanda = :domanda ORDER BY RAND()"; // RAND() per ordine casuale.
            $stmt_risposte = $pdo->prepare($sql_risposte);
            $stmt_risposte->bindParam(':quiz', $quiz_id, PDO::PARAM_INT);
            $stmt_risposte->bindParam(':domanda', $question_data['numero'], PDO::PARAM_INT);
            $stmt_risposte->execute();
            $question_data['answers'] = $stmt_risposte->fetchAll(PDO::FETCH_ASSOC); // Aggiunge le risposte all'array della domanda.
        }
        unset($question_data); // Rimuove la reference all'ultimo elemento per sicurezza.
    }

} catch (PDOException $e) { // Gestione errori database.
    error_log("Errore DB in quiz_participate.php: " . $e->getMessage());
    $error_message_page = "Si è verificato un errore tecnico durante il caricamento del quiz. Riprova più tardi.";
}

$domanda_indice_visualizzato = 0; // Contatore per visualizzare il numero progressivo della domanda.
?>

<!-- Contenuto principale della pagina di partecipazione -->
<div class="main-content container main-content-page-padding">
    <!-- Contenitore per gli alert JavaScript -->
    <div id="alert-container-participate"></div>

    <?php if ($error_message_page): // Se c'è un errore specifico per la pagina (es. quiz senza domande) ?>
        <div class="alert alert-danger" role="alert"><?php echo htmlspecialchars($error_message_page, ENT_QUOTES, 'UTF-8'); ?></div>
        <?php if (strpos($error_message_page, "non ha ancora domande") !== false): // Offre un link per tornare alla home ?>
            <p class="text-align-center padding-vertical-medium"><a href="index.php" class="btn">Torna alla Home</a></p>
        <?php endif; ?>
    <?php elseif ($quiz): // Se il quiz è stato caricato correttamente ?>
      
        <!-- Header della pagina di partecipazione con titolo e descrizione del quiz -->
        <div class="page-header-controls quiz-participation-page-header">
            <div class="page-title-container">
                <i class="fas fa-pencil-alt page-title-icon"></i>
                <h1 class="page-main-title">
                    Partecipazione al Quiz: <?php echo htmlspecialchars($quiz['titolo'], ENT_QUOTES, 'UTF-8'); ?>
                </h1>
            </div>
            <p class="quiz-participation-description">
                Seleziona le risposte che ritieni corrette per ogni domanda e invia il quiz al termine.
            </p>
        </div>

        <!-- Form per la partecipazione al quiz -->
        <form id="participate-form">
            <input type="hidden" name="idQuiz" value="<?php echo $quiz_id; ?>"> <!-- ID del quiz -->
            <input type="hidden" name="action" value="submit"> <!-- Azione per l'API -->

            <?php if (!empty($questions)): // Se ci sono domande, itera e visualizzale ?>
                <?php foreach ($questions as $current_question): ?>
                    <?php $domanda_indice_visualizzato++; // Incrementa il contatore del numero domanda visualizzato ?>
                    <div class="question-item card"> <!-- Card per ogni domanda -->
                        <div class="question-text"> <!-- Testo della domanda -->
                            Domanda <?php echo $domanda_indice_visualizzato; ?>:
                            <span><?php echo htmlspecialchars($current_question['testo'], ENT_QUOTES, 'UTF-8'); ?></span>
                        </div>

                        <?php if (empty($current_question['answers'])): // Se la domanda non ha opzioni di risposta ?>
                            <p class="no-answers-message">Nessuna opzione di risposta disponibile per questa domanda.</p>
                        <?php else: // Visualizza le opzioni di risposta ?>
                            <div class="answer-options">
                                <?php foreach ($current_question['answers'] as $answer): ?>
                                    <div class="answer-option">
                                        <label> <!-- La label avvolge input e testo per migliore cliccabilità -->
                                            <input type="checkbox"
                                                   name="answers[<?php echo $current_question['numero']; ?>][]" <!-- Nome array per gestire risposte multiple -->
                                                   value="<?php echo $answer['numero']; ?>"> <!-- Valore = numero della risposta -->
                                            <span><?php echo htmlspecialchars($answer['testo'], ENT_QUOTES, 'UTF-8'); ?></span>
                                        </label>
                                    </div>
                                <?php endforeach; // Fine loop opzioni risposta ?>
                            </div>
                        <?php endif; // Fine controllo opzioni risposta ?>
                    </div> <!-- fine .question-item .card -->
                <?php endforeach; // Fine loop domande ?>
            <?php endif; // Fine controllo !empty($questions) ?>

            <?php if (!empty($questions)): // Mostra il bottone di invio solo se ci sono domande ?>
            <div class="form-group text-align-center">
                <button type="submit" class="btn button-primary-styled btn-lg">
                    <i class="fas fa-paper-plane"></i> Invia Risposte
                </button>
            </div>
            <?php endif; ?>
        </form>
    <?php else: // Fallback se $quiz non è stato caricato (raro, gestito prima con redirect) ?>
        <div class="alert alert-warning" role="alert">
            Impossibile caricare i dettagli del quiz. Potrebbe non essere disponibile o l'ID specificato non è corretto.
        </div>
        <p class="text-align-center padding-vertical-medium"><a href="index.php" class="btn">Torna alla Home</a></p>
    <?php endif; // Fine controllo $quiz ?>
</div> <!-- fine .main-content -->

<?php 
// Include il footer HTML comune.
include 'includes/footer.php'; 
?>
<!-- La chiusura del tag </body> è in footer.php -->