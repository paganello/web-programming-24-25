<?php
/**
 * Pagina "Le Mie Partecipazioni".
 *
 * Questa pagina elenca tutte le partecipazioni di un utente ai vari quiz,
 * mostrando il titolo del quiz, la data di partecipazione e il punteggio ottenuto.
 * Include funzionalità di paginazione per gestire un gran numero di partecipazioni.
 * Richiede che l'utente sia autenticato.
 */

// Assicura che la sessione sia attiva (può essere ridondante se header.php lo fa).
 if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// --- Controllo Autenticazione Utente ---
// Se l'utente non è loggato, salva un messaggio di errore in sessione
// e reindirizza alla pagina di login.
if (!isset($_SESSION['user']['nomeUtente'])) {
    $_SESSION['error_message'] = "Devi essere loggato per vedere le tue partecipazioni.";
    header('Location: auth_login.php');
    exit;
}

// Include la configurazione del database.
// Assicurarsi che il percorso sia corretto e che $pdo sia disponibile.
require_once 'config/database.php';
$nomeUtente = $_SESSION['user']['nomeUtente']; // Nome utente loggato.
$dbError = null; // Variabile per gestire eventuali errori del database.

// --- PARAMETRI DI PAGINAZIONE ---
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1; // Pagina corrente, default 1.
$valid_per_page_options_participations = [5, 10, 20, 50, 100]; // Opzioni valide per "elementi per pagina".
$per_page = isset($_GET['per_page']) ? (int)$_GET['per_page'] : 10; // Elementi per pagina, default 10.

// Validazione dei parametri di paginazione.
if ($page < 1) $page = 1;
if (!in_array($per_page, $valid_per_page_options_participations)) $per_page = 10; // Ripristina default.

// --- CONTEGGIO TOTALE PARTECIPAZIONI DELL'UTENTE ---
// Query per contare il numero totale di partecipazioni per l'utente (per la paginazione).
$total_participations = 0;
try {
    $count_sql = "SELECT COUNT(*) as total FROM Partecipazione WHERE utente = :nomeUtente";
    $count_stmt = $pdo->prepare($count_sql);
    $count_stmt->bindParam(':nomeUtente', $nomeUtente, PDO::PARAM_STR);
    $count_stmt->execute();
    $total_participations = (int)$count_stmt->fetch(PDO::FETCH_ASSOC)['total']; // Recupera il totale.
} catch (PDOException $e) {
    error_log("Errore conteggio partecipazioni per utente $nomeUtente (quiz_participations.php): " . $e->getMessage());
    $dbError = "Si è verificato un errore durante il recupero del numero di partecipazioni.";
}

// Calcola il numero totale di pagine e corregge il numero di pagina corrente se fuori range.
$total_pages = ($total_participations > 0) ? ceil($total_participations / $per_page) : 1;
if ($page > $total_pages && $total_participations > 0) $page = $total_pages;
if ($page < 1 && $total_participations > 0) $page = 1;
elseif ($total_participations === 0) $page = 1; // Se non ci sono risultati, la pagina è 1.

// Calcola l'offset per la clausola LIMIT della query.
$offset = ($page - 1) * $per_page;

// --- RECUPERO DELLE PARTECIPAZIONI DA VISUALIZZARE ---
$participations_to_display = []; // Inizializza l'array.
if (!$dbError) { // Procede solo se non ci sono stati errori precedenti.
    try {
        // Query per selezionare le partecipazioni dell'utente, con dettagli del quiz e punteggio.
        // Il punteggio massimo del quiz viene calcolato con una subquery.
        $sql = "SELECT
                    P.codice AS partecipazione_id, Q.titolo AS quiz_titolo, Q.codice AS quiz_id,
                    DATE_FORMAT(P.data, '%d/%m/%Y') AS data_partecipazione, -- Formatta la data.
                    COALESCE(SUM(R.punteggio), 0) AS punteggio_ottenuto, -- Somma i punteggi delle risposte corrette date.
                    (SELECT COALESCE(SUM(R_total.punteggio), 0) -- Subquery per il punteggio massimo possibile.
                     FROM Domanda D_total
                     JOIN Risposta R_total ON D_total.quiz = R_total.quiz AND D_total.numero = R_total.domanda
                     WHERE D_total.quiz = Q.codice AND R_total.tipo = 'Corretta') AS punteggio_massimo_quiz
                FROM Partecipazione P
                JOIN Quiz Q ON P.quiz = Q.codice
                LEFT JOIN RispostaUtenteQuiz RUQ ON P.codice = RUQ.partecipazione
                LEFT JOIN Risposta R ON RUQ.quiz = R.quiz AND RUQ.domanda = R.domanda AND RUQ.risposta = R.numero AND R.tipo = 'Corretta'
                WHERE P.utente = :nomeUtente
                GROUP BY P.codice, Q.titolo, Q.codice, P.data -- Raggruppa per partecipazione.
                ORDER BY P.data DESC, P.codice DESC -- Ordina per data (più recenti prima).
                LIMIT :offset, :per_page"; // Applica paginazione.

        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':nomeUtente', $nomeUtente, PDO::PARAM_STR);
        $stmt->bindParam(':offset', $offset, PDO::PARAM_INT);
        $stmt->bindParam(':per_page', $per_page, PDO::PARAM_INT);
        $stmt->execute();
        $participations_to_display = $stmt->fetchAll(PDO::FETCH_ASSOC); // Recupera le partecipazioni.
    } catch (PDOException $e) {
        error_log("Errore recupero partecipazioni per utente $nomeUtente (quiz_participations.php): " . $e->getMessage() . " | Query: " . $sql);
        $dbError = "Si è verificato un errore durante il recupero delle partecipazioni.";
        $participations_to_display = []; // Svuota array in caso di errore.
    }
}

