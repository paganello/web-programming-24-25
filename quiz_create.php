<?php
/**
 * Pagina di creazione dei quiz.
 *
 * Questa pagina permette agli utenti di creare nuovi quiz.
 */

include 'includes/header.php'; // Assicurati che questo includa Bootstrap e FontAwesome se usati

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Controllo se l'utente è loggato.
if (!isset($_SESSION['user'])) {
    header('Location: auth_login.php');
    exit;
}
?>

<div class="main-content">
    <div class="content">
        <h1>Crea un nuovo Quiz</h1>

        <!-- Placeholder per gli alert JavaScript -->
        <div id="alert-container-page" class="mb-3"></div>

        <div id="quiz-details">
            <div class="card shadow-sm mb-4">
                <div class="card-header">
                    <h2 class="h5 mb-0">Dettagli del Quiz</h2>
                </div>
                <div class="card-body">
                    <form id="create-quiz-form">
                        <div class="form-group mb-3">
                            <label for="titolo" class="form-label">Titolo del Quiz</label>
                            <input type="text" name="titolo" id="titolo" class="form-control" required>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group mb-3">
                                    <label for="dataInizio" class="form-label">Data di inizio</label>
                                    <input type="date" name="dataInizio" id="dataInizio" class="form-control" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group mb-3">
                                    <label for="dataFine" class="form-label">Data di fine</label>
                                    <input type="date" name="dataFine" id="dataFine" class="form-control" required>
                                </div>
                            </div>
                        </div>

                        <div class="form-group text-end">
                            <br>
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-arrow-right"></i> Continua e Aggiungi Domande
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div id="questions-section" style="display: none;">
            <div class="card shadow-sm">
                <div class="card-header">
                    <h2 class="h5 mb-0">Aggiungi Domande al Quiz</h2>
                </div>
                <div class="card-body">
                    <input type="hidden" id="quiz-id" value="">
                    <form id="questions-form">
                        <div id="questions-container">
                            <p id="no-questions-message" class="text-muted text-center py-3">
                                Nessuna domanda aggiunta. Clicca su "Aggiungi Domanda" per iniziare.
                            </p>
                        </div>

                        <div class="d-flex justify-content-between align-items-center mt-4 pt-3 border-top">
                            <button type="button" id="add-question" class="btn btn-success">
                                <i class="fas fa-plus"></i> Aggiungi Domanda
                            </button>
                            <div>
                                <button type="button" id="abort-quiz-creation" class="btn btn-outline-danger me-2">
                                    <i class="fas fa-times"></i> Annulla Creazione
                                </button>
                                <button type="button" id="save-questions" class="btn btn-primary">
                                    <i class="fas fa-save"></i> Salva Quiz e Domande
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Template per una singola domanda (usato da JavaScript) -->
<template id="question-template-create">
    <div class="question-block card mb-3" data-question="__Q_NUM__">
        <div class="card-body">
            <div class="d-flex justify-content-between align-items-start mb-2">
                <h3 class="h6 mb-0">Domanda <span class="question-number">__Q_NUM__</span></h3>
                <button type="button" class="btn btn-sm btn-outline-danger remove-question" data-question="__Q_NUM__" title="Rimuovi Domanda __Q_NUM__">
                    <i class="fas fa-trash"></i> Rimuovi Domanda
                </button>
            </div>
            <div class="form-group mb-3">
                <label for="question-__Q_NUM__" class="form-label">Testo della domanda</label>
                <textarea name="questions[__Q_NUM__][text]" id="question-__Q_NUM__" class="form-control" rows="2" required></textarea>
            </div>
            
            <h4 class="h6 mt-3 mb-2">Risposte:</h4>
            <div class="answers-container ps-3" id="answers-container-__Q_NUM__">
                <!-- Le risposte verranno aggiunte qui -->
            </div>
            <button type="button" class="btn btn-sm btn-info add-answer mt-2" data-question="__Q_NUM__">
                <i class="fas fa-plus-circle"></i> Aggiungi Risposta
            </button>
        </div>
    </div>
</template>

<!-- Template per una singola risposta (usato da JavaScript) -->
<template id="answer-template-create">
    <div class="answer-block border rounded p-2 mb-2 bg-light" data-answer="__A_NUM__">
        <div class="d-flex justify-content-between align-items-center mb-1">
            <label for="question-__Q_NUM__-answer-__A_NUM__" class="form-label fw-bold">Risposta <span class="answer-number">__A_NUM__</span></label>
            <button type="button" class="btn btn-xs btn-outline-danger remove-answer" title="Rimuovi Risposta">
                <i class="fas fa-times"></i>
            </button>
        </div>
        <div class="form-group mb-2">
            <input type="text" name="questions[__Q_NUM__][answers][__A_NUM__][text]" id="question-__Q_NUM__-answer-__A_NUM__" class="form-control form-control-sm" required placeholder="Testo della risposta">
        </div>
        <div class="form-group mb-2">
            <div class="radio-group">
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="questions[__Q_NUM__][answers][__A_NUM__][type]" id="question-__Q_NUM__-answer-__A_NUM__-type-correct" value="Corretta">
                    <label class="form-check-label" for="question-__Q_NUM__-answer-__A_NUM__-type-correct">Corretta</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="questions[__Q_NUM__][answers][__A_NUM__][type]" id="question-__Q_NUM__-answer-__A_NUM__-type-wrong" value="Sbagliata" checked>
                    <label class="form-check-label" for="question-__Q_NUM__-answer-__A_NUM__-type-wrong">Sbagliata</label>
                </div>
            </div>
        </div>
        <div class="form-group points-group" style="display:none;">
            <label for="question-__Q_NUM__-answer-__A_NUM__-points" class="form-label form-label-sm">Punti (se corretta):</label>
            <input type="number" name="questions[__Q_NUM__][answers][__A_NUM__][points]" id="question-__Q_NUM__-answer-__A_NUM__-points" class="form-control form-control-sm" value="1" min="0" style="width: 80px;">
        </div>
    </div>
</template>

<?php include 'includes/footer.php'; ?>