// assets/js/main.js

// Funzioni helper globali (definite prima di $(document).ready)
function checkDateRange(startDate, endDate, edit = false) {
    const today = new Date();
    today.setHours(0, 0, 0, 0);
    if (startDate < today && !edit) {
        return 'La data di inizio non può essere precedente a oggi.';
    }
    if (endDate < startDate) {
        return 'La data di fine non può essere precedente alla data di inizio.';
    }
    return null;
}

// assets/js/main.js

function showAlert(message, type = 'info', containerSelector = '#alert-container-page') { // Default a #alert-container-page per quiz_create
    // type può essere 'info', 'success', 'warning', 'danger'
    const alertId = 'custom-alert-' + Date.now(); // ID unico per l'alert
    const alertHtml = `
        <div id="${alertId}" class="custom-alert custom-alert-${type}" role="alert">
            <span class="custom-alert-message">${message}</span>
            <button type="button" class="custom-alert-close" aria-label="Close">×</button>
        </div>`;

    let $alertContainer = $(containerSelector);
    if (!$alertContainer.length) {
        // Fallback se il contenitore specificato non esiste
        $('body').prepend('<div id="alert-container-fallback" class="custom-alert-fallback-container"></div>');
        $alertContainer = $('#alert-container-fallback');
    }

    // Rimuovi alert precedenti dallo stesso contenitore per evitare sovrapposizioni
    // se non sono auto-dismissed o se l'utente clicca velocemente.
    $alertContainer.find('.custom-alert').remove();
    
    $alertContainer.append(alertHtml); // Usa append invece di html per non sovrascrivere altri eventuali contenuti del container

    const $currentAlert = $('#' + alertId);

    // Gestione chiusura
    $currentAlert.find('.custom-alert-close').on('click', function() {
        $currentAlert.fadeOut(300, function() { $(this).remove(); });
    });

    // Auto-dismiss per tipi non critici
    if (type !== 'danger' && type !== 'error' && type !== 'warning') { // Modificato per non far sparire warning
        setTimeout(function () {
            $currentAlert.fadeOut(500, function() { $(this).remove(); });
        }, 5000);
    }
}

function showEditAlerts(message, type) { // Specifica per form di modifica, usa showAlert
    showAlert(message, type, '#form-messages');
}

