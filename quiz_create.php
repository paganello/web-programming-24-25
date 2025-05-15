<?php
/**
 * Pagina di Creazione dei Quiz.
 *
 * Questa pagina fornisce l'interfaccia utente per creare nuovi quiz,
 * permettendo di definire i dettagli del quiz (titolo, date) e
 * successivamente aggiungere dinamicamente domande e relative risposte.
 * Richiede che l'utente sia autenticato.
 */

// Include l'header comune che gestisce session_start() e altre inclusioni.
include 'includes/header.php';

// --- Inizializzazione della sessione PHP ---
 if (session_status() === PHP_SESSION_NONE) {
 session_start();
 }

// --- Controllo Autenticazione Utente ---
// Se l'utente non è loggato (nessuna sessione 'user' attiva),
// reindirizza alla pagina di login.
if (!isset($_SESSION['user'])) {
    header('Location: auth_login.php'); // Reindirizzamento.
    exit; // Termina l'esecuzione dello script.
}
?>

<!-- Contenuto principale della pagina -->
<div class="main-content">
    <div class="content">
        <h1 class="page-main-title">Crea un nuovo Quiz</h1>

        <!-- Placeholder per gli alert JavaScript (messaggi di successo/errore) -->
        <div id="alert-container-page" class="alert-placeholder"></div>

        <!-- Sezione 1: Dettagli del Quiz (Titolo, Date) -->
        <div id="quiz-details-section">
            <div class="custom-card box-shadow-light margin-bottom-large"> <!-- Card per i dettagli -->
                <div class="custom-card-header">
                    <h2 class="custom-card-title">Dettagli del Quiz</h2>
                </div>
                <div class="custom-card-body">
                    <form id="create-quiz-form"> <!-- Form per i dettagli del quiz -->
                        <div class="form-field-group margin-bottom-medium">
                            <label for="titolo" class="form-label-styled">Titolo del Quiz</label>
                            <input type="text" name="titolo" id="titolo" class="form-input-styled" required>
                        </div>

                        <div class="form-row"> <!-- Layout a righe per le date -->
                            <div class="form-col-half">
                                <div class="form-field-group margin-bottom-medium">
                                    <label for="dataInizio" class="form-label-styled">Data di inizio</label>
                                    <input type="date" name="dataInizio" id="dataInizio" class="form-input-styled" required>
                                </div>
                            </div>
                            <div class="form-col-half">
                                <div class="form-field-group margin-bottom-medium">
                                    <label for="dataFine" class="form-label-styled">Data di fine</label>
                                    <input type="date" name="dataFine" id="dataFine" class="form-input-styled" required>
                                </div>
                            </div>
                        </div>
                        <br> <!-- Spaziatore, considerare l'uso di margini CSS -->
                        <div class="form-actions-container padding-top-medium">
                            <!-- Bottone per salvare i dettagli e procedere all'aggiunta delle domande -->
                            <button type="submit" class="button-styled button-primary-styled">
                                <i class="fas fa-arrow-right icon-spacing-right"></i> Continua e Aggiungi Domande
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Sezione 2: Aggiunta Domande (nascosta inizialmente) -->
        <div id="questions-section" style="display: none;">
            <div class="custom-card box-shadow-light"> <!-- Card per le domande -->
                <div class="custom-card-header">
                    <h2 class="custom-card-title">Aggiungi Domande al Quiz</h2>
                </div>
                <div class="custom-card-body">
                    <!-- Campo hidden per memorizzare l'ID del quiz creato -->
                    <input type="hidden" id="quiz-id" value="">
                    <form id="questions-form"> <!-- Form per le domande e risposte -->
                        <div id="questions-container">
                            <!-- Messaggio visualizzato se non ci sono domande -->
                            <p id="no-questions-message" class="message-placeholder-styled text-align-center padding-vertical-medium">
                                Nessuna domanda aggiunta. Clicca su "Aggiungi Domanda" per iniziare.
                            </p>
                            <!-- I blocchi domanda verranno inseriti qui dinamicamente da JavaScript -->
                        </div>
                        <!-- Barra dei bottoni di azione principali per le domande -->
                        <div class="main-actions-bar flex-container flex-gap-medium margin-top-large padding-top-medium border-top-light">
                            <button type="button" id="add-question" class="button-styled button-secondary-styled">
                                <i class="fas fa-plus icon-spacing-right"></i> Aggiungi Domanda
                            </button>
                            <button type="button" id="abort-quiz-creation" class="button-styled button-danger-styled">
                                <i class="fas fa-times icon-spacing-right"></i> Annulla Creazione
                            </button>
                            <button type="button" id="save-questions" class="button-styled button-success-styled">
                                <i class="fas fa-save icon-spacing-right"></i> Salva Quiz e Domande
                            </button>
                        </div>
                    </form>
                </div> <!-- fine .custom-card-body -->
            </div> <!-- fine .custom-card -->
        </div> <!-- fine #questions-section -->

    </div> <!-- fine .content -->
</div> <!-- fine .main-content -->

 <!-- Template HTML per una singola domanda (usato da JavaScript per crearne di nuove) -->
