<?php
/**
 * Pagina di ricerca avanzata dei quiz.
 *
 * Questa pagina permette agli utenti di cercare quiz disponibili
 * in base a titolo, creatore, e periodo di disponibilità.
 */
include 'includes/header.php';

$today = date('Y-m-d');

// Recupera i parametri di ricerca, fornendo valori predefiniti
$search_titolo = isset($_GET['search_titolo']) ? trim($_GET['search_titolo']) : '';
$search_creatore = isset($_GET['search_creatore']) ? trim($_GET['search_creatore']) : '';
$search_disponibile_ora = isset($_GET['search_disponibile_ora']) ? true : false;
$search_data_inizio_da = isset($_GET['search_data_inizio_da']) && !empty($_GET['search_data_inizio_da']) ? trim($_GET['search_data_inizio_da']) : '';
$search_data_fine_a = isset($_GET['search_data_fine_a']) && !empty($_GET['search_data_fine_a']) ? trim($_GET['search_data_fine_a']) : '';
$sort_by = isset($_GET['sort_by']) ? $_GET['sort_by'] : 'codice_desc'; // Default: più recente

// Costruzione base della query
$sql = "SELECT q.*, u.nome, u.cognome
        FROM Quiz q
        JOIN Utente u ON q.creatore = u.nomeUtente";

$conditions = [];
$params = [];

// Filtro per titolo
if (!empty($search_titolo)) {
    $conditions[] = "q.titolo LIKE :search_titolo";
    $params[':search_titolo'] = '%' . $search_titolo . '%';
}

// Filtro per creatore (nome utente, nome o cognome)
if (!empty($search_creatore)) {
    $conditions[] = "(u.nomeUtente LIKE :search_creatore OR u.nome LIKE :search_creatore OR u.cognome LIKE :search_creatore)";
    $params[':search_creatore'] = '%' . $search_creatore . '%';
}

// Filtro per disponibilità
if ($search_disponibile_ora) {
    $conditions[] = "q.dataInizio <= :today_available AND q.dataFine >= :today_available";
    $params[':today_available'] = $today;
} else {
    // Se non si cerca "disponibile ora", si possono usare i filtri di data specifici
    if (!empty($search_data_inizio_da)) {
        $conditions[] = "q.dataInizio >= :search_data_inizio_da";
        $params[':search_data_inizio_da'] = $search_data_inizio_da;
    }
    if (!empty($search_data_fine_a)) {
        $conditions[] = "q.dataFine <= :search_data_fine_a";
        $params[':search_data_fine_a'] = $search_data_fine_a;
    } elseif (empty($search_data_inizio_da) && empty($search_data_fine_a) && !$search_disponibile_ora) {
        // Comportamento di default: mostra quiz non ancora scaduti se non ci sono filtri di data specifici
        // o se non si sta cercando per "disponibile ora".
        $conditions[] = "q.dataFine >= :today_default";
        $params[':today_default'] = $today;
    }
}


// Aggiungi le condizioni alla query SQL
if (!empty($conditions)) {
    $sql .= " WHERE " . implode(" AND ", $conditions);
}

// Ordinamento dei risultati
$orderByClause = " ORDER BY ";
switch ($sort_by) {
    case 'codice_asc':
        $orderByClause .= "q.codice ASC";
        break;
    case 'titolo_asc':
        $orderByClause .= "q.titolo ASC";
        break;
    case 'titolo_desc':
        $orderByClause .= "q.titolo DESC";
        break;
    case 'data_inizio_asc':
        $orderByClause .= "q.dataInizio ASC, q.codice DESC"; // Secondario per stabilità
        break;
    case 'data_inizio_desc':
        $orderByClause .= "q.dataInizio DESC, q.codice DESC";
        break;
    case 'codice_desc': // Default
    default:
        $orderByClause .= "q.codice DESC";
        break;
}
$sql .= $orderByClause;

try {
    $stmt = $pdo->prepare($sql);
    // Bind dei parametri. Non è necessario bindare :today_default o :today_available se non usati.
    // Il prepare/execute gestirà i placeholder non presenti nei $params se le condizioni non li includono.
    $stmt->execute($params);
    $quizzes = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    die("Errore nella query: " . $e->getMessage() . "<pre>$sql</pre>" . print_r($params, true));
}
?>

