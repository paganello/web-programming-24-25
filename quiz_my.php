<?php
/**
 * Pagina "I Miei Quiz".
 *
 * Questa pagina visualizza un elenco dei quiz creati dall'utente attualmente
 * loggato. Offre funzionalità di paginazione e permette all'utente di
 * visualizzare i dettagli, modificare o eliminare ciascuno dei suoi quiz.
 */

// Include la configurazione del database.
// Se header.php lo include già, questa riga potrebbe essere ridondante ma non dannosa.
require_once 'config/database.php';

// Assicura che la sessione sia attiva (può essere ridondante se header.php lo fa).
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// --- Controllo Autenticazione Utente ---
// Se l'utente non è loggato, reindirizza alla pagina di login.
if (!isset($_SESSION['user']['nomeUtente'])) {
    header('Location: auth_login.php');
    exit; 
}
$nomeUtente = $_SESSION['user']['nomeUtente']; // Nome utente loggato.
$dbError = null; // Variabile per gestire eventuali errori del database.

// --- PARAMETRI DI PAGINAZIONE ---
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1; // Pagina corrente, default 1.
$per_page = isset($_GET['per_page']) ? (int)$_GET['per_page'] : 10; // Elementi per pagina, default 10.
$valid_per_page_options = [5, 10, 20, 50, 100]; // Opzioni valide per "elementi per pagina".

// Validazione dei parametri di paginazione.
if ($page < 1) $page = 1;
if (!in_array($per_page, $valid_per_page_options)) $per_page = 10; // Ripristina default se non valido.

// --- CONTEGGIO TOTALE QUIZ DELL'UTENTE ---
// Query per contare il numero totale di quiz creati dall'utente (per la paginazione).
$count_sql = "SELECT COUNT(*) as total 
              FROM Quiz AS Q
              WHERE Q.creatore = :nomeUtente";
$total_quizzes = 0;

try {
    $count_stmt = $pdo->prepare($count_sql);
    $count_stmt->bindParam(':nomeUtente', $nomeUtente, PDO::PARAM_STR);
    $count_stmt->execute();
    $total_quizzes = (int)$count_stmt->fetch(PDO::FETCH_ASSOC)['total']; // Recupera il totale.
} catch (PDOException $e) {
    error_log("Errore query conteggio quiz per utente $nomeUtente (quiz_my.php): " . $e->getMessage());
    $dbError = "Si è verificato un errore durante il recupero del numero di quiz.";
}

// Calcola il numero totale di pagine e corregge il numero di pagina corrente se fuori range.
$total_pages = ($total_quizzes > 0) ? ceil($total_quizzes / $per_page) : 1;
if ($page > $total_pages) $page = $total_pages; // Non andare oltre l'ultima pagina.
if ($page < 1 && $total_quizzes > 0) $page = 1; // Assicura che la pagina sia almeno 1 se ci sono quiz.
elseif ($total_quizzes === 0) $page = 1; // Se non ci sono quiz, la pagina è 1.

// Calcola l'offset per la clausola LIMIT della query.
$offset = ($page - 1) * $per_page;

// --- RECUPERO DEI QUIZ DA VISUALIZZARE PER LA PAGINA CORRENTE ---
// Query per selezionare i quiz dell'utente, ordinati e paginati.
$sql = "SELECT Q.titolo, Q.dataInizio, Q.dataFine, Q.codice
        FROM Quiz AS Q
        WHERE Q.creatore = :nomeUtente
        ORDER BY Q.dataInizio DESC, Q.titolo ASC -- Ordina per data di inizio (più recenti prima), poi per titolo.
        LIMIT :offset, :per_page"; // Applica paginazione.

$quizzes_to_display = []; // Inizializza l'array dei quiz da visualizzare.

if (!$dbError) { // Procede solo se non ci sono stati errori precedenti.
    try {
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':nomeUtente', $nomeUtente, PDO::PARAM_STR);
        $stmt->bindParam(':offset', $offset, PDO::PARAM_INT);
        $stmt->bindParam(':per_page', $per_page, PDO::PARAM_INT);
        $stmt->execute();
        $quizzes_to_display = $stmt->fetchAll(PDO::FETCH_ASSOC); // Recupera i quiz.
    } catch (PDOException $e) {
        error_log("Errore query recupero quiz per utente $nomeUtente (quiz_my.php): " . $e->getMessage());
        $dbError = "Si è verificato un errore durante il recupero dei quiz. Riprova più tardi.";
        $quizzes_to_display = []; // Svuota l'array in caso di errore.
    }
}

