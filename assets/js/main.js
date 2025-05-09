// Funzioni helper globali
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

function showAlert(message, type = 'info', containerSelector = '#alert-container-page') {
    const alertId = 'custom-alert-' + Date.now();
    const alertHtml = `
        <div id="${alertId}" class="custom-alert custom-alert-${type}" role="alert">
            <span class="custom-alert-message">${message}</span>
            <button type="button" class="custom-alert-close" aria-label="Close">×</button>
        </div>`;

    let $alertContainer = $(containerSelector);
    if (!$alertContainer.length) {
        $('body').prepend('<div id="alert-container-fallback" class="custom-alert-fallback-container"></div>');
        $alertContainer = $('#alert-container-fallback');
    }
    $alertContainer.find('.custom-alert').remove();
    $alertContainer.append(alertHtml);
    const $currentAlert = $('#' + alertId);
    $currentAlert.find('.custom-alert-close').on('click', function() {
        $currentAlert.fadeOut(300, function() { $(this).remove(); });
    });
    if (type !== 'danger' && type !== 'error' && type !== 'warning') {
        setTimeout(function () {
            $currentAlert.fadeOut(500, function() { $(this).remove(); });
        }, 5000);
    }
}

function showEditAlerts(message, type) { // Usata in quiz_edit.php
    showAlert(message, type, '#form-messages');
}

// Funzione per rinumerare domande e risposte
function renumberQuestions() {
    const $questionBlocks = $('#questions-container .question-block-styled');
    $('#no-questions-message').toggle($questionBlocks.length === 0);

    $questionBlocks.each(function (index) {
        const qNum = index + 1;
        const $currentQuestionBlock = $(this);
        $currentQuestionBlock.attr('data-question', qNum);
        $currentQuestionBlock.find('.question-number').text(qNum);

        $currentQuestionBlock.find('label.form-label-styled[for^="question-"]').first().attr('for', `question-${qNum}`);
        $currentQuestionBlock.find('textarea.textarea-styled[id^="question-"]').attr({
            'id': `question-${qNum}`,
            'name': `questions[${qNum}][text]`
        });

        const $answersContainer = $currentQuestionBlock.find('.answers-container-styled');
        $answersContainer.attr('id', `answers-container-${qNum}`);
        $answersContainer.find('.message-inline-styled[id^="no-answers-for-q-"]').attr('id', `no-answers-for-q-${qNum}`);

        $currentQuestionBlock.find('button.add-answer').data('question', qNum);
        $currentQuestionBlock.find('button.remove-question').data('question', qNum).attr('title', `Rimuovi Domanda ${qNum}`);

        $answersContainer.find('.answer-block-styled').each(function (aIndex) {
            const aNum = aIndex + 1;
            const $currentAnswerBlock = $(this);
            $currentAnswerBlock.attr('data-answer', aNum);
            $currentAnswerBlock.find('.answer-number').text(aNum);

            $currentAnswerBlock.find('label.label-small-styled[for^="question-"][for*="-answer-"]').attr('for', `question-${qNum}-answer-${aNum}`);
            $currentAnswerBlock.find('input[type="text"].input-small-styled[id^="question-"]').attr({
                'id': `question-${qNum}-answer-${aNum}`,
                'name': `questions[${qNum}][answers][${aNum}][text]`
            });

            // MODIFICA PER RADIO BUTTONS CON 'type' e valori 'Corretta'/'Sbagliata'
            $currentAnswerBlock.find('input.radio-input-styled[name$="[type]"]').each(function() {
                const radioIdBase = `question-${qNum}-answer-${aNum}-type-`;
                const radioValue = $(this).val(); // "Corretta" o "Sbagliata"
                const typeSuffix = radioValue === 'Corretta' ? 'correct' : 'wrong'; // Per l'ID
                $(this).attr({
                    'name': `questions[${qNum}][answers][${aNum}][type]`, // Name corretto
                    'id': radioIdBase + typeSuffix
                });
                $(this).next('label.radio-label-styled').attr('for', radioIdBase + typeSuffix);
            });

            const $pointsGroup = $currentAnswerBlock.find('.points-group');
            $pointsGroup.find('label.label-small-styled[for$="-points"]').attr('for', `question-${qNum}-answer-${aNum}-points`);
            $pointsGroup.find('input[type="number"].input-numerical-styled[name$="[points]"]').attr({
                'id': `question-${qNum}-answer-${aNum}-points`,
                'name': `questions[${qNum}][answers][${aNum}][points]`
            });
        });
        const noAnswersMsg = document.getElementById(`no-answers-for-q-${qNum}`);
        if (noAnswersMsg) {
            noAnswersMsg.style.display = $answersContainer.find('.answer-block-styled').length === 0 ? 'block' : 'none';
        }
    });
}

