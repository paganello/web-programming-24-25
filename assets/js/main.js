// ==========================================================================
// Funzioni Helper Globali
// ==========================================================================

/**
 * Controlla se l'intervallo di date fornito è valido.
 * Verifica che la data di inizio non sia nel passato (a meno che non sia permesso)
 * e che la data di fine non sia precedente alla data di inizio.
 *
 * @param {Date} startDate - La data di inizio.
 * @param {Date} endDate - La data di fine.
 * @param {boolean} [allowPastStartDate=false] - Se true, permette che la data di inizio sia nel passato.
 *                                              Utile ad esempio durante la modifica di un quiz già iniziato.
 * @returns {string|null} Un messaggio di errore stringa se l'intervallo non è valido, altrimenti null.
 */
function checkDateRange(startDate, endDate, allowPastStartDate = false) {
    const today = new Date();
    today.setHours(0, 0, 0, 0); // Normalizza l'ora a mezzanotte per un confronto corretto basato solo sulla data.

    // Controlla se la data di inizio è nel passato e se ciò non è permesso.
    if (!allowPastStartDate && startDate < today) {
        return 'La data di inizio non può essere precedente a oggi.';
    }
    // Controlla se la data di fine è precedente alla data di inizio.
    if (endDate < startDate) {
        return 'La data di fine non può essere precedente alla data di inizio.';
    }
    return null; // Nessun errore, l'intervallo di date è considerato valido.
}

/**
 * Mostra un messaggio di alert dinamico all'utente.
 * L'alert viene inserito in un contenitore specificato e scompare automaticamente
 * dopo un timeout, tranne per i tipi di alert considerati più critici ('danger', 'error', 'warning').
 *
 * @param {string} message - Il messaggio da visualizzare nell'alert.
 * @param {string} [type='info'] - Il tipo di alert (es. 'success', 'danger', 'warning', 'info').
 *                                 Questo influenza lo stile CSS dell'alert.
 * @param {string} [containerSelector='#alert-container-page'] - Il selettore CSS del contenitore
 *                                                              dove l'alert deve essere inserito.
 */
function showAlert(message, type = 'info', containerSelector = '#alert-container-page') {
    const alertId = 'custom-alert-' + Date.now(); // Genera un ID univoco per l'alert, utile per la gestione.

    // Costruisce l'HTML dell'alert. Utilizza classi simili a Bootstrap per compatibilità
    // con gli stili CSS esistenti (es. .alert, .alert-success).
    const alertHtml = `
        <div id="${alertId}" class="alert alert-${type}" role="alert">
            <span class="alert-message">${message}</span>
            <button type="button" class="alert-close-btn" aria-label="Close">×</button>
        </div>`;

    let $alertContainer = $(containerSelector); // Seleziona il contenitore dell'alert usando jQuery.

    // Se il contenitore specificato non esiste nel DOM, ne crea uno di fallback.
    // Questo contenitore di fallback è posizionato in modo fisso in alto al centro della pagina.
    if (!$alertContainer.length) {
        // Nota: lo stile inline qui è per il fallback; idealmente, dovrebbe essere definito nel file CSS.
        $('body').prepend('<div id="alert-container-fallback" class="custom-alert-fallback-container" style="position: fixed; top: 20px; left: 50%; transform: translateX(-50%); z-index: 9999; width: auto; max-width: 90%;"></div>');
        $alertContainer = $('#alert-container-fallback'); // Seleziona il contenitore di fallback appena creato.
    }

    // Rimuove eventuali alert precedenti presenti nello stesso contenitore
    // per evitare la sovrapposizione di più messaggi.
    // Si assume che tutti gli alert abbiano la classe generica '.alert'.
    $alertContainer.find('.alert').remove();

    // Aggiunge il nuovo alert al contenitore designato.
    $alertContainer.append(alertHtml);
    const $currentAlert = $('#' + alertId); // Seleziona l'alert appena aggiunto tramite il suo ID univoco.

    // Aggiunge la funzionalità di chiusura al click sul bottone 'x' (con classe '.alert-close-btn').
    $currentAlert.find('.alert-close-btn').on('click', function() {
        $currentAlert.fadeOut(300, function() { // Effetto di dissolvenza.
            $(this).remove(); // Rimuove l'elemento alert dal DOM dopo il fadeOut.
        });
    });

    // Imposta un timeout per la scomparsa automatica dell'alert,
    // tranne per gli alert di tipo 'danger', 'error', o 'warning' che rimangono visibili
    // finché l'utente non li chiude manualmente.
    if (type !== 'danger' && type !== 'error' && type !== 'warning') {
        setTimeout(function () {
            $currentAlert.fadeOut(500, function() { $(this).remove(); });
        }, 5000); // L'alert scompare dopo 5 secondi.
    }
}

/**
 * Funzione wrapper per `showAlert`, specificamente pensata per la pagina di modifica quiz (quiz_edit.php).
 * Utilizza un selettore di contenitore alert dedicato per quella pagina ('#alert-container-page-modify').
 *
 * @param {string} message - Il messaggio da visualizzare.
 * @param {string} type - Il tipo di alert (es. 'success', 'danger').
 */
function showEditAlerts(message, type) {
    showAlert(message, type, '#alert-container-page-modify');
}


/**
 * Rinumera dinamicamente le domande e le relative risposte nel form di creazione quiz (quiz_create.php).
 * Questa funzione è cruciale quando si aggiungono o rimuovono domande/risposte dinamicamente,
 * in quanto aggiorna gli attributi HTML 'name', 'id', 'for' e il testo visualizzato per i numeri progressivi.
 * Questo assicura che i dati vengano inviati correttamente al server con indici coerenti.
 */
function renumberQuestions() { // Specifica per la pagina quiz_create.php
    const $questionBlocks = $('#questions-container .question-block-styled'); // Seleziona tutti i blocchi domanda.

    // Mostra o nasconde il messaggio "nessuna domanda aggiunta" in base alla presenza di blocchi domanda.
    $('#no-questions-message').toggle($questionBlocks.length === 0);

    // Itera su ciascun blocco domanda.
    $questionBlocks.each(function (index) { // 'index' è l'indice 0-based dell'iterazione.
        const qNum = index + 1; // Per quiz_create.php, i numeri/indici nei 'name' inviati al server partono da 1.
        const $currentQuestionBlock = $(this);

        // Aggiorna l'attributo 'data-question' (utile per JS) e il testo del numero domanda visualizzato (badge).
        $currentQuestionBlock.attr('data-question', qNum);
        $currentQuestionBlock.find('.question-number').text(qNum); // Es. "Domanda 1", "Domanda 2".

        // Aggiorna l'attributo 'for' delle label e gli attributi 'id'/'name' del textarea della domanda.
        $currentQuestionBlock.find('label.form-label-styled[for^="question-"]').first().attr('for', `question-${qNum}`);
        $currentQuestionBlock.find('textarea.textarea-styled[id^="question-"]').attr({
            'id': `question-${qNum}`,
            'name': `questions[${qNum}][text]` // Formato atteso dal backend: questions[1][text], questions[2][text], ...
        });

        // Aggiorna gli ID del contenitore delle risposte e del messaggio "nessuna risposta" per questa domanda.
        const $answersContainer = $currentQuestionBlock.find('.answers-container-styled');
        $answersContainer.attr('id', `answers-container-${qNum}`);
        $answersContainer.find('.message-inline-styled[id^="no-answers-for-q-"]').attr('id', `no-answers-for-q-${qNum}`);

        // Aggiorna i data attribute e il 'title' dei bottoni "Aggiungi Risposta" e "Rimuovi Domanda".
        $currentQuestionBlock.find('button.add-answer').data('question', qNum);
        $currentQuestionBlock.find('button.remove-question').data('question', qNum).attr('title', `Rimuovi Domanda ${qNum}`);

        // Itera su ogni blocco risposta all'interno della domanda corrente.
        $answersContainer.find('.answer-block-styled').each(function (aIndex) { // 'aIndex' è l'indice 0-based delle risposte.
            const aNum = aIndex + 1; // I numeri/indici delle risposte partono da 1.
            const $currentAnswerBlock = $(this);
            $currentAnswerBlock.attr('data-answer', aNum);
            $currentAnswerBlock.find('.answer-number').text(aNum); // Badge visuale del numero risposta.

            // Input testo della risposta.
            $currentAnswerBlock.find('label.label-small-styled[for^="question-"][for*="-answer-"]').attr('for', `question-${qNum}-answer-${aNum}`);
            $currentAnswerBlock.find('input[type="text"].input-small-styled[id^="question-"]').attr({
                'id': `question-${qNum}-answer-${aNum}`,
                'name': `questions[${qNum}][answers][${aNum}][text]` // Formato: questions[1][answers][1][text]
            });

            // Radio buttons per il tipo di risposta (Corretta/Sbagliata).
            // Assicura che 'name' e 'id' siano univoci e corretti.
            $currentAnswerBlock.find('input.radio-input-styled[name$="[type]"]').each(function() {
                const radioIdBase = `question-${qNum}-answer-${aNum}-type-`;
                const radioValue = $(this).val(); // Il valore è "Corretta" o "Sbagliata".
                const typeSuffix = radioValue === 'Corretta' ? 'correct' : 'wrong'; // Suffisso per ID univoco.
                $(this).attr({
                    'name': `questions[${qNum}][answers][${aNum}][type]`,
                    'id': radioIdBase + typeSuffix
                });
                $(this).next('label.radio-label-styled').attr('for', radioIdBase + typeSuffix); // Aggiorna 'for' della label.
            });

            // Input punteggio per la risposta.
            const $pointsGroup = $currentAnswerBlock.find('.points-group'); // Contenitore del campo punti.
            $pointsGroup.find('label.label-small-styled[for$="-points"]').attr('for', `question-${qNum}-answer-${aNum}-points`);
            $pointsGroup.find('input[type="number"].input-numerical-styled[name$="[points]"]').attr({
                'id': `question-${qNum}-answer-${aNum}-points`,
                'name': `questions[${qNum}][answers][${aNum}][points]`
            });
        });

        // Aggiorna la visibilità del messaggio "nessuna risposta aggiunta" per la domanda corrente.
        // Utilizza JavaScript nativo per selezionare l'elemento tramite ID, per varietà e potenziale performance.
        const noAnswersMsg = document.getElementById(`no-answers-for-q-${qNum}`);
        if (noAnswersMsg) {
            noAnswersMsg.style.display = $answersContainer.find('.answer-block-styled').length === 0 ? 'block' : 'none';
        }
    });
}

