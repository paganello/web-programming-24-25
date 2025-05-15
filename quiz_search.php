<?php
/**
 * Pagina di Ricerca Avanzata dei Quiz.
 *
 * Questa pagina fornisce un'interfaccia utente per cercare quiz
 * basandosi su vari criteri come titolo, creatore e periodo di disponibilità.
 * I risultati della ricerca vengono visualizzati in un elenco.
 */

// Include l'header comune (gestisce session_start, config DB, CSS, etc.).
include 'includes/header.php';
// Il file header.php dovrebbe già includere 'config/database.php' e avviare la sessione.

$today = date('Y-m-d'); // Data odierna, usata per filtri di disponibilità.

// --- Recupero e Sanitizzazione Parametri di Ricerca ---
// Ottiene i parametri dalla query string GET, applicando trim() per pulizia
// e fornendo valori di default stringa vuota se non presenti.
$search_titolo = isset($_GET['search_titolo']) ? trim($_GET['search_titolo']) : '';
$search_creatore = isset($_GET['search_creatore']) ? trim($_GET['search_creatore']) : '';
$search_disponibile_ora = isset($_GET['search_disponibile_ora']) ? true : false; // Se la checkbox "Disponibile Ora" è spuntata.
$search_data_inizio_da = isset($_GET['search_data_inizio_da']) && !empty($_GET['search_data_inizio_da']) ? trim($_GET['search_data_inizio_da']) : '';
$search_data_fine_a = isset($_GET['search_data_fine_a']) && !empty($_GET['search_data_fine_a']) ? trim($_GET['search_data_fine_a']) : '';
$sort_by = isset($_GET['sort_by']) ? $_GET['sort_by'] : 'codice_desc'; // Criterio di ordinamento, default: più recenti.

// --- Costruzione Dinamica della Query SQL ---
// Parte base della query (SELECT, FROM, JOIN).
$sql = "SELECT q.*, u.nome, u.cognome
        FROM Quiz q
        JOIN Utente u ON q.creatore = u.nomeUtente";

$conditions = []; // Array per le condizioni della clausola WHERE.
$params = [];     // Array per i parametri da legare alla query (per prepared statements).

// Applica filtro per titolo, se fornito.
if (!empty($search_titolo)) {
    $conditions[] = "q.titolo LIKE :search_titolo"; // Ricerca parziale (LIKE).
    $params[':search_titolo'] = '%' . $search_titolo . '%';
}

// Applica filtro per creatore (cerca su nome utente, nome o cognome), se fornito.
if (!empty($search_creatore)) {
    $conditions[] = "(u.nomeUtente LIKE :search_creatore OR u.nome LIKE :search_creatore OR u.cognome LIKE :search_creatore)";
    $params[':search_creatore'] = '%' . $search_creatore . '%';
}

// Applica filtro per disponibilità.
if ($search_disponibile_ora) { // Se si cerca specificamente quiz disponibili ora.
    $conditions[] = "q.dataInizio <= :today_available AND q.dataFine >= :today_available";
    $params[':today_available'] = $today;
} else {
    // Se non si cerca "disponibile ora", si possono usare i filtri di data specifici (dal/al).
    if (!empty($search_data_inizio_da)) {
        $conditions[] = "q.dataInizio >= :search_data_inizio_da";
        $params[':search_data_inizio_da'] = $search_data_inizio_da;
    }
    if (!empty($search_data_fine_a)) {
        $conditions[] = "q.dataFine <= :search_data_fine_a";
        $params[':search_data_fine_a'] = $search_data_fine_a;
    } elseif (empty($search_data_inizio_da) && empty($search_data_fine_a) && !$search_disponibile_ora) {
        // Comportamento di default (se nessun filtro di data specifico e non si cerca "disponibile ora"):
        // mostra i quiz non ancora scaduti.
        $conditions[] = "q.dataFine >= :today_default";
        $params[':today_default'] = $today;
    }
}

// Aggiunge la clausola WHERE alla query SQL se ci sono condizioni.
if (!empty($conditions)) {
    $sql .= " WHERE " . implode(" AND ", $conditions);
}

