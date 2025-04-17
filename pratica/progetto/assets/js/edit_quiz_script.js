document.addEventListener('DOMContentLoaded', () => {
    const form = document.getElementById('edit-quiz-form');
    const questionsContainer = document.getElementById('questions-container');
    const addQuestionBtn = document.getElementById('add-question-btn');
    const questionTemplate = document.getElementById('question-template');
    const answerTemplate = document.getElementById('answer-template');
    const formMessages = document.getElementById('form-messages');

    let questionCounter = questionsContainer.querySelectorAll('.question-block').length; // Contatore per nuovi indici

    // --- Funzione per aggiornare indici e numeri visualizzati ---
    const updateIndices = () => {
        const questionBlocks = questionsContainer.querySelectorAll('.question-block');
        questionBlocks.forEach((qBlock, qIndex) => {
            qBlock.dataset.questionIndex = qIndex; // Aggiorna data attribute
            qBlock.querySelector('h4').textContent = `Domanda ${qIndex + 1}`;
            // Aggiorna gli attributi 'name' per la domanda
            qBlock.querySelectorAll('[name^="questions["]').forEach(input => {
                const oldName = input.getAttribute('name');
                const newName = oldName.replace(/questions\[\d+\]/, `questions[${qIndex}]`);
                input.setAttribute('name', newName);
            });

            // Aggiorna indici risposte all'interno della domanda
            const answerBlocks = qBlock.querySelectorAll('.answer-block');
            answerBlocks.forEach((aBlock, aIndex) => {
                aBlock.dataset.answerIndex = aIndex; // Aggiorna data attribute
                aBlock.querySelector('h6').textContent = `Risposta ${aIndex + 1}`;
                 // Aggiorna gli attributi 'name' per le risposte (assicurati che l'indice domanda sia corretto!)
                 aBlock.querySelectorAll('[name*="[answers]"]').forEach(input => {
                    const oldName = input.getAttribute('name');
                    // Ricostruisci il nome con l'indice corretto della domanda E della risposta
                    const newName = oldName.replace(/questions\[\d+\]\[answers\]\[\d+\]/, `questions[${qIndex}][answers][${aIndex}]`);
                    input.setAttribute('name', newName);
                });
            });
        });
         // Aggiorna il contatore globale basato su quanti blocchi ci sono ora
         questionCounter = questionBlocks.length;
    };


    // --- Gestione Aggiunta/Rimozione Elementi (Event Delegation) ---
    form.addEventListener('click', (event) => {
        // Rimuovi Domanda
        if (event.target.classList.contains('remove-question-btn')) {
            if (confirm('Sei sicuro di voler rimuovere questa domanda e tutte le sue risposte?')) {
                event.target.closest('.question-block').remove();
                updateIndices(); // Ri-assegna indici dopo rimozione
            }
        }

        // Rimuovi Risposta
        if (event.target.classList.contains('remove-answer-btn')) {
            const answerBlock = event.target.closest('.answer-block');
            const answersContainer = answerBlock.closest('.answers-container');
            if (answersContainer.querySelectorAll('.answer-block').length > 1) { // Impedisci di rimuovere l'ultima risposta? O gestiscilo lato server? Qui lo impediamo.
                answerBlock.remove();
               updateIndices();
            } else {
                alert('Ogni domanda deve avere almeno una risposta.');
            }
        }

        // Aggiungi Risposta
        if (event.target.classList.contains('add-answer-btn')) {
            const questionBlock = event.target.closest('.question-block');
            const currentQuestionIndex = parseInt(questionBlock.dataset.questionIndex); // Usa l'indice aggiornato
            const answersContainer = questionBlock.querySelector('.answers-container');
            const currentAnswerCount = answersContainer.querySelectorAll('.answer-block').length;

            const templateNode = answerTemplate.content.cloneNode(true);
            const newAnswerHtml = templateNode.firstElementChild.outerHTML // Prendi l'HTML del div interno
                .replace(/__Q_INDEX__/g, currentQuestionIndex)
                .replace(/__A_INDEX__/g, currentAnswerCount) // Il nuovo indice è il conteggio attuale
                .replace(/__A_DISPLAY_NUM__/g, currentAnswerCount + 1);

            answersContainer.insertAdjacentHTML('beforeend', newAnswerHtml);
            // Non è strettamente necessario updateIndices qui, ma può aiutare a mantenere coerenza
             updateIndices();
        }
    });

    // Aggiungi Nuova Domanda
    addQuestionBtn.addEventListener('click', () => {
        const templateNode = questionTemplate.content.cloneNode(true);
        const newQuestionHtml = templateNode.firstElementChild.outerHTML // Prendi l'HTML del div interno
            .replace(/__Q_INDEX__/g, questionCounter) // Usa il contatore globale per il nuovo indice
            .replace(/__Q_DISPLAY_NUM__/g, questionCounter + 1);

        questionsContainer.insertAdjacentHTML('beforeend', newQuestionHtml);

         // Aggiungi automaticamente una prima risposta alla nuova domanda
        const newQuestionBlock = questionsContainer.querySelector(`.question-block[data-question-index="${questionCounter}"]`);
        const addAnswerButton = newQuestionBlock.querySelector('.add-answer-btn');
        if(addAnswerButton) {
            addAnswerButton.click(); // Simula il click per aggiungere la prima risposta
        }

        questionCounter++; // Incrementa per la prossima nuova domanda
        updateIndices(); // Aggiorna tutti gli indici

    });

    // --- Gestione Submit Form ---
    form.addEventListener('submit', (event) => {
        event.preventDefault(); // Blocca l'invio HTML standard
        formMessages.innerHTML = ''; // Pulisci messaggi precedenti

        // Validazione base frontend (assicurati che ci sia almeno una domanda e ogni domanda abbia almeno una risposta)
        const questionBlocks = questionsContainer.querySelectorAll('.question-block');
        if (questionBlocks.length === 0) {
            formMessages.innerHTML = '<p class="error-message">Il quiz deve avere almeno una domanda.</p>';
            return;
        }
        let validAnswers = true;
        questionBlocks.forEach((qBlock) => {
            if (qBlock.querySelectorAll('.answer-block').length === 0) {
                validAnswers = false;
            }
            // Assicurati che almeno una risposta sia marcata come corretta per domanda (opzionale qui, meglio lato server)
            let correctFound = false;
            qBlock.querySelectorAll('input[type="radio"][value="Corretta"]:checked').forEach(() => {
                 correctFound = true;
            });
            // if (!correctFound) { /* Potresti aggiungere un controllo */ }

        });
        if (!validAnswers) {
            formMessages.innerHTML = '<p class="error-message">Ogni domanda deve avere almeno una risposta.</p>';
            return;
        }


        // Raccogli i dati dal form in un oggetto JS strutturato
        const formData = new FormData(form);
        const data = {
            quiz_id: formData.get('quiz_id'),
            title: formData.get('titolo'),
            start_date: formData.get('dataInizio'),
            end_date: formData.get('dataFine'),
            questions: []
        };

        const questionElements = form.querySelectorAll('.question-block');
        questionElements.forEach((qElement, qIndex) => { // Usa l'indice DOM corrente
            const questionData = {
                // Passiamo l'original_numero se esiste, altrimenti null/undefined
                original_numero: qElement.querySelector(`input[name="questions[${qIndex}][original_numero]"]`)?.value || null,
                testo: qElement.querySelector(`textarea[name="questions[${qIndex}][testo]"]`).value,
                answers: []
            };

            const answerElements = qElement.querySelectorAll('.answer-block');
            answerElements.forEach((aElement, aIndex) => { // Usa l'indice DOM corrente
                 const tipoChecked = aElement.querySelector(`input[name="questions[${qIndex}][answers][${aIndex}][tipo]"]:checked`);
                 const answerData = {
                    original_numero: aElement.querySelector(`input[name="questions[${qIndex}][answers][${aIndex}][original_numero]"]`)?.value || null,
                    testo: aElement.querySelector(`textarea[name="questions[${qIndex}][answers][${aIndex}][testo]"]`).value,
                    punteggio: aElement.querySelector(`input[name="questions[${qIndex}][answers][${aIndex}][punteggio]"]`).value,
                    // Assicurati che il tipo venga preso correttamente dal radio button selezionato
                    tipo: tipoChecked ? tipoChecked.value : null // Gestisci il caso in cui nessuno sia selezionato (anche se 'required' dovrebbe prevenirlo)
                };
                 if (answerData.tipo) { // Aggiungi solo se il tipo è valido
                    questionData.answers.push(answerData);
                 } else {
                    console.warn(`Tipo non trovato per risposta ${aIndex} della domanda ${qIndex}`);
                    // Potresti voler invalidare il form qui
                 }
            });
            data.questions.push(questionData);
        });


        console.log("Dati inviati:", JSON.stringify(data, null, 2)); // Per Debug

        // Invia i dati all'API
        fetch('api/quiz.php?action=modify', { // Assicurati che il percorso sia corretto
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
                // Aggiungi altri header se necessari (es. CSRF token)
            },
            body: JSON.stringify(data)
        })
        .then(response => {
             // Leggi sempre il JSON anche per errori, per ottenere il messaggio
             return response.json().then(body => ({ status: response.status, ok: response.ok, body }));
        })
        .then(result => {
            if (result.ok) { // Controlla se lo status è 2xx
                formMessages.innerHTML = `<p class="success-message">${result.body.message || 'Quiz aggiornato con successo!'}</p>`;
                // Opzionale: Resetta il form o reindirizza
                // window.location.href = 'quiz_my.php'; // Esempio di reindirizzamento
            } else {
                // Mostra messaggio di errore dall'API
                formMessages.innerHTML = `<p class="error-message">Errore ${result.status}: ${result.body.message || 'Si è verificato un errore.'}</p>`;
            }
        })
        .catch(error => {
            console.error('Errore Fetch:', error);
            formMessages.innerHTML = `<p class="error-message">Errore di rete o nell'elaborazione della richiesta: ${error.message}</p>`;
        });
    });

     // Esegui un aggiornamento iniziale degli indici al caricamento
     updateIndices();
});