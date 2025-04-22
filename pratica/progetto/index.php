<?php

/**
 * Home page dell'applicazione Quiz Online
 * 
 * Questa pagina rappresenta il punto di ingresso dell'applicazione.
 * Funzionalità principali:
 * - Visualizzazione dei quiz disponibili
 * - Filtri per la ricerca dei quiz
 * - Link per la creazione di nuovi quiz
 * - Informazioni generali sull'applicazione
 * - Accesso alla registrazione e al login
 * - Visualizzazione delle statistiche dei quiz più popolari
 */

include 'includes/header.php';

$today = date('Y-m-d');
$sql = "SELECT q.*, u.nome, u.cognome 
        FROM Quiz q 
        JOIN Utente u ON q.creatore = u.nomeUtente 
        WHERE q.dataFine >= :today 
        ORDER BY q.codice DESC";

try {
    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':today', $today);
    $stmt->execute();

    $quizzes = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    die("Errore nella query: " . $e->getMessage());
}
?>

<div class="main-content">
    <div class="sidebar">
        <div class="search-filter">
            <h3>Ricerca Rapida</h3>
            <form id="quick-search-form" method="GET" action="quiz_search.php">
                <div class="form-group">
                    <input type="text" name="search" placeholder="Cerca quiz..."
                        value="<?php echo isset($_GET['search']) ? htmlspecialchars($_GET['search']) : ''; ?>">
                </div>
                <button type="submit">Cerca</button>
            </form>
        </div>
    </div>

    <div class="content">
        <h1>Benvenuto nel sistema Quiz Online</h1>

        <?php if (!isset($_SESSION['user'])): ?>
            <div class="card">
                <div class="card-content">
                    <p>Benvenuto nel sistema di Quiz Online dell'Università di Bergamo.</p>
                    <p>Per creare o partecipare ai quiz, effettua il <a href="login.php">login</a> o <a
                            href="register.php">registrati</a>.</p>
                </div>
            </div>
        <?php else: ?>
            <div class="card">
                <div class="card-content">
                    <p>Benvenuto <?php echo $_SESSION['user']['nome'] . ' ' . $_SESSION['user']['cognome']; ?> nel sistema
                        di Quiz Online dell'Università di Bergamo.</p>
                    </p>
                </div>
            </div>
        <?php endif; ?>

        <h2>Quiz disponibili</h2>

        <?php if (empty($quizzes)): ?>
            <p>Nessun quiz disponibile al momento.</p>
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
                                <a href="participate.php?id=<?php echo $quiz['codice']; ?>" class="btn btn-secondary">Partecipa</a>
                            <?php endif; ?>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
        <?php endif; ?>
    </div>
</div>

<?php include 'includes/footer.php'; ?>