<template id="question-template-create">
    <div class="question-block-styled margin-bottom-large" data-question="__Q_NUM__"> <!-- Placeholder __Q_NUM__ per il numero domanda -->
        <div class="question-header-styled flex-container flex-justify-between flex-align-center padding-medium margin-bottom-medium">
            <h3 class="question-title-styled">Domanda <span class="question-number">__Q_NUM__</span></h3>
            <button type="button" class="button-styled button-danger-outline-styled button-small-styled remove-question" data-question="__Q_NUM__" title="Rimuovi Domanda __Q_NUM__">
                <i class="fas fa-trash-alt icon-spacing-right-small"></i>Rimuovi
            </button>
        </div>
        <div class="question-body-styled padding-medium-horizontal">
            <div class="form-field-group margin-bottom-medium">
                <label for="question-__Q_NUM__" class="form-label-styled label-bold-styled">Testo della Domanda:</label>
                <textarea name="questions[__Q_NUM__][text]" id="question-__Q_NUM__" class="textarea-styled" rows="3" required placeholder="Inserisci qui il testo della domanda..."></textarea>
            </div>
            <h4 class="answers-area-title-styled margin-top-medium margin-bottom-small">Risposte:</h4>
            <div class="answers-container-styled padding-left-small" id="answers-container-__Q_NUM__">
                <!-- Messaggio se non ci sono risposte per questa domanda -->
                <p class="message-inline-styled text-description-styled" id="no-answers-for-q-__Q_NUM__">Nessuna risposta aggiunta per questa domanda.</p>
                <!-- I blocchi risposta verranno inseriti qui -->
            </div>
            <button type="button" class="button-styled button-secondary-styled button-small-styled margin-top-medium add-answer" data-question="__Q_NUM__">
                <i class="fas fa-plus-circle icon-spacing-right-small"></i>Aggiungi Risposta
            </button>
        </div>
    </div>
</template>

<!-- Template HTML per una singola risposta (usato da JavaScript) -->
<template id="answer-template-create">
    <div class="answer-block-styled padding-medium margin-bottom-medium box-shadow-extra-light" data-answer="__A_NUM__"> <!-- Placeholder __A_NUM__ per il numero risposta -->
        <div class="answer-header-styled flex-container flex-justify-between flex-align-center margin-bottom-small">
            <label class="form-label-styled label-bold-styled label-accent-color-styled answer-label-dynamic">Risposta <span class="answer-number">__A_NUM__</span></label>
            <button type="button" class="button-styled button-danger-styled button-extra-small-styled remove-answer" title="Rimuovi Risposta">
                <i class="fas fa-times"></i> <!-- Icona 'X' per rimuovere -->
            </button>
        </div>
        <div class="form-field-group margin-bottom-small">
            <label for="question-__Q_NUM__-answer-__A_NUM__" class="form-label-styled label-small-styled">Testo della Risposta:</label>
            <input type="text" name="questions[__Q_NUM__][answers][__A_NUM__][text]" id="question-__Q_NUM__-answer-__A_NUM__" class="form-input-styled input-small-styled" required placeholder="Testo della risposta">
        </div>
        <div class="form-field-group margin-bottom-small">
            <label class="form-label-styled label-small-styled display-block margin-bottom-extra-small">Tipo Risposta:</label>
            <div class="radio-option-group-styled"> <!-- Gruppo per radio button Corretta/Sbagliata -->
                <div class="radio-option-styled">
                    <input class="radio-input-styled" type="radio" name="questions[__Q_NUM__][answers][__A_NUM__][type]" id="question-__Q_NUM__-answer-__A_NUM__-type-correct" value="Corretta">
                    <label class="radio-label-styled" for="question-__Q_NUM__-answer-__A_NUM__-type-correct">Corretta</label>
                </div>
                <div class="radio-option-styled">
                    <input class="radio-input-styled" type="radio" name="questions[__Q_NUM__][answers][__A_NUM__][type]" id="question-__Q_NUM__-answer-__A_NUM__-type-wrong" value="Sbagliata" checked> <!-- Sbagliata come default -->
                    <label class="radio-label-styled" for="question-__Q_NUM__-answer-__A_NUM__-type-wrong">Sbagliata</label>
                </div>
            </div>
        </div>
        <div class="form-field-group points-group" style="display:none;"> <!-- Campo Punti, nascosto di default -->
            <label for="question-__Q_NUM__-answer-__A_NUM__-points" class="form-label-styled label-small-styled">Punti (se corretta):</label>
            <input type="number" name="questions[__Q_NUM__][answers][__A_NUM__][points]" id="question-__Q_NUM__-answer-__A_NUM__-points" class="form-input-styled input-small-styled input-numerical-styled" value="1" min="0">
        </div>
    </div>
</template>

<!-- Modale di Conferma per l'Annullamento della Creazione del Quiz -->
<div id="confirmAbortCreationModal" class="custom-modal" style="display:none;">
    <div class="custom-modal-content">
        <span class="custom-modal-close-button">×</span> <!-- Bottone chiusura modale -->
        <h2 class="custom-modal-title">Conferma Annullamento</h2>
        <p id="abortCreationModalMessage" class="custom-modal-text">Sei sicuro di voler annullare la creazione del quiz? Eventuali dati inseriti o il quiz parzialmente creato verranno persi.</p>
        <div class="custom-modal-actions">
            <button type="button" id="cancelAbortBtn" class="button-styled button-grey-styled">Indietro</button>
            <button type="button" id="confirmAbortActionBtn" class="button-styled button-danger-styled">Sì, Annulla Creazione</button>
        </div>
    </div>
</div>

<?php 
// Include il footer comune.
include 'includes/footer.php'; 
?>
<!-- La chiusura del tag </body> è in footer.php -->
</html>