<div class="content">
    <a href="index.php" class="btn">⟵ Torna alla Home</a>
    <h1>Ricerca Quiz</h1>

    <form method="GET" action="quiz_search.php" class="search-form">
        <div class="form-grid">
            <div class="form-group">
                <label for="search_titolo">Titolo del Quiz:</label>
                <input type="text" id="search_titolo" name="search_titolo" value="<?php echo htmlspecialchars($search_titolo); ?>">
            </div>

            <div class="form-group">
                <label for="search_creatore">Creatore (Nome Utente, Nome o Cognome):</label>
                <input type="text" id="search_creatore" name="search_creatore" value="<?php echo htmlspecialchars($search_creatore); ?>">
            </div>

            <div class="form-group">
                <label for="search_data_inizio_da">Disponibile dal:</label>
                <input type="date" id="search_data_inizio_da" name="search_data_inizio_da" value="<?php echo htmlspecialchars($search_data_inizio_da); ?>">
            </div>

            <div class="form-group">
                <label for="search_data_fine_a">Disponibile fino al:</label>
                <input type="date" id="search_data_fine_a" name="search_data_fine_a" value="<?php echo htmlspecialchars($search_data_fine_a); ?>">
            </div>
            
            <div class="form-group form-group-checkbox">
                <input type="checkbox" id="search_disponibile_ora" name="search_disponibile_ora" value="1" <?php if ($search_disponibile_ora) echo 'checked'; ?>>
                <label for="search_disponibile_ora">Solo quiz attualmente disponibili</label>
            </div>

            <div class="form-group">
                <label for="sort_by">Ordina per:</label>
                <select id="sort_by" name="sort_by">
                    <option value="codice_desc" <?php if ($sort_by == 'codice_desc') echo 'selected'; ?>>Più Recenti (Default)</option>
                    <option value="codice_asc" <?php if ($sort_by == 'codice_asc') echo 'selected'; ?>>Meno Recenti</option>
                    <option value="titolo_asc" <?php if ($sort_by == 'titolo_asc') echo 'selected'; ?>>Titolo (A-Z)</option>
                    <option value="titolo_desc" <?php if ($sort_by == 'titolo_desc') echo 'selected'; ?>>Titolo (Z-A)</option>
                    <option value="data_inizio_asc" <?php if ($sort_by == 'data_inizio_asc') echo 'selected'; ?>>Data Inizio (Crescente)</option>
                    <option value="data_inizio_desc" <?php if ($sort_by == 'data_inizio_desc') echo 'selected'; ?>>Data Inizio (Decrescente)</option>
                </select>
            </div>
        </div>

        <div class="form-actions">
            <button type="submit" class="btn">Cerca</button>
            <a href="quiz_search.php" class="btn btn-secondary">Resetta Filtri</a>
        </div>
    </form>

    <hr>
    <h2>Risultati della ricerca</h2>

    <?php if (empty($quizzes)): ?>
        <p>Nessun quiz trovato con i criteri specificati.</p>
    <?php else: ?>
        <div class="quiz-list">
            <?php foreach ($quizzes as $quiz): ?>
                <div class="quiz-item">
                    <h3 class="quiz-title"><?php echo htmlspecialchars($quiz['titolo']); ?></h3>
                    <div class="quiz-meta">
                        <p>Creato da: <?php echo htmlspecialchars($quiz['nome'] . ' ' . $quiz['cognome']); ?> (<?php echo htmlspecialchars($quiz['creatore']); ?>)</p>
                        <p>Disponibile dal <?php echo date('d/m/Y', strtotime($quiz['dataInizio'])); ?> al
                            <?php echo date('d/m/Y', strtotime($quiz['dataFine'])); ?></p>
                        <?php
                            $now = new DateTime();
                            $dataInizio = new DateTime($quiz['dataInizio']);
                            $dataFine = new DateTime($quiz['dataFine']);
                            $dataFine->setTime(23,59,59); // Considera disponibile fino alla fine del giorno

                            if ($now >= $dataInizio && $now <= $dataFine) {
                                echo '<p><strong style="color: green;">Attualmente Disponibile</strong></p>';
                            } elseif ($now < $dataInizio) {
                                echo '<p><strong style="color: orange;">Non ancora disponibile</strong></p>';
                            } else {
                                echo '<p><strong style="color: red;">Scaduto</strong></p>';
                            }
                        ?>
                    </div>
                    <div class="quiz-actions">
                        <a href="quiz_view.php?id=<?php echo $quiz['codice']; ?>" class="btn">Visualizza</a>
                        <?php if (isset($_SESSION['user'])): ?>
                            <?php if ($now >= $dataInizio && $now <= $dataFine): // Solo se disponibile ?>
                                <a href="quiz_participate.php?id=<?php echo $quiz['codice']; ?>" class="btn btn-secondary">Partecipa</a>
                            <?php endif; ?>
                        <?php endif; ?>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    <?php endif; ?>
</div>

<?php include 'includes/footer.php'; ?>