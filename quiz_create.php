<?php

/**
 * Pagina di creazione dei quiz.
 * 
 * Questa pagina permette agli utenti di creare nuovi quiz.
 */

include 'includes/header.php';

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

        <div id="quiz-details">
            <div class="card">
                <div class="card-content">
                    <form id="create-quiz-form">
                        <div class="form-group">
                            <label for="titolo">Titolo del Quiz</label>
                            <input type="text" name="titolo" id="titolo" required>
                        </div>

                        <div class="form-group">
                            <label for="dataInizio">Data di inizio</label>
                            <input type="date" name="dataInizio" id="dataInizio" required>
                        </div>

                        <div class="form-group">
                            <label for="dataFine">Data di fine</label>
                            <input type="date" name="dataFine" id="dataFine" required>
                        </div>

                        <div class="form-group">
                            <button type="submit">Continua</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div id="questions-section" style="display: none;">
            <h2>Aggiungi Domande</h2>

            <input type="hidden" id="quiz-id" value="">

            <form id="questions-form">
                <div id="questions-container"></div>

                <div class="form-group">
                    <br />
                    <button type="button" id="add-question" class="btn btn-secondary">Aggiungi Domanda</button>
                </div>

                <div class="form-group">
                    <button type="button" id="save-questions" class="btn">Salva Quiz</button>
                    <button type="button" id="abort-quiz-creation" class="btn btn-danger">Annulla</button>
                </div>
            </form>
        </div>
    </div>
</div>

<?php include 'includes/footer.php'; ?>