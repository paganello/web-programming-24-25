// assets/js/main.js

// Funzioni helper globali (definite prima di $(document).ready)
function checkDateRange(startDate, endDate) {
    const today = new Date();
    today.setHours(0, 0, 0, 0);
    if (startDate < today) {
        return 'La data di inizio non può essere precedente a oggi.';
    }
    if (endDate < startDate) {
        return 'La data di fine non può essere precedente alla data di inizio.';
    }
    return null;
}

function showAlert(message, type = 'info', containerSelector = '#alert-container') {
    // Questa funzione showAlert è per gli alert generati da JavaScript.
    // Il PHP non genererà più alert visivi all'utente in base alle modifiche recenti.
    const alertHtml = `<div class="alert alert-${type} alert-dismissible fade show" role="alert">
                            ${message}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                       </div>`;
    let $alertContainer = $(containerSelector);
    if (!$alertContainer.length) {
        $('body').prepend('<div id="alert-container-fallback" style="position:fixed; top:20px; left:50%; transform:translateX(-50%); z-index:9999; width:80%; max-width:600px;"></div>');
        $alertContainer = $('#alert-container-fallback');
    }
    $alertContainer.html(alertHtml);
    if (type !== 'danger' && type !== 'error') { // Non far sparire automaticamente gli errori critici
        setTimeout(function () {
            $alertContainer.find('.alert').fadeOut(500, function() { $(this).remove(); });
        }, 5000);
    }
}

function showEditAlerts(message, type) { // Specifica per form di modifica, usa showAlert
    showAlert(message, type, '#form-messages');
}

function renumberQuestions() { /* ... codice per rinumerare domande in create quiz ... */
    $('.question-block').each(function (index) {
        const qNum = index + 1;
        $(this).attr('data-question', qNum);
        $(this).find('label[for^="question-"]').first().attr('for', `question-${qNum}`).text(`Testo della domanda ${qNum}`);
        $(this).find('textarea[id^="question-"]').attr('id', `question-${qNum}`).attr('name', `questions[${qNum}][text]`);
        const answersContainer = $(this).find('.answers-container');
        answersContainer.attr('id', `answers-container-${qNum}`);
        $(this).find('.add-answer').data('question', qNum);
        $(this).find('.remove-question').data('question', qNum).text(`Rimuovi Domanda ${qNum}`); // Aggiorna testo bottone
        answersContainer.find('.answer-block').each(function (aIndex) {
            const aNum = aIndex + 1;
            $(this).attr('data-answer', aNum);
            $(this).find('label[for^="question-"]').first().attr('for', `question-${qNum}-answer-${aNum}`).text(`Risposta ${aNum}`);
            $(this).find('input[type="text"][id^="question-"]').attr({'id': `question-${qNum}-answer-${aNum}`, 'name': `questions[${qNum}][answers][${aNum}][text]`});
            $(this).find('input[type="radio"][name$="[type]"]').attr('name', `questions[${qNum}][answers][${aNum}][type]`);
            const pointsGroupInput = $(this).find('.points-group input[type="number"]');
            pointsGroupInput.attr({'id': `question-${qNum}-answer-${aNum}-points`, 'name': `questions[${qNum}][answers][${aNum}][points]`});
            $(this).find('.points-group label').attr('for', `question-${qNum}-answer-${aNum}-points`);
        });
    });
}

function renumberEditQuestions() { /* ... codice per rinumerare domande in edit quiz ... */
    $('#edit-quiz-form .question-block').each(function (index) {
        $(this).attr('data-question-index', index);
        $(this).find('h2.question-title-editor, .question-block > label').first().text('Domanda ' + (index + 1)); // Adatta selettore titolo
        $(this).find('[name^="questions["]').each(function () {
            const oldName = $(this).attr('name');
            if (oldName) {
                const newName = oldName.replace(/questions\[\d+\]/, 'questions[' + index + ']');
                $(this).attr('name', newName);
            }
        });
        renumberEditAnswers($(this), index);
    });
}

