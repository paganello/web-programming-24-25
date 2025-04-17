/**
 * assets/js/main.js
 * Script JavaScript principale
 * 
 * Questo file gestisce tutte le interazioni lato client dell'applicazione.
 * Funzionalità principali:
 * - Gestione delle chiamate asincrone alle API tramite fetch
 * - Validazione dei form lato client
 * - Gestione dinamica dell'interfaccia utente
 * - Aggiunta/rimozione dinamica di domande e risposte nei form di creazione quiz
 * - Controllo in tempo reale delle risposte durante la partecipazione ai quiz
 * - Gestione della navigazione e delle transizioni tra le diverse sezioni
 */

$(document).ready(function() {
    // Login e Registrazione
    $('#login-form').on('submit', function(e) {
        e.preventDefault();
        
        $.ajax({
            type: 'POST',
            url: 'api/users.php?action=login',
            data: $(this).serialize(),
            dataType: 'json',
            success: function(response) {
                if (response.status === 'success') {
                    showAlert('Login effettuato con successo!', 'success');
                    setTimeout(function() {
                        window.location.href = 'index.php';
                    }, 1500);
                } else {
                    showAlert(response.message, 'danger');
                }
            },
            error: function() {
                showAlert('Errore durante la comunicazione con il server', 'danger');
            }
        });
    });

    $('#register-form').on('submit', function(e) {
        e.preventDefault();
        
        $.ajax({
            type: 'POST',
            url: 'api/users.php?action=register',
            data: $(this).serialize(),
            dataType: 'json',
            success: function(response) {
                if (response.status === 'success') {
                    showAlert('Registrazione completata con successo!', 'success');
                    setTimeout(function() {
                        window.location.href = 'login.php';
                    }, 1500);
                } else {
                    showAlert(response.message, 'danger');
                }
            },
            error: function() {
                showAlert('Errore durante la comunicazione con il server', 'danger');
            }
        });
    });

    // Creazione Quiz
    $('#create-quiz-form').on('submit', function(e) {
        e.preventDefault();
        
        $.ajax({
            type: 'POST',
            url: 'api/quiz.php?action=create',
            data: $(this).serialize(),
            dataType: 'json',
            success: function(response) {
                if (response.status === 'success') {
                    showAlert('Quiz creato con successo!', 'success');
                    $('#quiz-id').val(response.idQuiz);
                    $('#quiz-details').hide();
                    $('#questions-section').show();
                } else {
                    showAlert(response.message, 'danger');
                }
            },
            error: function() {
                showAlert('Errore durante la comunicazione con il server', 'danger');
            }
        });
    });

    // Aggiunta dinamica di domande e risposte
    let questionCounter = 1;
    
    $('#add-question').click(function() {
        const questionHtml = `
            <div class="question-block" data-question="${questionCounter}">
                <div class="form-group">
                    <label for="question-${questionCounter}">Testo della domanda ${questionCounter}</label>
                    <textarea name="questions[${questionCounter}][text]" id="question-${questionCounter}" required></textarea>
                </div>
                <div class="answers-container" id="answers-container-${questionCounter}">
                    <div class="answer-block" data-answer="1">
                        <div class="form-group">
                            <label for="question-${questionCounter}-answer-1">Risposta 1</label>
                            <input type="text" name="questions[${questionCounter}][answers][1][text]" id="question-${questionCounter}-answer-1" required>
                        </div>
                        <div class="form-group">
                            <label>Tipo di risposta</label>
                            <div class="radio-group">
                                <label>
                                    <input type="radio" name="questions[${questionCounter}][answers][1][type]" value="Corretta"> Corretta
                                </label>
                                <label>
                                    <input type="radio" name="questions[${questionCounter}][answers][1][type]" value="Sbagliata" checked> Sbagliata
                                </label>
                            </div>
                        </div>
                        <div class="form-group points-group" style="display:none;">
                            <label for="question-${questionCounter}-answer-1-points">Punteggio</label>
                            <input type="number" name="questions[${questionCounter}][answers][1][points]" id="question-${questionCounter}-answer-1-points" value="0" min="0">
                        </div>
                    </div>
                </div>
                <button type="button" class="btn btn-secondary add-answer" data-question="${questionCounter}">Aggiungi Risposta</button>
                <hr>
            </div>
        `;
        
        $('#questions-container').append(questionHtml);
        questionCounter++;
    });

    // Delegare l'evento per aggiungere risposte
    $(document).on('click', '.add-answer', function() {
        const questionId = $(this).data('question');
        const answersContainer = $(`#answers-container-${questionId}`);
        const answerCount = answersContainer.children().length + 1;
        
        const answerHtml = `
            <div class="answer-block" data-answer="${answerCount}">
                <div class="form-group">
                    <label for="question-${questionId}-answer-${answerCount}">Risposta ${answerCount}</label>
                    <input type="text" name="questions[${questionId}][answers][${answerCount}][text]" id="question-${questionId}-answer-${answerCount}" required>
                </div>
                <div class="form-group">
                    <label>Tipo di risposta</label>
                    <div class="radio-group">
                        <label>
                            <input type="radio" name="questions[${questionId}][answers][${answerCount}][type]" value="Corretta"> Corretta
                        </label>
                        <label>
                            <input type="radio" name="questions[${questionId}][answers][${answerCount}][type]" value="Sbagliata" checked> Sbagliata
                        </label>
                    </div>
                </div>
                <div class="form-group points-group" style="display:none;">
                    <label for="question-${questionId}-answer-${answerCount}-points">Punteggio</label>
                    <input type="number" name="questions[${questionId}][answers][${answerCount}][points]" id="question-${questionId}-answer-${answerCount}-points" value="0" min="0">
                </div>
            </div>
        `;
        
        answersContainer.append(answerHtml);
    });

    // Mostra/nascondi campo punteggio in base al tipo di risposta
    $(document).on('change', 'input[type=radio]', function() {
        const answerBlock = $(this).closest('.answer-block');
        const pointsGroup = answerBlock.find('.points-group');
        
        if ($(this).val() === 'Corretta') {
            pointsGroup.show();
        } else {
            pointsGroup.hide();
            pointsGroup.find('input').val(0);
        }
    });

    // Salvataggio domande e risposte
    $('#save-questions').click(function() {
        const quizId = $('#quiz-id').val();
        const formData = $('#questions-form').serialize() + `&idQuiz=${quizId}`;
        
        $.ajax({
            type: 'POST',
            url: 'api/questions.php?action=save',
            data: formData,
            dataType: 'json',
            success: function(response) {
                if (response.status === 'success') {
                    showAlert('Domande e risposte salvate con successo!', 'success');
                    setTimeout(function() {
                        window.location.href = 'view_quiz.php?id=' + quizId;
                    }, 1500);
                } else {
                    showAlert(response.message, 'danger');
                }
            },
            error: function() {
                showAlert('Errore durante la comunicazione con il server', 'danger');
            }
        });
    });

    // Partecipazione al quiz
    $('#participate-form').on('submit', function(e) {
        e.preventDefault();
        
        $.ajax({
            type: 'POST',
            url: 'api/partecipation.php?action=submit',
            data: $(this).serialize(),
            dataType: 'json',
            success: function(response) {
                if (response.status === 'success') {
                    showAlert('Risposte inviate con successo!', 'success');
                    setTimeout(function() {
                        window.location.href = 'results.php?participation=' + response.participation_id;
                    }, 1500);
                } else {
                    showAlert(response.message, 'danger');
                }
            },
            error: function() {
                showAlert('Errore durante la comunicazione con il server', 'danger');
            }
        });
    });

    // Ricerca Quiz
    $('#search-quiz-form').on('submit', function(e) {
        e.preventDefault();
        
        $.ajax({
            type: 'GET',
            url: 'api/quiz.php?action=search',
            data: $(this).serialize(),
            dataType: 'json',
            success: function(response) {
                if (response.status === 'success') {
                    displayQuizResults(response.quizzes);
                } else {
                    showAlert(response.message, 'info');
                    $('#quiz-results').html('');
                }
            },
            error: function() {
                showAlert('Errore durante la comunicazione con il server', 'danger');
            }
        });
    });

    // Funzione per mostrare i risultati della ricerca
    function displayQuizResults(quizzes) {
        let html = '';
        
        if (quizzes.length === 0) {
            html = '<p>Nessun quiz trovato.</p>';
        } else {
            html = '<div class="quiz-list">';
            
            quizzes.forEach(quiz => {
                html += `
                    <div class="quiz-item">
                        <h3 class="quiz-title">${quiz.titolo}</h3>
                        <div class="quiz-meta">
                            <p>Creato da: ${quiz.creatore}</p>
                            <p>Disponibile dal ${quiz.dataInizio} al ${quiz.dataFine}</p>
                        </div>
                        <div class="quiz-actions">
                            <a href="view_quiz.php?id=${quiz.codice}" class="btn">Visualizza</a>
                            <a href="participate.php?id=${quiz.codice}" class="btn btn-secondary">Partecipa</a>
                        </div>
                    </div>
                `;
            });
            
            html += '</div>';
        }
        
        $('#quiz-results').html(html);
    }

    // Funzione per mostrare messaggi di alert
    function showAlert(message, type) {
        const alertHtml = `
            <div class="alert alert-${type}">
                ${message}
            </div>
        `;
        
        $('#alert-container').html(alertHtml);
        
        // Auto-hide after 5 seconds
        setTimeout(function() {
            $('#alert-container .alert').fadeOut();
        }, 5000);
    }
});
