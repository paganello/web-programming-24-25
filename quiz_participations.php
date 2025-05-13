<?php
/**
 * Pagina di visualizzazione delle partecipazioni dell'utente.
 *
 * Questa pagina mostra le partecipazioni dell'utente ai quiz.
 */

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

if (!isset($_SESSION['user']['nomeUtente'])) {
    header('Location: auth_login.php');
    exit;
}

// Parametri di default per la paginazione (saranno gestiti principalmente da JS)
$per_page = isset($_GET['per_page']) ? (int)$_GET['per_page'] : 10;
$valid_per_page_options_participations = [5, 10, 20, 50, 100]; // Rinomina per evitare conflitti se includi lo stesso header
if (!in_array($per_page, $valid_per_page_options_participations)) $per_page = 10;

require_once 'includes/header.php'; // Includi header comune
?>

<!-- Assicurati che main.js sia caricato, preferibilmente con defer -->
<!-- Se non è già in header.php o footer.php, aggiungi:
<script src="assets/js/main.js" defer></script> -->

<div class="container" style="padding-top: 20px; padding-bottom: 40px;">

    <!-- Riga del titolo e controllo "Elementi per pagina" -->
    <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 20px; padding-bottom: 15px; border-bottom: 1px solid var(--border-color); flex-wrap: wrap; gap: 15px;">
        <div style="display: flex; align-items: center;">
            <i class="fas fa-tasks" style="font-size: 1.8rem; margin-right: 12px; color: var(--main-color);"></i>
            <h2 style="font-size: 1.8rem; color: var(--dark-color); margin: 0; line-height: 1.3;">
                Le Mie Partecipazioni
                <small id="total-participations-count" style="font-size: 0.85em; color: var(--text-muted); font-weight: normal; margin-left: 10px; display: none;">
                    <!-- Il conteggio totale verrà inserito qui da JS -->
                </small>
            </h2>
        </div>

        <div class="controls-container" style="margin-bottom: 0; display: none;" id="per-page-controls-participations">
            <form method="GET" id="per-page-form-participations" action="quiz_participations.php" style="display: flex; align-items: center; margin:0;">
                 <?php
                    // Mantenere altri parametri GET se presenti (es. filtri futuri)
                    // Questa parte potrebbe essere gestita meglio da JS per la paginazione dinamica
                    // Per ora, è più semplice non includerla e lasciare che JS gestisca i parametri
                 ?>
                <label for="per_page_select_participations" style="font-size: 0.9rem; color: var(--text-dark); font-weight: 500; margin-right: 8px; white-space: nowrap;">
                    <i class="fas fa-list-ul" style="margin-right: 4px;"></i>Elementi:
                </label>
                <select id="per_page_select_participations" name="per_page" aria-label="Elementi per pagina"
                        style="padding: 7px 10px; font-size: 0.9rem; border: 1px solid var(--border-color, #ced4da); border-radius: 4px; background-color: #fff; color: var(--text-dark); cursor:pointer; min-width: 60px;">
                    <?php foreach ($valid_per_page_options_participations as $option): ?>
                        <option value="<?php echo $option; ?>" <?php if ($per_page == $option) echo 'selected'; ?>><?php echo $option; ?></option>
                    <?php endforeach; ?>
                </select>
            </form>
        </div>
    </div>

    <!-- CONTENITORE PER GLI ALERT -->
    <div id="alert-container-participations" class="custom-alert-container-static" style="margin-bottom: 20px;" aria-live="polite">
        <!-- Gli alert verranno inseriti qui da JavaScript -->
    </div>

    <!-- CONTENITORE PER LE PARTECIPAZIONI -->
    <div id="partecipations-container">
        <!-- Qui verranno caricate le partecipazioni dinamicamente -->
        <!-- Messaggio di caricamento iniziale -->
        <p class="loading-message text-align-center padding-vertical-medium" role="status">Caricamento delle tue partecipazioni...</p>
    </div>

    <!-- CONTENITORE PER LA PAGINAZIONE -->
    <nav id="pagination-container-participations" class="pagination" aria-label="Paginazione delle tue partecipazioni" style="margin-top: 30px; display: none;">
        <div class="pagination-wrapper">
            <div id="pagination-info-participations" class="pagination-info">
                <!-- Info paginazione qui da JS -->
            </div>
            <div id="pagination-controls-participations" class="pagination-controls">
                <!-- Controlli paginazione qui da JS -->
            </div>
        </div>
    </nav>

    <!-- Messaggio di fallback nel caso JS non carichi nulla (es. errore JS grave) -->
    <noscript>
        <div class="alert alert-warning" role="alert">
            JavaScript è disabilitato o non supportato dal tuo browser.
            La visualizzazione delle partecipazioni richiede JavaScript.
        </div>
    </noscript>

</div>

<?php
include 'includes/footer.php'; // Includi footer comune
?>