function renumberEditAnswers(questionBlock, questionIndex) { /* ... codice per rinumerare risposte in edit quiz ... */
    questionBlock.find('.answer-block').each(function (answerIdx) {
        $(this).attr('data-answer-index', answerIdx);
        $(this).find('h3.answer-title-editor, .answer-block > label').first().text('Risposta ' + (answerIdx + 1)); // Adatta selettore titolo
        $(this).find('[name*="[answers]"]').each(function () {
            const oldName = $(this).attr('name');
            if (oldName) {
                const newName = oldName.replace(/\[answers\]\[\d+\]/, `[answers][${answerIdx}]`).replace(/questions\[\d+\]/, `questions[${questionIndex}]`);
                $(this).attr('name', newName);
            }
        });
    });
}


$(document).ready(function () {
    // --- Login e Registrazione ---
    $('#login-form').on('submit', function (e) {
        e.preventDefault();
        $.ajax({
            type: 'POST', url: 'api/users.php?action=login', data: $(this).serialize(), dataType: 'json',
            success: function (response) {
                if (response.status === 'success') {
                    showAlert('Login effettuato con successo!', 'success');
                    setTimeout(() => window.location.href = 'index.php', 1500);
                } else { showAlert(response.message, 'danger'); }
            },
            error: () => showAlert('Errore durante la comunicazione con il server.', 'danger')
        });
    });

    $('#register-form').on('submit', function (e) {
        e.preventDefault();
        $.ajax({
            type: 'POST', url: 'api/users.php?action=register', data: $(this).serialize(), dataType: 'json',
            success: function (response) {
                if (response.status === 'success') {
                    showAlert('Registrazione completata con successo!', 'success');
                    setTimeout(() => window.location.href = 'auth_login.php', 1500);
                } else { showAlert(response.message, 'danger'); }
            },
            error: () => showAlert('Errore durante la comunicazione con il server.', 'danger')
        });
    });

    // --- Creazione Quiz (es. su quiz_create.php) ---
    if ($('#create-quiz-form').length) {
        $('#create-quiz-form').on('submit', function (e) {
            e.preventDefault();
            const startDate = new Date($('#dataInizio').val());
            const endDate = new Date($('#dataFine').val());
            const errorMessage = checkDateRange(startDate, endDate);
            if (errorMessage) { showAlert(errorMessage, 'danger'); return; }
            $.ajax({
                type: 'POST', url: 'api/quiz.php?action=create', data: $(this).serialize(), dataType: 'json',
                success: function (response) {
                    if (response.status === 'success' && response.idQuiz) {
                        showAlert('Quiz creato con successo! Ora aggiungi le domande.', 'success');
                        $('#quiz-id').val(response.idQuiz);
                        $('#quiz-details').hide();
                        $('#questions-section').show();
                    } else { showAlert(response.message || 'Errore nella creazione del quiz.', 'danger'); }
                },
                error: () => showAlert('Errore durante la creazione del quiz.', 'danger')
            });
        });

        $('#add-question').click(function () {
            const questionCounter = $('#questions-container .question-block').length + 1;
            const questionHtml = `
            <div class="question-block" data-question="${questionCounter}">
                <div class="form-group"> <label for="question-${questionCounter}">Testo della domanda ${questionCounter}</label> <textarea name="questions[${questionCounter}][text]" id="question-${questionCounter}" class="form-control" required></textarea> </div>
                <div class="answers-container" id="answers-container-${questionCounter}">
                    <div class="answer-block" data-answer="1">
                        <div class="form-group"><label for="question-${questionCounter}-answer-1">Risposta 1</label><input type="text" name="questions[${questionCounter}][answers][1][text]" id="question-${questionCounter}-answer-1" class="form-control" required></div>
                        <div class="form-group"><label>Tipo:</label><div class="radio-group"><label class="radio-inline"><input type="radio" name="questions[${questionCounter}][answers][1][type]" value="Corretta"> Corretta</label><label class="radio-inline"><input type="radio" name="questions[${questionCounter}][answers][1][type]" value="Sbagliata" checked> Sbagliata</label></div></div>
                        <div class="form-group points-group" style="display:none;"><label for="question-${questionCounter}-answer-1-points">Punti:</label><input type="number" name="questions[${questionCounter}][answers][1][points]" id="question-${questionCounter}-answer-1-points" class="form-control" value="1" min="0"></div>
                        <button type="button" class="btn btn-sm btn-danger remove-answer"><i class="fas fa-times"></i> Rimuovi Risp.</button>
                    </div>
                </div>
                <button type="button" class="btn btn-sm btn-info add-answer" data-question="${questionCounter}"><i class="fas fa-plus"></i> Aggiungi Risposta</button>
                <hr style="margin: 15px 0;">
                <button type="button" class="btn btn-danger remove-question" data-question="${questionCounter}"><i class="fas fa-trash"></i> Rimuovi Domanda ${questionCounter}</button>
            </div>`;
            $('#questions-container').append(questionHtml);
        });

        $(document).on('click', '#questions-container .add-answer', function () {
            const questionNum = $(this).data('question');
            const answersContainer = $(`#answers-container-${questionNum}`);
            const answerCount = answersContainer.find('.answer-block').length + 1;
            const answerHtml = `
            <div class="answer-block" data-answer="${answerCount}">
                <div class="form-group"><label for="question-${questionNum}-answer-${answerCount}">Risposta ${answerCount}</label><input type="text" name="questions[${questionNum}][answers][${answerCount}][text]" id="question-${questionNum}-answer-${answerCount}" class="form-control" required></div>
                <div class="form-group"><label>Tipo:</label><div class="radio-group"><label class="radio-inline"><input type="radio" name="questions[${questionNum}][answers][${answerCount}][type]" value="Corretta"> Corretta</label><label class="radio-inline"><input type="radio" name="questions[${questionNum}][answers][${answerCount}][type]" value="Sbagliata" checked> Sbagliata</label></div></div>
                <div class="form-group points-group" style="display:none;"><label for="question-${questionNum}-answer-${answerCount}-points">Punti:</label><input type="number" name="questions[${questionNum}][answers][${answerCount}][points]" id="question-${questionNum}-answer-${answerCount}-points" class="form-control" value="1" min="0"></div>
                <button type="button" class="btn btn-sm btn-danger remove-answer"><i class="fas fa-times"></i> Rimuovi Risp.</button>
            </div>`;
            answersContainer.append(answerHtml);
        });

        $(document).on('click', '#questions-container .remove-answer', function () {
            const questionBlock = $(this).closest('.question-block');
            if (questionBlock.find('.answer-block').length > 1) {
                $(this).closest('.answer-block').remove();
                renumberQuestions();
            } else { showAlert('Ogni domanda deve avere almeno una risposta.', 'warning'); }
        });

        $(document).on('click', '#questions-container .remove-question', function () {
            $(this).closest('.question-block').remove();
            renumberQuestions();
        });

        $('#save-questions').click(function () {
            const quizId = $('#quiz-id').val();
            if (!quizId) { showAlert('ID del Quiz non trovato.', 'danger'); return; }
            const formData = $('#questions-form').serialize();
            $.ajax({
                type: 'POST', url: 'api/questions.php?action=save', data: formData, dataType: 'json',
                success: function (response) {
                    if (response.status === 'success') {
                        showAlert('Domande salvate con successo!', 'success');
                        setTimeout(() => window.location.href = 'quiz_view.php?id=' + quizId, 1500);
                    } else { showAlert(response.message || 'Errore nel salvataggio delle domande.', 'danger'); }
                },
                error: () => showAlert('Errore durante il salvataggio delle domande.', 'danger')
            });
        });

        $('#abort-quiz-creation').click(function () {
            const quizIdToDelete = $('#quiz-id').val();
            if (quizIdToDelete && confirm("Sei sicuro di voler annullare? Il quiz e le domande verranno eliminati.")) {
                $.ajax({
                    url: `api/quiz.php?delId=${quizIdToDelete}`, method: 'GET', // o DELETE se API supporta
                    success: (response, status, xhr) => {
                        if (xhr.status === 204 || (response && response.status === 'success')) {
                            showAlert('Creazione quiz annullata.', 'info');
                            setTimeout(() => window.location.href = 'quiz_create.php', 1000);
                        } else { showAlert(response.message || 'Errore durante l\'annullamento.', 'danger');}
                    },
                    error: () => showAlert('Errore di comunicazione durante l\'annullamento.', 'danger')
                });
            } else if (!quizIdToDelete) { // Se non c'è ID, resetta solo UI
                 $('#questions-section').hide(); $('#quiz-details').show();
                 $('#create-quiz-form')[0].reset(); $('#questions-form')[0].reset();
                 $('#questions-container').empty();
            }
        });
    } // Fine if ($('#create-quiz-form').length)

    // Mostra/nascondi campo punteggio (per create e edit)
    $(document).on('change', '.answers-container input[type="radio"][name$="[type]"], .answer-block input[type="radio"][name$="[type]"]', function () {
        const pointsGroup = $(this).closest('.answer-block').find('.points-group');
        if ($(this).val() === 'Corretta') {
            pointsGroup.slideDown();
        } else {
            pointsGroup.slideUp();
            pointsGroup.find('input[type="number"]').val(0);
        }
    });
    
    // --- Partecipazione Quiz (es. su quiz_participate.php) ---
    if ($('#participate-form').length) {
        $('#participate-form').on('submit', function (e) {
            e.preventDefault();
            $.ajax({
                type: 'POST', url: 'api/partecipation.php?action=submit', data: $(this).serialize(), dataType: 'json',
                success: function (response) {
                    if (response.status === 'success' && response.data && response.data.codice) {
                        showAlert('Risposte inviate con successo!', 'success');
                        setTimeout(() => window.location.href = 'quiz_results.php?participation=' + response.data.codice, 1500);
                    } else { showAlert(response.message || 'Errore nell\'invio.', 'danger'); }
                },
                error: () => showAlert('Errore di comunicazione.', 'danger')
            });
        });
    }

    // --- Elenco Partecipazioni (es. su quiz_participations.php) ---
    if (window.location.pathname.endsWith('quiz_participations.php') && $('#partecipations-container').length) {
        $.ajax({
            url: 'api/partecipation.php', type: 'GET', dataType: 'json',
            success: function (response) {
                let html = '';
                if (response.status === 'success' && response.data && response.data.length > 0) {
                    $.each(response.data, (index, part) => {
                        html += `<div class="partecipation-card card"><div class="card-content"><h3>${part.titolo}</h3><p>Data: ${new Date(part.data).toLocaleDateString('it-IT')}</p><a href="quiz_results.php?participation=${part.codice}" class="btn btn-sm">Vedi Risultati</a></div></div>`;
                    });
                } else { html = '<p>Nessuna partecipazione trovata.</p>'; }
                $('#partecipations-container').html(html);
            },
            error: () => $('#partecipations-container').html('<p>Errore nel caricamento.</p>')
        });
    }

    // --- Modifica Quiz (es. su quiz_edit.php) ---
    if ($('#edit-quiz-form').length) {
        // Bottone Aggiungi Domanda in Edit
        $('#add-question-btn-edit').click(function () { // Assicurati che questo ID sia unico per la pagina di edit
            const questionIndex = $('#edit-quiz-form .question-block').length;
            // Assicurati che #question-template esista e sia corretto per l'edit
            const template = $('#question-template').html().replace(/__Q_INDEX__/g, questionIndex).replace(/__Q_DISPLAY_NUM__/g, questionIndex + 1);
            $('#edit-quiz-form #questions-container-edit').append(template); // Contenitore specifico
            renumberEditQuestions();
        });

        // Bottone Aggiungi Risposta in Edit
        $(document).on('click', '#edit-quiz-form .add-answer-btn-edit', function () { // Classe specifica
            const questionBlock = $(this).closest('.question-block');
            const questionIndex = questionBlock.data('question-index');
            const answerIndex = questionBlock.find('.answer-block').length;
            const answersContainer = questionBlock.find('.answers-container');
            // Assicurati che #answer-template esista
            const template = $('#answer-template').html().replace(/__Q_INDEX__/g, questionIndex).replace(/__A_INDEX__/g, answerIndex).replace(/__A_DISPLAY_NUM__/g, answerIndex + 1);
            answersContainer.append(template);
            renumberEditAnswers(questionBlock, questionIndex);
        });
        
        // Rimuovi Domanda/Risposta in Edit (usa classi specifiche o controlla il contesto del form)
        $(document).on('click', '#edit-quiz-form .remove-question-btn', function () {
             $(this).closest('.question-block').remove();
             renumberEditQuestions();
        });
        $(document).on('click', '#edit-quiz-form .remove-answer-btn', function () {
            const answerBlock = $(this).closest('.answer-block');
            const questionBlock = answerBlock.closest('.question-block');
            if (questionBlock.find('.answer-block').length > 1) {
                answerBlock.remove();
                renumberEditAnswers(questionBlock, questionBlock.data('question-index'));
            } else { showEditAlerts('Ogni domanda deve avere almeno una risposta!', 'warning'); }
        });

        // Invio Form Modifica Quiz
        $('#edit-quiz-form').submit(function (e) {
            e.preventDefault();
            const startDate = new Date($(this).find('#dataInizio').val());
            const endDate = new Date($(this).find('#dataFine').val());
            const errorMessage = checkDateRange(startDate, endDate);
            if (errorMessage) { showEditAlerts(errorMessage, 'danger'); return; }
            
            $.ajax({
                url: $(this).attr('action'), type: $(this).attr('method'), // Usa method dal form (potrebbe essere POST con _method=PUT)
                data: $(this).serialize(), dataType: 'json',
                success: function (response) {
                    if (response.status === 'success') {
                        showEditAlerts('Quiz aggiornato con successo!', 'success');
                        const quizId = $('#edit-quiz-form input[name="quiz_id"]').val();
                        setTimeout(() => window.location.href = 'quiz_view.php?id=' + quizId, 1500);
                    } else { showEditAlerts(response.message || 'Errore durante il salvataggio.', 'danger'); }
                },
                error: (xhr) => showEditAlerts('Errore: ' + (xhr.responseJSON?.message || xhr.statusText), 'danger')
            });
        });
    } // Fine if ($('#edit-quiz-form').length)


    // --- Gestione Modale Conferma Eliminazione (Globale o per pagina specifica) ---
    const $confirmDeleteModal = $('#confirmDeleteModal');
    if ($confirmDeleteModal.length) {
        let quizIdToDeleteModal = null;
        const $confirmDeleteButton = $('#confirmDeleteActionBtn');
        const $cancelOrCloseButtons = $confirmDeleteModal.find('.close-button, #cancelDeleteBtn');

        $(document).on('click', '.delete-quiz-btn', function (event) { // Delega l'evento se i bottoni sono dinamici
            event.preventDefault();
            quizIdToDeleteModal = $(this).data('delid') || $(this).attr('delid');
            if (quizIdToDeleteModal && quizIdToDeleteModal !== '#') {
                // Potresti popolare info nel modale qui, es. nome quiz
                // $('#confirmDeleteModal .quiz-name-placeholder').text($(this).data('quiz-title'));
                $confirmDeleteModal.show();
            }
        });

        $confirmDeleteButton.on('click', function () {
            if (quizIdToDeleteModal) {
                const apiUrl = `api/quiz.php?delId=${quizIdToDeleteModal}`; // O usa `quiz_manage.php?action=delete&id=`
                $.ajax({
                    url: apiUrl, method: 'GET', // Idealmente DELETE, ma GET è più semplice per link/API base
                    success: function (response, status, xhr) {
                        if (xhr.status === 204 || (response && response.status === 'success')) {
                            showAlert('Quiz eliminato con successo!', 'success');
                            setTimeout(() => location.reload(), 1500);
                        } else { showAlert(response.message || 'Errore durante l\'eliminazione.', 'danger');}
                    },
                    error: (xhr) => showAlert('Errore: ' + (xhr.responseJSON?.message || xhr.statusText), 'danger'),
                    complete: () => hideModal()
                });
            }
        });
        const hideModal = () => { $confirmDeleteModal.hide(); quizIdToDeleteModal = null; };
        $cancelOrCloseButtons.on('click', hideModal);
        $(window).on('click', (event) => { if ($(event.target).is($confirmDeleteModal)) hideModal(); });
        $(document).on('keydown', (event) => { if (event.key === 'Escape' && $confirmDeleteModal.is(':visible')) hideModal(); });
    }


    // --- Funzionalità specifiche per la pagina Index (index.php) ---
    if (window.location.pathname.endsWith('index.php') || window.location.pathname === '/' || window.location.pathname.endsWith('tuo-path-base/')) { // Adatta se il tuo index ha un nome diverso o è la root
        const $resetFormButton = $('#reset-form');
        if ($resetFormButton.length) {
            $resetFormButton.on('click', function(event) {
                event.preventDefault();
                window.location.href = window.location.pathname;
            });
        }

        $('.compact-pagination .page-item:not(.disabled):not(.active)').on('click', function(e) {
            e.preventDefault();
            const $link = $(this);
            $link.html('<i class="fas fa-spinner fa-spin"></i>').css('pointer-events', 'none');
            const targetHref = $link.attr('href');
            if (window.scrollY > 200) {
                $('html, body').animate({ scrollTop: 0 }, 300, 'swing', () => window.location.href = targetHref);
            } else {
                setTimeout(() => window.location.href = targetHref, 100);
            }
        });

        const $paginationContainer = $('.compact-pagination');
        if ($paginationContainer.length && !$paginationContainer.attr('role')) {
            $paginationContainer.attr({'role': 'navigation', 'aria-label': 'Navigazione pagine'});
        }

        const $perPageSelect = $('#per_page_select');
        if ($perPageSelect.length) {
            $perPageSelect.on('change', function() {
                const $form = $(this).closest('form');
                if ($form.find('input[name="page"]').length) {
                    $form.find('input[name="page"]').val('1');
                } else {
                    $form.append('<input type="hidden" name="page" value="1" />');
                }
                $form.submit();
            });
        }

        const $sortBySelect = $('#sort_by_inline');
        if ($sortBySelect.length) {
            $sortBySelect.on('change', function() {
                // L'ordinamento dovrebbe resettare alla pagina 1, quindi non serve modificare 'page' qui se già gestito
                $(this).closest('form').submit();
            });
        }

        const $disponibileOraCheckbox = $('#search_disponibile_ora_sidebar');
        const $dataInizioInput = $('#search_data_inizio_da_sidebar');
        const $dataFineInput = $('#search_data_fine_a_sidebar');
        function toggleDateInputsState() {
            if ($disponibileOraCheckbox.is(':checked')) {
                $dataInizioInput.prop('disabled', true).val('');
                $dataFineInput.prop('disabled', true).val('');
            } else {
                $dataInizioInput.prop('disabled', false);
                $dataFineInput.prop('disabled', false);
            }
        }
        if ($disponibileOraCheckbox.length) {
            $disponibileOraCheckbox.on('change', toggleDateInputsState);
            toggleDateInputsState(); // Stato iniziale
        }
    } // Fine if (pagina index)
});