function addAnswerToQuestion(questionBlockElement, questionNum, answerCount) {
    const answerTemplate = document.getElementById('answer-template-create').innerHTML;
    let answerHtml = answerTemplate.replace(/__Q_NUM__/g, questionNum)
                                .replace(/__A_NUM__/g, answerCount);
    $(questionBlockElement).find('.answers-container-styled').append(answerHtml);
    $(questionBlockElement).find(`#no-answers-for-q-${questionNum}`).hide();
}

// Funzioni per quiz_edit.php
function renumberEditQuestions() {
    $('#edit-quiz-form .question-block').each(function (index) {
        $(this).attr('data-question-index', index);
        $(this).find('h2.question-title-editor, .question-block > label').first().text('Domanda ' + (index + 1));
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
function renumberEditAnswers(questionBlock, questionIndex) {
    questionBlock.find('.answer-block').each(function (answerIdx) {
        $(this).attr('data-answer-index', answerIdx);
        $(this).find('h3.answer-title-editor, .answer-block > label').first().text('Risposta ' + (answerIdx + 1));
        $(this).find('[name*="[answers]"]').each(function () {
            const oldName = $(this).attr('name');
            if (oldName) {
                const newName = oldName.replace(/\[answers\]\[\d+\]/, `[answers][${answerIdx}]`).replace(/questions\[\d+\]/, `questions[${questionIndex}]`);
                $(this).attr('name', newName);
            }
        });
    });
}

// Funzione per gestire l'apertura/chiusura delle domande (accordion per quiz_view.php)
function toggleQuestion(headerElement) {
    const questionCard = headerElement.closest('.question-card');
    if (questionCard) {
        const contentWrapper = questionCard.querySelector('.question-content-wrapper');
        const isOpen = questionCard.classList.toggle('open');
        headerElement.setAttribute('aria-expanded', isOpen.toString());
        if (isOpen) {
            contentWrapper.style.maxHeight = contentWrapper.scrollHeight + "px";
        } else {
            contentWrapper.style.maxHeight = null;
        }
    }
}

document.addEventListener('DOMContentLoaded', () => { // Per accordion in quiz_view.php
    document.querySelectorAll('.question-header').forEach(header => {
        header.addEventListener('click', function() { toggleQuestion(this); });
        header.addEventListener('keydown', function(event) {
            if (event.key === 'Enter' || event.key === ' ') { event.preventDefault(); toggleQuestion(this); }
        });
    });
    document.querySelectorAll('.question-card.open').forEach(card => {
        const contentWrapper = card.querySelector('.question-content-wrapper');
        const header = card.querySelector('.question-header');
        if (header) header.setAttribute('aria-expanded', 'true');
        if (contentWrapper) {
            const originalTransition = contentWrapper.style.transition;
            contentWrapper.style.transition = 'none';
            contentWrapper.style.maxHeight = contentWrapper.scrollHeight + "px";
            void contentWrapper.offsetWidth;
            contentWrapper.style.transition = originalTransition;
        }
    });
});

// Codice jQuery principale
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

    // --- Creazione Quiz (Pagina: quiz_create.php) ---
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
                        $('#quiz-details-section').hide(); // Nascondi la sezione dettagli quiz
                        $('#questions-section').show();
                        renumberQuestions();
                    } else { showAlert(response.message || 'Errore nella creazione del quiz.', 'danger'); }
                },
                error: (xhr) => showAlert('Errore AJAX creazione quiz: ' + (xhr.responseJSON?.message || xhr.statusText), 'danger')
            });
        });

        $('#add-question').click(function () {
            $('#no-questions-message').hide();

            const questionTemplate = document.getElementById('question-template-create').innerHTML;
            const questionNumberForTemplate = $('#questions-container .question-block-styled').length + 1;

            const questionHtml = questionTemplate.replace(/__Q_NUM__/g, questionNumberForTemplate);
            $('#questions-container').append(questionHtml);

            renumberQuestions();

            const $newlyAddedQuestionBlock = $('#questions-container .question-block-styled:last-child');

            if ($newlyAddedQuestionBlock.length) {
                const actualQuestionNum = $newlyAddedQuestionBlock.data('question');
                if ($newlyAddedQuestionBlock.find('.answers-container-styled .answer-block-styled').length === 0) {
                    addAnswerToQuestion($newlyAddedQuestionBlock, actualQuestionNum, 1);
                    renumberQuestions();
                }
            } else {
                // Questo non dovrebbe accadere se renumberQuestions e l'append funzionano
            }
        });

        $(document).on('click', '#questions-container .add-answer', function () {
            const questionNum = $(this).data('question');
            const $questionBlock = $(this).closest('.question-block-styled');
            const answerCount = $questionBlock.find('.answers-container-styled .answer-block-styled').length + 1;
            addAnswerToQuestion($questionBlock, questionNum, answerCount);
            renumberQuestions();
        });

        $(document).on('click', '#questions-container .remove-question', function () {
            $(this).closest('.question-block-styled').remove();
            renumberQuestions();
        });

        $(document).on('click', '#questions-container .remove-answer', function () {
            const $answerBlock = $(this).closest('.answer-block-styled');
            const $questionBlock = $answerBlock.closest('.question-block-styled');

            if ($questionBlock.find('.answer-block-styled').length > 1) {
                $answerBlock.remove();
                renumberQuestions();
            } else {
                showAlert('Ogni domanda deve avere almeno una risposta.', 'warning', '#alert-container-page');
            }
        });

        // Handler per il salvataggio delle domande
