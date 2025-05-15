<?php
/**
 * Home page dell'applicazione Quiz Online.
 *
 * Questa pagina visualizza l'elenco dei quiz disponibili, con funzionalità
 * di ricerca, filtro, ordinamento e paginazione.
 * Mostra anche un messaggio di benvenuto e una sidebar per i filtri.
 */

// Include l'header comune della pagina.
// header.php ora si occupa di inizializzare la sessione, includere database.php
// e impostare la variabile $bodyClass (es. 'page-index').
include 'includes/header.php';

$today = date('Y-m-d'); // Data odierna, usata per filtrare quiz attivi.

// --- PARAMETRI DI RICERCA E FILTRO ---
// Recupera i parametri dalla query string GET, applicando trim() e valori di default.
$search_titolo = isset($_GET['search_titolo']) ? trim($_GET['search_titolo']) : '';
$search_creatore = isset($_GET['search_creatore']) ? trim($_GET['search_creatore']) : '';
$search_data_inizio_da = isset($_GET['search_data_inizio_da']) && !empty($_GET['search_data_inizio_da']) ? trim($_GET['search_data_inizio_da']) : '';
$search_data_fine_a = isset($_GET['search_data_fine_a']) && !empty($_GET['search_data_fine_a']) ? trim($_GET['search_data_fine_a']) : '';
$sort_by = isset($_GET['sort_by']) ? $_GET['sort_by'] : 'codice_desc'; // Default: ordina per codice decrescente (più recenti).

// --- PARAMETRI DI PAGINAZIONE ---
$page = isset($_GET['page']) ? (int) $_GET['page'] : 1; // Pagina corrente, default 1.
$per_page = isset($_GET['per_page']) ? (int) $_GET['per_page'] : 20; // Elementi per pagina, default 20.
$valid_per_page_options = [10, 20, 50, 100]; // Opzioni valide per il numero di elementi per pagina.

// Validazione dei parametri di paginazione.
if ($page < 1) $page = 1;
if (!in_array($per_page, $valid_per_page_options)) $per_page = 20; // Ripristina default se non valido.

// Determina se è attiva una ricerca (se è stato premuto "Cerca" o se ci sono filtri attivi).
$is_search_active = isset($_GET['perform_search']) || !empty($search_titolo) || !empty($search_creatore) || !empty($search_data_inizio_da) || !empty($search_data_fine_a);

// --- COSTRUZIONE DELLA QUERY SQL DINAMICA ---
// Parte base della query (FROM e JOIN).
$query_base_from_join = "FROM Quiz q JOIN Utente u ON q.creatore = u.nomeUtente";
$conditions = []; // Array per le condizioni della clausola WHERE.
$params = [];     // Array per i parametri da legare alla query (per prepared statements).

// Applica i filtri di ricerca se attivi.
if ($is_search_active) {
    if (!empty($search_titolo)) {
        $conditions[] = "q.titolo LIKE :search_titolo";
        $params[':search_titolo'] = '%' . $search_titolo . '%'; // Ricerca parziale.
    }
    if (!empty($search_creatore)) {
        // Ricerca su nome utente, nome o cognome del creatore.
        $conditions[] = "(u.nomeUtente LIKE :search_creatore_un OR u.nome LIKE :search_creatore_n OR u.cognome LIKE :search_creatore_c)";
        $search_creatore_param = '%' . $search_creatore . '%';
        $params[':search_creatore_un'] = $search_creatore_param;
        $params[':search_creatore_n'] = $search_creatore_param;
        $params[':search_creatore_c'] = $search_creatore_param;
    }
    // Se il creatore non è specificato, applica filtri per data.
    // Questa logica potrebbe essere rivista se si vuole combinare creatore e date.
    // Attualmente, se si cerca per creatore, i filtri data vengono ignorati.
    else { 
        if (!empty($search_data_inizio_da)) {
            $conditions[] = "q.dataInizio >= :search_data_inizio_da";
            $params[':search_data_inizio_da'] = $search_data_inizio_da;
        }
        if (!empty($search_data_fine_a)) {
            $conditions[] = "q.dataFine <= :search_data_fine_a";
            $params[':search_data_fine_a'] = $search_data_fine_a;
        }
    }
    // Se si sta cercando ma non sono state specificate date, filtra comunque per quiz non scaduti.
    if (empty($search_data_inizio_da) && empty($search_data_fine_a)) {
        $conditions[] = "q.dataFine >= :today_default_search_filter";
        $params[':today_default_search_filter'] = $today;
    }
} else {
    // Se non è attiva una ricerca, visualizza di default solo i quiz non ancora scaduti.
    $conditions[] = "q.dataFine >= :today_default";
    $params[':today_default'] = $today;
}

