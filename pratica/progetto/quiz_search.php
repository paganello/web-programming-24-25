<?php

/**
 * Pagina di ricerca dei quiz.
 * 
 * Questa pagina permette agli utenti di cercare quiz disponibili.
 */
include 'includes/header.php';

$today = date('Y-m-d');
$search = isset($_GET['search']) ? trim($_GET['search']) : '';

$sql = "SELECT q.*, u.nome, u.cognome 
        FROM Quiz q 
        JOIN Utente u ON q.creatore = u.nomeUtente 
        WHERE q.dataFine >= :today";

if (!empty($search)) {
    $sql .= " AND q.titolo LIKE :search";
}

// Ordina i risultati per codice quiz in ordine decrescente (dal più recente).
$sql .= " ORDER BY q.codice DESC";

try {
    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':today', $today);
    if (!empty($search)) {
        $searchParam = '%' . $search . '%';
        $stmt->bindParam(':search', $searchParam);
    }
    $stmt->execute();

    $quizzes = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    die("Errore nella query: " . $e->getMessage());
}
?>

<div class="content">
    <a href="index.php" class="btn">⟵ Torna alla Home</a>
    <h1>Risultati della ricerca</h1>

    <?php if (empty($quizzes)): ?>
        <p>Nessun quiz trovato per la ricerca "<?php echo htmlspecialchars($search); ?>".</p>
    <?php else: ?>
        <div class="quiz-list">
            <?php foreach ($quizzes as $quiz): ?>
                <div class="quiz-item">
                    <h3 class="quiz-title"><?php echo htmlspecialchars($quiz['titolo']); ?></h3>
                    <div class="quiz-meta">
                        <p>Creato da: <?php echo htmlspecialchars($quiz['nome'] . ' ' . $quiz['cognome']); ?></p>
                        <p>Disponibile dal <?php echo date('d/m/Y', strtotime($quiz['dataInizio'])); ?> al
                            <?php echo date('d/m/Y', strtotime($quiz['dataFine'])); ?></p>
                    </div>
                    <div class="quiz-actions">
                        <a href="quiz_view.php?id=<?php echo $quiz['codice']; ?>" class="btn">Visualizza</a>
                        <?php if (isset($_SESSION['user'])): ?>
                            <a href="quiz_participate.php?id=<?php echo $quiz['codice']; ?>" class="btn btn-secondary">Partecipa</a>
                        <?php endif; ?>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    <?php endif; ?>
</div>

<?php include 'includes/footer.php'; ?>