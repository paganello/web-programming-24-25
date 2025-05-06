<?php
/**
 * Home page dell'applicazione Quiz Online.
 *
 * Questa pagina rappresenta il punto di ingresso dell'applicazione e
 * include funzionalità di ricerca avanzata dei quiz.
 */
include 'includes/header.php';

$today = date('Y-m-d');

// --- PARAMETRI DI RICERCA ---
// Recupera i parametri di ricerca, fornendo valori predefiniti
$search_titolo = isset($_GET['search_titolo']) ? trim($_GET['search_titolo']) : '';
$search_creatore = isset($_GET['search_creatore']) ? trim($_GET['search_creatore']) : '';
$search_disponibile_ora = isset($_GET['search_disponibile_ora']) ? true : false;
$search_data_inizio_da = isset($_GET['search_data_inizio_da']) && !empty($_GET['search_data_inizio_da']) ? trim($_GET['search_data_inizio_da']) : '';
$search_data_fine_a = isset($_GET['search_data_fine_a']) && !empty($_GET['search_data_fine_a']) ? trim($_GET['search_data_fine_a']) : '';
$sort_by = isset($_GET['sort_by']) ? $_GET['sort_by'] : 'codice_desc'; // Default: più recente

// Determina se è stata effettuata una ricerca (se il form è stato inviato o ci sono parametri attivi)
$is_search_active = isset($_GET['perform_search']) || !empty($search_titolo) || !empty($search_creatore) || $search_disponibile_ora || !empty($search_data_inizio_da) || !empty($search_data_fine_a);

// --- COSTRUZIONE QUERY ---
$sql = "SELECT q.*, u.nome, u.cognome
        FROM Quiz q
        JOIN Utente u ON q.creatore = u.nomeUtente";

$conditions = [];
$params = [];

if ($is_search_active) {
    // Se è una ricerca attiva, applica i filtri
    if (!empty($search_titolo)) {
        $conditions[] = "q.titolo LIKE :search_titolo";
        $params[':search_titolo'] = '%' . $search_titolo . '%';
    }
    // INIZIO DELLA MODIFICA APPLICATA (Soluzione 1)
    if (!empty($search_creatore)) {
        $conditions[] = "(u.nomeUtente LIKE :search_creatore_un OR u.nome LIKE :search_creatore_n OR u.cognome LIKE :search_creatore_c)";
        $search_creatore_param = '%' . $search_creatore . '%';
        $params[':search_creatore_un'] = $search_creatore_param;
        $params[':search_creatore_n'] = $search_creatore_param;
        $params[':search_creatore_c'] = $search_creatore_param;
    }
    // FINE DELLA MODIFICA APPLICATA

    if ($search_disponibile_ora) {
        $conditions[] = "q.dataInizio <= :today_available AND q.dataFine >= :today_available";
        $params[':today_available'] = $today;
    } else {
        if (!empty($search_data_inizio_da)) {
            $conditions[] = "q.dataInizio >= :search_data_inizio_da";
            $params[':search_data_inizio_da'] = $search_data_inizio_da;
        }
        if (!empty($search_data_fine_a)) {
            $conditions[] = "q.dataFine <= :search_data_fine_a";
            $params[':search_data_fine_a'] = $search_data_fine_a;
        }
    }
    // ... (resto della logica dei filtri) ...
    if (!$search_disponibile_ora && empty($search_data_inizio_da) && empty($search_data_fine_a)) {
        $conditions[] = "q.dataFine >= :today_default_search_filter";
        $params[':today_default_search_filter'] = $today;
    }

} else {
    // Visualizzazione di default (nessuna ricerca attiva): mostra solo quiz non scaduti
    $conditions[] = "q.dataFine >= :today_default";
    $params[':today_default'] = $today;
}

if (!empty($conditions)) {
    $sql .= " WHERE " . implode(" AND ", $conditions);
}

// Ordinamento
$orderByClause = " ORDER BY ";
switch ($sort_by) {
    case 'codice_asc': $orderByClause .= "q.codice ASC"; break;
    case 'titolo_asc': $orderByClause .= "q.titolo ASC"; break;
    case 'titolo_desc': $orderByClause .= "q.titolo DESC"; break;
    case 'data_inizio_asc': $orderByClause .= "q.dataInizio ASC, q.codice DESC"; break;
    case 'data_inizio_desc': $orderByClause .= "q.dataInizio DESC, q.codice DESC"; break;
    case 'codice_desc': default: $orderByClause .= "q.codice DESC"; break;
}
$sql .= $orderByClause;