// Costruisce la clausola WHERE.
$where_clause = "";
if (!empty($conditions)) {
    $where_clause = " WHERE " . implode(" AND ", $conditions);
}

// Query per contare il numero totale di quiz che soddisfano i filtri (per la paginazione).
$count_sql = "SELECT COUNT(*) as total " . $query_base_from_join . $where_clause;

// Query principale per selezionare i quiz da visualizzare.
// Include una subquery per contare il numero di partecipazioni per ogni quiz.
$sql = "SELECT q.*, u.nome, u.cognome,
               (SELECT COUNT(*) FROM Partecipazione p_count WHERE p_count.quiz = q.codice) AS num_partecipazioni "
    . $query_base_from_join . $where_clause;

// Costruisce la clausola ORDER BY in base al parametro $sort_by.
$orderByClause = " ORDER BY ";
switch ($sort_by) {
    case 'codice_asc':        $orderByClause .= "q.codice ASC"; break;
    case 'titolo_asc':        $orderByClause .= "q.titolo ASC, q.codice DESC"; break;
    case 'titolo_desc':       $orderByClause .= "q.titolo DESC, q.codice DESC"; break;
    case 'data_inizio_asc':   $orderByClause .= "q.dataInizio ASC, q.codice DESC"; break;
    case 'data_inizio_desc':  $orderByClause .= "q.dataInizio DESC, q.codice DESC"; break;
    case 'partecipazioni_desc':$orderByClause .= "num_partecipazioni DESC, q.codice DESC"; break;
    case 'partecipazioni_asc':$orderByClause .= "num_partecipazioni ASC, q.codice DESC"; break;
    case 'codice_desc':       // Default
    default:                  $orderByClause .= "q.codice DESC"; break;
}
$sql .= $orderByClause; // Aggiunge la clausola di ordinamento alla query.

// --- ESECUZIONE QUERY DI CONTEGGIO E CALCOLO PAGINAZIONE ---
$total_quizzes = 0;
try {
    $count_stmt = $pdo->prepare($count_sql);
    $count_stmt->execute($params); // Esegue la query di conteggio.
    $total_quizzes = (int) $count_stmt->fetch(PDO::FETCH_ASSOC)['total']; // Recupera il totale.
} catch (PDOException $e) {
    error_log("Errore nella query di conteggio (index.php): " . $e->getMessage());
    // In un'app reale, gestire l'errore mostrando un messaggio all'utente o loggando.
}

// Calcola il numero totale di pagine.
$total_pages = ($total_quizzes > 0) ? ceil($total_quizzes / $per_page) : 1;
// Corregge il numero di pagina se fuori range.
if ($page > $total_pages && $total_pages > 0) $page = $total_pages;
if ($page < 1) $page = 1;

// Calcola l'offset per la clausola LIMIT.
$offset = ($page - 1) * $per_page;
$sql .= " LIMIT :offset, :per_page"; // Aggiunge la clausola LIMIT per la paginazione.

// Prepara i parametri per la query di selezione, includendo offset e per_page.
$params_for_selection = $params;
$params_for_selection[':offset'] = $offset;
$params_for_selection[':per_page'] = $per_page;

