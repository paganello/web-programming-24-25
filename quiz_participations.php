<?php
/**
 * Pagina di visualizzazione delle partecipazioni dell'utente.
 * Logica di paginazione e recupero dati gestita server-side in questa pagina.
 */

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Se l'utente non è loggato, reindirizza alla pagina di login.
if (!isset($_SESSION['user']['nomeUtente'])) {
    $_SESSION['error_message'] = "Devi essere loggato per vedere le tue partecipazioni.";
    header('Location: auth_login.php');
    exit;
}

require_once 'config/database.php'; // Assicurati del percorso
$nomeUtente = $_SESSION['user']['nomeUtente'];
$dbError = null;

// --- PARAMETRI PAGINAZIONE ---
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
$valid_per_page_options_participations = [5, 10, 20, 50, 100];
$per_page = isset($_GET['per_page']) ? (int)$_GET['per_page'] : 10;

if ($page < 1) $page = 1;
if (!in_array($per_page, $valid_per_page_options_participations)) $per_page = 10;

$total_participations = 0;
try {
    $count_sql = "SELECT COUNT(*) as total FROM Partecipazione WHERE utente = :nomeUtente";
    $count_stmt = $pdo->prepare($count_sql);
    $count_stmt->bindParam(':nomeUtente', $nomeUtente, PDO::PARAM_STR);
    $count_stmt->execute();
    $total_participations = (int)$count_stmt->fetch(PDO::FETCH_ASSOC)['total'];
} catch (PDOException $e) {
    error_log("Errore conteggio partecipazioni per utente $nomeUtente: " . $e->getMessage());
    $dbError = "Si è verificato un errore durante il recupero del numero di partecipazioni.";
}

$total_pages = ($total_participations > 0) ? ceil($total_participations / $per_page) : 1;
if ($page > $total_pages && $total_participations > 0) $page = $total_pages; // Se la pagina richiesta è oltre, vai all'ultima
if ($page < 1 && $total_participations > 0) $page = 1; // Se la pagina richiesta è prima della prima, vai alla prima
elseif ($total_participations === 0) $page = 1; // Se non ci sono risultati, la pagina è 1


$offset = ($page - 1) * $per_page;

$participations_to_display = [];
if (!$dbError) {
    try {
        $sql = "SELECT
                    P.codice AS partecipazione_id, Q.titolo AS quiz_titolo, Q.codice AS quiz_id,
                    DATE_FORMAT(P.data, '%d/%m/%Y') AS data_partecipazione,
                    COALESCE(SUM(R.punteggio), 0) AS punteggio_ottenuto,
                    (SELECT COALESCE(SUM(R_total.punteggio), 0)
                     FROM Domanda D_total
                     JOIN Risposta R_total ON D_total.quiz = R_total.quiz AND D_total.numero = R_total.domanda
                     WHERE D_total.quiz = Q.codice AND R_total.tipo = 'Corretta') AS punteggio_massimo_quiz
                FROM Partecipazione P
                JOIN Quiz Q ON P.quiz = Q.codice
                LEFT JOIN RispostaUtenteQuiz RUQ ON P.codice = RUQ.partecipazione
                LEFT JOIN Risposta R ON RUQ.quiz = R.quiz AND RUQ.domanda = R.domanda AND RUQ.risposta = R.numero AND R.tipo = 'Corretta'
                WHERE P.utente = :nomeUtente
                GROUP BY P.codice, Q.titolo, Q.codice, P.data
                ORDER BY P.data DESC, P.codice DESC
                LIMIT :offset, :per_page";

        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':nomeUtente', $nomeUtente, PDO::PARAM_STR);
        $stmt->bindParam(':offset', $offset, PDO::PARAM_INT);
        $stmt->bindParam(':per_page', $per_page, PDO::PARAM_INT);
        $stmt->execute();
        $participations_to_display = $stmt->fetchAll(PDO::FETCH_ASSOC);

    } catch (PDOException $e) {
        error_log("Errore recupero partecipazioni per utente $nomeUtente: " . $e->getMessage() . " | Query: " . $sql);
        $dbError = "Si è verificato un errore durante il recupero delle partecipazioni.";
        $participations_to_display = []; // Assicura che sia un array vuoto in caso di errore
    }
}