/**
 * Aggiunge un nuovo blocco risposta HTML a una domanda specifica nel form di creazione quiz.
 * Utilizza un template HTML definito nella pagina e sostituisce i placeholder con i numeri corretti.
 *
 * @param {HTMLElement} questionBlockElement - L'elemento DOM del blocco domanda a cui aggiungere la risposta.
 * @param {number} questionNum - Il numero (1-based) della domanda.
 * @param {number} answerCount - Il numero progressivo (1-based) per la nuova risposta all'interno di quella domanda.
 */
function addAnswerToQuestion(questionBlockElement, questionNum, answerCount) { // Specifica per quiz_create.php
    // Recupera il template HTML per una nuova risposta.
    const answerTemplate = document.getElementById('answer-template-create').innerHTML;

    // Sostituisce i placeholder nel template con i numeri effettivi della domanda e della risposta.
    // I placeholder __Q_NUM__ e __A_NUM__ devono essere presenti nel template HTML.
    let answerHtml = answerTemplate.replace(/__Q_NUM__/g, questionNum)
                                .replace(/__A_NUM__/g, answerCount);

    // Aggiunge il blocco risposta HTML generato al contenitore delle risposte della domanda specifica.
    $(questionBlockElement).find('.answers-container-styled').append(answerHtml);

    // Nasconde il messaggio "nessuna risposta aggiunta" per questa domanda, dato che ne è stata appena aggiunta una.
    $(questionBlockElement).find(`#no-answers-for-q-${questionNum}`).hide();
}

/**
 * Gestisce l'apertura e la chiusura di una card-domanda (comportamento accordion).
 * Utilizzata in pagine come quiz_view.php (anteprima domande) e altre pagine
 * che utilizzano la struttura .question-card per visualizzare domande espandibili.
 *
 * @param {HTMLElement} headerElement - L'elemento header della domanda che è stato cliccato per attivare il toggle.
 */
function toggleQuestion(headerElement) {
    // Trova l'elemento .question-card più vicino all'header cliccato.
    const questionCard = headerElement.closest('.question-card');
    if (!questionCard) return; // Se non trovato, esce dalla funzione.

    // Trova il wrapper del contenuto della domanda all'interno della card.
    const contentWrapper = questionCard.querySelector('.question-content-wrapper');
    if (!contentWrapper) return; // Se non trovato, esce.

    const wasOpen = questionCard.classList.contains('open'); // Controlla se la card era già aperta.

    if (wasOpen) { // Se la card era aperta e si sta per chiudere:
        // Per una transizione fluida da 'max-height: none' (quando aperto) a 'max-height: 0',
        // è necessario prima impostare l'altezza esplicita corrente del contenuto.
        if (contentWrapper.style.maxHeight === 'none' || contentWrapper.style.maxHeight === '') {
             contentWrapper.style.maxHeight = contentWrapper.scrollHeight + "px"; // Imposta max-height all'altezza attuale del contenuto.
        }
        // Forza un reflow del browser per applicare l'altezza esplicita prima di iniziare la transizione.
        // Leggere offsetHeight è un modo comune per triggerare un reflow.
        contentWrapper.offsetHeight;

        // Usa requestAnimationFrame per assicurare che la transizione a max-height = 0 avvenga nel frame successivo.
        // Questo migliora la fluidità dell'animazione di chiusura.
        requestAnimationFrame(() => {
            contentWrapper.style.maxHeight = "0px";      // Inizia la transizione per chiudere.
            questionCard.classList.remove('open');       // Rimuove la classe 'open'.
            headerElement.setAttribute('aria-expanded', 'false'); // Aggiorna attributo ARIA per accessibilità.
        });
    } else { // Se la card era chiusa e si sta per aprire:
        questionCard.classList.add('open');            // Aggiunge la classe 'open'.
        headerElement.setAttribute('aria-expanded', 'true'); // Aggiorna attributo ARIA.
        contentWrapper.style.maxHeight = contentWrapper.scrollHeight + "px"; // Imposta max-height per aprire.

        // Funzione di callback da eseguire al termine della transizione di apertura.
        const handleTransitionEnd = () => {
            // Dopo che la transizione è completata, se la card è ancora aperta,
            // rimuove l'altezza esplicita (impostando max-height a 'none').
            // Questo permette al contenuto di adattarsi dinamicamente se le sue dimensioni cambiano
            // (es. se immagini vengono caricate all'interno, o testo viene aggiunto/rimosso).
            if (questionCard.classList.contains('open')) {
                contentWrapper.style.maxHeight = 'none';
            }
            // Rimuove l'event listener per evitare esecuzioni multiple.
            contentWrapper.removeEventListener('transitionend', handleTransitionEnd);
        };
        // Aggiunge l'event listener per 'transitionend'.
        contentWrapper.addEventListener('transitionend', handleTransitionEnd);
    }
}

// ==========================================================================
// Esecuzione al Caricamento del DOM (Vanilla JavaScript)
// ==========================================================================
// Questo blocco di codice viene eseguito quando il DOM HTML iniziale è stato completamente caricato e parsato,
// senza attendere il caricamento completo di stylesheet, immagini e subframe.
document.addEventListener('DOMContentLoaded', () => {

    // Inizializzazione della funzionalità accordion per le domande (es. in quiz_view.php).
    // Si applica a tutti gli elementi con classe '.question-header'.
    document.querySelectorAll('.question-header').forEach(header => {
        // Aggiunge un event listener per il click sull'header della domanda.
        header.addEventListener('click', function() { toggleQuestion(this); });

        // Miglioramento dell'accessibilità: permette di aprire/chiudere l'accordion
        // anche utilizzando i tasti Invio o Spazio quando l'header ha il focus.
        header.addEventListener('keydown', function(event) {
            if (event.key === 'Enter' || event.key === ' ') { // Se viene premuto Invio o Spazio.
                event.preventDefault(); // Previene l'azione di default del browser (es. scroll della pagina con Spazio).
                toggleQuestion(this);   // Chiama la funzione per aprire/chiudere.
            }
        });
    });

    // Inizializzazione delle card domanda che sono già contrassegnate come 'open' al caricamento della pagina
    // (es. se la classe 'open' è stata impostata dal server PHP).
    document.querySelectorAll('.question-card.open').forEach(card => {
        const contentWrapper = card.querySelector('.question-content-wrapper');
        const header = card.querySelector('.question-header');

        // Imposta l'attributo ARIA 'aria-expanded' a 'true' per le domande già aperte.
        if (header) header.setAttribute('aria-expanded', 'true');

        if (contentWrapper) {
            // Imposta maxHeight a scrollHeight per assicurare che il contenuto sia visibile all'apertura iniziale.
            contentWrapper.style.maxHeight = contentWrapper.scrollHeight + "px";
            // Dopo un breve timeout (leggermente superiore alla durata della transizione CSS),
            // imposta maxHeight a 'none' per permettere al contenuto di adattarsi dinamicamente
            // a eventuali cambiamenti futuri nelle sue dimensioni (es. caricamento di immagini).
            setTimeout(() => {
               if (card.classList.contains('open')) { // Controlla se la card è ancora aperta.
                   contentWrapper.style.maxHeight = 'none';
               }
            }, 360); // Durata del timeout (es. se la transizione CSS è 0.35s = 350ms).
        }
    });
});

