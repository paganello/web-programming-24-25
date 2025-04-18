/**
 * assets/js/main.js
 * 
 * Funzionalità principali:
 * - Gestione delle chiamate alle API
 * - Validazione dei form lato client
 * - Aggiunta/rimozione dinamica di domande e risposte nei form di creazione quiz
 * - Gestione della navigazione e delle transizioni tra le diverse sezioni
 */

$(document).ready(function () {
    // Login e Registrazione
    $('#login-form').on('submit', function (e) {
        e.preventDefault();

        $.ajax({
            type: 'POST',
            url: 'api/users.php?action=login',
            data: $(this).serialize(),
            dataType: 'json',
            success: function (response) {
                if (response.status === 'success') {
                    showAlert('Login effettuato con successo!', 'success');
                    setTimeout(function () {
                        window.location.href = 'index.php';
                    }, 1500);
                } else {
                    showAlert(response.message, 'danger');
                }
            },
            error: function () {
                showAlert('Errore durante la comunicazione con il server', 'danger');
            }
        });
    });

    $('#register-form').on('submit', function (e) {
        e.preventDefault();

        $.ajax({
            type: 'POST',
            url: 'api/users.php?action=register',
            data: $(this).serialize(),
            dataType: 'json',
            success: function (response) {
                if (response.status === 'success') {
                    showAlert('Registrazione completata con successo!', 'success');
                    setTimeout(function () {
                        window.location.href = 'login.php';
                    }, 1500);
                } else {
                    showAlert(response.message, 'danger');
                }
            },
            error: function () {
                showAlert('Errore durante la comunicazione con il server', 'danger');
            }
        });
    });

    // Creazione Quiz
    $('#create-quiz-form').on('submit', function (e) {
        e.preventDefault();

        const today = new Date();
        today.setHours(0, 0, 0, 0); // Normalizza l'orario a mezzanotte

        const startDate = new Date($('#start_date').val());
        const endDate = new Date($('#end_date').val());

        // Controllo: data di inizio < oggi
        if (startDate < today) {
            showAlert('La data di inizio non può essere precedente a oggi.', 'danger');
            return;
        }

        // Controllo: data di fine < data di inizio
        if (endDate < startDate) {
            showAlert('La data di fine non può essere precedente alla data di inizio.', 'danger');
            return;
        }
        $.ajax({
            type: 'POST',
            url: 'api/quiz.php?action=create',
            data: $(this).serialize(),
            dataType: 'json',
            success: function (response) {
                if (response.status === 'success') {
                    showAlert('Quiz creato con successo!', 'success');
                    $('#quiz-id').val(response.idQuiz);
                    $('#quiz-details').hide();
                    $('#questions-section').show();
                } else {
                    showAlert(response.message, 'danger');
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.error("Errore AJAX:");
                console.error("Stato Testuale: ", textStatus); // Es: "timeout", "error", "abort", "parsererror"
                console.error("Errore Lanciato: ", errorThrown); // Es: Oggetto Error o stringa
                console.error("Risposta Ricevuta (raw): ", jqXHR.responseText); // Il testo grezzo della risposta
                console.error("Oggetto jqXHR: ", jqXHR); // L'oggetto XHR completo
                let errorMsg = 'Errore durante la comunicazione con il server.';
                if (textStatus === 'parsererror') {
                     errorMsg = 'Errore nel parsing della risposta JSON dal server.';
                } else if (jqXHR.responseText) {
                     // Prova a mostrare un messaggio più specifico se disponibile
                     try {
                         const errResponse = JSON.parse(jqXHR.responseText);
                         if (errResponse && errResponse.message) {
                             errorMsg = errResponse.message;
                         }
                     } catch(e) {
                         // Non era JSON valido, mantieni il messaggio generico
                     }
                }
                showAlert(errorMsg + ' (Status: ' + textStatus + ')', 'danger');
            }
        });
    });

    // Funzione per rinumerare tutte le domande e risposte
    function renumberQuestions() {
        $('.question-block').each(function (index) {
            const qNum = index + 1;
            $(this).attr('data-question', qNum);
            $(this).find('label[for^="question-"]').attr('for', `question-${qNum}`);
            $(this).find('textarea').attr('id', `question-${qNum}`).attr('name', `questions[${qNum}][text]`);
            $(this).find('.answers-container').attr('id', `answers-container-${qNum}`);
            $(this).find('.add-answer').data('question', qNum);
            $(this).find('.remove-question').data('question', qNum);

            // Rinumeriamo anche le risposte
            $(this).find('.answer-block').each(function (aIndex) {
                const aNum = aIndex + 1;
                $(this).attr('data-answer', aNum);
                $(this).find('label[for^="question-"]').attr('for', `question-${qNum}-answer-${aNum}`);
                $(this).find('input[type="text"]').attr({
                    'id': `question-${qNum}-answer-${aNum}`,
                    'name': `questions[${qNum}][answers][${aNum}][text]`
                });
                $(this).find('input[type="radio"]').each(function () {
                    const value = $(this).val();
                    $(this).attr('name', `questions[${qNum}][answers][${aNum}][type]`);
                });
                $(this).find('.points-group input').attr({
                    'id': `question-${qNum}-answer-${aNum}-points`,
                    'name': `questions[${qNum}][answers][${aNum}][points]`
                });
            });
        });
    }

    // Aggiunta domanda
    $('#add-question').click(function () {
        const questionCounter = $('.question-block').length + 1;

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
                    <button type="button" class="btn btn-danger remove-answer">Rimuovi Risposta</button>
                </div>
            </div>
            <button type="button" class="btn btn-secondary add-answer" data-question="${questionCounter}">Aggiungi Risposta</button>
            <br/><br/>
            <button type="button" class="btn btn-danger remove-question" data-question="${questionCounter}">Rimuovi Domanda</button>
            <hr>       
        </div>
    `;

        $('#questions-container').append(questionHtml);
    });

    // Aggiunta risposta
    $(document).on('click', '.add-answer', function () {
        const questionId = $(this).data('question');
        const answersContainer = $(`#answers-container-${questionId}`);
        const answerCount = answersContainer.find('.answer-block').length + 1;

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
            <button type="button" class="btn btn-danger remove-answer">Rimuovi Risposta</button>
        </div>
    `;

        answersContainer.append(answerHtml);
    });

    // Rimozione risposta
    $(document).on('click', '.remove-answer', function () {
        $(this).closest('.answer-block').remove();
        renumberQuestions();
    });

    // Rimozione domanda
    $(document).on('click', '.remove-question', function () {
        $(this).closest('.question-block').remove();
        renumberQuestions();
    });

    // Mostra/nascondi punteggio
    $(document).on('change', 'input[type=radio]', function () {
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
    $('#save-questions').click(function () {
        const quizId = $('#quiz-id').val();
        const formData = $('#questions-form').serialize() + `&idQuiz=${quizId}`;

        $.ajax({
            type: 'POST',
            url: 'api/questions.php?action=save',
            data: formData,
            dataType: 'json',
            success: function (response) {
                if (response.status === 'success') {
                    showAlert('Domande e risposte salvate con successo!', 'success');
                    setTimeout(function () {
                        window.location.href = 'quiz_view.php?id=' + quizId;
                    }, 1500);
                } else {
                    showAlert(response.message, 'danger');
                }
            },
            error: function () {
                showAlert('Errore durante la comunicazione con il server', 'danger');
            }
        });
    });

    // Partecipazione al quiz
    $('#participate-form').on('submit', function (e) {
        e.preventDefault();

        $.ajax({
            type: 'POST',
            url: 'api/partecipation.php?action=submit',
            data: $(this).serialize(),
            dataType: 'json',
            success: function (response) {
                if (response.status === 'success') {
                    showAlert('Risposte inviate con successo!', 'success');
                    setTimeout(function () {
                        window.location.href = 'results.php?participation=' + response.data.codice;
                    }, 1500);
                } else {
                    showAlert(response.message, 'danger');
                }
            },
            error: function () {
                showAlert('Errore durante la comunicazione con il server', 'danger');
            }
        });
    });

    // Ricerca Quiz
    $('#search-quiz-form').on('submit', function (e) {
        e.preventDefault();

        $.ajax({
            type: 'GET',
            url: 'api/quiz.php?action=search',
            data: $(this).serialize(),
            dataType: 'json',
            success: function (response) {
                if (response.status === 'success') {
                    displayQuizResults(response.quizzes);
                } else {
                    showAlert(response.message, 'info');
                    $('#quiz-results').html('');
                }
            },
            error: function () {
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
                            <a href="quiz_view.php?id=${quiz.codice}" class="btn">Visualizza</a>
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
        setTimeout(function () {
            $('#alert-container .alert').fadeOut();
        }, 5000);
    }

    // Carica le partecipazioni
    $.ajax({
        url: 'api/partecipation.php',
        type: 'GET',
        dataType: 'json',
        success: function(response) {
            let html = '';
            
            // Se ci sono partecipazioni, le mostra
            if (response.status === 'success' && response.data && response.data.length > 0) {
                $.each(response.data, function(index, part) {
                    const date = new Date(part.data).toLocaleDateString('it-IT');
                    
                    html += `
                        <div class="partecipation-card">
                            <h3>${part.titolo}</h3>
                            <p>Data: ${date}</p>
                        </div>
                        <br/>
                    `;
                });
            } else {
                html = '<p>Nessuna partecipazione trovata</p>';
            }
            
            $('#partecipations-container').html(html);
        },
        error: function(xhr, status, error) {
            console.error("Errore AJAX:", status, error);
            $('#partecipations-container').html('<p>Errore nel caricamento</p>');
            
            // Mostra alert solo se la funzione esiste
            if (typeof showAlert === 'function') {
                showAlert('Errore durante il caricamento delle partecipazioni', 'error');
            }
        }
    });
    
});