// --- ESECUZIONE QUERY PRINCIPALE DI SELEZIONE DEI QUIZ ---
$quizzes_to_display = [];
try {
    $stmt = $pdo->prepare($sql);
    // Lega i parametri specificando il tipo per LIMIT (interi).
    foreach ($params_for_selection as $key => $value) {
        if ($key === ':offset' || $key === ':per_page') {
            $stmt->bindValue($key, (int) $value, PDO::PARAM_INT);
        } else {
            $stmt->bindValue($key, $value);
        }
    }
    $stmt->execute();
    $quizzes_to_display = $stmt->fetchAll(PDO::FETCH_ASSOC); // Recupera i quiz da visualizzare.
} catch (PDOException $e) {
    error_log("Errore nella query principale (index.php): " . $e->getMessage());
    // Gestire l'errore.
}

// Titolo dinamico per il contenuto della pagina.
$page_content_title = $is_search_active ? "Risultati della Ricerca" : "Quiz Disponibili";
?>

<!-- Struttura principale della pagina: Sidebar + Contenuto -->
<div class="main-content">
    <div class="sidebar"> <!-- Sidebar per i filtri di ricerca -->
        <div class="search-filter card"> <!-- Card per il form di ricerca -->
            <h3><i class="fas fa-search"></i> Cerca Quiz</h3>
            <form id="advanced-search-form" method="GET" action="index.php" class="search-form-sidebar">
                <input type="hidden" name="perform_search" value="1"> <!-- Indica che è una ricerca attiva -->
                <div class="form-group">
                    <label for="search_titolo_sidebar">Titolo del Quiz:</label>
                    <input type="text" id="search_titolo_sidebar" name="search_titolo"
                        value="<?php echo htmlspecialchars($search_titolo, ENT_QUOTES, 'UTF-8'); ?>" placeholder="Inserisci titolo...">
                </div>
                <div class="form-group">
                    <label for="search_creatore_sidebar">Creatore:</label>
                    <input type="text" id="search_creatore_sidebar" name="search_creatore"
                        value="<?php echo htmlspecialchars($search_creatore, ENT_QUOTES, 'UTF-8'); ?>"
                        placeholder="Nome, cognome o username...">
                </div>
                <div class="form-group">
                    <label for="search_data_inizio_da_sidebar">Disponibile dal:</label>
                    <input type="date" id="search_data_inizio_da_sidebar" name="search_data_inizio_da"
                        value="<?php echo htmlspecialchars($search_data_inizio_da, ENT_QUOTES, 'UTF-8'); ?>" >
                </div>
                <div class="form-group">
                    <label for="search_data_fine_a_sidebar">Disponibile fino al:</label>
                    <input type="date" id="search_data_fine_a_sidebar" name="search_data_fine_a"
                        value="<?php echo htmlspecialchars($search_data_fine_a, ENT_QUOTES, 'UTF-8'); ?>" >
                </div>
                <div class="form-actions-sidebar">
                    <button type="submit" class="btn"><i class="fas fa-search"></i> Cerca</button>
                    <button type="button" id="reset-filters-btn" class="btn btn-secondary"><i class="fas fa-undo"></i> Resetta Filtri</button>
                </div>
            </form>
        </div>
    </div>

    <div class="content"> <!-- Area principale del contenuto -->
        <h1>Benvenuto nel Sistema Quiz Online</h1>

        <!-- Messaggio di benvenuto dinamico -->
        <?php if (!isset($_SESSION['user'])): // Se l'utente non è loggato ?>
            <div class="card welcome-card">
                <div class="card-content">
                    <p>Benvenuto nel sistema di Quiz Online. Per accedere a tutte le funzionalità, effettua il <a
                            href="auth_login.php" class="text-link">login</a> o <a href="auth_register.php"
                            class="text-link">registrati</a>.</p>
                </div>
            </div>
        <?php else: // Se l'utente è loggato ?>
            <div class="card welcome-card">
                <div class="card-content">
                    <p>Benvenuto
                        <strong><?php echo htmlspecialchars($_SESSION['user']['nome'] . ' ' . $_SESSION['user']['cognome'], ENT_QUOTES, 'UTF-8'); ?></strong>!
                    </p>
                </div>
            </div>
        <?php endif; ?>

        <!-- Header dei risultati (titolo, conteggio, controlli per pagina/ordinamento) -->
        <div class="results-header">
            <h2>
                <i class="fas <?php echo $is_search_active ? 'fa-search' : 'fa-list-ul'; ?>"></i> <!-- Icona dinamica -->
                <?php echo htmlspecialchars($page_content_title, ENT_QUOTES, 'UTF-8'); ?>
                <small>(<?php echo $total_quizzes; ?> quiz
                    trovat<?php echo ($total_quizzes !== 1) ? 'i' : 'o'; ?>)</small> <!-- Conteggio e plurale dinamico -->
            </h2>
            <div class="controls-container"> <!-- Controlli per paginazione e ordinamento -->
                <form method="GET" id="per-page-form" action="index.php">
                    <!-- Mantiene i parametri di ricerca/filtro correnti quando si cambia "elementi per pagina" -->
                    <?php foreach ($_GET as $key => $value) {
                        if ($key !== 'per_page' && $key !== 'page') { // Esclude i parametri che verranno reimpostati
                            echo '<input type="hidden" name="' . htmlspecialchars($key, ENT_QUOTES, 'UTF-8') . '" value="' . htmlspecialchars($value, ENT_QUOTES, 'UTF-8') . '">';
                        }
                    } ?>
                    <label for="per_page_select"><i class="fas fa-th-list"></i> Elementi:</label>
                    <select id="per_page_select" name="per_page" aria-label="Elementi per pagina">
                        <?php foreach ($valid_per_page_options as $option): ?>
                            <option value="<?php echo $option; ?>" <?php if ($per_page == $option) echo 'selected'; ?>>
                                <?php echo $option; ?></option>
                        <?php endforeach; ?>
                    </select>
                </form>
                <form method="GET" id="sort-form" action="index.php">
                    <!-- Mantiene i parametri di ricerca/filtro correnti quando si cambia l'ordinamento -->
                    <?php foreach ($_GET as $key => $value) {
                        if ($key !== 'sort_by' && $key !== 'page') {
                            echo '<input type="hidden" name="' . htmlspecialchars($key, ENT_QUOTES, 'UTF-8') . '" value="' . htmlspecialchars($value, ENT_QUOTES, 'UTF-8') . '">';
                        }
                    } ?>
                    <label for="sort_by_inline"><i class="fas fa-sort"></i> Ordina:</label>
                    <select id="sort_by_inline" name="sort_by" aria-label="Criterio di ordinamento">
                        <option value="codice_desc" <?php if ($sort_by == 'codice_desc') echo 'selected'; ?>>Più Recenti (Default)</option>
                        <option value="codice_asc" <?php if ($sort_by == 'codice_asc') echo 'selected'; ?>>Meno Recenti</option>
                        <option value="titolo_asc" <?php if ($sort_by == 'titolo_asc') echo 'selected'; ?>>Titolo (A-Z)</option>
                        <option value="titolo_desc" <?php if ($sort_by == 'titolo_desc') echo 'selected'; ?>>Titolo (Z-A)</option>
                        <option value="data_inizio_asc" <?php if ($sort_by == 'data_inizio_asc') echo 'selected'; ?>>Data Inizio (Crescente)</option>
                        <option value="data_inizio_desc" <?php if ($sort_by == 'data_inizio_desc') echo 'selected'; ?>>Data Inizio (Decrescente)</option>
                        <option value="partecipazioni_desc" <?php if ($sort_by == 'partecipazioni_desc') echo 'selected'; ?>>Partecipazioni (Più alto)</option>
                        <option value="partecipazioni_asc" <?php if ($sort_by == 'partecipazioni_asc') echo 'selected'; ?>>Partecipazioni (Più basso)</option>
                    </select>
                </form>
            </div>
        </div>

        <!-- Visualizzazione della lista dei quiz o messaggio "nessun risultato" -->
        <?php if (empty($quizzes_to_display) && $total_quizzes === 0): // Nessun quiz trovato in assoluto ?>
            <div class="no-results card">
                <p><i class="fas fa-info-circle"></i>
                    <?php if ($is_search_active): ?>
                        Nessun quiz trovato con i criteri specificati.
                    <?php else: ?>
                        Nessun quiz disponibile al momento.
                    <?php endif; ?>
                </p>
                <?php if ($is_search_active): // Se è una ricerca, offre di azzerare i filtri ?>
                    <p><a href="index.php" class="text-link">Azzera filtri e visualizza tutti i quiz</a></p>
                <?php endif; ?>
            </div>
        <?php elseif (!empty($quizzes_to_display)): // Se ci sono quiz da visualizzare ?>
            <div class="quiz-list"> <!-- Griglia di card per i quiz -->
                <?php foreach ($quizzes_to_display as $quiz): ?>
                    <div class="quiz-item card">
                        <h3 class="quiz-title"><?php echo htmlspecialchars($quiz['titolo'], ENT_QUOTES, 'UTF-8'); ?></h3>
                        <div class="quiz-meta"> <!-- Informazioni meta del quiz -->
                            <p><i class="fas fa-user"></i>Creato da:  
                                <strong><?php echo htmlspecialchars($quiz['nome'] . ' ' . $quiz['cognome'], ENT_QUOTES, 'UTF-8'); ?></strong></p>
                            <p><i class="far fa-calendar-alt"></i> Dal  
                                <strong><?php echo date('d/m/Y', strtotime($quiz['dataInizio'])); ?></strong>   al  
                                <strong><?php echo date('d/m/Y', strtotime($quiz['dataFine'])); ?></strong></p>
                            <p><i class="fas fa-users"></i> Partecipazioni:
                                <strong><?php echo $quiz['num_partecipazioni']; ?></strong></p>

                            <?php // Badge di stato del quiz (Disponibile, Prossimamente, Scaduto)
                            $now_dt = new DateTime();
                            $dataInizio_dt = new DateTime($quiz['dataInizio']);
                            $dataFine_dt = (new DateTime($quiz['dataFine']))->setTime(23, 59, 59); // Considera fino alla fine del giorno.

                            if ($now_dt >= $dataInizio_dt && $now_dt <= $dataFine_dt) {
                                echo '<span class="status-badge available"><i class="fas fa-check-circle"></i> Disponibile</span>';
                            } elseif ($now_dt < $dataInizio_dt) {
                                echo '<span class="status-badge pending"><i class="fas fa-clock"></i> Prossimamente</span>';
                            } else {
                                echo '<span class="status-badge expired"><i class="fas fa-times-circle"></i> Scaduto</span>';
                            }
                            ?>
                        </div>
                        <div class="quiz-actions"> <!-- Bottoni di azione per il quiz -->
                            <a href="quiz_view.php?id=<?php echo $quiz['codice']; ?>" class="btn"><i class="fas fa-eye"></i>
                                Visualizza</a>
                            <?php if (isset($_SESSION['user']) && ($now_dt >= $dataInizio_dt && $now_dt <= $dataFine_dt)): // Bottone "Partecipa" solo se loggato e quiz attivo ?>
                                <a href="quiz_participate.php?id=<?php echo $quiz['codice']; ?>" class="btn btn-secondary"><i
                                        class="fas fa-play"></i> Partecipa</a>
                            <?php endif; ?>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>

            <?php // --- Paginazione ---
            if ($total_pages > 1): // Mostra la paginazione solo se c'è più di una pagina.
            ?>
                <nav class="pagination" aria-label="Paginazione risultati">
                    <div class="pagination-wrapper">
                        <div class="pagination-info"> <!-- Info sulla paginazione -->
                            <i class="fas fa-list-ol"></i>
                            Visualizzazione <?php echo ($offset + 1); ?>-<?php echo min($offset + $per_page, $total_quizzes); ?>
                            di <?php echo $total_quizzes; ?> quiz
                        </div>
                        <div class="pagination-controls"> <!-- Controlli di navigazione pagina -->
                            <?php
                            // Funzione helper per generare URL di paginazione mantenendo i filtri correnti.
                            if (!function_exists('getPaginationUrl')) { // Definisce la funzione solo se non esiste già.
                                function getPaginationUrl($page_num_target) {
                                    $current_params = $_GET; // Parametri GET correnti.
                                    $current_params['page'] = $page_num_target; // Imposta la nuova pagina.
                                    return 'index.php?' . http_build_query($current_params); // Costruisce l'URL.
                                }
                            }
                            ?>
                            <div class="compact-pagination" role="navigation" aria-label="Navigazione pagine">
                                <!-- Bottone "Precedente" -->
                                <?php if ($page > 1): ?>
                                    <a href="<?php echo getPaginationUrl($page - 1); ?>" class="page-item page-nav"
                                        title="Pagina precedente">
                                        <i class="fas fa-chevron-left"></i> Prec
                                    </a>
                                <?php else: ?>
                                    <span class="page-item page-nav disabled" title="Sei alla prima pagina">
                                        <i class="fas fa-chevron-left"></i> Prec
                                    </span>
                                <?php endif; ?>

                                <?php // Link ai numeri di pagina (con logica per puntini "...")
                                $links_range = 2; // Quanti link mostrare prima e dopo la pagina corrente.
                                $show_first_last = true; // Se mostrare sempre il link alla prima e ultima pagina.

                                for ($i = 1; $i <= $total_pages; $i++) {
                                    // Mostra il link se è la prima, l'ultima, o vicino alla pagina corrente.
                                    if ($i == 1 || $i == $total_pages || ($i >= $page - $links_range && $i <= $page + $links_range)) {
                                        if ($page == $i) { // Pagina corrente (attiva).
                                            echo '<span class="page-item active" aria-current="page">' . $i . '</span>';
                                        } else { // Altre pagine.
                                            echo '<a href="' . getPaginationUrl($i) . '" class="page-item" title="Vai a pagina ' . $i . '">' . $i . '</a>';
                                        }
                                    } elseif ( // Logica per i puntini di sospensione "...".
                                        ($i == $page - $links_range - 1 && $page - $links_range > 2 && $show_first_last) ||
                                        ($i == $page + $links_range + 1 && $page + $links_range < $total_pages - 1 && $show_first_last)
                                    ) {
                                        echo '<span class="page-dots">...</span>';
                                    }
                                }
                                ?>

                                <!-- Bottone "Successivo" -->
                                <?php if ($page < $total_pages): ?>
                                    <a href="<?php echo getPaginationUrl($page + 1); ?>" class="page-item page-nav"
                                        title="Pagina successiva">
                                        Succ <i class="fas fa-chevron-right"></i>
                                    </a>
                                <?php else: ?>
                                    <span class="page-item page-nav disabled" title="Sei all'ultima pagina">
                                        Succ <i class="fas fa-chevron-right"></i>
                                    </span>
                                <?php endif; ?>
                            </div>
                        </div>
                    </div>
                </nav>
            <?php endif; // Fine paginazione ?>
        <?php endif; // Fine controllo $quizzes_to_display ?>
    </div> <!-- Fine .content -->
</div> <!-- Fine .main-content -->

<?php 
// Include il footer comune.
include 'includes/footer.php'; 
?>
<!-- La chiusura del tag </body> è in footer.php -->
</html>