// ==========================================================================
// Codice jQuery (Esecuzione dopo il caricamento completo del DOM e delle risorse)
// ==========================================================================
// Questo blocco di codice, racchiuso in $(document).ready(), viene eseguito
// solo dopo che l'intero DOM HTML è stato caricato e tutte le risorse (come immagini)
// sono state caricate. È il posto standard per il codice jQuery che manipola il DOM.
$(document).ready(function () {

    // --- Gestione Autenticazione (Form di Login e Registrazione) ---

    // Gestione del submit del form di login.
    $('#login-form').on('submit', function (e) {
        e.preventDefault(); // Previene l'invio standard del form (ricaricamento pagina).
        const $form = $(this); // Riferimento al form jQuery.
        $.ajax({
            type: 'POST',                             // Metodo HTTP.
            url: 'api/users.php?action=login',        // Endpoint API per il login.
            data: $form.serialize(),                  // Dati del form serializzati (es. username=...&password=...).
            dataType: 'json',                         // Tipo di risposta attesa dal server (JSON).
            success: function (response) {            // Callback in caso di successo della chiamata AJAX.
                if (response.status === 'success') {  // Se l'API restituisce successo.
                    // Salva un messaggio di successo in sessionStorage per mostrarlo nella pagina successiva
                    // (utile se c's_un reindirizzamento).
                    sessionStorage.setItem('loginMessage', response.message || 'Login effettuato con successo!');
                    sessionStorage.setItem('loginMessageType', 'success');
                    // Reindirizza l'utente alla pagina specificata dall'API o a index.php di default.
                    window.location.href = response.redirect_url || 'index.php';
                } else {
                    // Se l'API restituisce un errore gestito (es. credenziali errate).
                    showAlert(response.message || 'Credenziali non valide.', 'danger', '#alert-container-login');
                }
            },
            error: function () { // Callback in caso di errore della chiamata AJAX (es. server non raggiungibile).
                showAlert('Errore durante la comunicazione con il server.', 'danger', '#alert-container-login');
            }
        });
    });

    // Gestione del submit del form di registrazione.
    $('#register-form').on('submit', function (e) {
        e.preventDefault(); // Previene l'invio standard.
        const $form = $(this);
        $.ajax({
            type: 'POST',
            url: 'api/users.php?action=register', // Endpoint API per la registrazione.
            data: $form.serialize(),
            dataType: 'json',
            success: function (response) {
                if (response.status === 'success') {
                    // Mostra messaggio di successo e reindirizza alla pagina di login dopo un breve ritardo.
                    showAlert(response.message || 'Registrazione completata con successo! Effettua il login.', 'success', '#alert-container-register');
                    setTimeout(() => window.location.href = 'auth_login.php', 2000); // Reindirizza dopo 2 secondi.
                } else {
                    // Errore gestito dall'API (es. username già esistente).
                    showAlert(response.message || 'Errore durante la registrazione.', 'danger', '#alert-container-register');
                }
            },
            error: function () { // Errore AJAX.
                showAlert('Errore durante la comunicazione con il server.', 'danger', '#alert-container-register');
            }
        });
    });


    // --- Gestione Creazione Quiz (Pagina: quiz_create.php) ---
    // Esegue questo blocco di codice solo se l'elemento con ID 'create-quiz-form' è presente nella pagina.
    if ($('#create-quiz-form').length) {

        // Gestione del submit del form per i dettagli del quiz (titolo, date).
        $('#create-quiz-form').on('submit', function (e) {
            e.preventDefault(); // Previene invio standard.

            const titolo = $('#titolo').val().trim(); // Recupera e pulisce il titolo.
            const startDateVal = $('#dataInizio').val(); // Data di inizio.
            const endDateVal = $('#dataFine').val();   // Data di fine.

            // Validazione campi obbligatori lato client.
            if (titolo === '') {
                 showAlert('Il Titolo del Quiz è obbligatorio.', 'warning', '#alert-container-page');
                 $('#titolo').focus(); // Focus sul campo titolo.
                 return; // Interrompe l'esecuzione.
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

            // Converte le stringhe delle date in oggetti Date per la validazione.
            const startDate = new Date(startDateVal);
            const endDate = new Date(endDateVal);

            // Validazione dell'intervallo di date usando la funzione helper.
            // Il terzo parametro `false` indica che la data di inizio non può essere nel passato.
            const errorMessage = checkDateRange(startDate, endDate, false);
            if (errorMessage) {
                showAlert(errorMessage, 'danger', '#alert-container-page');
                return; // Interrompe se le date non sono valide.
            }

            // Chiamata AJAX per creare il quiz (solo i metadati: titolo, date).
            $.ajax({
                type: 'POST',
                url: 'api/quiz.php?action=create', // Endpoint API per la creazione del quiz.
                data: $(this).serialize(),       // Dati del form dei dettagli.
                dataType: 'json',
                success: function (response) {
                    if (response.status === 'success' && response.idQuiz) { // Se la creazione ha successo e l'API restituisce l'ID del quiz.
                        showAlert('Quiz creato con successo! Ora aggiungi le domande.', 'success', '#alert-container-page');
                        $('#quiz-id').val(response.idQuiz); // Salva l'ID del quiz in un campo hidden nel form delle domande.
                        $('#quiz-details-section').slideUp(); // Nasconde la sezione dei dettagli del quiz con un effetto slide.
                        $('#questions-section').slideDown();  // Mostra la sezione per aggiungere domande con un effetto slide.

                        // Aggiunge automaticamente la prima domanda se non ce ne sono già (improbabile in questo flusso, ma per sicurezza).
                        if ($('#questions-container .question-block-styled').length === 0) {
                            $('#add-question').click(); // Simula il click sul bottone "Aggiungi Domanda".
                        } else {
                            renumberQuestions(); // Rinumera se ci sono già domande (caso raro qui).
                        }
                    } else {
                        // Errore gestito dall'API durante la creazione del quiz.
                        showAlert(response.message || 'Errore nella creazione del quiz.', 'danger', '#alert-container-page');
                    }
                },
                error: (xhr) => { // Errore AJAX.
                    showAlert('Errore AJAX creazione quiz: ' + (xhr.responseJSON?.message || xhr.statusText), 'danger', '#alert-container-page');
                }
            });
        });

        // Gestione del click sul bottone "Aggiungi Domanda".
        $('#add-question').click(function () {
            $('#no-questions-message').hide(); // Nasconde il messaggio "nessuna domanda aggiunta".
            const questionTemplate = document.getElementById('question-template-create').innerHTML; // Recupera il template HTML.
            // Determina il numero per la nuova domanda (1-based).
            const questionNumberForTemplate = $('#questions-container .question-block-styled').length + 1;

            // Sostituisce i placeholder nel template con il numero della domanda.
            const questionHtml = questionTemplate.replace(/__Q_NUM__/g, questionNumberForTemplate);
            $('#questions-container').append(questionHtml); // Aggiunge il nuovo blocco domanda al DOM.

            // Trova il blocco domanda appena aggiunto.
            const $newlyAddedQuestionBlock = $('#questions-container .question-block-styled:last-child');
            if ($newlyAddedQuestionBlock.length) {
                // Aggiunge automaticamente la prima risposta alla nuova domanda.
                const actualQuestionNumForData = $newlyAddedQuestionBlock.data('question') || questionNumberForTemplate;
                addAnswerToQuestion($newlyAddedQuestionBlock, actualQuestionNumForData, 1); // 1 indica la prima risposta.
            }
            renumberQuestions(); // Aggiorna numeri e attributi di tutte le domande e risposte.
            // Imposta il focus sul campo di testo della nuova domanda per facilitare l'inserimento.
            $newlyAddedQuestionBlock.find('textarea.textarea-styled').first().focus();
        });

        // Gestione del click sul bottone "Aggiungi Risposta".
        // Utilizza event delegation (.on()) perché i bottoni sono aggiunti dinamicamente.
        $(document).on('click', '#questions-container .add-answer', function () {
            const $thisButton = $(this);
            const questionNum = $thisButton.data('question'); // Recupera il numero della domanda dal data attribute.
            const $questionBlock = $thisButton.closest('.question-block-styled'); // Trova il blocco domanda parente.
            // Determina il numero per la nuova risposta.
            const answerCount = $questionBlock.find('.answers-container-styled .answer-block-styled').length + 1;
            addAnswerToQuestion($questionBlock, questionNum, answerCount); // Chiama la funzione helper.
            renumberQuestions(); // Aggiorna tutto.
            // Imposta il focus sul campo di testo della nuova risposta.
            $questionBlock.find('.answer-block-styled:last-child input[type="text"]').first().focus();
        });

        // Gestione del click sul bottone "Rimuovi Domanda" (event delegation).
        $(document).on('click', '#questions-container .remove-question', function () {
            $(this).closest('.question-block-styled').remove(); // Rimuove il blocco domanda.
            renumberQuestions(); // Aggiorna.
        });

        // Gestione del click sul bottone "Rimuovi Risposta" (event delegation).
        $(document).on('click', '#questions-container .remove-answer', function () {
            const $answerBlock = $(this).closest('.answer-block-styled'); // Blocco risposta da rimuovere.
            const $questionBlock = $answerBlock.closest('.question-block-styled'); // Blocco domanda parente.

            // Impedisce la rimozione se è l'unica risposta per quella domanda.
            if ($questionBlock.find('.answers-container-styled .answer-block-styled').length > 1) {
                $answerBlock.remove();
                renumberQuestions(); // Aggiorna.
            } else {
                showAlert('Ogni domanda deve avere almeno una risposta.', 'warning', '#alert-container-page');
            }
        });

        // Gestione del click sul bottone "Salva Domande".
        $('#save-questions').click(function () {
            const quizId = $('#quiz-id').val(); // ID del quiz a cui associare le domande.
            if (!quizId) {
                showAlert('ID del Quiz non trovato. Impossibile salvare le domande.', 'danger', '#alert-container-page');
                return;
            }
            // Validazione: deve esserci almeno una domanda.
            if ($('#questions-container .question-block-styled').length === 0) {
                showAlert('Devi aggiungere almeno una domanda prima di salvare.', 'warning', '#alert-container-page');
                return;
            }

            // Validazione approfondita di ogni domanda e risposta prima dell'invio.
            let allQuestionsValid = true;
            $('#questions-container .question-block-styled').each(function() {
                const $qBlock = $(this);
                const qNumText = $qBlock.find('.question-number').text(); // Numero visualizzato della domanda.

                // Controlla testo domanda.
                if ($qBlock.find('textarea.textarea-styled').val().trim() === '') {
                    showAlert(`Il testo della Domanda ${qNumText} non può essere vuoto.`, 'warning', '#alert-container-page');
                    allQuestionsValid = false; return false; // Interrompe l'iterazione .each().
                }
                // Controlla che ci siano risposte.
                if ($qBlock.find('.answers-container-styled .answer-block-styled').length === 0) {
                    showAlert(`La Domanda ${qNumText} non ha risposte.`, 'warning', '#alert-container-page');
                    allQuestionsValid = false; return false;
                }
                let hasCorrect = false; // Flag per verificare se c'è almeno una risposta corretta.
                let allAnswersHaveText = true; // Flag per verificare che tutte le risposte abbiano testo.
                $qBlock.find('.answers-container-styled .answer-block-styled').each(function(idx) {
                    // Controlla testo risposta.
                    if ($(this).find('input[type="text"].input-small-styled').val().trim() === '') {
                        showAlert(`Il testo della Risposta ${idx+1} per la Domanda ${qNumText} non può essere vuoto.`, 'warning', '#alert-container-page');
                        allAnswersHaveText = false; return false;
                    }
                    // Controlla se è marcata come corretta.
                    if ($(this).find('input.radio-input-styled[value="Corretta"]').is(':checked')) {
                        hasCorrect = true;
                    }
                });
                if (!allAnswersHaveText) { allQuestionsValid = false; return false; }
                if (!hasCorrect) { // Ogni domanda deve avere almeno una risposta corretta.
                    showAlert(`La Domanda ${qNumText} non ha una risposta designata come "Corretta".`, 'warning', '#alert-container-page');
                    allQuestionsValid = false; return false;
                }
            });
            if (!allQuestionsValid) return; // Interrompe se una validazione fallisce.

            // Prepara i dati del form delle domande e invia via AJAX.
            // Aggiunge l'ID del quiz e un'azione specifica.
            const formData = $('#questions-form').serialize() + '&quiz_id=' + quizId + '&action=save_questions';
            $.ajax({
                type: 'POST',
                url: 'api/questions.php', // Endpoint API per salvare le domande.
                data: formData,
                dataType: 'json',
                success: function (response) {
                    if (response.status === 'success') {
                        showAlert('Domande salvate con successo!', 'success', '#alert-container-page');
                        // Reindirizza alla pagina di visualizzazione del quiz dopo un breve ritardo.
                        setTimeout(() => window.location.href = 'quiz_view.php?id=' + quizId, 1500);
                    } else {
                        showAlert(response.message || 'Errore nel salvataggio delle domande.', 'danger', '#alert-container-page');
                    }
                },
                error: (xhr) => { // Errore AJAX.
                    showAlert('Errore AJAX salvataggio domande: ' + (xhr.responseJSON?.message || xhr.statusText), 'danger', '#alert-container-page');
                }
            });
        });

        // --- Gestione Modale di Conferma Annullamento Creazione Quiz ---
        const $confirmAbortModal = $('#confirmAbortCreationModal'); // Seleziona il modale.
        const $confirmAbortActionBtn = $('#confirmAbortActionBtn'); // Bottone "Conferma Annullamento" nel modale.
        const $abortModalMessage = $('#abortCreationModalMessage'); // Elemento per il messaggio nel modale.

        // Funzioni helper per mostrare/nascondere il modale.
        function showAbortCreationModal() { if($confirmAbortModal.length) $confirmAbortModal.fadeIn(200); }
        function hideAbortCreationModal() { if($confirmAbortModal.length) $confirmAbortModal.fadeOut(200); }

        // Se il modale esiste nella pagina.
        if ($confirmAbortModal.length) {
            // Event listener per i bottoni di chiusura del modale (X, "Annulla").
            $confirmAbortModal.find('.custom-modal-close-button, #cancelAbortBtn').on('click', hideAbortCreationModal);
            // Chiude il modale se si clicca sull'overlay (fuori dal contenuto del modale).
            $(window).on('click', (event) => { if ($(event.target).is($confirmAbortModal)) hideAbortCreationModal(); });
            // Chiude il modale se viene premuto il tasto Escape.
            $(document).on('keydown', (event) => { if (event.key === 'Escape' && $confirmAbortModal.is(':visible')) hideAbortCreationModal(); });
        }

        // Gestione del click sul bottone "Annulla Creazione Quiz".
        $('#abort-quiz-creation').click(function () {
            const quizIdToDelete = $('#quiz-id').val(); // ID del quiz, se già creato.
            let msg = "Sei sicuro di voler annullare la creazione del quiz?"; // Messaggio di default.

            // Personalizza il messaggio del modale in base allo stato attuale della creazione.
            if (quizIdToDelete && $('#questions-section').is(':visible')) {
                // Caso: il quiz è stato creato (ID presente) e si stanno aggiungendo domande.
                 msg += " Il quiz parzialmente creato (ID: " + quizIdToDelete + ") e le sue eventuali domande verranno eliminati.";
            } else if ($('#create-quiz-form').find('input[name="titolo"]').val() !== '') {
                // Caso: dati inseriti nel form dei dettagli, ma il quiz non è ancora stato salvato (nessun ID).
                msg += " Eventuali dati inseriti per i dettagli del quiz verranno persi.";
            }
            // Imposta il testo del messaggio nel modale.
            if($abortModalMessage.length) $abortModalMessage.text(msg);
            showAbortCreationModal(); // Mostra il modale di conferma.

            // Azione del bottone "Conferma Annullamento" all'interno del modale.
            if($confirmAbortActionBtn.length) {
                // Rimuove eventuali listener precedenti per evitare esecuzioni multiple.
                $confirmAbortActionBtn.off('click').on('click', function() {
                    hideAbortCreationModal(); // Nasconde il modale.

                    // Funzione di utility per resettare i form e la UI.
                    const resetCreationPage = () => {
                        $('#quiz-details-section').slideDown(); // Mostra dettagli.
                        $('#questions-section').slideUp();   // Nasconde domande.
                        $('#create-quiz-form')[0].reset();     // Resetta form dettagli.
                        $('#questions-form')[0].reset();       // Resetta form domande.
                        $('#quiz-id').val('');                 // Pulisce ID quiz.
                        // Ripristina il contenitore delle domande allo stato iniziale.
                        $('#questions-container').empty().html('<p id="no-questions-message" class="message-placeholder-styled text-align-center padding-vertical-medium">Nessuna domanda aggiunta. Clicca su "Aggiungi Domanda" per iniziare.</p>');
                        renumberQuestions(); // Chiama renumber per aggiornare UI (es. messaggio no-questions).
                    };

                    if (quizIdToDelete && $('#questions-section').is(':visible')) {
                        // Se il quiz è stato effettivamente creato (ID presente), effettua una chiamata AJAX per eliminarlo dal database.
                        $.ajax({
                            url: `api/quiz.php?action=delete&delId=${quizIdToDelete}`, // Endpoint API per eliminare il quiz.
                            method: 'GET', // O 'DELETE' se l'API è configurata per supportarlo per questa azione.
                            dataType: 'json',
                            success: (res) => {
                                if (res.status === 'success') {
                                    showAlert('Creazione annullata e quiz parzialmente creato eliminato.', 'info', '#alert-container-page');
                                    setTimeout(resetCreationPage, 1500); // Resetta la pagina dopo un ritardo.
                                } else {
                                    // Errore durante l'eliminazione del quiz dal DB.
                                    showAlert(res.message || 'Errore durante l\'eliminazione del quiz dal database.', 'danger', '#alert-container-page');
                                }
                            },
                            error: () => showAlert('Errore di comunicazione AJAX durante l\'annullamento e l\'eliminazione del quiz.', 'danger', '#alert-container-page')
                        });
                    } else {
                        // Se il quiz non era ancora stato salvato nel DB (nessun ID), resetta semplicemente il form e la UI.
                        showAlert('Creazione del quiz annullata.', 'info', '#alert-container-page');
                        resetCreationPage();
                    }
                });
            }
        });
    } // Fine del blocco condizionale if ($('#create-quiz-form').length)


    // Handler per il cambio dei radio button (Tipo Risposta: Corretta/Sbagliata).
    // Questo gestisce la visibilità e il valore di default del campo "Punti" associato.
    // Si applica sia alla pagina di creazione (quiz_create.php) che a quella di modifica (quiz_modify.php)
    // grazie ai selettori multipli.
    $(document).on('change', '#questions-section .answer-block-styled input[type="radio"][name$="[type]"], #edit-quiz-form .answer-block-styled input[type="radio"][name$="[type]"]', function () {
        const $answerBlock = $(this).closest('.answer-block-styled'); // Trova il blocco risposta parente.
        const $pointsGroup = $answerBlock.find('.points-group');       // Contenitore del campo punti.
        const $pointsInput = $pointsGroup.find('input[type="number"]');// Il campo input per i punti.

        // Se il radio button "Corretta" è selezionato:
        if ($(this).val() === 'Corretta' && $(this).is(':checked')) {
            $pointsGroup.slideDown(); // Mostra il campo punti con un effetto slide.
             // Imposta un valore di default (1) per i punti se il campo è vuoto, zero o non valido.
             if (parseInt($pointsInput.val(), 10) <= 0 || $pointsInput.val() === "") {
                $pointsInput.val(1);
            }
        } else {
            // Se "Sbagliata" è selezionato per questo gruppo di radio (stesso 'name'):
            const nameAttr = $(this).attr('name'); // Recupera l'attributo 'name' per identificare il gruppo.
            if ($answerBlock.find('input[type="radio"][name="'+nameAttr+'"][value="Sbagliata"]').is(':checked')) {
                $pointsGroup.slideUp(function() { // Nasconde il campo punti.
                    $pointsInput.val(0); // Azzera il valore dei punti dopo che l'animazione di chiusura è completata.
                });
            }
        }
    });


    // --- Gestione Partecipazione al Quiz (Pagina: quiz_participate.php) ---
    const $participateForm = $('#participate-form'); // Seleziona il form di partecipazione.
    // Esegue questo blocco solo se il form è presente nella pagina.
    if ($participateForm.length) {

        // Gestione del submit del form di partecipazione.
        $participateForm.on('submit', function(e) {
            e.preventDefault(); // Previene invio standard.
            const $form = $(this);
            const $submitButton = $form.find('button[type="submit"]'); // Bottone di invio.
            const originalButtonText = $submitButton.html(); // Salva il testo originale del bottone.
            const alertContainerSelector = '#alert-container-participate'; // Contenitore specifico per gli alert in questa pagina.

            $(alertContainerSelector).empty(); // Pulisce eventuali alert precedenti.

            // Disabilita il bottone di invio e mostra un messaggio di caricamento/invio in corso.
            $submitButton.prop('disabled', true).html('<i class="fas fa-spinner fa-spin" style="margin-right: 8px;"></i> Invio in corso...');

            $.ajax({
                type: 'POST',
                url: 'api/partecipation.php', // Endpoint API per registrare la partecipazione.
                data: $form.serialize() + '&action=submit', // Dati del form, assicurando che 'action=submit' sia inviato.
                dataType: 'json',
                success: function(response) { // Callback in caso di successo.
                    if (response.status === 'success') {
                        if (response.redirect_url) {
                            // Se l'API fornisce un URL di reindirizzamento (tipicamente alla pagina dei risultati),
                            // effettua il reindirizzamento. Il messaggio di successo PHP viene gestito tramite sessione.
                            window.location.href = response.redirect_url;
                        } else {
                            // Caso meno comune: successo ma nessun reindirizzamento. Mostra un alert e nasconde il form.
                            showAlert(response.message || 'Partecipazione inviata con successo!', 'success', alertContainerSelector);
                            $form.hide();
                        }
                    } else {
                        // Errore gestito dall'API (es. validazione fallita, quiz non valido).
                        showAlert(response.message || 'Si è verificato un errore durante l\'invio.', 'danger', alertContainerSelector);
                        $submitButton.prop('disabled', false).html(originalButtonText); // Riabilita il bottone.
                    }
                },
                error: function(xhr, status, error) { // Callback in caso di errore AJAX.
                    // Gestione dettagliata degli errori HTTP per fornire feedback più specifici.
                    let errorMsg = 'Errore di comunicazione con il server. Riprova più tardi.';
                    if (xhr.responseJSON && xhr.responseJSON.message) {
                        errorMsg = xhr.responseJSON.message; // Messaggio di errore specifico dall'API, se presente.
                    } else if (xhr.status === 401) { // Unauthorized (utente non autenticato).
                         errorMsg = 'Sessione scaduta o non autorizzato. Effettua nuovamente il login.';
                         setTimeout(() => window.location.href = 'auth_login.php', 2500); // Reindirizza al login.
                    } else if (xhr.status === 403) { // Forbidden (accesso negato, es. quiz terminato).
                        errorMsg = xhr.responseJSON && xhr.responseJSON.message ? xhr.responseJSON.message : 'Accesso negato o quiz non più disponibile.';
                         setTimeout(() => window.location.href = 'index.php', 2500); // Reindirizza alla home.
                    } else if (xhr.status === 409) { // Conflict (es. utente ha già partecipato).
                        errorMsg = xhr.responseJSON && xhr.responseJSON.message ? xhr.responseJSON.message : 'Hai già partecipato a questo quiz.';
                        if (xhr.responseJSON && xhr.responseJSON.redirect_url) {
                             // Se l'API fornisce un redirect (es. ai risultati della partecipazione esistente).
                             setTimeout(() => window.location.href = xhr.responseJSON.redirect_url, 2500);
                        } else {
                             // Altrimenti, reindirizza alla lista delle partecipazioni.
                             setTimeout(() => window.location.href = 'quiz_participations.php', 2500);
                        }
                    } else if (xhr.status === 404) { // Not Found (quiz o endpoint non trovato).
                        errorMsg = xhr.responseJSON && xhr.responseJSON.message ? xhr.responseJSON.message : 'Quiz non trovato o endpoint API errato.';
                    } else {
                        // Log dettagliato dell'errore nella console per scopi di debug.
                        console.error("Errore AJAX invio partecipazione:", xhr.status, xhr.responseText, status, error);
                    }
                    showAlert(errorMsg, 'danger', alertContainerSelector);
                    $submitButton.prop('disabled', false).html(originalButtonText); // Riabilita il bottone.
                }
            });
        });

        // Aggiunge/rimuove la classe 'selected-answer' alla label quando una checkbox cambia stato.
        // Questo è utile per applicare stili CSS specifici all'opzione selezionata (feedback visivo).
        $participateForm.on('change', '.answer-option input[type="checkbox"]', function() {
            const $label = $(this).closest('label'); // Trova la label parente.
            if ($(this).is(':checked')) {
                $label.addClass('selected-answer'); // Aggiunge classe se la checkbox è selezionata.
            } else {
                $label.removeClass('selected-answer'); // Rimuove classe se deselezionata.
            }
        });
        // Applica la classe 'selected-answer' anche al caricamento della pagina
        // per le checkbox che potrebbero essere già selezionate (es. se l'utente torna indietro nel browser).
        $participateForm.find('.answer-option input[type="checkbox"]:checked').each(function() {
            $(this).closest('label').addClass('selected-answer');
        });

    } // Fine del blocco condizionale if ($participateForm.length)


    // --- Gestione Modifica Quiz (Pagina: quiz_modify.php) ---
    // Esegue questo blocco solo se il form di modifica è presente.
    if ($('#edit-quiz-form').length) {

        // Funzioni per rinumerare dinamicamente domande e risposte nel form di modifica.
        // Queste sono simili a quelle usate in quiz_create.php, ma adattate per gestire
        // anche campi hidden come 'original_numero_domanda' e 'original_numero_risposta',
        // che sono necessari per l'aggiornamento corretto dei record esistenti nel database.
        // Gli indici nei 'name' degli array (es. questions[0], questions[1]) sono 0-based,
        // il che è più naturale per la gestione in JavaScript e spesso anche in PHP.

        function renumberQuestionsForEdit() {
            const $form = $('#edit-quiz-form'); // Riferimento al form di modifica.
            const $questionBlocks = $form.find('#questions-container .question-block-styled'); // Tutti i blocchi domanda.

            // Mostra/nasconde il messaggio "nessuna domanda" in base alla presenza di blocchi.
            $form.find('#no-questions-message').toggle($questionBlocks.length === 0);

            // Itera su ciascun blocco domanda.
            $questionBlocks.each(function (qIndex) { // qIndex è l'indice 0-based dell'array di domande.
                const $currentQuestionBlock = $(this);
                const displayQNum = qIndex + 1; // Numero visualizzato all'utente (1-based).

                // Aggiorna attributi data e testo visualizzato del numero domanda.
                $currentQuestionBlock.attr('data-question-index', qIndex); // Salva l'indice 0-based per riferimento.
                $currentQuestionBlock.find('.question-number-badge').first().text(displayQNum); // Badge del numero domanda.

                // Aggiorna testo nei bottoni (es. "Aggiungi Risposta alla Domanda X") e attributo 'title'.
                $currentQuestionBlock.find('.add-answer-btn .question-number-btn-text').text(displayQNum);
                $currentQuestionBlock.find('.remove-question-btn').attr('title', `Rimuovi Domanda ${displayQNum}`);

                // Aggiorna 'name' e 'id' del textarea della domanda.
                $currentQuestionBlock.find('textarea.textarea-styled').each(function () {
                    const newName = `questions[${qIndex}][text]`; // Formato: questions[0][text], questions[1][text], ...
                    $(this).attr('name', newName);
                    const newId = `question_text_${qIndex}`; // ID univoco per la label.
                    $(this).attr('id', newId);
                    $(this).closest('.form-field-group').find('label.form-label-styled').attr('for', newId);
                });

                // Aggiorna l'attributo 'name' del campo hidden per 'original_numero_domanda'.
                // Questo campo serve al backend per identificare le domande preesistenti.
                $currentQuestionBlock.find('input[type="hidden"][name$="[original_numero_domanda]"]').each(function() {
                    const newNameHidden = `questions[${qIndex}][original_numero_domanda]`;
                    $(this).attr('name', newNameHidden);
                });

                // Aggiorna ID del contenitore delle risposte e del messaggio "nessuna risposta".
                const $answersContainer = $currentQuestionBlock.find('.answers-container-styled');
                $answersContainer.attr('id', `answers-container-q${qIndex}`);
                $answersContainer.find('.no-answers-message').attr('id', `no-answers-for-q${qIndex}`);

                // Chiama la funzione per rinumerare le risposte all'interno di questa domanda.
                renumberAnswersForEdit($currentQuestionBlock, qIndex);
            });
        }

        function renumberAnswersForEdit($questionBlock, questionIndex) {
            const $answerBlocks = $questionBlock.find('.answers-container-styled .answer-block-styled'); // Tutti i blocchi risposta.

            // Mostra/nasconde il messaggio "nessuna risposta" per questa domanda.
            $questionBlock.find('.no-answers-message').toggle($answerBlocks.length === 0);

            // Itera su ciascun blocco risposta.
            $answerBlocks.each(function (aIndex) { // aIndex è l'indice 0-based dell'array di risposte per questa domanda.
                const $currentAnswerBlock = $(this);
                const displayANum = aIndex + 1; // Numero visualizzato all'utente (1-based).

                // Aggiorna attributi data e testo visualizzato del numero risposta.
                $currentAnswerBlock.attr('data-answer-index', aIndex);
                $currentAnswerBlock.find('.answer-number-badge').first().text(displayANum); // Badge del numero risposta.

                // Costruisce le parti del nome per i campi della risposta, per coerenza.
                const nameQuestionPart = `questions[${questionIndex}]`;
                const nameAnswerPart = `[answers][${aIndex}]`;

                // Input testo della risposta.
                $currentAnswerBlock.find('input.form-input-styled.input-small-styled[type="text"]').each(function() {
                    const newName = `${nameQuestionPart}${nameAnswerPart}[text]`;
                    $(this).attr('name', newName);
                    const newId = `answer_text_${questionIndex}_${aIndex}`; // ID univoco.
                    $(this).attr('id', newId);
                    $(this).closest('.form-field-group').find('label.form-label-styled').attr('for', newId);
                });

                // Radio buttons per il tipo di risposta.
                $currentAnswerBlock.find('input.radio-input-styled[name$="[type]"]').each(function() {
                    const radioValue = $(this).val(); // "Corretta" o "Sbagliata".
                    const typeSuffix = radioValue === 'Corretta' ? 'C' : 'S'; // Suffisso per ID univoco.
                    const newId = `q${questionIndex}a${aIndex}tipo${typeSuffix}`;
                    $(this).attr('name', `${nameQuestionPart}${nameAnswerPart}[type]`);
                    $(this).attr('id', newId);
                    $(this).next('label.radio-label-styled').attr('for', newId);
                });

                // Input per i punti della risposta.
                $currentAnswerBlock.find('input.input-numerical-styled[name$="[points]"]').each(function() {
                    const newId = `q${questionIndex}a${aIndex}punti`;
                    $(this).attr('name', `${nameQuestionPart}${nameAnswerPart}[points]`);
                    $(this).attr('id', newId);
                    $(this).closest('.points-group').find('label.form-label-styled').attr('for', newId);
                });

                // Campi hidden per 'original_numero_risposta' e 'id_risposta' (usati dal backend).
                $currentAnswerBlock.find('input[type="hidden"][name$="[original_numero_risposta]"]').each(function() {
                    $(this).attr('name', `${nameQuestionPart}${nameAnswerPart}[original_numero_risposta]`);
                });
                 $currentAnswerBlock.find('input[type="hidden"][name$="[id_risposta]"]').each(function() {
                    $(this).attr('name', `${nameQuestionPart}${nameAnswerPart}[id_risposta]`);
                });
            });
        }

        // Chiamata iniziale alla funzione per assicurare che tutti gli indici e numeri
        // siano corretti al momento del caricamento della pagina di modifica.
        renumberQuestionsForEdit();

        // Gestione del click sul bottone "Aggiungi Nuova Domanda" in modalità modifica.
        $('#edit-quiz-form').on('click', '#add-question-btn', function () {
            const questionTemplate = $('#question-template').html(); // Recupera il template HTML per una nuova domanda.
            // Determina il nuovo indice 0-based per la domanda.
            const questionIndex = $('#edit-quiz-form #questions-container .question-block-styled').length;
            const displayQNum = questionIndex + 1; // Numero da visualizzare (1-based).

            // Pulisce i valori e gli ID specifici dal template HTML per renderlo generico per una nuova domanda.
            // Questo è importante perché il template potrebbe contenere valori da una domanda precedente se clonato.
            let newQuestionHtml = questionTemplate
                .replace(/__Q_INDEX__/g, questionIndex) // Sostituisce placeholder per l'indice.
                .replace(/__Q_DISPLAY_NUM__/g, displayQNum) // Sostituisce placeholder per il numero visualizzato.
                .replace(/value="[^"]*"/g, 'value=""') // Rimuove tutti gli attributi 'value' dagli input.
                .replace(/original_numero_domanda" value="[^"]*"/g, 'original_numero_domanda" value=""') // Azzera 'original_numero_domanda'.
                // Pulisce il contenuto del textarea e imposta 'name' e 'id' corretti.
                .replace(/<textarea[^>]*>[\s\S]*?<\/textarea>/g, '<textarea class="textarea-styled" name="questions[' + questionIndex + '][text]" id="question_text_' + questionIndex + '" rows="3"></textarea>');

            $('#edit-quiz-form #questions-container').append(newQuestionHtml); // Aggiunge la nuova domanda al DOM.

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
                    .replace(/value="[^"]*"/g, 'value=""') // Rimuove 'value'.
                    .replace(/id_risposta" value="[^"]*"/g, 'id_risposta" value=""') // Azzera 'id_risposta'.
                    .replace(/original_numero_risposta" value="[^"]*"/g, 'original_numero_risposta" value=""'); // Azzera 'original_numero_risposta'.

                $newlyAddedQuestionBlock.find('.answers-container-styled').append(newAnswerHtml);
                $newlyAddedQuestionBlock.find('.no-answers-message').hide(); // Nasconde messaggio "nessuna risposta".

                // Imposta "Sbagliata" come tipo di default per la nuova risposta e nasconde il campo punti.
                const $newAnswer = $newlyAddedQuestionBlock.find('.answer-block-styled').first();
                $newAnswer.find('input[type="radio"][value="Sbagliata"]').prop('checked', true);
                $newAnswer.find('input[type="number"][name$="[points]"]').val(0);
                $newAnswer.find('.points-group').hide();
            }
            renumberQuestionsForEdit(); // Rinumera tutte le domande e risposte.
            // Imposta il focus sul campo di testo della nuova domanda.
            $newlyAddedQuestionBlock.find('textarea').first().focus();
        });

        // Gestione del click sul bottone "Aggiungi Risposta" a una domanda esistente in modalità modifica.
        $('#edit-quiz-form').on('click', '.add-answer-btn', function () {
            const $questionBlock = $(this).closest('.question-block-styled');
            const questionIndex = $questionBlock.data('question-index'); // Recupera l'indice 0-based della domanda.

            const $answersContainer = $questionBlock.find('.answers-container-styled');
            const answerIndex = $answersContainer.find('.answer-block-styled').length; // Nuovo indice 0-based per la risposta.
            const displayANum = answerIndex + 1; // Numero da visualizzare.

            const answerTemplate = $('#answer-template').html(); // Template per la risposta.
            // Pulisce il template della risposta come fatto per "Aggiungi Nuova Domanda".
            let newAnswerHtml = answerTemplate
                .replace(/__Q_INDEX__/g, questionIndex)
                .replace(/__A_INDEX__/g, answerIndex)
                .replace(/__A_DISPLAY_NUM__/g, displayANum)
                .replace(/value="[^"]*"/g, 'value=""')
                .replace(/id_risposta" value="[^"]*"/g, 'id_risposta" value=""')
                .replace(/original_numero_risposta" value="[^"]*"/g, 'original_numero_risposta" value=""');

            $answersContainer.append(newAnswerHtml); // Aggiunge la nuova risposta.
            $questionBlock.find('.no-answers-message').hide(); // Nasconde messaggio "nessuna risposta".

            // Imposta "Sbagliata" come tipo di default per la nuova risposta e gestisce i punti.
            const $newAnswer = $answersContainer.find('.answer-block-styled').last();
            $newAnswer.find('input[type="radio"][value="Sbagliata"]').prop('checked', true);
            $newAnswer.find('input[type="number"][name$="[points]"]').val(0);
            $newAnswer.find('.points-group').hide();

            // Rinumera solo le risposte all'interno di questa domanda per efficienza.
            renumberAnswersForEdit($questionBlock, questionIndex);
            // Imposta il focus sul campo di testo della nuova risposta.
            $newAnswer.find('input[type="text"]').first().focus();
        });

        // Gestione del click sul bottone "Rimuovi Domanda" in modalità modifica.
        $('#edit-quiz-form').on('click', '.remove-question-btn', function () {
            $(this).closest('.question-block-styled').remove(); // Rimuove il blocco domanda.
            renumberQuestionsForEdit(); // Rinumera tutte le domande rimanenti.
        });

        // Gestione del click sul bottone "Rimuovi Risposta" in modalità modifica.
        $('#edit-quiz-form').on('click', '.remove-answer-btn', function () {
            const $answerBlock = $(this).closest('.answer-block-styled');
            const $questionBlock = $answerBlock.closest('.question-block-styled');
            const questionIndex = $questionBlock.data('question-index'); // Indice della domanda parente.

            // Impedisce la rimozione se è l'unica risposta per quella domanda.
            if ($questionBlock.find('.answers-container-styled .answer-block-styled').length > 1) {
                $answerBlock.remove(); // Rimuove il blocco risposta.
                // Rinumera le risposte solo per la domanda modificata.
                renumberAnswersForEdit($questionBlock, questionIndex);
            } else {
                // Mostra un avviso all'utente.
                showEditAlerts('Ogni domanda deve avere almeno una risposta!', 'warning');
            }
        });

        // Gestione del submit del form di modifica quiz.
        $('#edit-quiz-form').submit(function (e) {
            e.preventDefault(); // Previene invio standard.
            const $form = $(this);
            const startDateVal = $form.find('#dataInizio').val();
            const endDateVal = $form.find('#dataFine').val();

            // Validazione delle date.
            if (startDateVal && endDateVal) {
                const startDate = new Date(startDateVal);
                const endDate = new Date(endDateVal);
                // Per la modifica, si può permettere che la data di inizio sia nel passato
                // solo se la data di inizio originale del quiz (se esistente e passata) non era già futura.
                // Questo previene di rendere passata una data di inizio che era originariamente futura.
                const originalStartDateString = $form.find('#original_data_inizio').val();
                const originalStartDate = originalStartDateString ? new Date(originalStartDateString) : new Date(startDateVal); // Fallback
                const allowPastStart = originalStartDate <= new Date(); // Permette se la data originale è passata o odierna.

                const dateError = checkDateRange(startDate, endDate, allowPastStart);
                if (dateError) {
                     showEditAlerts(dateError, 'danger'); // Mostra errore specifico per la modifica.
                     return; // Interrompe.
                }
            } else if (!startDateVal || !endDateVal) { // Entrambe le date sono obbligatorie.
                 showEditAlerts('Le date di inizio e fine sono obbligatorie.', 'warning');
                 return;
            }

            // Validazione: il quiz deve avere almeno una domanda.
            if ($form.find('#questions-container .question-block-styled').length === 0) {
                showEditAlerts('Il quiz deve avere almeno una domanda.', 'warning');
                return;
            }

            // Validazione approfondita di ogni domanda e risposta (testi, tipo risposta corretta).
            let allQuestionsValid = true;
            $form.find('#questions-container .question-block-styled').each(function(qIdx) {
                const $qBlock = $(this);
                const qNumText = $qBlock.find('.question-number-badge').first().text(); // Numero visualizzato.

                // Controlla testo domanda.
                if ($qBlock.find('textarea.textarea-styled').val().trim() === '') {
                    showEditAlerts(`Il testo della Domanda ${qNumText} non può essere vuoto.`, 'warning');
                    allQuestionsValid = false; return false; // Interrompe .each().
                }
                // Controlla che ci siano risposte.
                if ($qBlock.find('.answers-container-styled .answer-block-styled').length === 0) {
                    showEditAlerts(`La Domanda ${qNumText} non ha risposte. Ogni domanda deve avere almeno una risposta.`, 'warning');
                    allQuestionsValid = false; return false;
                }
                let hasCorrectAnswer = false; // Flag per risposta corretta.
                let allAnswersHaveText = true; // Flag per testo in tutte le risposte.
                $qBlock.find('.answers-container-styled .answer-block-styled').each(function(aIdx) {
                    // Controlla testo risposta.
                    if ($(this).find('input[type="text"].form-input-styled').val().trim() === '') {
                         showEditAlerts(`Il testo della Risposta ${aIdx+1} per la Domanda ${qNumText} non può essere vuoto.`, 'warning');
                         allAnswersHaveText = false; return false;
                    }
                    // Controlla se è marcata come corretta.
                    if ($(this).find('input[type="radio"][name$="[type]"][value="Corretta"]').is(':checked')) {
                        hasCorrectAnswer = true;
                    }
                });
                if (!allAnswersHaveText) { allQuestionsValid = false; return false; }
                if (!hasCorrectAnswer) { // Ogni domanda deve avere almeno una risposta corretta.
                    showEditAlerts(`La Domanda ${qNumText} non ha una risposta designata come "Corretta".`, 'warning');
                    allQuestionsValid = false; return false;
                }
            });
            if (!allQuestionsValid) return; // Interrompe se una validazione fallisce.

            // Prepara il bottone di submit (disabilita, cambia testo) e invia i dati via AJAX.
            const $submitButton = $form.find('button[type="submit"]');
            const originalButtonText = $submitButton.html();
            $submitButton.prop('disabled', true).html('<i class="fas fa-spinner fa-spin"></i> Salvataggio...');

            $.ajax({
                url: $form.attr('action'), // URL dell'API per l'update (dall'attributo 'action' del form).
                type: $form.attr('method'),// Metodo HTTP (dall'attributo 'method' del form, tipicamente POST).
                data: $form.serialize(),   // Dati del form completi, serializzati.
                dataType: 'json',
                success: function (response) { // Callback in caso di successo.
                    if (response.status === 'success') {
                        showEditAlerts(response.message || 'Quiz aggiornato con successo!', 'success');
                        // Reindirizza alla pagina specificata dall'API o alla lista "I Miei Quiz".
                        setTimeout(() => {
                             window.location.href = response.redirect_url || 'quiz_my.php';
                        }, 1500);
                    } else {
                        // Errore gestito dall'API.
                        showEditAlerts(response.message || 'Errore durante il salvataggio delle modifiche.', 'danger');
                    }
                },
                error: function (xhr) { // Errore AJAX.
                    showEditAlerts('Errore di comunicazione: ' + (xhr.responseJSON?.message || xhr.statusText || 'Dettagli non disponibili'), 'danger');
                },
                complete: function() { // Eseguito sempre, sia in caso di successo che di errore.
                    $submitButton.prop('disabled', false).html(originalButtonText); // Riabilita il bottone e ripristina testo.
                }
            });
        });
    } // Fine del blocco condizionale if ($('#edit-quiz-form').length)


    // --- Gestione Modale Conferma Eliminazione Quiz (Globale) ---
    // Questo modale è riutilizzabile in diverse pagine (es. quiz_my_list.php, quiz_view.php).
    const $confirmDeleteModal = $('#confirmDeleteModal'); // Seleziona il modale.
    if ($confirmDeleteModal.length) { // Esegui solo se il modale è presente.
        const $confirmDeleteButton = $('#confirmDeleteActionBtn'); // Bottone "Conferma Elimina" nel modale.
        let quizIdToDeleteModal = null;     // Variabile per memorizzare l'ID del quiz da eliminare.
        let quizTitleToDeleteModal = '';    // Variabile per memorizzare il titolo del quiz (per il messaggio di conferma).
        let successRedirectUrl = '';        // Variabile per l'URL a cui reindirizzare dopo un'eliminazione riuscita.

        // Bottoni per chiudere/annullare il modale.
        const $cancelOrCloseButtons = $confirmDeleteModal.find('.custom-modal-close-button, #cancelDeleteBtn');

        // Funzione per mostrare il modale di conferma eliminazione.
        function showMainDeleteModal(quizId, quizTitle = 'questo quiz', redirectUrlAfterDelete = null) {
            quizIdToDeleteModal = quizId;
            quizTitleToDeleteModal = quizTitle;
            // Imposta l'URL di redirect. Se non fornito, ricarica la pagina corrente di default.
            successRedirectUrl = redirectUrlAfterDelete || window.location.href;

            // Aggiorna il testo nel modale per mostrare il titolo del quiz da eliminare.
            const $quizTitleSpan = $('#quizTitleToDelete');
            if ($quizTitleSpan.length) {
                $quizTitleSpan.text(quizTitleToDeleteModal);
            }
            // Nasconde/resetta eventuali messaggi di errore precedenti all'interno del modale.
            $('#modalDeleteErrorMessage').hide().text('');
            $confirmDeleteModal.fadeIn(200); // Mostra il modale con un effetto fade.
        }

        // Funzione per nascondere il modale.
        function hideMainDeleteModal() {
            $confirmDeleteModal.fadeOut(200); // Nasconde il modale con fade.
            // Resetta le variabili associate al modale.
            quizIdToDeleteModal = null;
            quizTitleToDeleteModal = '';
            successRedirectUrl = '';
        }

        // Event listener delegato per i bottoni ".delete-quiz-btn".
        // Questi bottoni possono essere aggiunti dinamicamente al DOM (es. in una lista di quiz).
        $(document).on('click', '.delete-quiz-btn', function (event) {
            event.preventDefault(); // Previene l'azione di default del link/bottone.
            const $button = $(this);
            // Recupera l'ID del quiz e il titolo dai data attribute del bottone.
            const quizId = $button.data('delid') || $button.attr('delid'); // Compatibilità con 'delid'.
            const quizTitle = $button.data('quiz-title') || 'questo quiz'; // Titolo per il messaggio.
            const redirectUrl = $button.data('redirect-on-delete'); // URL di redirect opzionale.

            if (quizId && quizId !== '#') { // Assicura che l'ID del quiz sia valido.
                showMainDeleteModal(quizId, quizTitle, redirectUrl); // Mostra il modale.
            }
        });

        // Azione del bottone "Conferma Elimina" all'interno del modale.
        $confirmDeleteButton.on('click', function () {
            if (quizIdToDeleteModal) { // Se un ID quiz è stato impostato.
                const $thisButton = $(this); // Riferimento al bottone di conferma.
                const originalButtonText = $thisButton.html(); // Salva testo originale.
                // Disabilita il bottone e mostra messaggio di caricamento.
                $thisButton.prop('disabled', true).html('<i class="fas fa-spinner fa-spin"></i> Eliminazione...');
                $('#modalDeleteErrorMessage').hide(); // Nasconde errori precedenti nel modale.

                // Chiamata AJAX per eliminare il quiz.
                $.ajax({
                    url: `api/quiz.php?action=delete&delId=${quizIdToDeleteModal}`, // Endpoint API per l'eliminazione.
                                                                                  // 'action=delete' è un parametro custom,
                                                                                  // l'ID è passato come 'delId'.
                    method: 'GET', // Tradizionalmente, DELETE sarebbe più RESTful, ma GET è comune per semplicità.
                    dataType: 'json',
                    success: function (response) { // Callback in caso di successo.
                        if (response.status === 'success') {
                            hideMainDeleteModal(); // Nasconde il modale.
                            // Mostra un messaggio di successo sulla pagina principale (fuori dal modale).
                            showAlert(response.message || 'Quiz eliminato con successo!', 'success', '#alert-container-page');
                            // Dopo un breve ritardo, reindirizza o ricarica la pagina.
                            setTimeout(() => {
                                if (successRedirectUrl && successRedirectUrl !== window.location.href) {
                                    window.location.href = successRedirectUrl; // Reindirizza all'URL specificato.
                                } else {
                                    location.reload(); // Ricarica la pagina corrente.
                                }
                            }, 1500);
                        } else {
                            // Errore gestito dall'API (es. utente non autorizzato, quiz non trovato).
                            // Mostra il messaggio di errore all'interno del modale.
                            $('#modalDeleteErrorMessage').text(response.message || 'Errore durante l\'eliminazione.').show();
                        }
                    },
                    error: function (xhr) { // Errore AJAX.
                        const errorMsg = xhr.responseJSON?.message || xhr.statusText || 'Errore AJAX durante l\'eliminazione.';
                        $('#modalDeleteErrorMessage').text(errorMsg).show(); // Mostra errore nel modale.
                    },
                    complete: function() { // Eseguito sempre.
                        $thisButton.prop('disabled', false).html(originalButtonText); // Riabilita il bottone.
                        // Non nascondere il modale automaticamente in caso di errore,
                        // così l'utente può vedere il messaggio di errore.
                    }
                });
            }
        });

        // Event listener per i bottoni di chiusura/annullamento del modale.
        $cancelOrCloseButtons.on('click', hideMainDeleteModal);
        // Chiude il modale se si clicca sull'overlay.
        $(window).on('click', (event) => {
            if ($confirmDeleteModal.is(':visible') && $(event.target).is($confirmDeleteModal)) {
                hideMainDeleteModal();
            }
        });
        // Chiude il modale se si preme il tasto Escape.
        $(document).on('keydown', (event) => {
            if (event.key === 'Escape' && $confirmDeleteModal.is(':visible')) {
                hideMainDeleteModal();
            }
        });
    } // Fine del blocco condizionale if ($confirmDeleteModal.length)


    // --- Funzionalità Specifiche per la Pagina Index (index.php) ---
    // Esegue questo blocco solo se il tag <body> ha la classe 'page-index'.
    // Questo è un buon modo per organizzare JavaScript specifico per pagina.
    if (document.body.classList.contains('page-index')) {
        const $resetFormButton = $('#reset-filters-btn'); // Bottone "Resetta Filtri" nella sidebar.
        if ($resetFormButton.length) {
            $resetFormButton.on('click', function(event) {
                event.preventDefault(); // Previene invio form (se è un submit button).
                const $filterForm = $(this).closest('form'); // Trova il form dei filtri parente.
                if ($filterForm.length) {
                    $filterForm[0].reset(); // Resetta i campi del form ai loro valori di default.
                    // Rimuove i parametri dalla query string dell'URL e ricarica la pagina
                    // per una pulizia completa dei filtri.
                    window.location.href = window.location.pathname;
                } else {
                    // Fallback se il form non viene trovato (improbabile ma sicuro).
                    window.location.href = window.location.pathname;
                }
            });
        }

        // Gestione del cambio valore nei select per "Elementi per pagina" e "Ordina per".
        // Invia automaticamente il form contenitore quando un'opzione viene selezionata.
        $('#per_page_select, #sort_by_inline').on('change', function() {
            $(this).closest('form').submit(); // Trova il form parente e lo invia.
        });
    } // Fine del blocco condizionale if (document.body.classList.contains('page-index'))

}); // Fine di $(document).ready()