// Include l'header HTML comune.
include 'includes/header.php';
?>

<!-- Inclusione script JavaScript (defer per caricamento non bloccante) -->
<!-- NOTA: Solitamente main.js è già incluso nel footer.php.
     Se è necessario qui per funzionalità specifiche immediate, assicurarsi
     che il DOM sia pronto o usare $(document).ready() / DOMContentLoaded. -->
<script src="assets/js/main.js" defer></script>

<!-- Contenitore principale della pagina -->
<div class="container" style="padding-top: 20px; padding-bottom: 40px;">
    
    <!-- Riga del titolo della pagina e controllo "Elementi per pagina" -->
    <div class="page-header-controls"> <!-- Usare una classe CSS definita per questo layout se possibile -->
        <div class="page-title-container"> <!-- Contenitore per icona e titolo -->
            <i class="fas fa-th-list page-title-icon"></i> <!-- Icona titolo -->
            <h2 class="page-main-title">
                I Miei Quiz
                <?php if ($total_quizzes > 0): // Mostra il conteggio solo se ci sono quiz ?>
                    <small class="total-count-badge">
                        (<?php echo $total_quizzes; ?> total<?php echo ($total_quizzes !== 1) ? 'i':'o'; ?>)
                    </small>
                <?php endif; ?>
            </h2>
        </div>

        <?php // Mostra il controllo "Elementi per pagina" solo se ci sono quiz da visualizzare.
        if ($total_quizzes > 0) : ?>
            <div class="controls-container"> <!-- Contenitore per i controlli (es. select) -->
                <form method="GET" id="per-page-form-myquiz" action="quiz_my.php" class="per-page-form">
                     <?php // Mantiene i parametri GET esistenti (es. sort_by) quando si cambia 'per_page'.
                        foreach ($_GET as $key => $value) {
                            if ($key !== 'per_page' && $key !== 'page') { // Esclude i parametri di paginazione.
                                echo '<input type="hidden" name="' . htmlspecialchars($key, ENT_QUOTES, 'UTF-8') . '" value="' . htmlspecialchars($value, ENT_QUOTES, 'UTF-8') . '">';
                            }
                        }
                    ?>
                    <label for="per_page_select_myquiz" class="per-page-label">
                        <i class="fas fa-list-ul"></i>Elementi:
                    </label>
                    <!-- Select per cambiare il numero di elementi per pagina -->
                    <select id="per_page_select_myquiz" name="per_page" aria-label="Elementi per pagina" 
                            class="custom-select-styled"
                            onchange="this.form.submit()"> <!-- Invia il form al cambio -->
                        <?php foreach ($valid_per_page_options as $option): ?>
                            <option value="<?php echo $option; ?>" <?php if ($per_page == $option) echo 'selected'; ?>><?php echo $option; ?></option>
                        <?php endforeach; ?>
                    </select>
                </form>
            </div>
        <?php endif; ?>
    </div>

    <!-- CONTENITORE PER GLI ALERT JavaScript (es. dopo eliminazione quiz) -->
    <div id="alert-container-page" class="custom-alert-container-static" style="margin-bottom: 20px;">
        <!-- Gli alert verranno inseriti qui da JavaScript -->
    </div>

    <!-- Visualizzazione della lista dei quiz o messaggi appropriati -->
    <?php if ($dbError): // Se si è verificato un errore database ?>
        <div class="alert alert-danger" role="alert">
            <i class="fas fa-exclamation-triangle" style="margin-right: 8px;"></i> 
            <?php echo htmlspecialchars($dbError, ENT_QUOTES, 'UTF-8'); ?>
        </div>
    <?php elseif (empty($quizzes_to_display) && $total_quizzes === 0): // Se l'utente non ha creato nessun quiz ?>
        <div class="no-results-box"> <!-- Stile per "nessun risultato" con invito all'azione -->
            <div class="no-results-icon"><i class="fas fa-folder-open"></i></div>
            <h3 class="no-results-title">Nessun Quiz Creato</h3>
            <p class="no-results-text">Non hai ancora creato nessun quiz. Inizia subito a creare contenuti coinvolgenti!</p>
            <a href="quiz_create.php" class="btn button-primary-styled btn-lg"> <!-- btn-lg per bottone più grande -->
                <i class="fas fa-plus" style="margin-right: 6px;"></i> Crea il tuo primo Quiz!
            </a>
        </div>
    <?php elseif (empty($quizzes_to_display) && $total_quizzes > 0): // Se ci sono quiz ma non in questa pagina (pagina non valida) ?>
         <div class="no-results card"> <!-- Stile card standard per questo messaggio -->
            <p><i class="fas fa-info-circle"></i> Nessun quiz da visualizzare in questa pagina. Probabilmente hai selezionato un numero di pagina non valido.</p>
            <p><a href="quiz_my.php" class="text-link">Torna alla prima pagina dei tuoi quiz</a></p>
        </div>
    <?php else: // Se ci sono quiz da visualizzare ?>
        <div class='quiz-list'> <!-- Griglia di card per i quiz -->
            <?php foreach ($quizzes_to_display as $quiz): ?>
                <div class='quiz-item card'> 
                    <h3 class='quiz-title'><?php echo htmlspecialchars($quiz['titolo'], ENT_QUOTES, 'UTF-8'); ?></h3>
                    <div class='quiz-meta'> <!-- Informazioni meta del quiz -->
                        <p title="Periodo di disponibilità">
                            <i class="fas fa-calendar-alt" style="margin-right: 6px; color: var(--secondary-gray);"></i>
                            Disponibile dal   <strong><?php echo htmlspecialchars(date('d/m/Y', strtotime($quiz['dataInizio'])), ENT_QUOTES, 'UTF-8'); ?></strong>
                              al  <strong><?php echo htmlspecialchars(date('d/m/Y', strtotime($quiz['dataFine'])), ENT_QUOTES, 'UTF-8'); ?></strong>
                        </p>
                        <p title="Codice Identificativo del Quiz">
                            <i class="fas fa-key" style="margin-right: 6px; color: var(--secondary-gray);"></i>
                            Codice:   <strong><?php echo htmlspecialchars($quiz['codice'], ENT_QUOTES, 'UTF-8'); ?></strong>
                        </p>
                        <!-- Aggiungere qui il badge di stato se necessario, come in index.php -->
                    </div>
                    <!-- Bottoni di azione specifici per "I Miei Quiz" -->
                    <div class='quiz-actions quiz-actions-manage'>
                        <a href='quiz_info.php?id=<?php echo htmlspecialchars($quiz['codice'], ENT_QUOTES, 'UTF-8'); ?>' class='btn button-info-styled btn-sm' title="Visualizza statistiche e informazioni dettagliate del quiz">
                            <i class="fas fa-chart-bar"></i> Statistiche <!-- Cambiata icona per statistiche -->
                        </a>
                        <a href='quiz_view.php?id=<?php echo htmlspecialchars($quiz['codice'], ENT_QUOTES, 'UTF-8'); ?>' class='btn button-primary-styled btn-sm' title="Visualizza l'anteprima del quiz come lo vedrebbe un partecipante">
                            <i class="fas fa-eye"></i> Anteprima
                        </a>
                        <a href='quiz_modify.php?id=<?php echo htmlspecialchars($quiz['codice'], ENT_QUOTES, 'UTF-8'); ?>' class='btn btn-secondary btn-sm' title="Modifica i dettagli, le domande e le risposte di questo quiz">
                            <i class="fas fa-edit"></i> Modifica
                        </a>
                        <!-- Bottone per eliminare il quiz (attiva modale di conferma) -->
                        <button data-delid="<?php echo htmlspecialchars($quiz['codice'], ENT_QUOTES, 'UTF-8'); ?>"
                                data-quiz-title="<?php echo htmlspecialchars($quiz['titolo'], ENT_QUOTES, 'UTF-8'); ?>" 
                                class='btn button-danger-styled delete-quiz-btn btn-sm' 
                                title="Elimina questo quiz in modo permanente">
                            <i class="fas fa-trash-alt"></i> Elimina
                        </button>
                    </div>
                </div> <!-- fine .quiz-item -->
            <?php endforeach; ?>
        </div> <!-- fine .quiz-list -->

        <?php // --- HTML DELLA PAGINAZIONE ---
        // Mostra la paginazione solo se c'è più di una pagina di risultati.
        if ($total_pages > 1):
        ?>
            <nav class="pagination" aria-label="Paginazione dei tuoi quiz">
                <div class="pagination-wrapper">
                    <div class="pagination-info"> <!-- Informazioni sulla paginazione -->
                        <i class="fas fa-list-ol"></i>
                        Visualizzazione <?php echo ($offset + 1); ?>-<?php echo min($offset + $per_page, $total_quizzes); ?> di <?php echo $total_quizzes; ?> quiz
                    </div>
                    <div class="pagination-controls"> <!-- Controlli di navigazione pagina -->
                        <?php
                        // Funzione helper per generare URL di paginazione mantenendo i filtri correnti.
                        if (!function_exists('getMyQuizPaginationUrl')) { // Definisce la funzione solo se non esiste già.
                            function getMyQuizPaginationUrl($page_num_target) {
                                $current_params = $_GET; // Parametri GET correnti.
                                $current_params['page'] = $page_num_target; // Imposta la nuova pagina.
                                // 'per_page' sarà già in $current_params se è stato settato tramite il select.
                                return 'quiz_my.php?' . http_build_query($current_params); // Costruisce l'URL.
                            }
                        }
                        ?>
                        <div class="compact-pagination" role="navigation" aria-label="Navigazione pagine">
                            <!-- Bottone "Precedente" -->
                            <?php if ($page > 1): ?>
                                <a href="<?php echo getMyQuizPaginationUrl($page - 1); ?>" class="page-item page-nav" title="Pagina precedente">
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
                                        echo '<a href="' . getMyQuizPaginationUrl($i) . '" class="page-item" title="Vai a pagina ' . $i . '">' . $i . '</a>';
                                    }
                                }
                                // Logica per i puntini di sospensione "...".
                                elseif (($i == $page - $links_range - 1 && $page - $links_range > 2 && $show_first_last) ||
                                        ($i == $page + $links_range + 1 && $page + $links_range < $total_pages - 1 && $show_first_last)) {
                                    echo '<span class="page-dots">...</span>';
                                }
                            }
                            ?>

                            <!-- Bottone "Successivo" -->
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
            </nav> <!-- fine .pagination -->
        <?php endif; // Fine paginazione ?>

        <!-- Modale di Conferma Eliminazione Quiz -->
        <!-- Questo modale viene attivato da JavaScript quando si clicca un bottone ".delete-quiz-btn" -->
        <div id="confirmDeleteModal" class="custom-modal" style="display: none;"> <!-- 'modal' è più Bootstrap, 'custom-modal' è più specifico -->
            <div class="custom-modal-content"> <!-- Contenuto del modale -->
                <span class="custom-modal-close-button" title="Chiudi">×</span> <!-- Bottone per chiudere il modale -->
                <h2 class="custom-modal-title" style="display: flex; align-items: center;">
                    <i class="fas fa-exclamation-triangle" style="color: var(--score-low-color); margin-right: 10px; font-size: 1.5rem;"></i>
                    Conferma Eliminazione
                </h2>
                <p id="deleteModalText" class="custom-modal-text" style="margin-top: 15px; margin-bottom: 10px;">
                    Sei sicuro di voler eliminare il quiz "<strong><span id="quizTitleToDelete">[Nome Quiz]</span></strong>"?
                </p>
                <p style="color: var(--text-muted); font-size: 0.9rem; line-height: 1.5;">
                    L'azione è <strong>irreversibile</strong>. Tutti i dati associati al quiz, incluse le domande, le risposte e le eventuali partecipazioni, verranno persi definitivamente.
                </p>
                <div class="custom-modal-actions" style="margin-top: 25px;">
                    <button type="button" id="cancelDeleteBtn" class="button-styled button-secondary-styled" style="margin-right: 10px;">
                        <i class="fas fa-times" style="margin-right: 6px;"></i> Annulla
                    </button>
                    <button type="button" id="confirmDeleteActionBtn" class="button-styled button-danger-styled">
                        <i class="fas fa-trash-alt" style="margin-right: 6px;"></i> Elimina Quiz
                    </button>
                </div>
            </div>
        </div> <!-- fine #confirmDeleteModal -->
    <?php endif; // Fine controllo principale (se ci sono quiz da visualizzare o messaggi di errore/nessun quiz) ?>

</div> <!-- fine .container principale -->

<?php
// Include il footer HTML comune.
include 'includes/footer.php';
?>
<!-- La chiusura del tag </body> è in footer.php -->