// Costruisce la clausola ORDER BY in base al parametro $sort_by.
$orderByClause = " ORDER BY ";
switch ($sort_by) {
    case 'codice_asc':        $orderByClause .= "q.codice ASC"; break;
    case 'titolo_asc':        $orderByClause .= "q.titolo ASC"; break;
    case 'titolo_desc':       $orderByClause .= "q.titolo DESC"; break;
    case 'data_inizio_asc':   $orderByClause .= "q.dataInizio ASC, q.codice DESC"; break; // Ordinamento secondario per stabilità.
    case 'data_inizio_desc':  $orderByClause .= "q.dataInizio DESC, q.codice DESC"; break;
    case 'codice_desc':       // Default
    default:                  $orderByClause .= "q.codice DESC"; break;
}
$sql .= $orderByClause; // Aggiunge la clausola di ordinamento alla query.

// --- Esecuzione della Query e Recupero Risultati ---
try {
    $stmt = $pdo->prepare($sql);
    // Bind dei parametri.
    // Non è necessario bindare :today_default o :today_available se non sono stati effettivamente
    // aggiunti all'array $params (cioè se le relative condizioni non sono state attivate).
    // Il metodo execute($params) gestisce correttamente i placeholder non presenti nell'array $params
    // se le condizioni corrispondenti non sono state incluse nella query.
    $stmt->execute($params); // Esegue la query con i parametri.
    $quizzes = $stmt->fetchAll(PDO::FETCH_ASSOC); // Recupera tutti i risultati.
} catch (PDOException $e) { // Gestione errori database.
    // In un'app reale, loggare l'errore e mostrare un messaggio più user-friendly.
    die("Errore nella query di ricerca: " . $e->getMessage() . "<pre>Debug SQL: $sql</pre><pre>Parametri: " . print_r($params, true) . "</pre>");
}
?>

