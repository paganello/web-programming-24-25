<?php

require_once 'config/database.php';

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

if (!isset($_SESSION['user']['nomeUtente'])) {
    // Utente non loggato: reindirizza alla pagina di login o mostra un errore
    header('Location: login.php');
    echo "<p>Devi effettuare l'accesso per vedere i tuoi quiz.</p>";
    include 'includes/footer.php';
    exit;
}

$nomeUtente = $_SESSION['user']['nomeUtente'];
$quizzes = [];
$dbError = null;

$sql = "SELECT Q.titolo, Q.dataInizio, Q.dataFine, Q.codice
        FROM Quiz AS Q
        WHERE Q.creatore = :nomeUtente
        ORDER BY Q.dataInizio DESC, Q.titolo ASC";

try {
    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':nomeUtente', $nomeUtente, PDO::PARAM_STR);
    $stmt->execute();

    $quizzes = $stmt->fetchAll(PDO::FETCH_ASSOC);

} catch (PDOException $e) {
    error_log("Errore query recupero quiz per utente $nomeUtente: " . $e->getMessage());
    $dbError = "Si è verificato un errore durante il recupero dei quiz. Riprova più tardi.";
}

include 'includes/header.php';

?>


<script src="assets/js/quiz_my.js" defer></script>

<div class="container">
    <br>
    <h2>Ecco i tuoi Quiz</h2>

    <?php if ($dbError): ?>
        <p class="error-message" style="color: red;"><?php echo htmlspecialchars($dbError); ?></p>
    <?php elseif (empty($quizzes)): ?>
        <p>Non hai ancora creato nessun quiz.</p>
        <p><a href="crea_quiz.php" class="btn">Crea il tuo primo Quiz!</a></p>
    <?php else: ?>
        <div class='quiz-list'>
            <?php foreach ($quizzes as $quiz): ?>
                <div class='quiz-item'>
                    <h3 class='quiz-title'><?php echo htmlspecialchars($quiz['titolo']); ?></h3>
                    <div class='quiz-meta'>
                        <p>
                            Disponibile dal <?php echo htmlspecialchars(date('d/m/Y', strtotime($quiz['dataInizio']))); ?>
                            al <?php echo htmlspecialchars(date('d/m/Y', strtotime($quiz['dataFine']))); ?>
                        </p>
                    </div>
                    <div class='quiz-actions'>
                        <a href='quiz_view.php?id=<?php echo htmlspecialchars($quiz['codice']); ?>' class='btn'>Visualizza</a>
                        <a href='quiz_modify.php?id=<?php echo htmlspecialchars($quiz['codice']); ?>' class='btn'>Modifica</a>
                        <button delId="<?php echo htmlspecialchars($quiz['codice']); ?>"
                            class='btn btn-danger delete-quiz-btn'>Elimina</button>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
        <div id="confirmDeleteModal" class="modal" style="display: none;">
            <div class="modal-content">
                <span class="close-button">×</span>
                <h4>Conferma Eliminazione</h4>
                <p>Sei sicuro di voler eliminare questo quiz?</p>
                <p>L'azione è irreversibile.</p>
                <div class="modal-actions">
                    <button id="cancelDeleteBtn" class="btn btn-secondary">Annulla</button>
                    <button id="confirmDeleteActionBtn" class="btn btn-danger">Elimina</button>
                </div>
            </div>
        </div>
    <?php endif; ?>

</div>

<?php
include 'includes/footer.php';
?>