$('#save-questions').click(function () {
    const quizId = $('#quiz-id').val();
    if (!quizId) {
        showAlert('ID del Quiz non trovato. Impossibile salvare.', 'danger');
        return;
    }
    if ($('#questions-container .question-block-styled').length === 0) {
        showAlert('Devi aggiungere almeno una domanda.', 'warning');
        return;
    }
    let allQuestionsValid = true;
    $('#questions-container .question-block-styled').each(function() {
        const $qBlock = $(this);
        const qNumText = $qBlock.find('.question-number').text();
        if ($qBlock.find('.answers-container-styled .answer-block-styled').length === 0) {
            showAlert(`Domanda ${qNumText} non ha risposte.`, 'warning');
            allQuestionsValid = false;
            return false;
        }
        let hasCorrect = false;
        // MODIFICA: Cerca il radio con value="Corretta"
        $qBlock.find('.answers-container-styled .answer-block-styled input.radio-input-styled[name$="[type]"][value="Corretta"]').each(function() {
            if ($(this).is(':checked')) {
                hasCorrect = true;
                return false;
            }
        });
        if (!hasCorrect) {
            showAlert(`Domanda ${qNumText} non ha una risposta "Corretta".`, 'warning');
            allQuestionsValid = false;
            return false;
        }
    });
    if (!allQuestionsValid) return;

    const formData = $('#questions-form').serialize() + '&quiz_id=' + quizId;
    $.ajax({
        type: 'POST',
        url: 'api/questions.php', // Assicurati che l'endpoint sia corretto
        data: formData,
        dataType: 'json',
        success: function (response) {
            if (response.status === 'success') {
                showAlert('Domande salvate con successo!', 'success');
                setTimeout(() => window.location.href = 'quiz_view.php?id=' + quizId, 1500);
            } else {
                showAlert(response.message || 'Errore nel salvataggio delle domande.', 'danger');
            }
        },
        error: (xhr) => {
            showAlert('Errore durante la comunicazione per il salvataggio delle domande: ' + (xhr.responseJSON?.message || xhr.statusText), 'danger');
        }
    });
});

        const $confirmAbortModal = $('#confirmAbortCreationModal');
        const $confirmAbortActionBtn = $('#confirmAbortActionBtn');
        const $abortModalMessage = $('#abortCreationModalMessage');
        function showAbortCreationModal() { if($confirmAbortModal.length) $confirmAbortModal.show(); }
        function hideAbortCreationModal() { if($confirmAbortModal.length) $confirmAbortModal.hide(); }

        if ($confirmAbortModal.length) {
            $confirmAbortModal.find('.custom-modal-close-button, #cancelAbortBtn').on('click', hideAbortCreationModal);
            $(window).on('click', (event) => { if ($(event.target).is($confirmAbortModal)) hideAbortCreationModal(); });
            $(document).on('keydown', (event) => { if (event.key === 'Escape' && $confirmAbortModal.is(':visible')) hideAbortCreationModal(); });
        }

        $('#abort-quiz-creation').click(function () {
            const quizIdToDelete = $('#quiz-id').val();
            let msg = "Sei sicuro di voler annullare la creazione del quiz?";
            if (quizIdToDelete) msg += " Il quiz parzialmente creato (ID: " + quizIdToDelete + ") verrà eliminato.";
            else msg += " Eventuali dati inseriti verranno persi.";
            if($abortModalMessage.length) $abortModalMessage.text(msg);
            showAbortCreationModal();

            if($confirmAbortActionBtn.length) {
                $confirmAbortActionBtn.off('click').on('click', function() {
                    hideAbortCreationModal();
                    if (quizIdToDelete) {
                        $.ajax({
                            url: `api/quiz.php?delId=${quizIdToDelete}`, method: 'GET',
                            success: (res, st, xhr) => {
                                if (xhr.status === 204 || (res && res.status === 'success')) {
                                    showAlert('Creazione annullata e quiz eliminato.', 'info');
                                    setTimeout(() => window.location.href = 'quiz_create.php', 1500);
                                } else showAlert(res.message || 'Errore annullamento.', 'danger');
                            }, error: () => showAlert('Errore AJAX annullamento.', 'danger')
                        });
                    } else {
                        showAlert('Creazione annullata.', 'info');
                        $('#questions-section').hide();
                        $('#quiz-details-section').show(); // Mostra di nuovo i dettagli quiz
                        $('#create-quiz-form')[0].reset();
                        $('#questions-form')[0].reset();
                        $('#questions-container').empty().html('<p id="no-questions-message" class="message-placeholder-styled text-align-center padding-vertical-medium">Nessuna domanda aggiunta. Clicca su "Aggiungi Domanda" per iniziare.</p>');
                        renumberQuestions(); // In caso ci fossero domande rimaste da un tentativo precedente non salvato
                    }
                });
            }
        });
    } // Fine if ($('#create-quiz-form').length)

