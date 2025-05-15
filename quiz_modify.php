<?php
/**
 * Pagina di Modifica Quiz Esistente.
 *
 * Questa pagina permette all'utente autenticato (che deve essere il creatore)
 * di modificare i dettagli di un quiz esistente, le sue domande e le relative risposte.
 * Carica i dati attuali del quiz e li popola nel form per la modifica.
 */

// Include l'header comune (gestisce session_start, config DB, CSS, etc.).
include "includes/header.php";
// Include il file di configurazione del database per la connessione.
require_once 'config/database.php'; 

// Assicura che la sessione sia attiva (può essere ridondante se header.php lo fa).
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// --- Controllo Accesso Utente ---
// Verifica se l'utente è loggato. Se non lo è, reindirizza alla pagina di login.
$nomeUtente = $_SESSION['user']['nomeUtente'] ?? null;
if (!isset($nomeUtente)) {
    header('Location: auth_login.php');
    exit;
}

// --- Recupero e Validazione dell'ID del Quiz dalla Query String ---
if (!isset($_GET['id']) || !filter_var($_GET['id'], FILTER_VALIDATE_INT)) {
    // Se l'ID non è presente o non è un intero valido, mostra un errore e termina.
    // In un'app reale, si potrebbe reindirizzare a una pagina di errore più user-friendly.
    die("<div class='container' style='padding-top:20px;'><div class='alert alert-danger'>ID Quiz non valido o mancante. Impossibile procedere con la modifica.</div></div>");
}
$quizId = (int) $_GET['id']; // Converte l'ID a intero.

// --- Fetch dei Dati del Quiz, delle Domande e delle Risposte dal Database ---
try {
    // 1. Recupera i dettagli del quiz, verificando che l'utente loggato sia il creatore.
    $sqlQuiz = "SELECT codice, titolo, dataInizio, dataFine FROM Quiz WHERE codice = :quizId AND creatore = :nomeUtente";
    $stmtQuiz = $pdo->prepare($sqlQuiz);
    $stmtQuiz->bindParam(':quizId', $quizId, PDO::PARAM_INT);
    $stmtQuiz->bindParam(':nomeUtente', $nomeUtente, PDO::PARAM_STR);
    $stmtQuiz->execute();
    $quiz = $stmtQuiz->fetch(PDO::FETCH_ASSOC); // Recupera i dati del quiz.

    // Se il quiz non viene trovato o l'utente non è il creatore, mostra un errore e termina.
    if (!$quiz) {
        die("<div class='container' style='padding-top:20px;'><div class='alert alert-danger'>Quiz non trovato o non sei autorizzato a modificarlo.</div></div>");
    }

    // 2. Recupera tutte le domande associate a questo quiz, ordinate per numero.
    $sqlDomande = "SELECT numero, testo FROM Domanda WHERE quiz = :quizId ORDER BY numero ASC";
    $stmtDomande = $pdo->prepare($sqlDomande);
    $stmtDomande->bindParam(':quizId', $quizId, PDO::PARAM_INT);
    $stmtDomande->execute();
    $domande = $stmtDomande->fetchAll(PDO::FETCH_ASSOC); // Array di domande.

    // 3. Recupera tutte le risposte per tutte le domande del quiz.
    $sqlRisposte = "SELECT domanda, numero, testo, tipo, punteggio FROM Risposta WHERE quiz = :quizId ORDER BY domanda ASC, numero ASC";
    $stmtRisposte = $pdo->prepare($sqlRisposte);
    $stmtRisposte->bindParam(':quizId', $quizId, PDO::PARAM_INT);
    $stmtRisposte->execute();
    $risposteRaw = $stmtRisposte->fetchAll(PDO::FETCH_ASSOC); // Array di tutte le risposte.

    // Organizza le risposte in un array associativo indicizzato per numero di domanda
    // per facilitare l'accesso e la visualizzazione nel form.
    // $risposteOrganizzate = [];
    foreach ($risposteRaw as $risposta) {
        $risposteOrganizzate[$risposta['domanda']][] = $risposta;
    }

} catch (PDOException $e) { // Gestione errori database.
    error_log("Errore Database in quiz_modify.php durante il caricamento dati: " . $e->getMessage());
    die("<div class='container' style='padding-top:20px;'><div class='alert alert-danger'>Si è verificato un errore nel caricamento dei dati del quiz. Riprova più tardi.</div></div>");
}