// --- ESECUZIONE QUERY ---
$quizzes_to_display = [];
try {
    $stmt = $pdo->prepare($sql);
    $stmt->execute($params);
    $quizzes_to_display = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    die("Errore nella query: " . $e->getMessage() . "<pre>$sql</pre>" . print_r($params, true));
}

$page_content_title = $is_search_active ? "Risultati della ricerca" : "Quiz disponibili";

// Aggiungi link ai fogli di stile e script personalizzati
echo '<link rel="stylesheet" href="css/search-styles.css">';
echo '<script src="assets/js/search-filter.js" defer></script>';
?>

<div class="main-content">
    <div class="sidebar">
        <div class="search-filter">
            <h3><i class="fas fa-search"></i> Cerca Quiz</h3>
            <form id="advanced-search-form" method="GET" action="index.php" class="search-form-sidebar">
                 <!-- Aggiunto un campo nascosto per identificare chiaramente l'invio del form di ricerca -->
                <input type="hidden" name="perform_search" value="1">

                <div class="form-group">
                    <label for="search_titolo_sidebar">Titolo del Quiz:</label>
                    <input type="text" id="search_titolo_sidebar" name="search_titolo" value="<?php echo htmlspecialchars($search_titolo); ?>" placeholder="Inserisci titolo...">
                </div>

                <div class="form-group">
                    <label for="search_creatore_sidebar">Creatore:</label>
                    <input type="text" id="search_creatore_sidebar" name="search_creatore" value="<?php echo htmlspecialchars($search_creatore); ?>" placeholder="Nome, cognome o username...">
                </div>

                <div class="form-group">
                    <label for="search_data_inizio_da_sidebar">Disponibile dal:</label>
                    <input type="date" id="search_data_inizio_da_sidebar" name="search_data_inizio_da" value="<?php echo htmlspecialchars($search_data_inizio_da); ?>">
                </div>

                <div class="form-group">
                    <label for="search_data_fine_a_sidebar">Disponibile fino al:</label>
                    <input type="date" id="search_data_fine_a_sidebar" name="search_data_fine_a" value="<?php echo htmlspecialchars($search_data_fine_a); ?>">
                </div>

                <div class="form-group">
                    <label for="sort_by_sidebar">Ordina per:</label>
                    <select id="sort_by_sidebar" name="sort_by">
                        <option value="codice_desc" <?php if ($sort_by == 'codice_desc') echo 'selected'; ?>>Più Recenti (Default)</option>
                        <option value="codice_asc" <?php if ($sort_by == 'codice_asc') echo 'selected'; ?>>Meno Recenti</option>
                        <option value="titolo_asc" <?php if ($sort_by == 'titolo_asc') echo 'selected'; ?>>Titolo (A-Z)</option>
                        <option value="titolo_desc" <?php if ($sort_by == 'titolo_desc') echo 'selected'; ?>>Titolo (Z-A)</option>
                        <option value="data_inizio_asc" <?php if ($sort_by == 'data_inizio_asc') echo 'selected'; ?>>Data Inizio (Crescente)</option>
                        <option value="data_inizio_desc" <?php if ($sort_by == 'data_inizio_desc') echo 'selected'; ?>>Data Inizio (Decrescente)</option>
                    </select>
                </div>

                <div class="form-actions-sidebar">
                    <button type="submit" class="btn" style="margin-bottom: 10px;"><i class="fas fa-search"></i> Cerca</button>
                    <button type="button" id="reset-form" class="btn-secondary"><i class="fas fa-undo"></i> Resetta Filtri</button>
                </div>
            </form>
        </div>
    </div>

    <div class="content">
        <h1>Benvenuto nel sistema Quiz Online</h1>

        <?php if (!isset($_SESSION['user'])): ?>
            <div class="card welcome-card">
                <div class="card-content">
                    <p>Benvenuto nel sistema di Quiz Online dell'Università di Bergamo.</p>
                    <p>Per creare o partecipare ai quiz, effettua il <a href="auth_login.php" class="text-link">login</a> o <a
                            href="auth_register.php" class="text-link">registrati</a>.</p>
                </div>
            </div>
        <?php else: ?>
            <div class="card welcome-card">
                <div class="card-content">
                    <p>Benvenuto <strong><?php echo htmlspecialchars($_SESSION['user']['nome'] . ' ' . $_SESSION['user']['cognome']); ?></strong> nel sistema
                        di Quiz Online dell'Università di Bergamo.</p>
                </div>
            </div>
        <?php endif; ?>

        <h2><?php echo htmlspecialchars($page_content_title); ?></h2>

        <?php if (empty($quizzes_to_display)): ?>
            <?php if ($is_search_active): ?>
                <div class="no-results">
                    <p><i class="fas fa-info-circle"></i> Nessun quiz trovato con i criteri specificati "<?php
                        $search_terms = [];
                        if (!empty($search_titolo)) $search_terms[] = "titolo: " . htmlspecialchars($search_titolo);
                        if (!empty($search_creatore)) $search_terms[] = "creatore: " . htmlspecialchars($search_creatore);
                        if ($search_disponibile_ora) $search_terms[] = "disponibile ora";
                        if (!empty($search_data_inizio_da)) $search_terms[] = "dal: " . htmlspecialchars($search_data_inizio_da);
                        if (!empty($search_data_fine_a)) $search_terms[] = "al: " . htmlspecialchars($search_data_fine_a);
                        echo implode(", ", $search_terms);
                    ?>".</p>
                </div>
            <?php else: ?>
                <div class="no-results">
                    <p><i class="fas fa-info-circle"></i> Nessun quiz disponibile al momento.</p>
                </div>
            <?php endif; ?>
        <?php else: ?>
            <div class="quiz-list">
                <?php foreach ($quizzes_to_display as $quiz): ?>
                    <div class="quiz-item">
                        <h3 class="quiz-title"><?php echo htmlspecialchars($quiz['titolo']); ?></h3>
                        <div class="quiz-meta">
                            <p><i class="fas fa-user"></i> Creato da: <strong><?php echo htmlspecialchars($quiz['nome'] . ' ' . $quiz['cognome']); ?></strong> (<?php echo htmlspecialchars($quiz['creatore']); ?>)</p>
                            <p><i class="far fa-calendar-alt"></i> Disponibile dal <strong><?php echo date('d/m/Y', strtotime($quiz['dataInizio'])); ?></strong> al
                                <strong><?php echo date('d/m/Y', strtotime($quiz['dataFine'])); ?></strong></p>
                            <?php
                                $now_dt = new DateTime();
                                $dataInizio_dt = new DateTime($quiz['dataInizio']);
                                $dataFine_dt = new DateTime($quiz['dataFine']);
                                $dataFine_dt->setTime(23,59,59);

                                if ($now_dt >= $dataInizio_dt && $now_dt <= $dataFine_dt) {
                                    echo '<p><span class="status-badge available"><i class="fas fa-check-circle"></i> Attualmente Disponibile</span></p>';
                                } elseif ($now_dt < $dataInizio_dt) {
                                    echo '<p><span class="status-badge pending"><i class="fas fa-clock"></i> Non ancora disponibile</span></p>';
                                } else {
                                    echo '<p><span class="status-badge expired"><i class="fas fa-times-circle"></i> Scaduto</span></p>';
                                }
                            ?>
                        </div>
                        <div class="quiz-actions">
                            <a href="quiz_view.php?id=<?php echo $quiz['codice']; ?>" class="btn"><i class="fas fa-eye"></i> Visualizza</a>
                            <?php if (isset($_SESSION['user'])): ?>
                                <?php if ($now_dt >= $dataInizio_dt && $now_dt <= $dataFine_dt): ?>
                                    <a href="quiz_participate.php?id=<?php echo $quiz['codice']; ?>" class="btn btn-secondary"><i class="fas fa-play"></i> Partecipa</a>
                                <?php endif; ?>
                            <?php endif; ?>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
        <?php endif; ?>
    </div>
</div>

<?php include 'includes/footer.php'; ?>