require_once 'includes/header.php';
?>

<div class="container" style="padding-top: 20px; padding-bottom: 40px;">

    <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 20px; padding-bottom: 15px; border-bottom: 1px solid var(--border-color); flex-wrap: wrap; gap: 15px;">
        <div style="display: flex; align-items: center;">
            <i class="fas fa-tasks" style="font-size: 1.8rem; margin-right: 12px; color: var(--main-color);"></i>
            <h2 style="font-size: 1.8rem; color: var(--dark-color); margin: 0; line-height: 1.3;">
                Le Mie Partecipazioni
                <?php if ($total_participations > 0): ?>
                    <small style="font-size: 0.85em; color: var(--text-muted); font-weight: normal; margin-left: 10px;">
                        (<?php echo $total_participations; ?> total<?php echo ($total_participations !== 1) ? 'i':'e'; ?>)
                    </small>
                <?php endif; ?>
            </h2>
        </div>

        <?php if ($total_participations > 0): // Mostra se ci sono partecipazioni, anche se solo per 1 pagina ?>
            <div class="controls-container" style="margin-bottom: 0;">
                <form method="GET" id="per-page-form-participations" action="quiz_participations.php" style="display: flex; align-items: center; margin:0;">
                    <?php
                        foreach ($_GET as $key => $value) {
                            if ($key !== 'per_page' && $key !== 'page') {
                                echo '<input type="hidden" name="' . htmlspecialchars($key) . '" value="' . htmlspecialchars($value) . '">';
                            }
                        }
                    ?>
                    <label for="per_page_select_participations" style="font-size: 0.9rem; color: var(--text-dark); font-weight: 500; margin-right: 8px; white-space: nowrap;">
                        <i class="fas fa-list-ul" style="margin-right: 4px;"></i>Elementi:
                    </label>
                    <select id="per_page_select_participations" name="per_page" aria-label="Elementi per pagina"
                            style="padding: 7px 10px; font-size: 0.9rem; border: 1px solid var(--border-color, #ced4da); border-radius: 4px; background-color: #fff; color: var(--text-dark); cursor:pointer; min-width: 60px;"
                            onchange="this.form.submit()">
                        <?php foreach ($valid_per_page_options_participations as $option): ?>
                            <option value="<?php echo $option; ?>" <?php if ($per_page == $option) echo 'selected'; ?>><?php echo $option; ?></option>
                        <?php endforeach; ?>
                    </select>
                </form>
            </div>
        <?php endif; ?>
    </div>

    <div id="alert-container-participations" class="custom-alert-container-static" style="margin-bottom: 20px;" aria-live="polite">
        <?php // Questo blocco PHP gestisce gli alert da sessionStorage o errori DB ?>
        <?php
        if (isset($_SESSION['participationMessage'])) {
            $message_text = htmlspecialchars($_SESSION['participationMessage']);
            $message_type = htmlspecialchars($_SESSION['participationMessageType'] ?? 'success');
            echo "<div class=\"custom-alert custom-alert-{$message_type}\" role=\"alert\">
                    <span class=\"custom-alert-message\">{$message_text}</span>
                    <button type=\"button\" class=\"custom-alert-close\" aria-label=\"Close\" onclick=\"this.parentElement.style.display='none';\">×</button>
                  </div>";
            unset($_SESSION['participationMessage']);
            unset($_SESSION['participationMessageType']);
        } elseif (isset($_SESSION['info_message'])) { // Aggiunto per gestire info_message se lo usi qui
             $message_text = htmlspecialchars($_SESSION['info_message']);
             echo "<div class=\"custom-alert custom-alert-info\" role=\"alert\">
                    <span class=\"custom-alert-message\">{$message_text}</span>
                    <button type=\"button\" class=\"custom-alert-close\" aria-label=\"Close\" onclick=\"this.parentElement.style.display='none';\">×</button>
                  </div>";
            unset($_SESSION['info_message']);
        }
        ?>
        <?php if ($dbError): ?>
            <div class="custom-alert custom-alert-danger" role="alert">
                <i class="fas fa-exclamation-triangle" style="margin-right: 8px;"></i>
                <?php echo htmlspecialchars($dbError); ?>
            </div>
        <?php endif; ?>
    </div>

    <div id="participations-container">
        <?php if (!$dbError && empty($participations_to_display) && $total_participations === 0): ?>
            <div class="no-results" style="text-align: center; padding: 25px; border: 1px dashed var(--border-color); border-radius: 8px; background-color: var(--background-card);">
                <i class="fas fa-meh" style="font-size: 3rem; color: var(--text-muted); margin-bottom: 15px; display: block;"></i>
                <p style="font-size: 1.1rem; color: var(--text-dark); margin-bottom: 8px;">Non hai ancora partecipato a nessun quiz.</p>
                <p style="font-size: 0.95rem; color: var(--text-muted); margin-bottom: 25px;">Esplora i quiz disponibili e mettiti alla prova!</p>
                <a href="index.php" class="btn button-primary-styled">
                    <i class="fas fa-search" style="margin-right: 6px;"></i> Vedi i Quiz
                </a>
            </div>
        <?php elseif (!$dbError && empty($participations_to_display) && $total_participations > 0): ?>
             <div class="no-results card">
                <p><i class="fas fa-info-circle"></i> Nessuna partecipazione da visualizzare in questa pagina.</p>
                <p><a href="quiz_participations.php" class="text-link">Torna alla prima pagina delle tue partecipazioni</a></p>
            </div>
        <?php elseif (!empty($participations_to_display)): ?>
            <?php foreach ($participations_to_display as $p): ?>
                <?php
                    $scorePercentage = 0;
                    if (isset($p['punteggio_massimo_quiz']) && $p['punteggio_massimo_quiz'] > 0) { // Aggiunto isset
                        $scorePercentage = ($p['punteggio_ottenuto'] / $p['punteggio_massimo_quiz']) * 100;
                    }
                    $scoreClass = '';
                    if (isset($p['punteggio_massimo_quiz']) && $p['punteggio_massimo_quiz'] > 0) { // Aggiunto isset
                        if ($scorePercentage >= 75) $scoreClass = 'text-success';
                        else if ($scorePercentage >= 50) $scoreClass = 'text-warning';
                        else $scoreClass = 'text-danger';
                    }
                    $scorePercentage_formatted = number_format($scorePercentage, 1);

                    $scoreText = (isset($p['punteggio_massimo_quiz']) && $p['punteggio_massimo_quiz'] > 0) ?
                        "<span class=\"score-value {$scoreClass}\">" . htmlspecialchars($p['punteggio_ottenuto']) . "</span> / <span class=\"score-max\">" . htmlspecialchars($p['punteggio_massimo_quiz']) . "</span> punti ({$scorePercentage_formatted}%)" :
                        (isset($p['punteggio_ottenuto']) && $p['punteggio_ottenuto'] > 0 ? "<span class=\"score-value\">" . htmlspecialchars($p['punteggio_ottenuto']) . "</span> punti (massimo non calcolabile)" : "Punteggio non disponibile");
                ?>
                <div class="participation-card card-hover-effect card">
                    <div class="participation-header">
                        <h3 class="participation-title">
                            <a href="quiz_view.php?id=<?php echo htmlspecialchars($p['quiz_id']); ?>" title="Vedi dettagli quiz"><?php echo htmlspecialchars($p['quiz_titolo'] ?: 'Quiz Senza Titolo'); ?></a>
                        </h3>
                        <span class="participation-date"><i class="fas fa-calendar-alt"></i> <?php echo htmlspecialchars($p['data_partecipazione'] ?: 'N/D'); ?></span>
                    </div>
                    <div class="participation-details">
                        <p class="participation-score">
                            <strong><i class="fas fa-star"></i> Punteggio:</strong> <?php echo $scoreText; ?>
                        </p>
                        <?php if (isset($p['punteggio_massimo_quiz']) && $p['punteggio_massimo_quiz'] > 0): ?>
                        <div class="progress-bar-container-custom" style="height: 10px; background-color: #e9ecef; border-radius: .25rem; margin-top: 5px;">
                            <div class="progress-bar-custom <?php echo $scorePercentage >= 75 ? 'bg-success' : ($scorePercentage >= 50 ? 'bg-warning' : 'bg-danger'); ?>"
                                 role="progressbar"
                                 style="width: <?php echo $scorePercentage_formatted; ?>%; height: 100%; border-radius: .25rem; transition: width 0.5s ease-in-out;"
                                 aria-valuenow="<?php echo $scorePercentage_formatted; ?>"
                                 aria-valuemin="0"
                                 aria-valuemax="100">
                            </div>
                        </div>
                        <?php endif; ?>
                    </div>
                    <div class="participation-actions text-align-right" style="margin-top: 15px;">
                        <a href="quiz_results.php?participation_id=<?php echo htmlspecialchars($p['partecipazione_id']); ?>" class="btn btn-sm button-primary-styled">
                            <i class="fas fa-poll-h"></i> Vedi Risultati
                        </a>
                    </div>
                </div>
            <?php endforeach; ?>
        <?php endif; ?>
    </div>

    <?php if (!$dbError && $total_pages > 1): ?>
        <nav class="pagination" aria-label="Paginazione delle tue partecipazioni" style="margin-top: 30px;">
            <div class="pagination-wrapper">
                <div class="pagination-info">
                    <i class="fas fa-list-ol"></i>
                    Visualizzazione <?php echo ($offset + 1); ?>-<?php echo min($offset + $per_page, $total_participations); ?> di <?php echo $total_participations; ?> partecipazioni
                </div>
                <div class="pagination-controls">
                    <?php
                    if (!function_exists('getParticipationPaginationUrl')) {
                        function getParticipationPaginationUrl($page_num_target) {
                            $current_params = $_GET;
                            $current_params['page'] = $page_num_target;
                            return 'quiz_participations.php?' . http_build_query($current_params);
                        }
                    }
                    ?>
                    <div class="compact-pagination" role="navigation" aria-label="Navigazione pagine">
                        <?php if ($page > 1): ?>
                            <a href="<?php echo getParticipationPaginationUrl($page - 1); ?>" class="page-item page-nav" title="Pagina precedente">
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
                                    echo '<a href="' . getParticipationPaginationUrl($i) . '" class="page-item" title="Vai a pagina ' . $i . '">' . $i . '</a>';
                                }
                            } elseif (($i == $page - $links_range - 1 && $page - $links_range > 2 && $show_first_last) ||
                                      ($i == $page + $links_range + 1 && $page + $links_range < $total_pages - 1 && $show_first_last)) {
                                echo '<span class="page-dots">...</span>';
                            }
                        }
                        ?>

                        <?php if ($page < $total_pages): ?>
                            <a href="<?php echo getParticipationPaginationUrl($page + 1); ?>" class="page-item page-nav" title="Pagina successiva">
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
    <?php endif; ?>

    <noscript>
        <div class="alert alert-warning" role="alert">
            JavaScript è disabilitato o non supportato dal tuo browser.
            Alcune funzionalità interattive potrebbero non essere disponibili.
        </div>
    </noscript>
</div>

<?php
include 'includes/footer.php';
?>