?>
<!-- L'HTML della pagina inizia qui (il tag <body> è già aperto in header.php) -->
<div class="main-content"> <!-- Contenitore principale del contenuto -->
    <div class="content">
    <h1 class="page-main-title">Modifica Quiz: <?php echo htmlspecialchars($quiz['titolo'], ENT_QUOTES, 'UTF-8'); ?></h1>
    
    <!-- Placeholder per gli alert JavaScript (messaggi di successo/errore durante il salvataggio) -->
    <div id="alert-container-page-modify" class="alert-placeholder"></div>

    <!-- Form principale per la modifica del quiz (dettagli e domande/risposte) -->
    <!-- L'azione punta a un endpoint API per l'aggiornamento. -->
    <form id="edit-quiz-form" action="api/quiz.php?action=update" method="POST">
        <!-- Campo hidden per inviare l'ID del quiz da modificare -->
        <input type="hidden" name="quiz_id" value="<?php echo $quiz['codice']; ?>">
        <!-- Campo hidden per conservare la data di inizio originale, utile per validazione date -->
        <input type="hidden" id="original_data_inizio" value="<?php echo htmlspecialchars($quiz['dataInizio'], ENT_QUOTES, 'UTF-8'); ?>">


        <!-- Sezione 1: Dettagli del Quiz (Titolo, Date) -->
        <div class="custom-card box-shadow-light margin-bottom-large">
            <div class="custom-card-header">
                <h2 class="custom-card-title">Dettagli del Quiz</h2>
            </div>
            <div class="custom-card-body">
                <div class="form-field-group margin-bottom-medium">
                    <label for="titolo" class="form-label-styled">Titolo del Quiz:</label>
                    <input type="text" id="titolo" name="titolo" class="form-input-styled" value="<?php echo htmlspecialchars($quiz['titolo'], ENT_QUOTES, 'UTF-8'); ?>" required>
                </div>
                <div class="form-row"> <!-- Layout a righe per le date -->
                    <div class="form-col-half">
                        <div class="form-field-group margin-bottom-medium">
                            <label for="dataInizio" class="form-label-styled">Data di Inizio:</label>
                            <input type="date" id="dataInizio" name="dataInizio" class="form-input-styled" value="<?php echo htmlspecialchars($quiz['dataInizio'], ENT_QUOTES, 'UTF-8'); ?>" required>
                        </div>
                    </div>
                    <div class="form-col-half">
                        <div class="form-field-group margin-bottom-medium">
                            <label for="dataFine" class="form-label-styled">Data di Fine:</label>
                            <input type="date" id="dataFine" name="dataFine" class="form-input-styled" value="<?php echo htmlspecialchars($quiz['dataFine'], ENT_QUOTES, 'UTF-8'); ?>" required>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Sezione 2: Domande e Risposte -->
        <div class="custom-card box-shadow-light">
            <div class="custom-card-header">
                <h2 class="custom-card-title">Domande e Risposte</h2>
            </div>
            <div class="custom-card-body">
                <div id="questions-container">
                    <!-- Messaggio se non ci sono domande (nascosto se ce ne sono) -->
                    <?php if (empty($domande)): ?>
                        <p id="no-questions-message" class="message-placeholder-styled text-align-center padding-vertical-medium">Nessuna domanda presente. Clicca su "Aggiungi Domanda" per iniziare.</p>
                    <?php else: ?>
                        <p id="no-questions-message" class="message-placeholder-styled text-align-center padding-vertical-medium" style="display: none;">Nessuna domanda presente. Clicca su "Aggiungi Domanda" per iniziare.</p>
                    <?php endif; ?>

                    <!-- Itera sulle domande esistenti e le visualizza nel form -->
                    <?php foreach ($domande as $indexDomanda => $domanda): // $indexDomanda è 0-based per gli array JS/PHP ?>
                        <div class="question-block-styled margin-bottom-large" data-question-index="<?php echo $indexDomanda; ?>">
                            <!-- Campo hidden per l'ID/numero originale della domanda (per il backend) -->
                            <input type="hidden" name="questions[<?php echo $indexDomanda; ?>][original_numero_domanda]" value="<?php echo $domanda['numero']; ?>">
                            
                            <div class="question-header-styled flex-container flex-justify-between flex-align-center padding-medium margin-bottom-medium">
                                <h3 class="question-title-styled">Domanda <span class="question-number-badge"><?php echo $indexDomanda + 1; ?></span></h3> <!-- Numero visualizzato 1-based -->
                                <button type="button" class="button-styled button-danger-outline-styled button-small-styled remove-question-btn" title="Rimuovi Domanda <?php echo $indexDomanda + 1; ?>">
                                    <i class="fas fa-trash-alt icon-spacing-right-small"></i>Rimuovi Domanda
                                </button>
                            </div>
                            <div class="question-body-styled padding-medium-horizontal">
                                <div class="form-field-group margin-bottom-medium">
                                    <label for="question_text_<?php echo $indexDomanda; ?>" class="form-label-styled label-bold-styled">Testo della Domanda:</label>
                                    <textarea id="question_text_<?php echo $indexDomanda; ?>" class="textarea-styled" name="questions[<?php echo $indexDomanda; ?>][text]" rows="3" required placeholder="Inserisci qui il testo della domanda..."><?php echo htmlspecialchars($domanda['testo'], ENT_QUOTES, 'UTF-8'); ?></textarea>
                                </div>
                                
                                <h4 class="answers-area-title-styled margin-top-medium margin-bottom-small">Risposte:</h4>
                                <div class="answers-container-styled padding-left-small" id="answers-container-q<?php echo $indexDomanda; ?>">
                                    <?php $rispostePerDomanda = $risposteOrganizzate[$domanda['numero']] ?? []; // Recupera le risposte per la domanda corrente ?>
                                    <!-- Messaggio se non ci sono risposte (nascosto se ce ne sono) -->
                                    <?php if (empty($rispostePerDomanda)): ?>
                                        <p class="message-inline-styled text-description-styled no-answers-message" id="no-answers-for-q<?php echo $indexDomanda; ?>">Nessuna risposta aggiunta per questa domanda.</p>
                                    <?php else: ?>
                                        <p class="message-inline-styled text-description-styled no-answers-message" id="no-answers-for-q<?php echo $indexDomanda; ?>" style="display: none;">Nessuna risposta aggiunta per questa domanda.</p>
                                    <?php endif; ?>

                                    <!-- Itera sulle risposte esistenti per questa domanda -->
                                    <?php foreach ($rispostePerDomanda as $indexRisposta => $risposta): // $indexRisposta è 0-based ?>
                                        <div class="answer-block-styled padding-medium margin-bottom-medium box-shadow-extra-light" data-answer-index="<?php echo $indexRisposta; ?>">
                                            <!-- Campo hidden per l'ID/numero originale della risposta -->
                                            <input type="hidden" name="questions[<?php echo $indexDomanda; ?>][answers][<?php echo $indexRisposta; ?>][original_numero_risposta]" value="<?php echo $risposta['numero']; ?>">
                                            
                                            <div class="answer-header-styled flex-container flex-justify-between flex-align-center margin-bottom-small">
                                                <label class="form-label-styled label-bold-styled label-accent-color-styled answer-label-dynamic">Risposta <span class="answer-number-badge"><?php echo $indexRisposta + 1; ?></span></label> <!-- Numero visualizzato 1-based -->
                                                <button type="button" class="button-styled button-danger-styled button-extra-small-styled remove-answer-btn" title="Rimuovi Risposta">
                                                    <i class="fas fa-times"></i>
                                                </button>
                                            </div>

                                            <div class="form-field-group margin-bottom-small">
                                                <label for="answer_text_<?php echo $indexDomanda; ?>_<?php echo $indexRisposta; ?>" class="form-label-styled label-small-styled">Testo della Risposta:</label>
                                                <input type="text" id="answer_text_<?php echo $indexDomanda; ?>_<?php echo $indexRisposta; ?>" class="form-input-styled input-small-styled" name="questions[<?php echo $indexDomanda; ?>][answers][<?php echo $indexRisposta; ?>][text]" value="<?php echo htmlspecialchars($risposta['testo'], ENT_QUOTES, 'UTF-8'); ?>" required placeholder="Testo della risposta">
                                            </div>
                                            
                                            <?php $isCorrect = ($risposta['tipo'] == 'Corretta'); // Determina se la risposta è corretta ?>
                                            <div class="form-field-group margin-bottom-small">
                                                <label class="form-label-styled label-small-styled display-block margin-bottom-extra-small">Tipo Risposta:</label>
                                                <div class="radio-option-group-styled">
                                                    <div class="radio-option-styled">
                                                        <input class="radio-input-styled" type="radio" name="questions[<?php echo $indexDomanda; ?>][answers][<?php echo $indexRisposta; ?>][type]" id="q<?php echo $indexDomanda; ?>a<?php echo $indexRisposta; ?>tipoC" value="Corretta" <?php echo $isCorrect ? 'checked' : ''; ?> required>
                                                        <label class="radio-label-styled" for="q<?php echo $indexDomanda; ?>a<?php echo $indexRisposta; ?>tipoC">Corretta</label>
                                                    </div>
                                                    <div class="radio-option-styled">
                                                        <input class="radio-input-styled" type="radio" name="questions[<?php echo $indexDomanda; ?>][answers][<?php echo $indexRisposta; ?>][type]" id="q<?php echo $indexDomanda; ?>a<?php echo $indexRisposta; ?>tipoS" value="Sbagliata" <?php echo !$isCorrect ? 'checked' : ''; ?> required>
                                                        <label class="radio-label-styled" for="q<?php echo $indexDomanda; ?>a<?php echo $indexRisposta; ?>tipoS">Sbagliata</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Campo Punti, visualizzato solo se la risposta è corretta -->
                                            <div class="form-field-group points-group" <?php echo !$isCorrect ? 'style="display:none;"' : ''; ?>>
                                                <label for="q<?php echo $indexDomanda; ?>a<?php echo $indexRisposta; ?>punti" class="form-label-styled label-small-styled">Punti (se corretta):</label>
                                                <input type="number" id="q<?php echo $indexDomanda; ?>a<?php echo $indexRisposta; ?>punti" class="form-input-styled input-small-styled input-numerical-styled" name="questions[<?php echo $indexDomanda; ?>][answers][<?php echo $indexRisposta; ?>][points]" value="<?php echo htmlspecialchars($risposta['punteggio'] ?? ($isCorrect ? 1 : 0), ENT_QUOTES, 'UTF-8'); ?>" required min="0">
                                            </div>
                                        </div> <!-- fine .answer-block-styled -->
                                    <?php endforeach; // fine loop risposte ?>
                                </div> <!-- fine .answers-container-styled -->
                                <!-- Bottone per aggiungere una nuova risposta a questa domanda -->
                                <button type="button" class="button-styled button-secondary-styled button-small-styled margin-top-medium add-answer-btn">
                                    <i class="fas fa-plus-circle icon-spacing-right-small"></i>Aggiungi Risposta a Domanda <span class="question-number-btn-text"><?php echo $indexDomanda + 1; ?></span>
                                </button>
                            </div> <!-- fine .question-body-styled -->
                        </div> <!-- fine .question-block-styled -->
                    <?php endforeach; // fine loop domande ?>
                </div> <!-- fine #questions-container -->

                <!-- Barra dei bottoni di azione principali per il form di modifica -->
                <div class="main-actions-bar flex-container flex-gap-medium margin-top-large padding-top-medium border-top-light">
                    <button type="button" id="add-question-btn" class="button-styled button-secondary-styled">
                        <i class="fas fa-plus icon-spacing-right"></i> Aggiungi Nuova Domanda
                    </button>
                    <button type="submit" class="button-styled button-success-styled">
                        <i class="fas fa-save icon-spacing-right"></i> Salva Modifiche al Quiz
                    </button>
                    <!-- Si potrebbe aggiungere un bottone "Annulla Modifiche" che reindirizza o resetta il form -->
                </div>
            </div> <!-- fine .custom-card-body (domande) -->
        </div> <!-- fine .custom-card (domande) -->
    </form> <!-- fine #edit-quiz-form -->
    </div> <!-- fine .content -->
