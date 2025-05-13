<?php
/**
 * Pagina di partecipazione al Quiz.
 *
 * Questa pagina permette agli utenti di partecipare a un quiz esistente.
 */

// Questo if session_start() dovrebbe essere già in header.php
// if (session_status() === PHP_SESSION_NONE) {
//     session_start();
// }

include 'includes/header.php';
require_once 'config/database.php'; // Assicurati del percorso

// Controllo se l'utente è loggato.
if (!isset($_SESSION['user']) || !isset($_SESSION['user']['nomeUtente'])) {
    $_SESSION['error_message'] = "Devi effettuare il login per partecipare ai quiz."; // Messaggio per il login
    header('Location: auth_login.php');
    exit;
}

// Controllo se l'ID del quiz è stato fornito.
if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    $_SESSION['info_message'] = "ID del quiz non specificato."; // Messaggio per index
    header('Location: index.php');
    exit;
}

$quiz_id = (int) $_GET['id'];
$user = $_SESSION['user']['nomeUtente'];
$today = date('Y-m-d');
$error_message_page = null; // Per errori da mostrare sulla pagina

try {
    // Verifica se l'utente ha già partecipato
    $participation_check_sql = "SELECT codice FROM Partecipazione WHERE utente = :nomeUtente AND quiz = :quizId";
    $part_check_stmt = $pdo->prepare($participation_check_sql);
    $part_check_stmt->bindParam(':nomeUtente', $user, PDO::PARAM_STR);
    $part_check_stmt->bindParam(':quizId', $quiz_id, PDO::PARAM_INT);
    $part_check_stmt->execute();
    if ($part_check_stmt->fetch()) {
        $_SESSION['info_message'] = "Hai già partecipato a questo quiz. Puoi vedere i tuoi risultati nella sezione 'Le Mie Partecipazioni'.";
        header('Location: quiz_participations.php'); // Reindirizza all'elenco
        exit;
    }


    // --- Verifica disponibilità quiz ---
    // Modificato per selezionare solo se dataInizio <= oggi E dataFine >= oggi
    $sql_quiz = "SELECT * FROM Quiz WHERE codice = :id AND dataInizio <= :oggi AND dataFine >= :oggi";
    $stmt_quiz = $pdo->prepare($sql_quiz);
    $stmt_quiz->bindParam(':id', $quiz_id, PDO::PARAM_INT);
    $stmt_quiz->bindParam(':oggi', $today, PDO::PARAM_STR);
    // $stmt_quiz->bindParam(':oggi2', $today, PDO::PARAM_STR); // non più necessario
    $stmt_quiz->execute();
    $quiz = $stmt_quiz->fetch(PDO::FETCH_ASSOC);

    if (!$quiz) {
        // Controlliamo perché non è stato trovato
        $check_existence_sql = "SELECT dataInizio, dataFine FROM Quiz WHERE codice = :id";
        $check_stmt = $pdo->prepare($check_existence_sql);
        $check_stmt->bindParam(':id', $quiz_id, PDO::PARAM_INT);
        $check_stmt->execute();
        $quiz_details_for_error = $check_stmt->fetch(PDO::FETCH_ASSOC);

        if (!$quiz_details_for_error) {
            $_SESSION['error_message'] = "Quiz con ID ".htmlspecialchars($quiz_id)." non trovato.";
        } elseif ($quiz_details_for_error['dataInizio'] > $today) {
            $_SESSION['info_message'] = "Il quiz \"".htmlspecialchars($quiz['titolo'] ?? 'ID '.$quiz_id)."\" non è ancora iniziato. Sarà disponibile dal ".date('d/m/Y', strtotime($quiz_details_for_error['dataInizio'])).".";
        } elseif ($quiz_details_for_error['dataFine'] < $today) {
            $_SESSION['info_message'] = "Il quiz \"".htmlspecialchars($quiz['titolo'] ?? 'ID '.$quiz_id)."\" è terminato il ".date('d/m/Y', strtotime($quiz_details_for_error['dataFine']))." e non accetta più partecipazioni.";
        } else {
            $_SESSION['error_message'] = "Quiz non disponibile (ID: ".htmlspecialchars($quiz_id).").";
        }
        header('Location: index.php');
        exit;
    }

    // --- Recupero domande ---
    $sql_domande = "SELECT * FROM Domanda WHERE quiz = :quiz ORDER BY numero"; // È buona norma ordinare per 'numero'
    $stmt_domande = $pdo->prepare($sql_domande);
    $stmt_domande->bindParam(':quiz', $quiz_id, PDO::PARAM_INT);
    $stmt_domande->execute();
    $questions = $stmt_domande->fetchAll(PDO::FETCH_ASSOC);

    if (empty($questions)) {
        $error_message_page = "Questo quiz non ha ancora domande associate. Torna più tardi o contatta il creatore del quiz.";
    } else {
        foreach ($questions as &$question) { // Usa la reference & per modificare direttamente l'array
            $sql_risposte = "SELECT * FROM Risposta WHERE quiz = :quiz AND domanda = :domanda ORDER BY RAND()"; // Ordina casualmente le risposte
            // Oppure usa shuffle($question['answers']); dopo il fetch
            $stmt_risposte = $pdo->prepare($sql_risposte);
            $stmt_risposte->bindParam(':quiz', $quiz_id, PDO::PARAM_INT);
            $stmt_risposte->bindParam(':domanda', $question['numero'], PDO::PARAM_INT); // 'numero' dalla tabella Domanda
            $stmt_risposte->execute();
            $question['answers'] = $stmt_risposte->fetchAll(PDO::FETCH_ASSOC);
            // shuffle($question['answers']); // Alternativa a ORDER BY RAND() se preferisci farlo in PHP
        }
        unset($question); // Rimuovi la reference

        // shuffle($questions); // Mescola l'ordine delle domande se vuoi
    }

} catch (PDOException $e) {
    error_log("Errore DB in quiz_play.php: " . $e->getMessage());
    // Non usare die() in produzione, mostra un messaggio amichevole
    $error_message_page = "Si è verificato un errore tecnico durante il caricamento del quiz. Riprova più tardi.";
    // Opzionalmente, potresti voler reindirizzare o mostrare una pagina di errore generica
    // include 'includes/error_page.php';
    // exit;
}

