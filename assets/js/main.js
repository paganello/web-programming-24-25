// ==========================================================================
// Funzioni Helper Globali
// ==========================================================================

/**
 * Controlla se l'intervallo di date fornito è valido.
 * @param {Date} startDate - La data di inizio.
 * @param {Date} endDate - La data di fine.
 * @param {boolean} [allowPastStartDate=false] - Se true, permette che la data di inizio sia nel passato.
 * @returns {string|null} Un messaggio di errore se l'intervallo non è valido, altrimenti null.
 */
function checkDateRange(startDate, endDate, allowPastStartDate = false) {
    const today = new Date();
    today.setHours(0, 0, 0, 0); // Normalizza a mezzanotte per un confronto corretto solo sulla data.

    if (!allowPastStartDate && startDate < today) {
        return 'La data di inizio non può essere precedente a oggi.';
    }
    if (endDate < startDate) {
        return 'La data di fine non può essere precedente alla data di inizio.';
    }
    return null; // Nessun errore, intervallo valido.
}

/**
 * Mostra un messaggio di alert dinamico all'utente.
 * L'alert scompare automaticamente dopo un timeout, tranne per i tipi 'danger', 'error', 'warning'.
 * @param {string} message - Il messaggio da visualizzare.
 * @param {string} [type='info'] - Il tipo di alert (es. 'success', 'danger', 'warning', 'info').
 * @param {string} [containerSelector='#alert-container-page'] - Il selettore CSS del contenitore dove inserire l'alert.
 */
function showAlert(message, type = 'info', containerSelector = '#alert-container-page') {
    const alertId = 'custom-alert-' + Date.now(); // ID univoco per l'alert, utile per la gestione.

    // HTML dell'alert, usando classi Bootstrap-like per compatibilità con CSS esistente.
    const alertHtml = `
        <div id="${alertId}" class="alert alert-${type}" role="alert">
            <span class="alert-message">${message}</span>
            <button type="button" class="alert-close-btn" aria-label="Close">×</button>
        </div>`;

    let $alertContainer = $(containerSelector);

    // Se il contenitore specificato non esiste, ne crea uno di fallback (posizionato fisso).
    if (!$alertContainer.length) {
        // Nota: lo stile inline qui è per il fallback; idealmente, dovrebbe essere nel CSS.
        $('body').prepend('<div id="alert-container-fallback" class="custom-alert-fallback-container" style="position: fixed; top: 20px; left: 50%; transform: translateX(-50%); z-index: 9999; width: auto; max-width: 90%;"></div>');
        $alertContainer = $('#alert-container-fallback');
    }

    // Rimuove eventuali alert precedenti nello stesso contenitore per evitare sovrapposizioni.
    // Si assume che gli alert abbiano la classe generica '.alert'.
    $alertContainer.find('.alert').remove();

    // Aggiunge il nuovo alert al contenitore.
    $alertContainer.append(alertHtml);
    const $currentAlert = $('#' + alertId); // Seleziona l'alert appena aggiunto.

    // Aggiunge la funzionalità di chiusura al click sul bottone 'x'.
    // Si assume che il bottone di chiusura abbia la classe '.alert-close-btn'.
    $currentAlert.find('.alert-close-btn').on('click', function() {
        $currentAlert.fadeOut(300, function() {
            $(this).remove(); // Rimuove l'alert dal DOM dopo il fadeOut.
        });
    });

    // Imposta un timeout per la scomparsa automatica, tranne per alert critici.
    if (type !== 'danger' && type !== 'error' && type !== 'warning') {
        setTimeout(function () {
            $currentAlert.fadeOut(500, function() { $(this).remove(); });
        }, 5000); // 5 secondi.
    }
}

/**
 * Funzione wrapper per showAlert specificamente per la pagina quiz_edit.php.
 * Utilizza un contenitore di alert dedicato per quella pagina.
 * @param {string} message - Il messaggio da visualizzare.
 * @param {string} type - Il tipo di alert.
 */
function showEditAlerts(message, type) {
    showAlert(message, type, '#alert-container-page-modify');
}


/**
 * Rinumera dinamicamente le domande e le risposte nel form di creazione quiz (quiz_create.php).
 * Aggiorna gli attributi 'name', 'id', 'for' e il testo visualizzato per i numeri
 * per mantenere la coerenza e permettere un corretto invio dei dati al server.
 */
function renumberQuestions() { // Specifica per quiz_create.php
    const $questionBlocks = $('#questions-container .question-block-styled'); // Seleziona tutti i blocchi domanda.
    // Mostra/nasconde il messaggio "nessuna domanda" in base alla presenza di blocchi.
    $('#no-questions-message').toggle($questionBlocks.length === 0);

    $questionBlocks.each(function (index) {
        const qNum = index + 1; // Per quiz_create.php, i numeri/indici nei 'name' partono da 1.
        const $currentQuestionBlock = $(this);

        // Aggiorna l'attributo data e il testo del numero domanda visualizzato.
        $currentQuestionBlock.attr('data-question', qNum);
        $currentQuestionBlock.find('.question-number').text(qNum); // Badge visuale del numero domanda.

        // Aggiorna gli attributi 'for' delle label e 'id'/'name' del textarea della domanda.
        $currentQuestionBlock.find('label.form-label-styled[for^="question-"]').first().attr('for', `question-${qNum}`);
        $currentQuestionBlock.find('textarea.textarea-styled[id^="question-"]').attr({
            'id': `question-${qNum}`,
            'name': `questions[${qNum}][text]` // Formato: questions[1][text], questions[2][text], ...
        });

        // Aggiorna ID del contenitore risposte e del messaggio "nessuna risposta".
        const $answersContainer = $currentQuestionBlock.find('.answers-container-styled');
        $answersContainer.attr('id', `answers-container-${qNum}`);
        $answersContainer.find('.message-inline-styled[id^="no-answers-for-q-"]').attr('id', `no-answers-for-q-${qNum}`);

        // Aggiorna i dati e gli attributi dei bottoni "Aggiungi Risposta" e "Rimuovi Domanda".
        $currentQuestionBlock.find('button.add-answer').data('question', qNum);
        $currentQuestionBlock.find('button.remove-question').data('question', qNum).attr('title', `Rimuovi Domanda ${qNum}`);

        // Itera su ogni blocco risposta all'interno della domanda corrente.
        $answersContainer.find('.answer-block-styled').each(function (aIndex) {
            const aNum = aIndex + 1; // I numeri/indici delle risposte partono da 1.
            const $currentAnswerBlock = $(this);
            $currentAnswerBlock.attr('data-answer', aNum);
            $currentAnswerBlock.find('.answer-number').text(aNum); // Badge visuale del numero risposta.

            // Input testo della risposta.
            $currentAnswerBlock.find('label.label-small-styled[for^="question-"][for*="-answer-"]').attr('for', `question-${qNum}-answer-${aNum}`);
            $currentAnswerBlock.find('input[type="text"].input-small-styled[id^="question-"]').attr({
                'id': `question-${qNum}-answer-${aNum}`,
                'name': `questions[${qNum}][answers][${aNum}][text]`
            });

            // Radio buttons per il tipo di risposta (Corretta/Sbagliata).
            $currentAnswerBlock.find('input.radio-input-styled[name$="[type]"]').each(function() {
                const radioIdBase = `question-${qNum}-answer-${aNum}-type-`;
                const radioValue = $(this).val(); // Es. "Corretta" o "Sbagliata".
                const typeSuffix = radioValue === 'Corretta' ? 'correct' : 'wrong';
                $(this).attr({
                    'name': `questions[${qNum}][answers][${aNum}][type]`,
                    'id': radioIdBase + typeSuffix
                });
                $(this).next('label.radio-label-styled').attr('for', radioIdBase + typeSuffix);
            });

            // Input punteggio per la risposta.
            const $pointsGroup = $currentAnswerBlock.find('.points-group');
            $pointsGroup.find('label.label-small-styled[for$="-points"]').attr('for', `question-${qNum}-answer-${aNum}-points`);
            $pointsGroup.find('input[type="number"].input-numerical-styled[name$="[points]"]').attr({
                'id': `question-${qNum}-answer-${aNum}-points`,
                'name': `questions[${qNum}][answers][${aNum}][points]`
            });
        });

        // Aggiorna la visibilità del messaggio "nessuna risposta aggiunta" per la domanda corrente.
        const noAnswersMsg = document.getElementById(`no-answers-for-q-${qNum}`);
        if (noAnswersMsg) {
            noAnswersMsg.style.display = $answersContainer.find('.answer-block-styled').length === 0 ? 'block' : 'none';
        }
    });
}