</div> <!-- fine .main-content -->


    <!-- Template HTML per una Nuova Domanda (nascosto, usato da JavaScript) -->
    <!-- I placeholder __Q_INDEX__ e __Q_DISPLAY_NUM__ verranno sostituiti da JS -->
    <template id="question-template">
        <div class="question-block-styled margin-bottom-large" data-question-index="__Q_INDEX__">
            <!-- Il campo hidden per original_numero_domanda non è necessario per domande completamente nuove -->
            <div class="question-header-styled flex-container flex-justify-between flex-align-center padding-medium margin-bottom-medium">
                <h3 class="question-title-styled">Domanda <span class="question-number-badge">__Q_DISPLAY_NUM__</span></h3>
                <button type="button" class="button-styled button-danger-outline-styled button-small-styled remove-question-btn" title="Rimuovi Domanda __Q_DISPLAY_NUM__">
                    <i class="fas fa-trash-alt icon-spacing-right-small"></i>Rimuovi Domanda
                </button>
            </div>
            <div class="question-body-styled padding-medium-horizontal">
                <div class="form-field-group margin-bottom-medium">
                    <label for="question_text___Q_INDEX__" class="form-label-styled label-bold-styled">Testo della Domanda:</label>
                    <textarea id="question_text___Q_INDEX__" class="textarea-styled" name="questions[__Q_INDEX__][text]" rows="3" required placeholder="Inserisci qui il testo della domanda..."></textarea>
                </div>
                <h4 class="answers-area-title-styled margin-top-medium margin-bottom-small">Risposte:</h4>
                <div class="answers-container-styled padding-left-small" id="answers-container-q__Q_INDEX__">
                    <p class="message-inline-styled text-description-styled no-answers-message" id="no-answers-for-q__Q_INDEX__" style="display: block;">Nessuna risposta aggiunta.</p>
                </div>
                <button type="button" class="button-styled button-secondary-styled button-small-styled margin-top-medium add-answer-btn">
                    <i class="fas fa-plus-circle icon-spacing-right-small"></i>Aggiungi Risposta a Domanda <span class="question-number-btn-text">__Q_DISPLAY_NUM__</span>
                </button>
            </div>
        </div>
    </template>

    <!-- Template HTML per una Nuova Risposta (nascosto, usato da JavaScript) -->
    <!-- I placeholder __Q_INDEX__, __A_INDEX__, __A_DISPLAY_NUM__ verranno sostituiti da JS -->
    <template id="answer-template">
        <div class="answer-block-styled padding-medium margin-bottom-medium box-shadow-extra-light" data-answer-index="__A_INDEX__">
            <!-- Campi hidden per original_numero_risposta e id_risposta non sono necessari per risposte completamente nuove -->
            <div class="answer-header-styled flex-container flex-justify-between flex-align-center margin-bottom-small">
                <label class="form-label-styled label-bold-styled label-accent-color-styled answer-label-dynamic">Risposta <span class="answer-number-badge">__A_DISPLAY_NUM__</span></label>
                <button type="button" class="button-styled button-danger-styled button-extra-small-styled remove-answer-btn" title="Rimuovi Risposta">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            <div class="form-field-group margin-bottom-small">
                <label for="answer_text___Q_INDEX_____A_INDEX__" class="form-label-styled label-small-styled">Testo della Risposta:</label>
                <input type="text" id="answer_text___Q_INDEX_____A_INDEX__" class="form-input-styled input-small-styled" name="questions[__Q_INDEX__][answers][__A_INDEX__][text]" required placeholder="Testo della risposta">
            </div>
            <div class="form-field-group margin-bottom-small">
                <label class="form-label-styled label-small-styled display-block margin-bottom-extra-small">Tipo Risposta:</label>
                <div class="radio-option-group-styled">
                    <div class="radio-option-styled">
                        <input class="radio-input-styled" type="radio" name="questions[__Q_INDEX__][answers][__A_INDEX__][type]" id="q__Q_INDEX__a__A_INDEX__tipoC" value="Corretta" required>
                        <label class="radio-label-styled" for="q__Q_INDEX__a__A_INDEX__tipoC">Corretta</label>
                    </div>
                    <div class="radio-option-styled">
                        <input class="radio-input-styled" type="radio" name="questions[__Q_INDEX__][answers][__A_INDEX__][type]" id="q__Q_INDEX__a__A_INDEX__tipoS" value="Sbagliata" checked> <!-- Default a Sbagliata per nuove risposte -->
                        <label class="radio-label-styled" for="q__Q_INDEX__a__A_INDEX__tipoS">Sbagliata</label>
                    </div>
                </div>
            </div>
            <div class="form-field-group points-group" style="display:none;"> <!-- Nascosto di default per nuova risposta (tipo Sbagliata) -->
                <label for="q__Q_INDEX__a__A_INDEX__punti" class="form-label-styled label-small-styled">Punti (se corretta):</label>
                <input type="number" id="q__Q_INDEX__a__A_INDEX__punti" class="form-input-styled input-small-styled input-numerical-styled" name="questions[__Q_INDEX__][answers][__A_INDEX__][points]" value="0" required min="0"> <!-- Default punti a 0 per nuove risposte -->
            </div>
        </div>
    </template>

    <?php 
    // Include il footer comune (contiene chiusura body/html e script JS).
    include 'includes/footer.php'; 
    ?>
<!-- La chiusura del tag </body> è in footer.php -->
</html>