<!-- Contenuto principale della pagina di ricerca -->
<div class="content"> <!-- Questo potrebbe essere <div class="container main-content-page-padding"> per coerenza -->
    <a href="index.php" class="btn btn-sm" style="margin-bottom: 15px;"><i class="fas fa-arrow-left"></i> Torna alla Home</a> <!-- Stile per bottone piccolo e icona -->
    <h1 class="page-main-title">Ricerca Avanzata Quiz</h1> <!-- Titolo pagina -->

    <!-- Form per i filtri di ricerca -->
    <form method="GET" action="quiz_search.php" class="search-form card" style="padding: 20px; margin-bottom:30px;"> <!-- Aggiunte classi per stile card -->
        <div class="form-grid"> <!-- Per layout a griglia dei campi, se definito in CSS -->
            <div class="form-group">
                <label for="search_titolo">Titolo del Quiz:</label>
                <input type="text" id="search_titolo" name="search_titolo"
                    value="<?php echo htmlspecialchars($search_titolo, ENT_QUOTES, 'UTF-8'); ?>" placeholder="Cerca per titolo...">
            </div>

            <div class="form-group">
                <label for="search_creatore">Creatore (Nome Utente, Nome o Cognome):</label>
                <input type="text" id="search_creatore" name="search_creatore"
                    value="<?php echo htmlspecialchars($search_creatore, ENT_QUOTES, 'UTF-8'); ?>" placeholder="Cerca per creatore...">
            </div>

            <div class="form-group">
                <label for="search_data_inizio_da">Disponibile dal:</label>
                <input type="date" id="search_data_inizio_da" name="search_data_inizio_da"
                    value="<?php echo htmlspecialchars($search_data_inizio_da, ENT_QUOTES, 'UTF-8'); ?>">
            </div>

            <div class="form-group">
                <label for="search_data_fine_a">Disponibile fino al:</label>
                <input type="date" id="search_data_fine_a" name="search_data_fine_a"
                    value="<?php echo htmlspecialchars($search_data_fine_a, ENT_QUOTES, 'UTF-8'); ?>">
            </div>

            <div class="form-group"> <!-- Campo per l'ordinamento -->
                <label for="sort_by">Ordina per:</label>
                <select id="sort_by" name="sort_by" class="custom-select-styled"> <!-- Applica stile custom -->
                    <option value="codice_desc" <?php if ($sort_by == 'codice_desc') echo 'selected'; ?>>Più Recenti (Default)</option>
                    <option value="codice_asc" <?php if ($sort_by == 'codice_asc') echo 'selected'; ?>>Meno Recenti</option>
                    <option value="titolo_asc" <?php if ($sort_by == 'titolo_asc') echo 'selected'; ?>>Titolo (A-Z)</option>
                    <option value="titolo_desc" <?php if ($sort_by == 'titolo_desc') echo 'selected'; ?>>Titolo (Z-A)</option>
                    <option value="data_inizio_asc" <?php if ($sort_by == 'data_inizio_asc') echo 'selected'; ?>>Data Inizio (Crescente)</option>
                    <option value="data_inizio_desc" <?php if ($sort_by == 'data_inizio_desc') echo 'selected'; ?>>Data Inizio (Decrescente)</option>
                </select>
            </div>
        </div>

        <div class="form-actions" style="margin-top: 20px;"> <!-- Bottoni di azione del form -->
            <button type="submit" class="btn"><i class="fas fa-search"></i> Cerca</button>
            <a href="quiz_search.php" class="btn btn-secondary"><i class="fas fa-undo"></i> Resetta Filtri</a>
        </div>
    </form>

    <hr> <!-- Separatore -->
    <h2 class="page-section-title">Risultati della ricerca (<?php echo count($quizzes); ?> trovat<?php echo (count($quizzes) !== 1 ? 'i':'o'); ?>)</h2>

    <?php if (empty($quizzes)): // Se la ricerca non ha prodotto risultati ?>
        <div class="no-results card"> <!-- Usa stile card per il messaggio -->
            <p><i class="fas fa-info-circle"></i> Nessun quiz trovato con i criteri specificati.</p>
            <p>Prova a modificare i filtri di ricerca o <a href="quiz_search.php" class="text-link">resettali</a>.</p>
        </div>
    <?php else: // Se ci sono risultati, visualizzali ?>
        <div class="quiz-list"> <!-- Griglia per la lista dei quiz -->
            <?php foreach ($quizzes as $quiz): ?>
                <div class="quiz-item card"> <!-- Card per ogni quiz -->
                    <h3 class="quiz-title"><?php echo htmlspecialchars($quiz['titolo'], ENT_QUOTES, 'UTF-8'); ?></h3>
                    <div class="quiz-meta">
                        <p><i class="fas fa-user"></i> Creato da: <?php echo htmlspecialchars($quiz['nome'] . ' ' . $quiz['cognome'], ENT_QUOTES, 'UTF-8'); ?>
                            (<?php echo htmlspecialchars($quiz['creatore'], ENT_QUOTES, 'UTF-8'); ?>)</p>
                        <p><i class="far fa-calendar-alt"></i> Disponibile dal <?php echo date('d/m/Y', strtotime($quiz['dataInizio'])); ?> al
                            <?php echo date('d/m/Y', strtotime($quiz['dataFine'])); ?>
                        </p>
                        <?php // Badge di stato del quiz
                        $now = new DateTime();
                        $dataInizio = new DateTime($quiz['dataInizio']);
                        $dataFine = new DateTime($quiz['dataFine']);
                        $dataFine->setTime(23, 59, 59); // Considera disponibile fino alla fine del giorno.
                
                        if ($now >= $dataInizio && $now <= $dataFine) {
                            echo '<span class="status-badge available"><i class="fas fa-check-circle"></i> Attualmente Disponibile</span>';
                        } elseif ($now < $dataInizio) {
                            echo '<span class="status-badge pending"><i class="fas fa-clock"></i> Non ancora disponibile</span>';
                        } else {
                            echo '<span class="status-badge expired"><i class="fas fa-times-circle"></i> Scaduto</span>';
                        }
                        ?>
                    </div>
                    <div class="quiz-actions"> <!-- Bottoni di azione -->
                        <a href="quiz_view.php?id=<?php echo $quiz['codice']; ?>" class="btn"><i class="fas fa-eye"></i> Visualizza</a>
                        <?php if (isset($_SESSION['user'])): // Mostra "Partecipa" solo se loggato e quiz disponibile ?>
                            <?php if ($now >= $dataInizio && $now <= $dataFine): ?>
                                <a href="quiz_participate.php?id=<?php echo $quiz['codice']; ?>" class="btn btn-secondary"><i class="fas fa-play"></i> Partecipa</a>
                            <?php endif; ?>
                        <?php endif; ?>
                    </div>
                </div> <!-- fine .quiz-item -->
            <?php endforeach; ?>
        </div> <!-- fine .quiz-list -->
    <?php endif; ?>
</div> <!-- fine .content -->

<?php 
// Include il footer HTML comune.
include 'includes/footer.php'; 
?>
<!-- La chiusura del tag </body> è in footer.php -->