function renumberQuestions() {
    $('#no-questions-message').toggle($('#questions-container .question-block').length === 0);

    $('.question-block').each(function (index) {
        const qNum = index + 1; // 1-based index
        $(this).attr('data-question', qNum);
        $(this).find('.question-number').text(qNum); // Aggiorna il numero visualizzato
        $(this).find('label[for^="question-"]').first().attr('for', `question-${qNum}`); // Etichetta testo domanda
        $(this).find('textarea[id^="question-"]').attr({
            'id': `question-${qNum}`,
            'name': `questions[${qNum}][text]`
        });
        
        const answersContainer = $(this).find('.answers-container');
        answersContainer.attr('id', `answers-container-${qNum}`);
        
        $(this).find('.add-answer').data('question', qNum);
        $(this).find('.remove-question').data('question', qNum).attr('title', `Rimuovi Domanda ${qNum}`);
        // Potresti anche aggiornare il testo del bottone se non usi solo title e icona
        // $(this).find('.remove-question').html(`<i class="fas fa-trash"></i> Rimuovi Domanda ${qNum}`);


        answersContainer.find('.answer-block').each(function (aIndex) {
            const aNum = aIndex + 1; // 1-based index
            $(this).attr('data-answer', aNum);
            $(this).find('.answer-number').text(aNum); // Aggiorna numero visualizzato risposta

            // Label per il testo della risposta
            $(this).find('label[for^="question-"][for*="-answer-"]').attr('for', `question-${qNum}-answer-${aNum}`);
            
            // Input testo risposta
            $(this).find('input[type="text"][id^="question-"]').attr({
                'id': `question-${qNum}-answer-${aNum}`,
                'name': `questions[${qNum}][answers][${aNum}][text]`
            });

            // Radio buttons tipo risposta
            $(this).find('input[type="radio"][name$="[type]"]').each(function() {
                const radioIdBase = `question-${qNum}-answer-${aNum}-type-`;
                const radioValue = $(this).val().toLowerCase(); // es. corretta, sbagliata
                $(this).attr({
                    'name': `questions[${qNum}][answers][${aNum}][type]`,
                    'id': radioIdBase + (radioValue === 'corretta' ? 'correct' : 'wrong')
                });
                // Aggiorna il 'for' della label associata al radio
                $(this).next('label.form-check-label').attr('for', radioIdBase + (radioValue === 'corretta' ? 'correct' : 'wrong'));
            });
            
            // Punti
            const pointsGroup = $(this).find('.points-group');
            pointsGroup.find('label').attr('for', `question-${qNum}-answer-${aNum}-points`);
            pointsGroup.find('input[type="number"]').attr({
                'id': `question-${qNum}-answer-${aNum}-points`,
                'name': `questions[${qNum}][answers][${aNum}][points]`
            });
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
    $('#no-questions-message').hide(); // Nascondi il messaggio se presente

    const questionCounter = $('#questions-container .question-block').length + 1;
    const questionTemplate = document.getElementById('question-template-create').innerHTML;
    
    // Sostituisci i placeholder. NOTA: __Q_NUM__ viene usato per gli indici degli array,
    // mentre il testo visualizzato "Domanda X" userà questionCounter direttamente.
    // Se vuoi che gli array siano 0-indexed, allora dovrai usare questionCounter - 1 per gli array.
    // Per semplicità, qui usiamo 1-indexed come nel tuo codice originale.
    const questionHtml = questionTemplate.replace(/__Q_NUM__/g, questionCounter);
                                    // .replace(/__Q_DISPLAY_NUM__/g, questionCounter); // Se avessi un placeholder per il numero visualizzato

    $('#questions-container').append(questionHtml);
    
    // Aggiungi automaticamente la prima risposta alla nuova domanda
    const newQuestionBlock = $(`#questions-container .question-block[data-question="${questionCounter}"]`);
    addAnswerToQuestion(newQuestionBlock, questionCounter, 1); // Aggiunge la prima risposta
    
    renumberQuestions(); // Assicurati che questa funzione aggiorni anche i testi "Domanda X" e "Risposta Y"
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

$(document).on('click', '#questions-container .remove-question', function () {
    $(this).closest('.question-block').remove();
    renumberQuestions(); // Questo si occuperà anche di mostrare/nascondere no-questions-message
});

$(document).on('click', '#questions-container .remove-answer', function () {
    const questionBlock = $(this).closest('.question-block');
    if (questionBlock.find('.answer-block').length > 1) {
        $(this).closest('.answer-block').remove();
        // Non è necessario rinumerare l'intera lista di domande qui,
        // ma solo le risposte all'interno di questa domanda.
        // La funzione renumberQuestions() completa lo farà comunque.
        // Per ottimizzare, potresti creare renumberAnswersForQuestion(questionBlock)
        renumberQuestions(); 
    } else { 
        showAlert('Ogni domanda deve avere almeno una risposta.', 'warning', '#alert-container-page'); 
    }
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
            const errorMessage = checkDateRange(startDate, endDate, true);
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

// Funzione per gestire l'apertura/chiusura delle domande
function toggleQuestion(headerElement) {
    const questionCard = headerElement.closest('.question-card');
    if (questionCard) {
        const contentWrapper = questionCard.querySelector('.question-content-wrapper');
        // Toggla la classe 'open' sulla card, che controlla lo stile CSS
        const isOpen = questionCard.classList.toggle('open'); 
        
        // Aggiorna l'attributo ARIA per l'accessibilità
        headerElement.setAttribute('aria-expanded', isOpen.toString());
        
        if (isOpen) {
            // Se la domanda si sta aprendo, imposta maxHeight per l'animazione
            // basandosi sull'altezza effettiva del suo contenuto.
            contentWrapper.style.maxHeight = contentWrapper.scrollHeight + "px";
        } else {
            // Se la domanda si sta chiudendo, resetta maxHeight a null.
            // Il CSS (max-height: 0) si occuperà di collassarla con l'animazione.
            contentWrapper.style.maxHeight = null; 
        }
    }
}

// Questo codice viene eseguito quando l'intera pagina HTML è stata caricata e analizzata
document.addEventListener('DOMContentLoaded', () => {
    
    // Aggiungi event listener per il click e per la tastiera (accessibilità)
    // a ogni header di domanda.
    document.querySelectorAll('.question-header').forEach(header => {
        header.addEventListener('click', function() {
            toggleQuestion(this); // Chiama la funzione quando l'header viene cliccato
        });

        header.addEventListener('keydown', function(event) {
            // Permetti di aprire/chiudere con i tasti Invio o Spazio
            if (event.key === 'Enter' || event.key === ' ') {
                event.preventDefault(); // Evita il comportamento di default (es. scroll)
                toggleQuestion(this);
            }
        });
    });

    // Gestisci lo stato iniziale delle domande che sono già aperte
    // (quelle a cui abbiamo aggiunto la classe 'open' nell'HTML via PHP).
    document.querySelectorAll('.question-card.open').forEach(card => {
        const contentWrapper = card.querySelector('.question-content-wrapper');
        const header = card.querySelector('.question-header');

        // L'attributo aria-expanded dovrebbe essere già 'true' dall'HTML,
        // ma lo confermiamo qui per coerenza.
        if (header) {
            header.setAttribute('aria-expanded', 'true');
        }

        if (contentWrapper) {
            // Per evitare l'animazione "scattosa" al caricamento iniziale
            // per le domande che sono già aperte:
            
            // 1. Salva la transizione CSS originale del wrapper (se presente)
            const originalTransition = contentWrapper.style.transition;
            // 2. Rimuovi temporaneamente la transizione
            contentWrapper.style.transition = 'none'; 
            
            // 3. Imposta il maxHeight all'altezza effettiva del contenuto
            contentWrapper.style.maxHeight = contentWrapper.scrollHeight + "px";
            
            // 4. Forza il browser a "ricalcolare" il layout (reflow).
            // Questo trucco assicura che il maxHeight sia applicato immediatamente
            // senza che la transizione (che abbiamo appena rimosso) possa interferire.
            void contentWrapper.offsetWidth; 
            
            // 5. Ripristina la transizione CSS originale.
            // Ora, le future aperture/chiusure manuali avranno l'animazione.
            contentWrapper.style.transition = originalTransition;
        }
        // L'icona a freccia (es. chevron) dovrebbe già essere ruotata correttamente
        // grazie alla classe '.open' e agli stili CSS corrispondenti
        // (.question-card.open .question-header .question-toggle i { transform: rotate(180deg); })
    });
});

// Funzione helper per aggiungere una risposta, da chiamare sia da "add-question" che da "add-answer"
function addAnswerToQuestion(questionBlockElement, questionNum, answerCount) {
    const answerTemplate = document.getElementById('answer-template-create').innerHTML;
    let answerHtml = answerTemplate.replace(/__Q_NUM__/g, questionNum)
                                   .replace(/__A_NUM__/g, answerCount);
    
    // Se il template non ha già la prima risposta, questa logica è per aggiungerla.
    // Altrimenti, se il template domanda include già una risposta, questa funzione è più per il bottone "Aggiungi Risposta"
    $(questionBlockElement).find('.answers-container').append(answerHtml);
}

$(document).on('click', '#questions-container .add-answer', function () {
    const questionNum = $(this).data('question');
    const questionBlock = $(this).closest('.question-block');
    const answersContainer = questionBlock.find('.answers-container');
    const answerCount = answersContainer.find('.answer-block').length + 1;

    addAnswerToQuestion(questionBlock, questionNum, answerCount);
    renumberQuestions(); // Assicurati che questa funzione aggiorni anche i testi
});