/**
 * Aggiunge un nuovo blocco risposta a una domanda specifica nel form di creazione quiz.
 * @param {HTMLElement} questionBlockElement - L'elemento DOM del blocco domanda.
 * @param {number} questionNum - Il numero della domanda a cui aggiungere la risposta.
 * @param {number} answerCount - Il numero progressivo per la nuova risposta.
 */
function addAnswerToQuestion(questionBlockElement, questionNum, answerCount) { // Specifica per quiz_create.php
    const answerTemplate = document.getElementById('answer-template-create').innerHTML;
    // Sostituisce i placeholder nel template HTML con i numeri corretti.
    let answerHtml = answerTemplate.replace(/__Q_NUM__/g, questionNum)
                                .replace(/__A_NUM__/g, answerCount);
    $(questionBlockElement).find('.answers-container-styled').append(answerHtml);
    // Nasconde il messaggio "nessuna risposta" dato che ne è stata aggiunta una.
    $(questionBlockElement).find(`#no-answers-for-q-${questionNum}`).hide();
}

/**
 * Gestisce l'apertura/chiusura di una card-domanda (accordion).
 * Utilizzata in quiz_view.php e altre pagine con la struttura .question-card.
 * @param {HTMLElement} headerElement - L'elemento header della domanda che è stato cliccato.
 */
function toggleQuestion(headerElement) {
    const questionCard = headerElement.closest('.question-card');
    if (!questionCard) return;

    const contentWrapper = questionCard.querySelector('.question-content-wrapper');
    if (!contentWrapper) return;

    const wasOpen = questionCard.classList.contains('open');

    if (wasOpen) { // Se sta per chiudere
        // Per una transizione fluida da 'max-height: none' a '0',
        // prima si imposta l'altezza esplicita corrente.
        if (contentWrapper.style.maxHeight === 'none' || contentWrapper.style.maxHeight === '') {
             contentWrapper.style.maxHeight = contentWrapper.scrollHeight + "px";
        }
        // Forza un reflow del browser per applicare l'altezza esplicita.
        contentWrapper.offsetHeight;

        // Usa requestAnimationFrame per assicurare che la transizione a 0 avvenga nel frame successivo.
        requestAnimationFrame(() => {
            contentWrapper.style.maxHeight = "0px";
            questionCard.classList.remove('open');
            headerElement.setAttribute('aria-expanded', 'false');
        });
    } else { // Se sta per aprire
        questionCard.classList.add('open');
        headerElement.setAttribute('aria-expanded', 'true');
        contentWrapper.style.maxHeight = contentWrapper.scrollHeight + "px";

        // Dopo che la transizione di apertura è completata, rimuove l'altezza esplicita
        // per permettere al contenuto di adattarsi dinamicamente (es. se immagini vengono caricate).
        const handleTransitionEnd = () => {
            if (questionCard.classList.contains('open')) { // Controlla se è ancora aperto
                contentWrapper.style.maxHeight = 'none';
            }
            contentWrapper.removeEventListener('transitionend', handleTransitionEnd);
        };
        contentWrapper.addEventListener('transitionend', handleTransitionEnd);
    }
}

// ==========================================================================
// Esecuzione al Caricamento del DOM (Vanilla JS)
// ==========================================================================
document.addEventListener('DOMContentLoaded', () => {
    // Inizializzazione dell'accordion per le domande (es. in quiz_view.php).
    // Si applica a tutti gli elementi con classe '.question-header'.
    document.querySelectorAll('.question-header').forEach(header => {
        header.addEventListener('click', function() { toggleQuestion(this); });
        // Accessibilità: permette di aprire/chiudere con Invio o Spazio.
        header.addEventListener('keydown', function(event) {
            if (event.key === 'Enter' || event.key === ' ') {
                event.preventDefault(); // Previene lo scroll della pagina con Spazio.
                toggleQuestion(this);
            }
        });
    });

    // Inizializzazione delle card domanda che sono già aperte al caricamento della pagina
    // (es. se la classe 'open' è impostata dal server).
    document.querySelectorAll('.question-card.open').forEach(card => {
        const contentWrapper = card.querySelector('.question-content-wrapper');
        const header = card.querySelector('.question-header');
        if (header) header.setAttribute('aria-expanded', 'true'); // Imposta ARIA attribute.
        if (contentWrapper) {
            // Imposta maxHeight a scrollHeight per l'apertura iniziale, poi 'none'
            // dopo un breve timeout per completare la transizione e permettere adattamento dinamico.
            contentWrapper.style.maxHeight = contentWrapper.scrollHeight + "px";
            setTimeout(() => {
               if (card.classList.contains('open')) contentWrapper.style.maxHeight = 'none';
            }, 360); // Durata leggermente superiore alla transizione CSS (es. 0.35s = 350ms).
        }
    });
});