// Handler per il cambio dei radio button (gestione campo punti)
$(document).on('change', '#questions-container .answer-block-styled input[type="radio"][name$="[type]"]', function () {
    const $answerBlock = $(this).closest('.answer-block-styled');
    const $pointsGroup = $answerBlock.find('.points-group');
    // Controlla se il valore del radio selezionato è "Corretta"
    if ($(this).val() === 'Corretta' && $(this).is(':checked')) {
        $pointsGroup.slideDown();
    } else {
        $pointsGroup.slideUp();
        // Se 'Sbagliata' è selezionato, azzera i punti
        // Questo if aggiuntivo assicura che succeda solo quando 'Sbagliata' diventa l'opzione attiva.
        if ($answerBlock.find('input[type="radio"][name$="[type]"][value="Sbagliata"]').is(':checked')) {
             $pointsGroup.find('input[type="number"]').val(0); // O 1 se vuoi un default diverso per punti risposta corretta
        }
    }
});

    // --- Partecipazione Quiz ---
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

    // --- Elenco Partecipazioni ---
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

    // --- Modifica Quiz (quiz_edit.php) ---
    if ($('#edit-quiz-form').length) {
        $('#add-question-btn-edit').click(function () {
            const questionIndex = $('#edit-quiz-form .question-block').length;
            const template = $('#question-template').html().replace(/__Q_INDEX__/g, questionIndex).replace(/__Q_DISPLAY_NUM__/g, questionIndex + 1);
            $('#edit-quiz-form #questions-container-edit').append(template);
            renumberEditQuestions();
        });

        $(document).on('click', '#edit-quiz-form .add-answer-btn-edit', function () {
            const questionBlock = $(this).closest('.question-block');
            const questionIndex = questionBlock.data('question-index');
            const answerIndex = questionBlock.find('.answer-block').length;
            const answersContainer = questionBlock.find('.answers-container');
            const template = $('#answer-template').html().replace(/__Q_INDEX__/g, questionIndex).replace(/__A_INDEX__/g, answerIndex).replace(/__A_DISPLAY_NUM__/g, answerIndex + 1);
            answersContainer.append(template);
            renumberEditAnswers(questionBlock, questionIndex);
        });

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

        $('#edit-quiz-form').submit(function (e) {
            e.preventDefault();
            const startDate = new Date($(this).find('#dataInizio').val());
            const endDate = new Date($(this).find('#dataFine').val());
            const errorMessage = checkDateRange(startDate, endDate);
            if (errorMessage) { showEditAlerts(errorMessage, 'danger'); return; }
            $.ajax({
                url: $(this).attr('action'), type: $(this).attr('method'),
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

    // --- Gestione Modale Conferma Eliminazione (Globale) ---
    const $confirmDeleteModal = $('#confirmDeleteModal');
    if ($confirmDeleteModal.length) {
        let quizIdToDeleteModal = null;
        const $confirmDeleteButton = $('#confirmDeleteActionBtn');
        const $cancelOrCloseButtons = $confirmDeleteModal.find('.custom-modal-close-button, #cancelDeleteBtn'); // Usa .custom-modal-close-button
        function hideMainDeleteModal() { $confirmDeleteModal.hide(); quizIdToDeleteModal = null; }
        $(document).on('click', '.delete-quiz-btn', function (event) {
            event.preventDefault();
            quizIdToDeleteModal = $(this).data('delid') || $(this).attr('delid');
            if (quizIdToDeleteModal && quizIdToDeleteModal !== '#') $confirmDeleteModal.show();
        });
        $confirmDeleteButton.on('click', function () {
            if (quizIdToDeleteModal) {
                $.ajax({
                    url: `api/quiz.php?delId=${quizIdToDeleteModal}`, method: 'GET',
                    success: function (response, status, xhr) {
                        if (xhr.status === 204 || (response && response.status === 'success')) {
                            showAlert('Quiz eliminato!', 'success'); setTimeout(() => location.reload(), 1500);
                        } else showAlert(response.message || 'Errore eliminazione.', 'danger');
                    },
                    error: (xhr) => showAlert('Errore AJAX: ' + (xhr.responseJSON?.message || xhr.statusText), 'danger'),
                    complete: () => hideMainDeleteModal()
                });
            }
        });
        $cancelOrCloseButtons.on('click', hideMainDeleteModal);
        $(window).on('click', (event) => { if ($(event.target).is($confirmDeleteModal)) hideMainDeleteModal(); });
        $(document).on('keydown', (event) => { if (event.key === 'Escape' && $confirmDeleteModal.is(':visible')) hideMainDeleteModal(); });
    }

    // --- Funzionalità specifiche per la pagina Index (index.php) ---
    if (window.location.pathname.endsWith('index.php') || window.location.pathname === '/' || window.location.pathname.includes('/index.php')) {
        const $resetFormButton = $('#reset-form');
        if ($resetFormButton.length) {
            $resetFormButton.on('click', function(event) { event.preventDefault(); window.location.href = window.location.pathname; });
        }
        $('.compact-pagination .page-item:not(.disabled):not(.active)').on('click', function(e) { /* ... */ });
        const $paginationContainer = $('.compact-pagination');
        if ($paginationContainer.length && !$paginationContainer.attr('role')) { /* ... */ }
        const $perPageSelect = $('#per_page_select');
        if ($perPageSelect.length) { $perPageSelect.on('change', function() { /* ... */ }); }
        const $sortBySelect = $('#sort_by_inline');
        if ($sortBySelect.length) { $sortBySelect.on('change', function() { /* ... */ }); }
        const $disponibileOraCheckbox = $('#search_disponibile_ora_sidebar');
        const $dataInizioInput = $('#search_data_inizio_da_sidebar');
        const $dataFineInput = $('#search_data_fine_a_sidebar');
        function toggleDateInputsState() { /* ... */ }
        if ($disponibileOraCheckbox.length) { $disponibileOraCheckbox.on('change', toggleDateInputsState); toggleDateInputsState(); }
    }
});

document.addEventListener('DOMContentLoaded', () => {
    const deleteButtons = document.querySelectorAll('.delete-quiz-btn');
    const modal = document.getElementById('confirmDeleteModal');
    const quizTitleToDeleteSpan = document.getElementById('quizTitleToDelete');
    const cancelDeleteBtn = document.getElementById('cancelDeleteBtn');
    const confirmDeleteActionBtn = document.getElementById('confirmDeleteActionBtn');
    const closeButton = modal ? modal.querySelector('.close-button') : null;
    let quizCodeToDelete = null;

    deleteButtons.forEach(button => {
        button.addEventListener('click', function() {
            quizCodeToDelete = this.getAttribute('delId');
            const quizTitle = this.dataset.quizTitle || 'questo quiz'; 
            
            if (quizTitleToDeleteSpan) {
                quizTitleToDeleteSpan.textContent = quizTitle;
            }
            if (modal) {
                modal.style.display = 'block';
            }
        });
    });

    function closeModal() {
        if (modal) {
            modal.style.display = 'none';
        }
        quizCodeToDelete = null;
        if (quizTitleToDeleteSpan) { 
            quizTitleToDeleteSpan.textContent = '[Nome Quiz]';
        }
    }

    if (cancelDeleteBtn) {
        cancelDeleteBtn.addEventListener('click', closeModal);
    }
    if (closeButton) {
        closeButton.addEventListener('click', closeModal);
    }
    window.addEventListener('click', (event) => {
        if (event.target == modal) {
            closeModal();
        }
    });

    // Se hai già una logica per confirmDeleteActionBtn nel tuo main.js,
    // non duplicarla qui. Assicurati solo che una delle due versioni esista.
    if (confirmDeleteActionBtn) {
        confirmDeleteActionBtn.addEventListener('click', () => {
            if (quizCodeToDelete) {
                // Azione di eliminazione (es. reindirizzamento o chiamata AJAX)
                // Sostituisci con la tua logica di eliminazione effettiva
                console.log('Azione ELIMINA per quiz con codice:', quizCodeToDelete);
                // Esempio: window.location.href = 'quiz_delete_action.php?id=' + quizCodeToDelete; 
                showAlert('Quiz con codice ' + quizCodeToDelete + ' eliminato (simulazione).', 'success'); 
                closeModal();
                // Potrebbe essere necessario ricaricare la pagina o rimuovere l'elemento dalla DOM
                // window.location.reload(); 
            }
        });
    }
});