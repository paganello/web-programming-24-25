// Funzioni helper globali
function checkDateRange(startDate, endDate, allowPastStartDate = false) { // Modificata per includere allowPastStartDate
    const today = new Date();
    today.setHours(0, 0, 0, 0); // Normalizza a mezzanotte per confronto date

    if (!allowPastStartDate && startDate < today) {
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
        $('body').prepend('<div id="alert-container-fallback" class="custom-alert-fallback-container" style="position: fixed; top: 20px; left: 50%; transform: translateX(-50%); z-index: 9999; width: auto; max-width: 90%;"></div>');
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

// Funzione per rinumerare domande e risposte per quiz_create.php
function renumberQuestions() { // Questa è per quiz_create.php
    const $questionBlocks = $('#questions-container .question-block-styled');
    $('#no-questions-message').toggle($questionBlocks.length === 0);

    $questionBlocks.each(function (index) {
        const qNum = index + 1; // Per quiz_create, gli indici partono da 1 nei name
        const $currentQuestionBlock = $(this);
        $currentQuestionBlock.attr('data-question', qNum); // Usiamo data-question
        $currentQuestionBlock.find('.question-number').text(qNum);

        // Aggiorna label for e id/name del textarea domanda
        $currentQuestionBlock.find('label.form-label-styled[for^="question-"]').first().attr('for', `question-${qNum}`);
        $currentQuestionBlock.find('textarea.textarea-styled[id^="question-"]').attr({
            'id': `question-${qNum}`,
            'name': `questions[${qNum}][text]` // questions[1][text], questions[2][text]
        });

        const $answersContainer = $currentQuestionBlock.find('.answers-container-styled');
        $answersContainer.attr('id', `answers-container-${qNum}`); // O answers-container-q${qNum}
        $answersContainer.find('.message-inline-styled[id^="no-answers-for-q-"]').attr('id', `no-answers-for-q-${qNum}`);

        $currentQuestionBlock.find('button.add-answer').data('question', qNum); // data-question per il bottone
        $currentQuestionBlock.find('button.remove-question').data('question', qNum).attr('title', `Rimuovi Domanda ${qNum}`);

        $answersContainer.find('.answer-block-styled').each(function (aIndex) {
            const aNum = aIndex + 1; // Indici risposte partono da 1
            const $currentAnswerBlock = $(this);
            $currentAnswerBlock.attr('data-answer', aNum); // data-answer
            $currentAnswerBlock.find('.answer-number').text(aNum);

            // Testo risposta
            $currentAnswerBlock.find('label.label-small-styled[for^="question-"][for*="-answer-"]').attr('for', `question-${qNum}-answer-${aNum}`);
            $currentAnswerBlock.find('input[type="text"].input-small-styled[id^="question-"]').attr({
                'id': `question-${qNum}-answer-${aNum}`,
                'name': `questions[${qNum}][answers][${aNum}][text]`
            });

            // Radio buttons per tipo
            $currentAnswerBlock.find('input.radio-input-styled[name$="[type]"]').each(function() {
                const radioIdBase = `question-${qNum}-answer-${aNum}-type-`;
                const radioValue = $(this).val(); // "Corretta" o "Sbagliata"
                const typeSuffix = radioValue === 'Corretta' ? 'correct' : 'wrong';
                $(this).attr({
                    'name': `questions[${qNum}][answers][${aNum}][type]`,
                    'id': radioIdBase + typeSuffix
                });
                $(this).next('label.radio-label-styled').attr('for', radioIdBase + typeSuffix);
            });

            // Punteggio
            const $pointsGroup = $currentAnswerBlock.find('.points-group');
            $pointsGroup.find('label.label-small-styled[for$="-points"]').attr('for', `question-${qNum}-answer-${aNum}-points`);
            $pointsGroup.find('input[type="number"].input-numerical-styled[name$="[points]"]').attr({
                'id': `question-${qNum}-answer-${aNum}-points`,
                'name': `questions[${qNum}][answers][${aNum}][points]`
            });
        });
        // Gestione messaggio "nessuna risposta"
        const noAnswersMsg = document.getElementById(`no-answers-for-q-${qNum}`); // Usa qNum qui
        if (noAnswersMsg) {
            noAnswersMsg.style.display = $answersContainer.find('.answer-block-styled').length === 0 ? 'block' : 'none';
        }
    });
}

function addAnswerToQuestion(questionBlockElement, questionNum, answerCount) { // Per quiz_create.php
    const answerTemplate = document.getElementById('answer-template-create').innerHTML;
    let answerHtml = answerTemplate.replace(/__Q_NUM__/g, questionNum) // Sostituisce __Q_NUM__
                                .replace(/__A_NUM__/g, answerCount); // Sostituisce __A_NUM__
    $(questionBlockElement).find('.answers-container-styled').append(answerHtml);
    $(questionBlockElement).find(`#no-answers-for-q-${questionNum}`).hide();
}


function toggleQuestion(headerElement) {
    const questionCard = headerElement.closest('.question-card');
    if (!questionCard) return;

    const contentWrapper = questionCard.querySelector('.question-content-wrapper');
    if (!contentWrapper) return;

    const wasOpen = questionCard.classList.contains('open');

    if (wasOpen) { // Sta per chiudere
        if (contentWrapper.style.maxHeight === 'none' || contentWrapper.style.maxHeight === '') {
             contentWrapper.style.maxHeight = contentWrapper.scrollHeight + "px";
        }
        requestAnimationFrame(() => {
            contentWrapper.style.maxHeight = "0px";
            questionCard.classList.remove('open');
            headerElement.setAttribute('aria-expanded', 'false');
        });
    } else { // Sta per aprire
        questionCard.classList.add('open');
        headerElement.setAttribute('aria-expanded', 'true');
        contentWrapper.style.maxHeight = contentWrapper.scrollHeight + "px";

        const handleTransitionEnd = () => {
            if (questionCard.classList.contains('open')) {
                contentWrapper.style.maxHeight = 'none';
            }
            contentWrapper.removeEventListener('transitionend', handleTransitionEnd);
        };
        contentWrapper.addEventListener('transitionend', handleTransitionEnd);
    }
}

document.addEventListener('DOMContentLoaded', () => {
    // Accordion per quiz_view.php
    document.querySelectorAll('.question-header').forEach(header => {
        header.addEventListener('click', function() { toggleQuestion(this); });
        header.addEventListener('keydown', function(event) {
            if (event.key === 'Enter' || event.key === ' ') {
                event.preventDefault();
                toggleQuestion(this);
            }
        });
    });

    // Inizializzazione delle card già aperte
    document.querySelectorAll('.question-card.open').forEach(card => {
        const contentWrapper = card.querySelector('.question-content-wrapper');
        const header = card.querySelector('.question-header');
        if (header) header.setAttribute('aria-expanded', 'true');
        if (contentWrapper) {
            contentWrapper.style.maxHeight = contentWrapper.scrollHeight + "px";
            // Opzionale: se vuoi che si adatti dopo l'apertura iniziale
            // setTimeout(() => {
            //    if (card.classList.contains('open')) contentWrapper.style.maxHeight = 'none';
            // }, 360); // leggermente più della durata della transizione
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
        showEditAlerts('Quiz aggiornato con successo!', 'success');
        // const quizId = $form.find('input[name="quiz_id"]').val(); // Corretto
        setTimeout(() => {
             window.location.href = 'quiz_my_list.php'; // O quiz_view.php?id=quizId
        }, 1500);
    } else {
        showEditAlerts(response.message || 'Errore durante il salvataggio delle modifiche.', 'danger');
    }
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
            const errorMessage = checkDateRange(startDate, endDate); // Usa la versione aggiornata di checkDateRange (senza allowPastStartDate)
            if (errorMessage) { showAlert(errorMessage, 'danger'); return; }
            $.ajax({
                type: 'POST', url: 'api/quiz.php?action=create', data: $(this).serialize(), dataType: 'json',
                success: function (response) {
                    if (response.status === 'success' && response.idQuiz) {
                        showAlert('Quiz creato con successo! Ora aggiungi le domande.', 'success');
                        $('#quiz-id').val(response.idQuiz);
                        $('#quiz-details-section').hide();
                        $('#questions-section').show();
                        renumberQuestions(); // Chiama la funzione per quiz_create
                    } else { showAlert(response.message || 'Errore nella creazione del quiz.', 'danger'); }
                },
                error: (xhr) => showAlert('Errore AJAX creazione quiz: ' + (xhr.responseJSON?.message || xhr.statusText), 'danger')
            });
        });

        $('#add-question').click(function () { // Questo è il bottone #add-question in quiz_create.php
            $('#no-questions-message').hide();
            const questionTemplate = document.getElementById('question-template-create').innerHTML;
            // Per quiz_create, qNum parte da 1
            const questionNumberForTemplate = $('#questions-container .question-block-styled').length + 1;

            const questionHtml = questionTemplate.replace(/__Q_NUM__/g, questionNumberForTemplate);
            $('#questions-container').append(questionHtml);
            
            const $newlyAddedQuestionBlock = $('#questions-container .question-block-styled:last-child');
            if ($newlyAddedQuestionBlock.length) {
                const actualQuestionNum = $newlyAddedQuestionBlock.data('question'); // Legge data-question
                if ($newlyAddedQuestionBlock.find('.answers-container-styled .answer-block-styled').length === 0) {
                    // Aggiunge risposta usando __Q_NUM__ e __A_NUM__
                    addAnswerToQuestion($newlyAddedQuestionBlock, actualQuestionNum, 1); 
                }
            }
            renumberQuestions(); // Chiama la funzione per quiz_create
        });

        // Eventi delegati per aggiungere/rimuovere risposte e domande in quiz_create.php
        $(document).on('click', '#questions-container .add-answer', function () { // .add-answer è in quiz_create.php
            const questionNum = $(this).data('question'); // Legge data-question
            const $questionBlock = $(this).closest('.question-block-styled');
            const answerCount = $questionBlock.find('.answers-container-styled .answer-block-styled').length + 1;
            addAnswerToQuestion($questionBlock, questionNum, answerCount);
            renumberQuestions(); // Chiama la funzione per quiz_create
        });

        $(document).on('click', '#questions-container .remove-question', function () { // .remove-question è in quiz_create.php
            $(this).closest('.question-block-styled').remove();
            renumberQuestions(); // Chiama la funzione per quiz_create
        });

        $(document).on('click', '#questions-container .remove-answer', function () { // .remove-answer è in quiz_create.php
            const $answerBlock = $(this).closest('.answer-block-styled');
            const $questionBlock = $answerBlock.closest('.question-block-styled');

            if ($questionBlock.find('.answer-block-styled').length > 1) {
                $answerBlock.remove();
                renumberQuestions(); // Chiama la funzione per quiz_create
            } else {
                showAlert('Ogni domanda deve avere almeno una risposta.', 'warning', '#alert-container-page');
            }
        });

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
                url: 'api/questions.php',
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
                        $('#quiz-details-section').show();
                        $('#create-quiz-form')[0].reset();
                        $('#questions-form')[0].reset();
                        $('#questions-container').empty().html('<p id="no-questions-message" class="message-placeholder-styled text-align-center padding-vertical-medium">Nessuna domanda aggiunta. Clicca su "Aggiungi Domanda" per iniziare.</p>');
                        renumberQuestions();
                    }
                });
            }
        });
    } // Fine if ($('#create-quiz-form').length)

    // Handler per il cambio dei radio button (gestione campo punti) in quiz_create.php
    $(document).on('change', '#questions-section .answer-block-styled input[type="radio"][name$="[type]"]', function () { // Specifico per #questions-section di create
        const $answerBlock = $(this).closest('.answer-block-styled');
        const $pointsGroup = $answerBlock.find('.points-group');
        const $pointsInput = $pointsGroup.find('input[type="number"]');

        if ($(this).val() === 'Corretta' && $(this).is(':checked')) {
            $pointsGroup.slideDown();
            // Se il punteggio è 0 o vuoto, imposta a 1 quando si seleziona "Corretta"
             if (parseInt($pointsInput.val(), 10) <= 0 || $pointsInput.val() === "") {
                $pointsInput.val(1);
            }
        } else {
            // Azzera e nascondi solo se "Sbagliata" è effettivamente selezionato
            const nameAttr = $(this).attr('name');
            if ($answerBlock.find('input[type="radio"][name="'+nameAttr+'"][value="Sbagliata"]').is(':checked')) {
                $pointsGroup.slideUp(function() {
                    $pointsInput.val(0);
                });
            }
        }
    });

    // --- Partecipazione Quiz ---
    if ($('#participate-form').length) {
        // ... (codice esistente) ...
    }

    // --- Elenco Partecipazioni ---
    if (window.location.pathname.endsWith('quiz_participations.php') && $('#partecipations-container').length) {
        // ... (codice esistente) ...
    }

    // --- Modifica Quiz (quiz_edit.php) ---
    if ($('#edit-quiz-form').length) {

        // Funzioni specifiche per la rinumerazione nella pagina di modifica
        function renumberQuestionsForEdit() {
            const $form = $('#edit-quiz-form');
            const $questionBlocks = $form.find('#questions-container .question-block-styled');
            $form.find('#no-questions-message').toggle($questionBlocks.length === 0);

            $questionBlocks.each(function (qIndex) { // qIndex parte da 0
                const $currentQuestionBlock = $(this);
                const displayQNum = qIndex + 1;

                $currentQuestionBlock.attr('data-question-index', qIndex); // Usiamo data-question-index (basato su 0)
                $currentQuestionBlock.find('.question-number').first().text(displayQNum);
                
                $currentQuestionBlock.find('.add-answer-btn .question-number-btn-text').text(displayQNum);
                $currentQuestionBlock.find('.remove-question-btn').attr('title', `Rimuovi Domanda ${displayQNum}`);

                // Aggiorna textarea domanda
                $currentQuestionBlock.find('textarea[name^="questions["]').each(function () {
                    const oldName = $(this).attr('name');
                    if (oldName) $(this).attr('name', oldName.replace(/questions\[.*?\]/, `questions[${qIndex}]`));
                    
                    const oldId = $(this).attr('id');
                    if (oldId && oldId.startsWith('question_text_')) {
                        const newId = `question_text_${qIndex}`;
                        $(this).attr('id', newId);
                        $currentQuestionBlock.find(`label[for="${oldId}"]`).attr('for', newId); // Aggiorna label
                    }
                });
                // Aggiorna campo hidden original_numero_domanda
                $currentQuestionBlock.find('input[type="hidden"][name$="[original_numero_domanda]"]').each(function() {
                    const oldName = $(this).attr('name');
                    if (oldName) $(this).attr('name', oldName.replace(/questions\[.*?\]/, `questions[${qIndex}]`));
                });

                const $answersContainer = $currentQuestionBlock.find('.answers-container-styled');
                $answersContainer.attr('id', `answers-container-q${qIndex}`);
                $answersContainer.find('.no-answers-message').attr('id', `no-answers-for-q${qIndex}`);

                renumberAnswersForEdit($currentQuestionBlock, qIndex);
            });
        }

        function renumberAnswersForEdit($questionBlock, questionIndex) { // questionIndex è base 0
            const $answerBlocks = $questionBlock.find('.answers-container-styled .answer-block-styled');
            $questionBlock.find('.no-answers-message').toggle($answerBlocks.length === 0);

            $answerBlocks.each(function (aIndex) { // aIndex parte da 0
                const $currentAnswerBlock = $(this);
                const displayANum = aIndex + 1;

                $currentAnswerBlock.attr('data-answer-index', aIndex); // Usiamo data-answer-index (base 0)
                $currentAnswerBlock.find('.answer-number').first().text(displayANum);

                const nameQuestionPart = `questions[${questionIndex}]`;
                const nameAnswerPart = `[answers][${aIndex}]`; // Indici base 0

                // Testo risposta
                $currentAnswerBlock.find('input[type="text"][name$="[testo]"]').each(function() {
                    const oldId = $(this).attr('id');
                    const newId = `answer_text_${questionIndex}_${aIndex}`;
                    $(this).attr('name', `${nameQuestionPart}${nameAnswerPart}[testo]`);
                    $(this).attr('id', newId);
                    $currentAnswerBlock.find(`label[for="${oldId}"]`).attr('for', newId); // Aggiorna label
                });
                // Tipo (radio)
                $currentAnswerBlock.find('input[type="radio"][name$="[tipo]"]').each(function() {
                    const radioValue = $(this).val(); // "Corretta" o "Sbagliata"
                    const typeSuffix = radioValue === 'Corretta' ? 'C' : 'S';
                    const newId = `q${questionIndex}a${aIndex}tipo${typeSuffix}`;
                    $(this).attr('name', `${nameQuestionPart}${nameAnswerPart}[tipo]`);
                    $(this).attr('id', newId);
                    $(this).next('label.radio-label-styled').attr('for', newId);
                });
                // Punteggio
                $currentAnswerBlock.find('input[type="number"][name$="[punteggio]"]').each(function() {
                    const oldId = $(this).attr('id');
                    const newId = `q${questionIndex}a${aIndex}punti`;
                    $(this).attr('name', `${nameQuestionPart}${nameAnswerPart}[punteggio]`);
                    $(this).attr('id', newId);
                    $currentAnswerBlock.find(`label[for="${oldId}"]`).attr('for', newId); // Aggiorna label
                });
                // Campo hidden original_numero_risposta
                $currentAnswerBlock.find('input[type="hidden"][name$="[original_numero_risposta]"]').each(function() {
                    $(this).attr('name', `${nameQuestionPart}${nameAnswerPart}[original_numero_risposta]`);
                });
            });
        }

        // Chiamata iniziale per assicurare che gli indici e i numeri siano corretti al caricamento
        renumberQuestionsForEdit();

        // Aggiungi Nuova Domanda in edit
        $('#edit-quiz-form').on('click', '#add-question-btn', function () {
            const questionTemplate = $('#question-template').html(); // Template per edit
            const questionIndex = $('#edit-quiz-form #questions-container .question-block-styled').length; // Indice base 0
            const displayQNum = questionIndex + 1;

            let newQuestionHtml = questionTemplate
                .replace(/__Q_INDEX__/g, questionIndex) // Per name e id
                .replace(/__Q_DISPLAY_NUM__/g, displayQNum); // Per testo visibile
            
            $('#edit-quiz-form #questions-container').append(newQuestionHtml);
            
            const $newlyAddedQuestionBlock = $('#edit-quiz-form #questions-container .question-block-styled').last();
            if ($newlyAddedQuestionBlock.length) {
                const answerTemplate = $('#answer-template').html(); // Template risposta per edit
                const answerIndex = 0; // Prima risposta, indice 0
                const displayANum = 1;
                let newAnswerHtml = answerTemplate
                    .replace(/__Q_INDEX__/g, questionIndex) 
                    .replace(/__A_INDEX__/g, answerIndex)   
                    .replace(/__A_DISPLAY_NUM__/g, displayANum);
                
                $newlyAddedQuestionBlock.find('.answers-container-styled').append(newAnswerHtml);
                $newlyAddedQuestionBlock.find('.no-answers-message').hide();
            }
            renumberQuestionsForEdit(); // Rinumera tutto
            $newlyAddedQuestionBlock.find('textarea').first().focus();
        });

        // Aggiungi Risposta a una Domanda in edit
        $('#edit-quiz-form').on('click', '.add-answer-btn', function () {
            const $questionBlock = $(this).closest('.question-block-styled');
            const questionIndex = $questionBlock.data('question-index'); // Leggi l'indice della domanda (base 0)
            
            const $answersContainer = $questionBlock.find('.answers-container-styled');
            const answerIndex = $answersContainer.find('.answer-block-styled').length; // Nuovo indice risposta (base 0)
            const displayANum = answerIndex + 1;

            const answerTemplate = $('#answer-template').html(); // Template risposta per edit
            let newAnswerHtml = answerTemplate
                .replace(/__Q_INDEX__/g, questionIndex)
                .replace(/__A_INDEX__/g, answerIndex)
                .replace(/__A_DISPLAY_NUM__/g, displayANum);
            
            $answersContainer.append(newAnswerHtml);
            $questionBlock.find('.no-answers-message').hide();
            renumberAnswersForEdit($questionBlock, questionIndex); // Rinumera solo le risposte di questa domanda
            $answersContainer.find('.answer-block-styled').last().find('input[type="text"]').first().focus();
        });

        // Rimuovi Domanda in edit
        $('#edit-quiz-form').on('click', '.remove-question-btn', function () {
            $(this).closest('.question-block-styled').remove();
            renumberQuestionsForEdit();
        });

        // Rimuovi Risposta in edit
        $('#edit-quiz-form').on('click', '.remove-answer-btn', function () {
            const $answerBlock = $(this).closest('.answer-block-styled');
            const $questionBlock = $answerBlock.closest('.question-block-styled');
            const questionIndex = $questionBlock.data('question-index'); // Leggi indice (base 0)

            if ($questionBlock.find('.answers-container-styled .answer-block-styled').length > 1) {
                $answerBlock.remove();
                renumberAnswersForEdit($questionBlock, questionIndex);
            } else {
                showEditAlerts('Ogni domanda deve avere almeno una risposta!', 'warning');
            }
        });

        // Gestione visualizzazione campo Punteggio in edit
        $('#edit-quiz-form').on('change', '.answer-block-styled input[type="radio"][name$="[tipo]"]', function () {
            const $answerBlock = $(this).closest('.answer-block-styled');
            const $pointsGroup = $answerBlock.find('.points-group');
            const $pointsInput = $pointsGroup.find('input[type="number"]');

            if ($(this).val() === 'Corretta' && $(this).is(':checked')) {
                $pointsGroup.slideDown();
                if (parseInt($pointsInput.val(), 10) <= 0 && $pointsInput.val() !== "") {
                    $pointsInput.val(1); 
                } else if ($pointsInput.val() === "") {
                     $pointsInput.val(1);
                }
            } else {
                const nameAttr = $(this).attr('name');
                if ($answerBlock.find('input[type="radio"][name="'+nameAttr+'"][value="Sbagliata"]').is(':checked')) {
                    $pointsGroup.slideUp(function() {
                        $pointsInput.val(0);
                    });
                }
            }
        });

        // Submit del form di modifica
        $('#edit-quiz-form').submit(function (e) {
            e.preventDefault();
            const $form = $(this);
            const startDateVal = $form.find('#dataInizio').val();
            const endDateVal = $form.find('#dataFine').val();
            
            if (startDateVal && endDateVal) {
                const startDate = new Date(startDateVal);
                const endDate = new Date(endDateVal);
                const dateError = checkDateRange(startDate, endDate, true); // true per allowPastStartDate
                if (dateError) {
                     showEditAlerts(dateError, 'danger');
                     return;
                }
            }

            if ($form.find('#questions-container .question-block-styled').length === 0) {
                showEditAlerts('Il quiz deve avere almeno una domanda.', 'warning');
                return;
            }

            let allQuestionsValid = true;
            $form.find('#questions-container .question-block-styled').each(function(qIdx) {
                const $qBlock = $(this);
                const qNumText = $qBlock.find('.question-number').first().text();

                if ($qBlock.find('.answers-container-styled .answer-block-styled').length === 0) {
                    showEditAlerts(`La Domanda ${qNumText} non ha risposte. Ogni domanda deve avere almeno una risposta.`, 'warning');
                    allQuestionsValid = false; return false; 
                }

                let hasCorrectAnswer = false;
                $qBlock.find('.answers-container-styled .answer-block-styled input[type="radio"][name$="[tipo]"][value="Corretta"]').each(function() {
                    if ($(this).is(':checked')) { hasCorrectAnswer = true; return false; }
                });
                if (!hasCorrectAnswer) {
                    showEditAlerts(`La Domanda ${qNumText} non ha una risposta designata come "Corretta".`, 'warning');
                    allQuestionsValid = false; return false;
                }
            });

            if (!allQuestionsValid) return;

            $.ajax({
                url: $form.attr('action'), 
                type: $form.attr('method'), 
                data: $form.serialize(),
                dataType: 'json',
                success: function (response) {
                    if (response.status === 'success') {
                        showEditAlerts('Quiz aggiornato con successo!', 'success');
                        const quizId = $form.find('input[name="quiz_id"]').val();
                        setTimeout(() => {
                             window.location.href = 'quiz_my.php';
                        }, 1500);
                    } else {
                        showEditAlerts(response.message || 'Errore durante il salvataggio delle modifiche.', 'danger');
                    }
                },
                error: function (xhr) {
                    showEditAlerts('Errore di comunicazione: ' + (xhr.responseJSON?.message || xhr.statusText || 'Dettagli non disponibili'), 'danger');
                }
            });
        });

    }

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