// ==========================================================================
// Codice jQuery (Esecuzione dopo il caricamento completo del DOM)
// ==========================================================================
$(document).ready(function () {

    // --- Gestione Autenticazione (Login e Registrazione) ---
    // Submit del form di login.
    $('#login-form').on('submit', function (e) {
        e.preventDefault(); // Previene l'invio standard del form.
        const $form = $(this);
        $.ajax({
            type: 'POST',
            url: 'api/users.php?action=login', // Endpoint API per il login.
            data: $form.serialize(),         // Dati del form serializzati.
            dataType: 'json',                // Tipo di risposta attesa.
            success: function (response) {
                if (response.status === 'success') {
                    // Messaggio di successo di solito mostrato nella pagina successiva (tramite sessionStorage).
                    sessionStorage.setItem('loginMessage', response.message || 'Login effettuato con successo!');
                    sessionStorage.setItem('loginMessageType', 'success');
                    window.location.href = response.redirect_url || 'index.php'; // Reindirizzamento.
                } else {
                    showAlert(response.message || 'Credenziali non valide.', 'danger', '#alert-container-login');
                }
            },
            error: () => showAlert('Errore durante la comunicazione con il server.', 'danger', '#alert-container-login')
        });
    });

    // Submit del form di registrazione.
    $('#register-form').on('submit', function (e) {
        e.preventDefault();
        const $form = $(this);
        $.ajax({
            type: 'POST',
            url: 'api/users.php?action=register', // Endpoint API per la registrazione.
            data: $form.serialize(),
            dataType: 'json',
            success: function (response) {
                if (response.status === 'success') {
                    showAlert(response.message || 'Registrazione completata con successo! Effettua il login.', 'success', '#alert-container-register');
                    setTimeout(() => window.location.href = 'auth_login.php', 2000); // Reindirizza alla pagina di login dopo 2s.
                } else {
                    showAlert(response.message || 'Errore durante la registrazione.', 'danger', '#alert-container-register');
                }
            },
            error: () => showAlert('Errore durante la comunicazione con il server.', 'danger', '#alert-container-register')
        });
    });


    // --- Gestione Creazione Quiz (Pagina: quiz_create.php) ---
    if ($('#create-quiz-form').length) { // Esegui solo se il form di creazione quiz è presente.

        // Submit del form per i dettagli del quiz (titolo, date).
        $('#create-quiz-form').on('submit', function (e) {
            e.preventDefault();

            const titolo = $('#titolo').val().trim();
            const startDateVal = $('#dataInizio').val();
            const endDateVal = $('#dataFine').val();

            // Validazione campi obbligatori.
            if (titolo === '') {
                 showAlert('Il Titolo del Quiz è obbligatorio.', 'warning', '#alert-container-page');
                 $('#titolo').focus();
                 return;
            }
            if (!startDateVal) {
                 showAlert('La Data di inizio è obbligatoria.', 'warning', '#alert-container-page');
                 $('#dataInizio').focus();
                 return;
            }
            if (!endDateVal) {
                 showAlert('La Data di fine è obbligatoria.', 'warning', '#alert-container-page');
                 $('#dataFine').focus();
                 return;
            }

            const startDate = new Date(startDateVal);
            const endDate = new Date(endDateVal);

            // Validazione intervallo date.
            const errorMessage = checkDateRange(startDate, endDate, false); // false: non permette data inizio nel passato.
            if (errorMessage) {
                showAlert(errorMessage, 'danger', '#alert-container-page');
                return;
            }

            // Chiamata AJAX per creare il quiz (solo i metadati).
            $.ajax({
                type: 'POST',
                url: 'api/quiz.php?action=create', // Endpoint API per la creazione quiz.
                data: $(this).serialize(),
                dataType: 'json',
                success: function (response) {
                    if (response.status === 'success' && response.idQuiz) {
                        showAlert('Quiz creato con successo! Ora aggiungi le domande.', 'success', '#alert-container-page');
                        $('#quiz-id').val(response.idQuiz); // Salva l'ID del quiz in un campo hidden.
                        $('#quiz-details-section').slideUp(); // Nasconde la sezione dettagli quiz.
                        $('#questions-section').slideDown();  // Mostra la sezione per aggiungere domande.
                        // Aggiunge automaticamente la prima domanda se non ce ne sono.
                        if ($('#questions-container .question-block-styled').length === 0) {
                            $('#add-question').click(); // Simula il click sul bottone "Aggiungi Domanda".
                        } else {
                            renumberQuestions(); // Rinumera se ci sono già domande (improbabile qui, ma per sicurezza).
                        }
                    } else {
                        showAlert(response.message || 'Errore nella creazione del quiz.', 'danger', '#alert-container-page');
                    }
                },
                error: (xhr) => showAlert('Errore AJAX creazione quiz: ' + (xhr.responseJSON?.message || xhr.statusText), 'danger', '#alert-container-page')
            });
        });

        // Click sul bottone "Aggiungi Domanda".
        $('#add-question').click(function () {
            $('#no-questions-message').hide(); // Nasconde il messaggio "nessuna domanda".
            const questionTemplate = document.getElementById('question-template-create').innerHTML;
            const questionNumberForTemplate = $('#questions-container .question-block-styled').length + 1;

            // Sostituisce i placeholder nel template.
            const questionHtml = questionTemplate.replace(/__Q_NUM__/g, questionNumberForTemplate);
            $('#questions-container').append(questionHtml); // Aggiunge il blocco domanda.

            const $newlyAddedQuestionBlock = $('#questions-container .question-block-styled:last-child');
            if ($newlyAddedQuestionBlock.length) {
                // Aggiunge automaticamente la prima risposta alla nuova domanda.
                const actualQuestionNumForData = $newlyAddedQuestionBlock.data('question') || questionNumberForTemplate;
                addAnswerToQuestion($newlyAddedQuestionBlock, actualQuestionNumForData, 1); // 1 per la prima risposta.
            }
            renumberQuestions(); // Aggiorna numeri e attributi.
            $newlyAddedQuestionBlock.find('textarea.textarea-styled').first().focus(); // Focus sul testo della nuova domanda.
        });

        // Click sul bottone "Aggiungi Risposta" (delegato, perché i bottoni sono aggiunti dinamicamente).
        $(document).on('click', '#questions-container .add-answer', function () {
            const $thisButton = $(this);
            const questionNum = $thisButton.data('question'); // Numero domanda dal data attribute.
            const $questionBlock = $thisButton.closest('.question-block-styled');
            const answerCount = $questionBlock.find('.answers-container-styled .answer-block-styled').length + 1;
            addAnswerToQuestion($questionBlock, questionNum, answerCount);
            renumberQuestions();
            $questionBlock.find('.answer-block-styled:last-child input[type="text"]').first().focus(); // Focus sulla nuova risposta.
        });

        // Click sul bottone "Rimuovi Domanda" (delegato).
        $(document).on('click', '#questions-container .remove-question', function () {
            $(this).closest('.question-block-styled').remove();
            renumberQuestions();
        });

        // Click sul bottone "Rimuovi Risposta" (delegato).
        $(document).on('click', '#questions-container .remove-answer', function () {
            const $answerBlock = $(this).closest('.answer-block-styled');
            const $questionBlock = $answerBlock.closest('.question-block-styled');

            // Impedisce la rimozione se è l'unica risposta.
            if ($questionBlock.find('.answers-container-styled .answer-block-styled').length > 1) {
                $answerBlock.remove();
                renumberQuestions();
            } else {
                showAlert('Ogni domanda deve avere almeno una risposta.', 'warning', '#alert-container-page');
            }
        });

        // Click sul bottone "Salva Domande".
        $('#save-questions').click(function () {
            const quizId = $('#quiz-id').val();
            if (!quizId) {
                showAlert('ID del Quiz non trovato. Impossibile salvare.', 'danger', '#alert-container-page');
                return;
            }
            // Validazione: almeno una domanda.
            if ($('#questions-container .question-block-styled').length === 0) {
                showAlert('Devi aggiungere almeno una domanda.', 'warning', '#alert-container-page');
                return;
            }

            // Validazione approfondita di ogni domanda e risposta.
            let allQuestionsValid = true;
            $('#questions-container .question-block-styled').each(function() {
                const $qBlock = $(this);
                const qNumText = $qBlock.find('.question-number').text(); // Numero visualizzato.

                if ($qBlock.find('textarea.textarea-styled').val().trim() === '') {
                    showAlert(`Il testo della Domanda ${qNumText} non può essere vuoto.`, 'warning', '#alert-container-page');
                    allQuestionsValid = false; return false; // Interrompe .each().
                }
                if ($qBlock.find('.answers-container-styled .answer-block-styled').length === 0) {
                    showAlert(`La Domanda ${qNumText} non ha risposte.`, 'warning', '#alert-container-page');
                    allQuestionsValid = false; return false;
                }
                let hasCorrect = false; // Flag per risposta corretta.
                let allAnswersHaveText = true; // Flag per testo in tutte le risposte.
                $qBlock.find('.answers-container-styled .answer-block-styled').each(function(idx) {
                    if ($(this).find('input[type="text"].input-small-styled').val().trim() === '') {
                        showAlert(`Il testo della Risposta ${idx+1} per la Domanda ${qNumText} non può essere vuoto.`, 'warning', '#alert-container-page');
                        allAnswersHaveText = false; return false;
                    }
                    if ($(this).find('input.radio-input-styled[value="Corretta"]').is(':checked')) {
                        hasCorrect = true;
                    }
                });
                if (!allAnswersHaveText) { allQuestionsValid = false; return false; }
                if (!hasCorrect) {
                    showAlert(`La Domanda ${qNumText} non ha una risposta designata come "Corretta".`, 'warning', '#alert-container-page');
                    allQuestionsValid = false; return false;
                }
            });
            if (!allQuestionsValid) return; // Interrompe se una validazione fallisce.

            // Prepara i dati del form e invia via AJAX.
            const formData = $('#questions-form').serialize() + '&quiz_id=' + quizId + '&action=save_questions';
            $.ajax({
                type: 'POST',
                url: 'api/questions.php', // Endpoint API per salvare le domande.
                data: formData,
                dataType: 'json',
                success: function (response) {
                    if (response.status === 'success') {
                        showAlert('Domande salvate con successo!', 'success', '#alert-container-page');
                        setTimeout(() => window.location.href = 'quiz_view.php?id=' + quizId, 1500); // Reindirizza alla vista del quiz.
                    } else {
                        showAlert(response.message || 'Errore nel salvataggio delle domande.', 'danger', '#alert-container-page');
                    }
                },
                error: (xhr) => {
                    showAlert('Errore AJAX salvataggio domande: ' + (xhr.responseJSON?.message || xhr.statusText), 'danger', '#alert-container-page');
                }
            });
        });

        // Gestione Modale di Conferma Annullamento Creazione Quiz.
        const $confirmAbortModal = $('#confirmAbortCreationModal');
        const $confirmAbortActionBtn = $('#confirmAbortActionBtn');
        const $abortModalMessage = $('#abortCreationModalMessage');

        function showAbortCreationModal() { if($confirmAbortModal.length) $confirmAbortModal.fadeIn(200); }
        function hideAbortCreationModal() { if($confirmAbortModal.length) $confirmAbortModal.fadeOut(200); }

        if ($confirmAbortModal.length) {
            // Event listener per chiudere il modale.
            $confirmAbortModal.find('.custom-modal-close-button, #cancelAbortBtn').on('click', hideAbortCreationModal);
            $(window).on('click', (event) => { if ($(event.target).is($confirmAbortModal)) hideAbortCreationModal(); });
            $(document).on('keydown', (event) => { if (event.key === 'Escape' && $confirmAbortModal.is(':visible')) hideAbortCreationModal(); });
        }

        // Click sul bottone "Annulla Creazione Quiz".
        $('#abort-quiz-creation').click(function () {
            const quizIdToDelete = $('#quiz-id').val();
            let msg = "Sei sicuro di voler annullare la creazione del quiz?";

            // Personalizza il messaggio del modale in base allo stato della creazione.
            if (quizIdToDelete && $('#questions-section').is(':visible')) { // Quiz creato, si stanno aggiungendo domande.
                 msg += " Il quiz parzialmente creato (ID: " + quizIdToDelete + ") e le sue domande verranno eliminati.";
            } else if ($('#create-quiz-form').find('input[name="titolo"]').val() !== '') { // Dati inseriti nel form dettagli.
                msg += " Eventuali dati inseriti per i dettagli del quiz verranno persi.";
            }
            if($abortModalMessage.length) $abortModalMessage.text(msg);
            showAbortCreationModal(); // Mostra il modale.

            // Azione del bottone "Conferma Annullamento" nel modale.
            if($confirmAbortActionBtn.length) {
                $confirmAbortActionBtn.off('click').on('click', function() { // .off() per evitare listener multipli.
                    hideAbortCreationModal();
                    if (quizIdToDelete && $('#questions-section').is(':visible')) { // Se il quiz è stato creato, eliminalo dal DB.
                        $.ajax({
                            url: `api/quiz.php?action=delete&delId=${quizIdToDelete}`, // Endpoint API per eliminare il quiz.
                            method: 'GET', // O 'DELETE' se l'API lo supporta.
                            dataType: 'json',
                            success: (res) => {
                                if (res.status === 'success') {
                                    showAlert('Creazione annullata e quiz eliminato.', 'info', '#alert-container-page');
                                    setTimeout(() => {
                                        // Resetta completamente la pagina allo stato iniziale.
                                        $('#quiz-details-section').slideDown();
                                        $('#questions-section').slideUp();
                                        $('#create-quiz-form')[0].reset();
                                        $('#questions-form')[0].reset();
                                        $('#quiz-id').val('');
                                        $('#questions-container').empty().html('<p id="no-questions-message" class="message-placeholder-styled text-align-center padding-vertical-medium">Nessuna domanda aggiunta. Clicca su "Aggiungi Domanda" per iniziare.</p>');
                                        renumberQuestions();
                                    }, 1500);
                                } else {
                                    showAlert(res.message || 'Errore durante l\'eliminazione del quiz.', 'danger', '#alert-container-page');
                                }
                            }, error: () => showAlert('Errore AJAX durante l\'annullamento.', 'danger', '#alert-container-page')
                        });
                    } else { // Altrimenti, resetta solo il form (nessun quiz da cancellare dal DB).
                        showAlert('Creazione annullata.', 'info', '#alert-container-page');
                        $('#quiz-details-section').slideDown();
                        $('#questions-section').slideUp();
                        $('#create-quiz-form')[0].reset();
                        $('#questions-form')[0].reset();
                        $('#quiz-id').val('');
                        $('#questions-container').empty().html('<p id="no-questions-message" class="message-placeholder-styled text-align-center padding-vertical-medium">Nessuna domanda aggiunta. Clicca su "Aggiungi Domanda" per iniziare.</p>');
                        renumberQuestions();
                    }
                });
            }
        });
    } // Fine if ($('#create-quiz-form').length)


    // Handler per il cambio dei radio button (Corretta/Sbagliata) per gestire la visibilità del campo punti.
    // Si applica sia a quiz_create.php (#questions-section) che a quiz_modify.php (#edit-quiz-form).
    $(document).on('change', '#questions-section .answer-block-styled input[type="radio"][name$="[type]"], #edit-quiz-form .answer-block-styled input[type="radio"][name$="[type]"]', function () {
        const $answerBlock = $(this).closest('.answer-block-styled');
        const $pointsGroup = $answerBlock.find('.points-group'); // Contenitore del campo punti.
        const $pointsInput = $pointsGroup.find('input[type="number"]');

        if ($(this).val() === 'Corretta' && $(this).is(':checked')) {
            $pointsGroup.slideDown(); // Mostra il campo punti.
             // Imposta un valore di default (1) se il campo è vuoto o non valido.
             if (parseInt($pointsInput.val(), 10) <= 0 || $pointsInput.val() === "") {
                $pointsInput.val(1);
            }
        } else {
            // Se "Sbagliata" è selezionato per questo gruppo di radio, nascondi e azzera i punti.
            const nameAttr = $(this).attr('name');
            if ($answerBlock.find('input[type="radio"][name="'+nameAttr+'"][value="Sbagliata"]').is(':checked')) {
                $pointsGroup.slideUp(function() { // Azzera i punti dopo l'animazione di chiusura.
                    $pointsInput.val(0);
                });
            }
        }
    });


    // --- Gestione Partecipazione al Quiz (Pagina: quiz_participate.php) ---
    const $participateForm = $('#participate-form');
    if ($participateForm.length) { // Esegui solo se il form di partecipazione è presente.

        // Submit del form di partecipazione.
        $participateForm.on('submit', function(e) {
            e.preventDefault();
            const $form = $(this);
            const $submitButton = $form.find('button[type="submit"]');
            const originalButtonText = $submitButton.html(); // Salva testo originale del bottone.
            const alertContainerSelector = '#alert-container-participate'; // Container specifico per alert.

            $(alertContainerSelector).empty(); // Pulisce alert precedenti.

            // Disabilita il bottone e mostra un messaggio di caricamento.
            $submitButton.prop('disabled', true).html('<i class="fas fa-spinner fa-spin" style="margin-right: 8px;"></i> Invio in corso...');

            $.ajax({
                type: 'POST',
                url: 'api/partecipation.php', // Endpoint API per la partecipazione.
                data: $form.serialize() + '&action=submit', // Assicura che 'action=submit' sia inviato.
                dataType: 'json',
                success: function(response) {
                    if (response.status === 'success') {
                        if (response.redirect_url) {
                            // L'API PHP imposta un messaggio di sessione, quindi il reindirizzamento è sufficiente.
                            window.location.href = response.redirect_url;
                        } else {
                            // Caso meno comune: successo ma nessun redirect.
                            showAlert(response.message || 'Partecipazione inviata con successo!', 'success', alertContainerSelector);
                            $form.hide(); // Nasconde il form.
                        }
                    } else {
                        // Errore gestito dall'API (es. validazione fallita).
                        showAlert(response.message || 'Si è verificato un errore durante l\'invio.', 'danger', alertContainerSelector);
                        $submitButton.prop('disabled', false).html(originalButtonText); // Riabilita bottone.
                    }
                },
                error: function(xhr, status, error) {
                    // Gestione errori AJAX (connessione, errori server non gestiti dall'API come JSON).
                    let errorMsg = 'Errore di comunicazione con il server. Riprova più tardi.';
                    if (xhr.responseJSON && xhr.responseJSON.message) {
                        errorMsg = xhr.responseJSON.message; // Messaggio specifico dall'API, se presente.
                    } else if (xhr.status === 401) { // Utente non autenticato.
                         errorMsg = 'Sessione scaduta o non autorizzato. Effettua nuovamente il login.';
                         setTimeout(() => window.location.href = 'auth_login.php', 2500);
                    } else if (xhr.status === 403) { // Accesso negato (es. quiz terminato).
                        errorMsg = xhr.responseJSON && xhr.responseJSON.message ? xhr.responseJSON.message : 'Accesso negato o quiz non più disponibile.';
                         setTimeout(() => window.location.href = 'index.php', 2500);
                    } else if (xhr.status === 409) { // Conflitto (es. già partecipato).
                        errorMsg = xhr.responseJSON && xhr.responseJSON.message ? xhr.responseJSON.message : 'Hai già partecipato a questo quiz.';
                        if (xhr.responseJSON && xhr.responseJSON.redirect_url) {
                             setTimeout(() => window.location.href = xhr.responseJSON.redirect_url, 2500); // Reindirizza ai risultati.
                        } else {
                             setTimeout(() => window.location.href = 'quiz_participations.php', 2500); // O alla lista partecipazioni.
                        }
                    } else if (xhr.status === 404) { // Quiz o endpoint non trovato.
                        errorMsg = xhr.responseJSON && xhr.responseJSON.message ? xhr.responseJSON.message : 'Quiz non trovato o endpoint API errato.';
                    } else {
                        // Log dettagliato dell'errore per debug.
                        console.error("Errore AJAX invio partecipazione:", xhr.status, xhr.responseText, status, error);
                    }
                    showAlert(errorMsg, 'danger', alertContainerSelector);
                    $submitButton.prop('disabled', false).html(originalButtonText); // Riabilita bottone.
                }
            });
        });

        // Aggiunge/rimuove la classe 'selected-answer' alla label quando una checkbox cambia stato.
        // Utile per stilizzare l'opzione selezionata.
        $participateForm.on('change', '.answer-option input[type="checkbox"]', function() {
            const $label = $(this).closest('label');
            if ($(this).is(':checked')) {
                $label.addClass('selected-answer');
            } else {
                $label.removeClass('selected-answer');
            }
        });
        // Applica la classe anche al caricamento della pagina per checkbox già selezionate (es. se si torna indietro).
        $participateForm.find('.answer-option input[type="checkbox"]:checked').each(function() {
            $(this).closest('label').addClass('selected-answer');
        });

    } // Fine if ($participateForm.length)


    // --- Gestione Modifica Quiz (Pagina: quiz_modify.php) ---
    if ($('#edit-quiz-form').length) { // Esegui solo se il form di modifica è presente.

        // Funzioni per rinumerare dinamicamente domande e risposte nel form di modifica.
        // Simili a quelle di quiz_create.php, ma adattate per indici basati su 0 (tipico per array in JS/PHP)
        // e per gestire campi hidden come 'original_numero_domanda'.
        function renumberQuestionsForEdit() {
            const $form = $('#edit-quiz-form');
            const $questionBlocks = $form.find('#questions-container .question-block-styled');
            $form.find('#no-questions-message').toggle($questionBlocks.length === 0); // Messaggio "nessuna domanda".

            $questionBlocks.each(function (qIndex) { // qIndex è l'indice 0-based dell'array di domande.
                const $currentQuestionBlock = $(this);
                const displayQNum = qIndex + 1; // Numero visualizzato (1-based).

                // Aggiorna attributi e testo visualizzato.
                $currentQuestionBlock.attr('data-question-index', qIndex); // Salva l'indice 0-based.
                $currentQuestionBlock.find('.question-number-badge').first().text(displayQNum); // Badge numero domanda.

                // Aggiorna testo nei bottoni e title.
                $currentQuestionBlock.find('.add-answer-btn .question-number-btn-text').text(displayQNum);
                $currentQuestionBlock.find('.remove-question-btn').attr('title', `Rimuovi Domanda ${displayQNum}`);

                // Aggiorna 'name' e 'id' del textarea domanda.
                $currentQuestionBlock.find('textarea.textarea-styled').each(function () {
                    const newName = `questions[${qIndex}][text]`; // Formato: questions[0][text], questions[1][text], ...
                    $(this).attr('name', newName);
                    const newId = `question_text_${qIndex}`;
                    $(this).attr('id', newId);
                    $(this).closest('.form-field-group').find('label.form-label-styled').attr('for', newId);
                });

                // Aggiorna 'name' del campo hidden per 'original_numero_domanda'.
                $currentQuestionBlock.find('input[type="hidden"][name$="[original_numero_domanda]"]').each(function() {
                    const newNameHidden = `questions[${qIndex}][original_numero_domanda]`;
                    $(this).attr('name', newNameHidden);
                });

                const $answersContainer = $currentQuestionBlock.find('.answers-container-styled');
                $answersContainer.attr('id', `answers-container-q${qIndex}`);
                $answersContainer.find('.no-answers-message').attr('id', `no-answers-for-q${qIndex}`);

                renumberAnswersForEdit($currentQuestionBlock, qIndex); // Chiama la funzione per rinumerare le risposte.
            });
        }

        function renumberAnswersForEdit($questionBlock, questionIndex) {
            const $answerBlocks = $questionBlock.find('.answers-container-styled .answer-block-styled');
            $questionBlock.find('.no-answers-message').toggle($answerBlocks.length === 0); // Messaggio "nessuna risposta".

            $answerBlocks.each(function (aIndex) { // aIndex è l'indice 0-based dell'array di risposte.
                const $currentAnswerBlock = $(this);
                const displayANum = aIndex + 1; // Numero visualizzato (1-based).

                $currentAnswerBlock.attr('data-answer-index', aIndex);
                $currentAnswerBlock.find('.answer-number-badge').first().text(displayANum); // Badge numero risposta.

                // Costruisce le parti del nome per i campi della risposta.
                const nameQuestionPart = `questions[${questionIndex}]`;
                const nameAnswerPart = `[answers][${aIndex}]`;

                // Input testo risposta.
                $currentAnswerBlock.find('input.form-input-styled.input-small-styled[type="text"]').each(function() {
                    const newName = `${nameQuestionPart}${nameAnswerPart}[text]`;
                    $(this).attr('name', newName);
                    const newId = `answer_text_${questionIndex}_${aIndex}`;
                    $(this).attr('id', newId);
                    $(this).closest('.form-field-group').find('label.form-label-styled').attr('for', newId);
                });

                // Radio buttons tipo risposta.
                $currentAnswerBlock.find('input.radio-input-styled[name$="[type]"]').each(function() {
                    const radioValue = $(this).val();
                    const typeSuffix = radioValue === 'Corretta' ? 'C' : 'S'; // Suffisso per ID univoco.
                    const newId = `q${questionIndex}a${aIndex}tipo${typeSuffix}`;
                    $(this).attr('name', `${nameQuestionPart}${nameAnswerPart}[type]`);
                    $(this).attr('id', newId);
                    $(this).next('label.radio-label-styled').attr('for', newId);
                });

                // Input punteggio.
                $currentAnswerBlock.find('input.input-numerical-styled[name$="[points]"]').each(function() {
                    const newId = `q${questionIndex}a${aIndex}punti`;
                    $(this).attr('name', `${nameQuestionPart}${nameAnswerPart}[points]`);
                    $(this).attr('id', newId);
                    $(this).closest('.points-group').find('label.form-label-styled').attr('for', newId);
                });

                // Campi hidden per 'original_numero_risposta' e 'id_risposta'.
                $currentAnswerBlock.find('input[type="hidden"][name$="[original_numero_risposta]"]').each(function() {
                    $(this).attr('name', `${nameQuestionPart}${nameAnswerPart}[original_numero_risposta]`);
                });
                 $currentAnswerBlock.find('input[type="hidden"][name$="[id_risposta]"]').each(function() {
                    $(this).attr('name', `${nameQuestionPart}${nameAnswerPart}[id_risposta]`);
                });
            });
        }

        // Chiamata iniziale per assicurare che indici e numeri siano corretti al caricamento della pagina di modifica.
        renumberQuestionsForEdit();

        // Click sul bottone "Aggiungi Nuova Domanda" in modalità modifica.
        $('#edit-quiz-form').on('click', '#add-question-btn', function () {
            const questionTemplate = $('#question-template').html(); // Template HTML per una nuova domanda.
            const questionIndex = $('#edit-quiz-form #questions-container .question-block-styled').length; // Nuovo indice 0-based.
            const displayQNum = questionIndex + 1; // Numero da visualizzare.

            // Pulisce i valori e gli ID specifici dal template per renderlo generico.
            let newQuestionHtml = questionTemplate
                .replace(/__Q_INDEX__/g, questionIndex)
                .replace(/__Q_DISPLAY_NUM__/g, displayQNum)
                .replace(/value="[^"]*"/g, 'value=""') // Rimuove 'value' da input.
                .replace(/original_numero_domanda" value="[^"]*"/g, 'original_numero_domanda" value=""') // Rimuove ID originale.
                .replace(/<textarea[^>]*>[\s\S]*?<\/textarea>/g, '<textarea class="textarea-styled" name="questions[' + questionIndex + '][text]" id="question_text_' + questionIndex + '" rows="3"></textarea>'); // Pulisce textarea.

            $('#edit-quiz-form #questions-container').append(newQuestionHtml); // Aggiunge la nuova domanda.

            // Aggiunge automaticamente la prima risposta alla domanda appena creata.
            const $newlyAddedQuestionBlock = $('#edit-quiz-form #questions-container .question-block-styled').last();
            if ($newlyAddedQuestionBlock.length) {
                const answerTemplate = $('#answer-template').html(); // Template HTML per una nuova risposta.
                const answerIndex = 0; // Indice 0 per la prima risposta.
                const displayANum = 1; // Numero da visualizzare.
                // Pulisce il template della risposta.
                let newAnswerHtml = answerTemplate
                    .replace(/__Q_INDEX__/g, questionIndex)
                    .replace(/__A_INDEX__/g, answerIndex)
                    .replace(/__A_DISPLAY_NUM__/g, displayANum)
                    .replace(/value="[^"]*"/g, 'value=""')
                    .replace(/id_risposta" value="[^"]*"/g, 'id_risposta" value=""')
                    .replace(/original_numero_risposta" value="[^"]*"/g, 'original_numero_risposta" value=""');

                $newlyAddedQuestionBlock.find('.answers-container-styled').append(newAnswerHtml);
                $newlyAddedQuestionBlock.find('.no-answers-message').hide();

                // Imposta "Sbagliata" come default per la nuova risposta e nasconde i punti.
                const $newAnswer = $newlyAddedQuestionBlock.find('.answer-block-styled').first();
                $newAnswer.find('input[type="radio"][value="Sbagliata"]').prop('checked', true);
                $newAnswer.find('input[type="number"][name$="[points]"]').val(0);
                $newAnswer.find('.points-group').hide();
            }
            renumberQuestionsForEdit(); // Rinumera tutto.
            $newlyAddedQuestionBlock.find('textarea').first().focus(); // Focus sul testo della nuova domanda.
        });

        // Click sul bottone "Aggiungi Risposta" a una domanda esistente in modalità modifica.
        $('#edit-quiz-form').on('click', '.add-answer-btn', function () {
            const $questionBlock = $(this).closest('.question-block-styled');
            const questionIndex = $questionBlock.data('question-index'); // Recupera l'indice 0-based della domanda.

            const $answersContainer = $questionBlock.find('.answers-container-styled');
            const answerIndex = $answersContainer.find('.answer-block-styled').length; // Nuovo indice 0-based per la risposta.
            const displayANum = answerIndex + 1;

            const answerTemplate = $('#answer-template').html();
            // Pulisce il template della risposta.
            let newAnswerHtml = answerTemplate
                .replace(/__Q_INDEX__/g, questionIndex)
                .replace(/__A_INDEX__/g, answerIndex)
                .replace(/__A_DISPLAY_NUM__/g, displayANum)
                .replace(/value="[^"]*"/g, 'value=""')
                .replace(/id_risposta" value="[^"]*"/g, 'id_risposta" value=""')
                .replace(/original_numero_risposta" value="[^"]*"/g, 'original_numero_risposta" value=""');

            $answersContainer.append(newAnswerHtml);
            $questionBlock.find('.no-answers-message').hide();

            // Imposta "Sbagliata" come default per la nuova risposta.
            const $newAnswer = $answersContainer.find('.answer-block-styled').last();
            $newAnswer.find('input[type="radio"][value="Sbagliata"]').prop('checked', true);
            $newAnswer.find('input[type="number"][name$="[points]"]').val(0);
            $newAnswer.find('.points-group').hide();

            renumberAnswersForEdit($questionBlock, questionIndex); // Rinumera solo le risposte di questa domanda.
            $newAnswer.find('input[type="text"]').first().focus(); // Focus sul testo della nuova risposta.
        });

        // Click sul bottone "Rimuovi Domanda" in modalità modifica.
        $('#edit-quiz-form').on('click', '.remove-question-btn', function () {
            $(this).closest('.question-block-styled').remove();
            renumberQuestionsForEdit(); // Rinumera tutte le domande rimanenti.
        });

        // Click sul bottone "Rimuovi Risposta" in modalità modifica.
        $('#edit-quiz-form').on('click', '.remove-answer-btn', function () {
            const $answerBlock = $(this).closest('.answer-block-styled');
            const $questionBlock = $answerBlock.closest('.question-block-styled');
            const questionIndex = $questionBlock.data('question-index');

            // Impedisce la rimozione se è l'unica risposta.
            if ($questionBlock.find('.answers-container-styled .answer-block-styled').length > 1) {
                $answerBlock.remove();
                renumberAnswersForEdit($questionBlock, questionIndex); // Rinumera le risposte della domanda modificata.
            } else {
                showEditAlerts('Ogni domanda deve avere almeno una risposta!', 'warning');
            }
        });

        // Submit del form di modifica quiz.
        $('#edit-quiz-form').submit(function (e) {
            e.preventDefault();
            const $form = $(this);
            const startDateVal = $form.find('#dataInizio').val();
            const endDateVal = $form.find('#dataFine').val();

            // Validazione date.
            if (startDateVal && endDateVal) {
                const startDate = new Date(startDateVal);
                const endDate = new Date(endDateVal);
                // Per la modifica, si può permettere che la data di inizio sia nel passato
                // solo se la data di inizio originale del quiz non era già futura.
                const originalStartDate = new Date($form.find('#original_data_inizio').val() || startDateVal);
                const allowPast = originalStartDate <= new Date();

                const dateError = checkDateRange(startDate, endDate, allowPast);
                if (dateError) {
                     showEditAlerts(dateError, 'danger');
                     return;
                }
            } else if (!startDateVal || !endDateVal) { // Assicura che entrambe le date siano presenti.
                 showEditAlerts('Le date di inizio e fine sono obbligatorie.', 'warning');
                 return;
            }

            // Validazione: almeno una domanda.
            if ($form.find('#questions-container .question-block-styled').length === 0) {
                showEditAlerts('Il quiz deve avere almeno una domanda.', 'warning');
                return;
            }

            // Validazione approfondita di ogni domanda e risposta.
            let allQuestionsValid = true;
            $form.find('#questions-container .question-block-styled').each(function(qIdx) {
                const $qBlock = $(this);
                const qNumText = $qBlock.find('.question-number-badge').first().text(); // Numero visualizzato.

                if ($qBlock.find('textarea.textarea-styled').val().trim() === '') {
                    showEditAlerts(`Il testo della Domanda ${qNumText} non può essere vuoto.`, 'warning');
                    allQuestionsValid = false; return false;
                }
                if ($qBlock.find('.answers-container-styled .answer-block-styled').length === 0) {
                    showEditAlerts(`La Domanda ${qNumText} non ha risposte. Ogni domanda deve avere almeno una risposta.`, 'warning');
                    allQuestionsValid = false; return false;
                }
                let hasCorrectAnswer = false;
                let allAnswersHaveText = true;
                $qBlock.find('.answers-container-styled .answer-block-styled').each(function(aIdx) {
                    if ($(this).find('input[type="text"].form-input-styled').val().trim() === '') {
                         showEditAlerts(`Il testo della Risposta ${aIdx+1} per la Domanda ${qNumText} non può essere vuoto.`, 'warning');
                         allAnswersHaveText = false; return false;
                    }
                    if ($(this).find('input[type="radio"][name$="[type]"][value="Corretta"]').is(':checked')) {
                        hasCorrectAnswer = true;
                    }
                });
                if (!allAnswersHaveText) { allQuestionsValid = false; return false; }
                if (!hasCorrectAnswer) {
                    showEditAlerts(`La Domanda ${qNumText} non ha una risposta designata come "Corretta".`, 'warning');
                    allQuestionsValid = false; return false;
                }
            });
            if (!allQuestionsValid) return; // Interrompe se una validazione fallisce.

            // Prepara il bottone di submit e invia i dati.
            const $submitButton = $form.find('button[type="submit"]');
            const originalButtonText = $submitButton.html();
            $submitButton.prop('disabled', true).html('<i class="fas fa-spinner fa-spin"></i> Salvataggio...');

            $.ajax({
                url: $form.attr('action'), // action dell'API per l'update (es. api/quiz.php?action=update).
                type: $form.attr('method'), // method (POST).
                data: $form.serialize(),      // Dati del form completi.
                dataType: 'json',
                success: function (response) {
                    if (response.status === 'success') {
                        showEditAlerts(response.message || 'Quiz aggiornato con successo!', 'success');
                        setTimeout(() => {
                             window.location.href = response.redirect_url || 'quiz_my.php'; // Reindirizza.
                        }, 1500);
                    } else {
                        showEditAlerts(response.message || 'Errore durante il salvataggio delle modifiche.', 'danger');
                    }
                },
                error: function (xhr) {
                    showEditAlerts('Errore di comunicazione: ' + (xhr.responseJSON?.message || xhr.statusText || 'Dettagli non disponibili'), 'danger');
                },
                complete: function() {
                    $submitButton.prop('disabled', false).html(originalButtonText); // Riabilita bottone.
                }
            });
        });
    } // Fine if ($('#edit-quiz-form').length)


    // --- Gestione Modale Conferma Eliminazione Quiz (Globale) ---
    // Usato in quiz_my_list.php, quiz_view.php, ecc.
    const $confirmDeleteModal = $('#confirmDeleteModal');
    if ($confirmDeleteModal.length) {
        const $confirmDeleteButton = $('#confirmDeleteActionBtn'); // Bottone "Conferma Elimina" nel modale.
        let quizIdToDeleteModal = null;     // ID del quiz da eliminare.
        let quizTitleToDeleteModal = '';    // Titolo del quiz (per messaggio).
        let successRedirectUrl = '';        // URL a cui reindirizzare dopo eliminazione.

        const $cancelOrCloseButtons = $confirmDeleteModal.find('.custom-modal-close-button, #cancelDeleteBtn');

        // Funzione per mostrare il modale di conferma eliminazione.
        function showMainDeleteModal(quizId, quizTitle = 'questo quiz', redirectUrlAfterDelete = null) {
            quizIdToDeleteModal = quizId;
            quizTitleToDeleteModal = quizTitle;
            successRedirectUrl = redirectUrlAfterDelete || window.location.href; // Default: ricarica pagina.

            const $quizTitleSpan = $('#quizTitleToDelete'); // Span per visualizzare il titolo nel modale.
            if ($quizTitleSpan.length) {
                $quizTitleSpan.text(quizTitleToDeleteModal);
            }
            $('#modalDeleteErrorMessage').hide().text(''); // Nasconde/resetta messaggi di errore precedenti.
            $confirmDeleteModal.fadeIn(200);
        }

        // Funzione per nascondere il modale.
        function hideMainDeleteModal() {
            $confirmDeleteModal.fadeOut(200);
            quizIdToDeleteModal = null;
            quizTitleToDeleteModal = '';
            successRedirectUrl = '';
        }

        // Event listener delegato per i bottoni ".delete-quiz-btn" (possono essere aggiunti dinamicamente).
        $(document).on('click', '.delete-quiz-btn', function (event) {
            event.preventDefault();
            const $button = $(this);
            const quizId = $button.data('delid') || $button.attr('delid'); // Prende l'ID del quiz.
            const quizTitle = $button.data('quiz-title') || 'questo quiz';
            const redirectUrl = $button.data('redirect-on-delete'); // URL opzionale per redirect.

            if (quizId && quizId !== '#') { // Assicura che l'ID sia valido.
                showMainDeleteModal(quizId, quizTitle, redirectUrl);
            }
        });

        // Azione del bottone "Conferma Elimina" nel modale.
        $confirmDeleteButton.on('click', function () {
            if (quizIdToDeleteModal) {
                const $thisButton = $(this);
                const originalButtonText = $thisButton.html();
                $thisButton.prop('disabled', true).html('<i class="fas fa-spinner fa-spin"></i> Eliminazione...');
                $('#modalDeleteErrorMessage').hide(); // Nasconde errori precedenti.

                // Chiamata AJAX per eliminare il quiz.
                $.ajax({
                    url: `api/quiz.php?action=delete&delId=${quizIdToDeleteModal}`, // Endpoint API per l'eliminazione.
                    method: 'GET', // O 'DELETE' se l'API lo supporta.
                    dataType: 'json',
                    success: function (response) {
                        if (response.status === 'success') {
                            hideMainDeleteModal();
                            // Mostra messaggio di successo sulla pagina principale.
                            showAlert(response.message || 'Quiz eliminato con successo!', 'success', '#alert-container-page');
                            setTimeout(() => {
                                // Reindirizza o ricarica la pagina.
                                if (successRedirectUrl && successRedirectUrl !== window.location.href) {
                                    window.location.href = successRedirectUrl;
                                } else {
                                    location.reload();
                                }
                            }, 1500);
                        } else {
                            // Mostra errore nel modale.
                            $('#modalDeleteErrorMessage').text(response.message || 'Errore durante l\'eliminazione.').show();
                        }
                    },
                    error: function (xhr) {
                        const errorMsg = xhr.responseJSON?.message || xhr.statusText || 'Errore AJAX durante l\'eliminazione.';
                        $('#modalDeleteErrorMessage').text(errorMsg).show(); // Mostra errore nel modale.
                    },
                    complete: function() {
                        $thisButton.prop('disabled', false).html(originalButtonText); // Riabilita bottone.
                        // Non nascondere il modale in caso di errore, l'utente potrebbe voler vedere il messaggio.
                    }
                });
            }
        });

        // Event listener per chiudere il modale.
        $cancelOrCloseButtons.on('click', hideMainDeleteModal);
        $(window).on('click', (event) => { // Click fuori dal contenuto del modale.
            if ($confirmDeleteModal.is(':visible') && $(event.target).is($confirmDeleteModal)) {
                hideMainDeleteModal();
            }
        });
        $(document).on('keydown', (event) => { // Tasto Escape.
            if (event.key === 'Escape' && $confirmDeleteModal.is(':visible')) {
                hideMainDeleteModal();
            }
        });
    } // Fine if ($confirmDeleteModal.length)


    // --- Funzionalità Specifiche per la Pagina Index (index.php) ---
    // Esegui solo se il body ha la classe 'page-index' (buona pratica per JS specifico per pagina).
    if (document.body.classList.contains('page-index')) {
        const $resetFormButton = $('#reset-filters-btn'); // Bottone "Resetta Filtri".
        if ($resetFormButton.length) {
            $resetFormButton.on('click', function(event) {
                event.preventDefault();
                const $filterForm = $(this).closest('form'); // Trova il form dei filtri.
                if ($filterForm.length) {
                    $filterForm[0].reset(); // Resetta i campi del form.
                    // Rimuove i parametri dalla query string e ricarica per una pulizia completa.
                    window.location.href = window.location.pathname;
                } else {
                    window.location.href = window.location.pathname; // Fallback se il form non viene trovato.
                }
            });
        }

        // Gestione del cambio valore nei select per "Elementi per pagina" e "Ordina per".
        // Invia automaticamente il form quando un'opzione viene selezionata.
        $('#per_page_select, #sort_by_inline').on('change', function() {
            $(this).closest('form').submit();
        });
    } // Fine if (document.body.classList.contains('page-index'))

}); // Fine $(document).ready()