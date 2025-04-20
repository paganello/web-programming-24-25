/**
 * assets/js/main.js
 * 
 * Funzionalità principali:
 * - Gestione delle chiamate alle API
 * - Validazione dei form lato client
 * - Aggiunta/rimozione dinamica di domande e risposte nei form di creazione quiz
 * - Gestione della navigazione e delle transizioni tra le diverse sezioni
 * - Gestione modali
 */

function checkDateRange(startDate, endDate) {
    const today = new Date();
    today.setHours(0, 0, 0, 0); // Normalizza l'orario a mezzanotte

    if (startDate < today) {
        return 'La data di inizio non può essere precedente a oggi.';
    }
    if (endDate < startDate) {
        return 'La data di fine non può essere precedente alla data di inizio.';
    }
    return null;
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

// Mostra messaggi
function showEditAlerts(message, type) {
    const alert = $('<div class="alert alert-' + type + '">' + message + '</div>');
    $('#form-messages').empty().append(alert);
    alert.delay(5000).fadeOut();
}

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

$(document).ready(function () {
    // -- Login e Registrazione ---
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

    // -- Creazione Quiz ---
    $('#create-quiz-form').on('submit', function (e) {
        e.preventDefault();

        const startDate = new Date($('#dataInizio').val());
        const endDate = new Date($('#dataFine').val());
        const errorMessage = checkDateRange(startDate, endDate);
        if (errorMessage) {
            showAlert(errorMessage, 'danger');
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
            error: function () {
                showAlert('Errore durante la comunicazione con il server', 'danger');
            }
        });
    });

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
                    <button type="button" class="btn remove-answer">Rimuovi Risposta</button>
                </div>
            </div>
            <button type="button" class="btn btn-secondary add-answer" data-question="${questionCounter}">Aggiungi Risposta</button>
            <br/><br/>
            <button type="button" class="btn remove-question" data-question="${questionCounter}">Rimuovi Domanda</button>
            <hr>       
        </div>
    `;

        $('#questions-container').append(questionHtml);
    });

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
            <button type="button" class="btn remove-answer">Rimuovi Risposta</button>
        </div>
    `;

        answersContainer.append(answerHtml);
    });

    $(document).on('click', '.remove-answer', function () {
        $(this).closest('.answer-block').remove();
        renumberQuestions();
    });

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

    // -- Partecipazione ---
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

    // -- Ricerca ---
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

    // Controlla se sei sulla pagina my_participations.php
    if (window.location.pathname.endsWith('my_participations.php')) {
        // Carica le partecipazioni tramite AJAX
        $.ajax({
            url: 'api/partecipation.php',
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                let html = '';

                if (response.status === 'success' && response.data && response.data.length > 0) {
                    $.each(response.data, function (index, part) {
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
            error: function (xhr, status, error) {
                console.error("Errore AJAX:", status, error);
                $('#partecipations-container').html('<p>Errore nel caricamento</p>');

                if (typeof showAlert === 'function') {
                    showAlert('Errore durante il caricamento delle partecipazioni', 'error');
                }
            }
        });
    }

    // --- Modifica quiz ---
    $('#add-question-btn').click(function () {
        const questionIndex = $('.question-block').length;
        const template = $('#question-template').html()
            .replace(/__Q_INDEX__/g, questionIndex)
            .replace('__Q_DISPLAY_NUM__', questionIndex + 1);

        $('#questions-container').append(template);
    });

    $(document).on('click', '.add-answer-btn', function () {
        const questionBlock = $(this).closest('.question-block');
        const questionIndex = questionBlock.data('question-index');
        const answerIndex = questionBlock.find('.answer-block').length;
        const answersContainer = questionBlock.find('.answers-container');

        const template = $('#answer-template').html()
            .replace(/__Q_INDEX__/g, questionIndex)
            .replace(/__A_INDEX__/g, answerIndex)
            .replace('__A_DISPLAY_NUM__', answerIndex + 1);

        answersContainer.append(template);
    });

    $(document).on('click', '.remove-question-btn', function () {
        $(this).closest('.question-block').remove();
        renumberEditQuestions();
    });

    $(document).on('click', '.remove-answer-btn', function () {
        const answerBlock = $(this).closest('.answer-block');
        if (answerBlock.siblings('.answer-block').length >= 1) {
            answerBlock.remove();
            renumberEditAnswers(answerBlock.closest('.question-block'));
        } else {
            alert('Ogni domanda deve avere almeno una risposta!');
        }
    });

    function renumberEditQuestions() {
        $('.question-block').each(function (index) {
            $(this).attr('data-question-index', index);
            $(this).find('h2').text('Domanda ' + (index + 1));

            // Aggiorna i nomi dei campi
            $(this).find('[name^="questions["]').each(function () {
                const newName = $(this).attr('name').replace(/questions\[\d+\]/, 'questions[' + index + ']');
                $(this).attr('name', newName);
            });

            // Rinumerazione risposte per questa domanda
            renumberEditAnswers($(this));
        });
    }

    function renumberEditAnswers(questionBlock) {
        questionBlock.find('.answer-block').each(function (index) {
            $(this).attr('data-answer-index', index);
            $(this).find('h3').text('Risposta ' + (index + 1));

            // Aggiorna i nomi dei campi
            $(this).find('[name^="questions["]').each(function () {
                const nameParts = $(this).attr('name').match(/questions\[(\d+)\]\[answers\]\[(\d+)\]/);
                if (nameParts) {
                    const newName = $(this).attr('name')
                        .replace(/questions\[\d+\]\[answers\]\[\d+\]/,
                            'questions[' + nameParts[1] + '][answers][' + index + ']');
                    $(this).attr('name', newName);
                }
            });
        });
    }

    // Invio del form
    $('#edit-quiz-form').submit(function (e) {
        e.preventDefault();

        // Validazione date
        const startDate = new Date($('#dataInizio').val());
        const endDate = new Date($('#dataFine').val());

        const errorMessage = checkDateRange(startDate, endDate);
        if (errorMessage) {
            showEditAlerts(errorMessage, 'error');
            return;
        }

        // Invio AJAX
        $.ajax({
            url: 'api/quiz.php',
            type: 'PUT',
            data: $(this).serialize(),
            dataType: 'json',
            success: function (response) {
                if (response.status === 'success') {
                    showEditAlerts('Quiz aggiornato con successo!', 'success');
                    setTimeout(() => {
                        window.location.href = 'quiz_view.php?id=' + $('#edit-quiz-form input[name="quiz_id"]').val();
                    }, 1500);
                } else {
                    showEditAlerts(response.message || 'Errore durante il salvataggio', 'error');
                }
            },
            error: function (xhr) {
                showEditAlerts('Errore di connessione: ' + xhr.statusText, 'error');
            }
        });
    });
});

// Gestione modal di conferma eliminazione
$(document).ready(function () {
    const $modal = $('#confirmDeleteModal');
    const $confirmDeleteButton = $('#confirmDeleteActionBtn');
    const $cancelDeleteBtn = $('#cancelDeleteBtn');
    const $closeButton = $modal.find('.close-button');

    let quizIdToDelete = null; // Variabile per memorizzare l'ID

    // --- Listener per i link "Elimina" nella lista ---
    $('.delete-quiz-btn').on('click', function (event) {
        event.preventDefault();
        quizIdToDelete = $(this).attr('delId');
        if (quizIdToDelete && quizIdToDelete !== '#') {
            $modal.show();
        }
    });

    // --- Listener per il pulsante "Conferma" nel modale ---
    $confirmDeleteButton.on('click', function () {
        const apiUrl = `api/quiz.php?delId=${quizIdToDelete}`; // Cambia con il tuo URL API
        console.log(`Invio richiesta a: ${apiUrl}`); // Utile per il debug

        $.ajax({
            url: apiUrl,
            method: 'GET',
            success: function (response, status, xhr) {
                if (xhr.status === 204) {
                    location.reload();
                }
            },
            error: function (xhr, status, error) {
                console.error('Errore durante l\'eliminazione del quiz:', error);
                alert(`Si è verificato un errore durante l'eliminazione del quiz ID ${quizIdToDelete}. Controlla la console per i dettagli.`);
            }
        });
    });

    const hideModal = () => {
        $modal.hide();
        quizIdToDelete = null;
    };

    // --- Listener per il pulsante "Annulla" e chiusura del modale ---
    $cancelDeleteBtn.on('click', hideModal);
    $closeButton.on('click', hideModal);

    // --- Listener per clic fuori dal modale ---
    $(window).on('click', function (event) {
        if ($(event.target).is($modal)) hideModal();
    });

    // --- Listener per il tasto "Escape" ---
    $(window).on('keydown', function (event) {
        if (event.key === 'Escape' && $modal.is(':visible')) hideModal();
    });
});