$domanda_indice_visualizzato = 0; // Per numerare le domande 1, 2, 3...
?>

<div class="main-content container" style="padding-top: 20px; padding-bottom: 40px;">
    <!-- Container per gli alert specifici di questa pagina -->
    <div id="alert-container-participate" class="custom-alert-container-static" style="margin-bottom: 20px;"></div>

    <?php if ($error_message_page): ?>
        <div class="alert alert-danger" role="alert"><?php echo htmlspecialchars($error_message_page); ?></div>
        <?php if (strpos($error_message_page, "non ha ancora domande") !== false): ?>
            <p class="text-align-center padding-vertical-medium"><a href="index.php" class="btn">Torna alla Home</a></p>
        <?php endif; ?>
    <?php else: ?>
        <div style="margin-bottom: 20px; padding-bottom: 15px; border-bottom: 1px solid var(--border-color);">
             <h1 style="font-size: 1.8rem; color: var(--dark-color); margin: 0; line-height: 1.3;">
                <i class="fas fa-pencil-alt" style="margin-right: 10px; color: var(--main-color);"></i>
                Partecipazione al Quiz: <?php echo htmlspecialchars($quiz['titolo']); ?>
            </h1>
            <p style="font-size: 0.9rem; color: var(--text-muted); margin-top: 5px;">
                Seleziona le risposte che ritieni corrette e invia il quiz.
            </p>
        </div>


        <form id="participate-form">
            <!-- NON serve participation_id qui, viene creato al submit -->
            <input type="hidden" name="idQuiz" value="<?php echo $quiz_id; ?>">
            <input type="hidden" name="action" value="submit"> <!-- Per l'API -->

            <?php foreach ($questions as $question): ?>
                <?php $domanda_indice_visualizzato++; ?>
                <div class="question-item card" style="margin-bottom: 25px; padding: 20px; border: 1px solid #ddd; border-radius: 8px;">
                    <div class="question-text" style="font-weight: bold; margin-bottom: 15px; font-size: 1.1em;">
                        Domanda <?php echo $domanda_indice_visualizzato; ?>:
                        <span style="font-weight: normal;"><?php echo htmlspecialchars($question['testo']); ?></span>
                    </div>

                    <?php if (empty($question['answers'])): ?>
                        <p style="color: #777; font-style: italic;">Nessuna opzione di risposta disponibile per questa domanda.</p>
                    <?php else: ?>
                        <div class="answer-options" style="display: flex; flex-direction: column; gap: 10px;">
                            <?php foreach ($question['answers'] as $answer): ?>
                                <div class="answer-option">
                                    <label style="display: flex; align-items: center; cursor: pointer; padding: 8px; border-radius: 4px; transition: background-color 0.2s;"
                                           onmouseover="this.style.backgroundColor='#f0f0f0';"
                                           onmouseout="this.style.backgroundColor='transparent';">
                                        <input type="checkbox"
                                               name="answers[<?php echo $question['numero']; ?>][]"
                                               value="<?php echo $answer['numero']; ?>"
                                               style="margin-right: 10px; transform: scale(1.2);">
                                        <?php echo htmlspecialchars($answer['testo']); ?>
                                    </label>
                                </div>
                            <?php endforeach; ?>
                        </div>
                    <?php endif; ?>
                </div>
            <?php endforeach; ?>

            <?php if (!empty($questions)): // Mostra il bottone solo se ci sono domande ?>
            <div class="form-group text-align-center" style="margin-top: 30px;">
                <button type="submit" class="btn button-primary-styled btn-lg" style="padding: 12px 30px; font-size: 1.1em;">
                    <i class="fas fa-paper-plane" style="margin-right: 8px;"></i> Invia Risposte
                </button>
            </div>
            <?php endif; ?>
        </form>
    <?php endif; ?>
</div>

<?php include 'includes/footer.php'; ?>