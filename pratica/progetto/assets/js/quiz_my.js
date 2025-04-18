
document.addEventListener('DOMContentLoaded', function () {
    const modal = document.getElementById('confirmDeleteModal');
    // Usa l'ID del bottone di conferma nel modale (cambia se usi un altro ID)
    const confirmDeleteButton = document.getElementById('confirmDeleteActionBtn');
    const cancelDeleteBtn = document.getElementById('cancelDeleteBtn');
    const closeButton = modal.querySelector('.close-button');

    let quizIdToDelete = null; // Variabile per memorizzare l'ID

    // --- Listener per i link "Elimina" nella lista ---
    document.querySelectorAll('.delete-quiz-btn').forEach(link => {
        link.addEventListener('click', function (event) {
            event.preventDefault();
            quizIdToDelete = this.getAttribute('delId');
            if (quizIdToDelete && quizIdToDelete !== '#') {
                modal.style.display = 'block';
            }
        });
    });

    // --- Listener per il pulsante "Conferma" nel modale ---
    confirmDeleteButton.addEventListener('click', function () {

        const apiUrl = `api/quiz.php?delId=${quizIdToDelete}`; // Cambia con il tuo URL API
        console.log(`Invio richiesta a: ${apiUrl}`); // Utile per il debug

        fetch(apiUrl)
            .then(response => {
                // Controlla se la risposta HTTP è andata a buon fine (es. status 200 OK)
                if (!response.ok) {
                    throw new Error(`Errore HTTP! Status: ${response.status}`);
                }
                if (response.status === 204){
                    location.reload();
                }
            })
            .catch(error => {
                // Gestisci errori di rete o errori lanciati nel blocco .then() precedente
                console.error('Errore durante l\'eliminazione del quiz:', error);
                alert(`Si è verificato un errore durante l'eliminazione del quiz ID ${quizId}. Controlla la console per i dettagli.`);
            });
    });

    const hideModal = () => {
        modal.style.display = 'none';
        quizIdToDelete = null;
    };

    cancelDeleteBtn.addEventListener('click', hideModal);
    closeButton.addEventListener('click', hideModal);
    window.addEventListener('click', (event) => {
        if (event.target == modal) hideModal();
    });
    window.addEventListener('keydown', (event) => {
        if (event.key === 'Escape' && modal.style.display === 'block') hideModal();
    });
});
