<?php

/**
 * Pagina di creazione dei quiz
 * 
 * Questa pagina permette agli utenti di creare nuovi quiz.
 * Funzionalità implementate:
 * - Form per l'inserimento dei dettagli del quiz (titolo, date)
 * - Aggiunta dinamica di domande
 * - Aggiunta dinamica di risposte per ogni domanda
 * - Specificazione delle risposte corrette e dei relativi punteggi
 * - Anteprima del quiz prima della pubblicazione
 * - Salvataggio del quiz nel database
 */

include 'includes/header.php';

// Controllo se l'utente è loggato
if (!isset($_SESSION['user'])) {
    header('Location: login.php');
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
                            <label for="title">Titolo del Quiz</label>
                            <input type="text" name="title" id="title" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="start_date">Data di inizio</label>
                            <input type="date" name="start_date" id="start_date" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="end_date">Data di fine</label>
                            <input type="date" name="end_date" id="end_date" required>
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
                    <br/>
                    <button type="button" id="add-question" class="btn btn-secondary">Aggiungi Domanda</button>
                </div>
                
                <div class="form-group">
                    <button type="button" id="save-questions" class="btn">Salva Quiz</button>
                </div>
            </form>
        </div>
    </div>
</div>

<?php include 'includes/footer.php'; ?>