// Include l'header HTML comune.
require_once 'includes/header.php';
?>

<!-- Contenitore principale della pagina con padding globale -->
<div class="container main-content-area" style="padding-top: 30px; padding-bottom: 50px;">

    <!-- Header della pagina con titolo, conteggio e controllo "Elementi per pagina" -->
    <div class="page-header-controls">
        <div class="page-title-container">
            <i class="fas fa-tasks page-title-icon"></i> <!-- Icona per "Le Mie Partecipazioni" -->
            <h1 class="page-main-title">
                Le Mie Partecipazioni
                <?php if ($total_participations > 0): // Mostra conteggio se ci sono partecipazioni ?>
                    <span class="total-count-badge">(<?php echo $total_participations; ?> total<?php echo ($total_participations !== 1) ? 'i':'e'; ?>)</span>
                <?php endif; ?>
            </h1>
        </div>

        <?php if ($total_participations > 0): // Mostra controllo "Elementi per pagina" se ci sono partecipazioni ?>
            <div class="per-page-controls-container"> <!-- Contenitore per il form del select -->
                <form method="GET" id="per-page-form-participations" action="quiz_participations.php" class="per-page-form">
                    <?php // Mantiene i parametri GET esistenti quando si cambia 'per_page'.
                        foreach ($_GET as $key => $value) {
                            if ($key !== 'per_page' && $key !== 'page') {
                                echo '<input type="hidden" name="' . htmlspecialchars($key, ENT_QUOTES, 'UTF-8') . '" value="' . htmlspecialchars($value, ENT_QUOTES, 'UTF-8') . '">';
                            }
                        }
                    ?>
                    <label for="per_page_select_participations" class="per-page-label">
                        <i class="fas fa-list-ul"></i>Elementi:
                    </label>
                    <select id="per_page_select_participations" name="per_page" class="per-page-select custom-select-styled"
                            aria-label="Elementi per pagina"
                            onchange="this.form.submit()"> <!-- Invia il form al cambio -->
                        <?php foreach ($valid_per_page_options_participations as $option): ?>
                            <option value="<?php echo $option; ?>" <?php if ($per_page == $option) echo 'selected'; ?>><?php echo $option; ?></option>
                        <?php endforeach; ?>
                    </select>
                </form>
            </div>
        <?php endif; ?>
    </div>

    <!-- Contenitore per gli alert JavaScript -->
    <div id="alert-container-participations" class="custom-alert-container-static" style="margin-bottom: 20px;" aria-live="polite">
        <?php // Alert PHP potrebbero essere inseriti qui se necessario, ma showAlert JS è preferito. ?>
    </div>

    <!-- Lista delle partecipazioni o messaggi appropriati -->
    <div id="participations-list-container">
        <?php if ($dbError): // Se si è verificato un errore database ?>
            <div class="alert alert-danger" role="alert">
                <i class="fas fa-exclamation-triangle" style="margin-right: 8px;"></i> 
                <?php echo htmlspecialchars($dbError, ENT_QUOTES, 'UTF-8'); ?>
            </div>
        <?php elseif (empty($participations_to_display) && $total_participations === 0): // Se l'utente non ha partecipazioni ?>
            <div class="no-results-box card">
                <div class="no-results-icon"><i class="fas fa-meh"></i></div>
                <h3 class="no-results-title">Nessuna Partecipazione Trovata</h3>
                <p class="no-results-text">Non hai ancora partecipato a nessun quiz. <br>Esplora i quiz disponibili e mettiti alla prova!</p>
                <a href="index.php" class="btn button-primary-styled btn-lg">
                    <i class="fas fa-search"></i> Vedi i Quiz
                </a>
            </div>
        <?php elseif (empty($participations_to_display) && $total_participations > 0): // Se pagina non valida ?>
             <div class="no-results-box card">
                <div class="no-results-icon"><i class="fas fa-info-circle"></i></div>
                <p class="no-results-text">Nessuna partecipazione da visualizzare in questa pagina.</p>
                <p><a href="quiz_participations.php" class="text-link">Torna alla prima pagina</a></p>
            </div>
        <?php elseif (!empty($participations_to_display)): // Se ci sono partecipazioni da visualizzare ?>
            <div class="participations-grid"> <!-- Griglia per le card delle partecipazioni -->
            <?php foreach ($participations_to_display as $p): ?>
                <?php
                    // Calcolo percentuale punteggio e classe CSS per la barra di progresso.
                    $scorePercentage = 0;
                    if (isset($p['punteggio_massimo_quiz']) && $p['punteggio_massimo_quiz'] > 0) {
                        $scorePercentage = ($p['punteggio_ottenuto'] / $p['punteggio_massimo_quiz']) * 100;
                    }
                    $scoreClass = ''; // Classe per il colore del testo del punteggio.
                    $progressBarClass = ''; // Classe per il colore della barra di progresso.
                    if (isset($p['punteggio_massimo_quiz']) && $p['punteggio_massimo_quiz'] > 0) {
                        if ($scorePercentage >= 75) { $scoreClass = 'score-high'; $progressBarClass = 'progress-bar-success'; }
                        else if ($scorePercentage >= 50) { $scoreClass = 'score-medium'; $progressBarClass = 'progress-bar-warning'; }
                        else { $scoreClass = 'score-low'; $progressBarClass = 'progress-bar-danger'; }
                    }
                    $scorePercentage_formatted = number_format($scorePercentage, 1, '.', ''); // Formatta percentuale.

                    // Testo del punteggio da visualizzare.
                    $scoreText = (isset($p['punteggio_massimo_quiz']) && $p['punteggio_massimo_quiz'] > 0) ?
                        "<span class=\"score-value {$scoreClass}\">" . htmlspecialchars($p['punteggio_ottenuto'], ENT_QUOTES, 'UTF-8') . "</span> / <span class=\"score-max\">" . htmlspecialchars($p['punteggio_massimo_quiz'], ENT_QUOTES, 'UTF-8') . "</span> <span class='score-unit'>punti</span> <span class='score-percentage'>({$scorePercentage_formatted}%)</span>" :
                        (isset($p['punteggio_ottenuto']) && $p['punteggio_ottenuto'] > 0 ? "<span class=\"score-value\">" . htmlspecialchars($p['punteggio_ottenuto'], ENT_QUOTES, 'UTF-8') . "</span> <span class='score-unit'>punti (max non calcolabile)</span>" : "<span class='score-unavailable'>Punteggio non disponibile</span>");
                ?>
                <div class="participation-card card"> <!-- Card per ogni partecipazione -->
                    <div class="card-header participation-card-header">
                        <h3 class="participation-card-title">
                            <a href="quiz_view.php?id=<?php echo htmlspecialchars($p['quiz_id'], ENT_QUOTES, 'UTF-8'); ?>"><?php echo htmlspecialchars($p['quiz_titolo'] ?: 'Quiz Senza Titolo', ENT_QUOTES, 'UTF-8'); ?></a>
                        </h3>
                        <span class="participation-card-date">
                            <i class="far fa-calendar-alt"></i> <!-- Icona calendario -->
                            <?php echo htmlspecialchars($p['data_partecipazione'] ?: 'N/D', ENT_QUOTES, 'UTF-8'); ?>
                        </span>
                    </div>
                    <div class="card-body participation-card-body">
                        <div class="participation-score-section"> <!-- Sezione punteggio -->
                            <div class="score-label"><i class="fas fa-star"></i> Punteggio Ottenuto:</div>
                            <div class="score-display"><?php echo $scoreText; // Sanitizzato sopra ?></div>
                        </div>
                        <?php if (isset($p['punteggio_massimo_quiz']) && $p['punteggio_massimo_quiz'] > 0): // Mostra barra solo se punteggio max è calcolabile ?>
                        <div class="progress-bar-container">
                            <div class="progress-bar <?php echo $progressBarClass; ?>" 
                                 role="progressbar"
                                 style="width: <?php echo htmlspecialchars($scorePercentage_formatted, ENT_QUOTES, 'UTF-8'); ?>%;"
                                 aria-valuenow="<?php echo htmlspecialchars($scorePercentage_formatted, ENT_QUOTES, 'UTF-8'); ?>"
                                 aria-valuemin="0"
                                 aria-valuemax="100">
                                 <!-- Il testo % può essere aggiunto qui o gestito con ::after in CSS se necessario -->
                            </div>
                        </div>
                        <?php endif; ?>
                    </div>
                    <div class="card-footer participation-card-actions"> <!-- Azioni per la partecipazione -->
                        <a href="quiz_results.php?participation_id=<?php echo htmlspecialchars($p['partecipazione_id'], ENT_QUOTES, 'UTF-8'); ?>" class="btn button-primary-styled btn-sm"> <!-- btn-sm per coerenza -->
                            <i class="fas fa-poll-h"></i> Vedi Risultati
                        </a>
                    </div>
                </div> <!-- fine .participation-card -->
            <?php endforeach; ?>
            </div> <!-- fine .participations-grid -->
        <?php endif; ?>
    </div> <!-- fine #participations-list-container -->

    <?php if (!$dbError && $total_pages > 1): // Mostra paginazione se più di una pagina ?>
        <nav class="pagination-container" aria-label="Paginazione delle tue partecipazioni">
            <div class="pagination-wrapper">
                <div class="pagination-info">
                    <i class="fas fa-list-ol"></i>
                    <span>Visualizzazione <?php echo ($offset + 1); ?>-<?php echo min($offset + $per_page, $total_participations); ?> di <?php echo $total_participations; ?> partecipazioni</span>
                </div>
                <div class="pagination-controls">
                    <?php // La logica PHP per generare i link di paginazione è mantenuta come fornita.
                          // Assicurarsi che la funzione getMyQuizPaginationUrl sia definita o inclusa.
                        if (!function_exists('getMyQuizPaginationUrl')) {
                            function getMyQuizPaginationUrl($page_num_target) {
                                $current_params = $_GET;
                                $current_params['page'] = $page_num_target;
                                return 'quiz_participations.php?' . http_build_query($current_params);
                            }
                        }
                    ?>
                    <div class="compact-pagination" role="navigation" aria-label="Navigazione pagine">
                        <?php if ($page > 1): ?>
                            <a href="<?php echo getMyQuizPaginationUrl($page - 1); ?>" class="page-item page-nav" title="Pagina precedente">
                                <i class="fas fa-chevron-left"></i> Prec
                            </a>
                        <?php else: ?>
                            <span class="page-item page-nav disabled" title="Sei alla prima pagina">
                                <i class="fas fa-chevron-left"></i> Prec
                            </span>
                        <?php endif; ?>

                        <?php
                        $links_range = 2;
                        $show_first_last = true;
                        for ($i = 1; $i <= $total_pages; $i++) {
                            if ($i == 1 || $i == $total_pages || ($i >= $page - $links_range && $i <= $page + $links_range)) {
                                if ($page == $i) {
                                    echo '<span class="page-item active" aria-current="page">' . $i . '</span>';
                                } else {
                                    echo '<a href="' . getMyQuizPaginationUrl($i) . '" class="page-item" title="Vai a pagina ' . $i . '">' . $i . '</a>';
                                }
                            }
                            elseif (($i == $page - $links_range - 1 && $page - $links_range > 2 && $show_first_last) ||
                                    ($i == $page + $links_range + 1 && $page + $links_range < $total_pages - 1 && $show_first_last)) {
                                echo '<span class="page-dots">...</span>';
                            }
                        }
                        ?>

                        <?php if ($page < $total_pages): ?>
                            <a href="<?php echo getMyQuizPaginationUrl($page + 1); ?>" class="page-item page-nav" title="Pagina successiva">
                                Succ <i class="fas fa-chevron-right"></i>
                            </a>
                        <?php else: ?>
                            <span class="page-item page-nav disabled" title="Sei all'ultima pagina">
                                Succ <i class="fas fa-chevron-right"></i>
                            </span>
                        <?php endif; ?>
                    </div> <!-- fine .compact-pagination -->
                </div> <!-- fine .pagination-controls -->
            </div> <!-- fine .pagination-wrapper -->
        </nav> <!-- fine .pagination-container -->
    <?php endif; ?>
</div> <!-- fine .container .main-content-area -->

<?php
// Include il footer HTML comune.
include 'includes/footer.php';
?>
<!-- La chiusura del tag </body> è in footer.php -->