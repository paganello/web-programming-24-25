<?php
/**
 * API per la gestione della sottomissione delle partecipazioni ai quiz.
 *
 * Questo script riceve le risposte di un utente a un quiz, valida i dati,
 * verifica che l'utente non abbia già partecipato e che il quiz sia attivo,
 * quindi registra la partecipazione e le risposte fornite nel database.
 * Risponde in formato JSON.
 */

// --- Inizializzazione della sessione e configurazione ---
if (session_status() === PHP_SESSION_NONE) {
    session_start(); // Avvia la sessione se non è già attiva, per accedere a $_SESSION.
}

header('Content-Type: application/json'); // Imposta l'header per rispondere in formato JSON.
require_once '../config/database.php'; // Include il file per la connessione al database.

// --- Autenticazione Utente ---
// Verifica se l'utente è autenticato. Solo utenti loggati possono sottomettere partecipazioni.
if (!isset($_SESSION['user']['nomeUtente'])) {
    echo json_encode(['status' => 'error', 'message' => 'Utente non autenticato. Accesso negato.']);
    http_response_code(401); // Unauthorized
    exit();
}
$nomeUtente = $_SESSION['user']['nomeUtente']; // Recupera il nome utente dalla sessione.

// --- Gestione della Richiesta ---
// Recupera l'azione specificata nel payload POST (ci si aspetta 'submit').
$action = isset($_POST['action']) ? $_POST['action'] : null;

// Verifica che la richiesta sia di tipo POST e che l'azione sia 'submit'.
if ($_SERVER['REQUEST_METHOD'] === 'POST' && $action === 'submit') {
    // Recupera e sanitizza l'ID del quiz.
    $quizId = isset($_POST['idQuiz']) ? (int)$_POST['idQuiz'] : null;
    // Recupera le risposte fornite dall'utente.
    $risposteUtenteRaw = isset($_POST['answers']) && is_array($_POST['answers']) ? $_POST['answers'] : [];
    $risposteUtenteProcessed = []; // Array per memorizzare le risposte processate.

    // --- Processamento delle Risposte Utente ---
    // Il formato delle risposte dal form potrebbe variare (singola vs. multipla per domanda).
    // Questo ciclo normalizza la struttura delle risposte.
    foreach ($risposteUtenteRaw as $questionNumber => $selectedAnswers) {
        if (is_array($selectedAnswers)) {
            // Caso: risposte multiple per una domanda (es. checkboxes).
            // Per ogni risposta selezionata, crea un record.
            foreach ($selectedAnswers as $answerNumber) {
                $risposteUtenteProcessed[] = [
                    'domanda_numero' => (int)$questionNumber,
                    'risposta_numero' => (int)$answerNumber
                ];
            }
        } else {
            // Caso: risposta singola per una domanda (es. radio button o select).
            $risposteUtenteProcessed[] = [
                'domanda_numero' => (int)$questionNumber,
                'risposta_numero' => (int)$selectedAnswers
            ];
        }
    }

    // Risposta di fallback in caso di errore non specificamente gestito.
    $response = ['status' => 'error', 'message' => 'Errore sconosciuto durante l\'invio.'];

    // Validazione: l'ID del quiz è obbligatorio.
    if (empty($quizId)) {
        $response['message'] = 'ID del quiz mancante.';
        http_response_code(400); // Bad Request
        echo json_encode($response);
        exit();
    }

    // --- Logica di Registrazione Partecipazione (all'interno di una transazione) ---
    try {
        $pdo->beginTransaction(); // Inizio della transazione per garantire la coerenza dei dati.

        // --- PASSO 1: Validazione del Quiz ---
        // Verifica che il quiz esista e recupera la data di fine.
        $quiz_check_sql = "SELECT codice, dataFine FROM Quiz WHERE codice = :quizId";
        $quiz_stmt = $pdo->prepare($quiz_check_sql);
        $quiz_stmt->bindParam(':quizId', $quizId, PDO::PARAM_INT);
        $quiz_stmt->execute();
        $quiz_data = $quiz_stmt->fetch(PDO::FETCH_ASSOC);

        // Se il quiz non viene trovato nel database.
        if (!$quiz_data) {
            $response['message'] = 'Quiz non trovato (ID: ' . htmlspecialchars($quizId) . ').'; // htmlspecialchars per sicurezza
            $pdo->rollBack();
            http_response_code(404); // Not Found
            echo json_encode($response);
            exit();
        }

        // Controlla se il quiz è scaduto (non accetta più partecipazioni).
        $today = date('Y-m-d');
        if ($quiz_data['dataFine'] < $today) {
            $response['message'] = 'Questo quiz è terminato e non accetta più partecipazioni.';
            $pdo->rollBack();
            http_response_code(403); // Forbidden
            echo json_encode($response);
            exit();
        }

        // --- PASSO 2: Verifica Partecipazione Esistente ---
        // Controlla se l'utente ha già partecipato a questo quiz.
        $participation_check_sql = "SELECT codice FROM Partecipazione WHERE utente = :nomeUtente AND quiz = :quizId";
        $part_check_stmt = $pdo->prepare($participation_check_sql);
        $part_check_stmt->bindParam(':nomeUtente', $nomeUtente, PDO::PARAM_STR);
        $part_check_stmt->bindParam(':quizId', $quizId, PDO::PARAM_INT);
        $part_check_stmt->execute();

        if ($part_check_stmt->fetch()) {
            // Se esiste già una partecipazione per questo utente e quiz.
            $response['message'] = 'Hai già partecipato a questo quiz.';
            $pdo->rollBack();
            http_response_code(409); // Conflict
            echo json_encode($response);
            exit();
        }

        // --- PASSO 3: Inserimento Nuova Partecipazione ---
        // Registra la partecipazione dell'utente al quiz.
        $sql_partecipazione = "INSERT INTO Partecipazione (utente, quiz, data) VALUES (:utente, :quiz, CURDATE())";
        $stmt_partecipazione = $pdo->prepare($sql_partecipazione);
        $stmt_partecipazione->bindParam(':utente', $nomeUtente, PDO::PARAM_STR);
        $stmt_partecipazione->bindParam(':quiz', $quizId, PDO::PARAM_INT);
        $stmt_partecipazione->execute();
        $partecipazioneId = $pdo->lastInsertId(); // Recupera l'ID della partecipazione appena inserita.

        // Verifica che l'ID della partecipazione sia stato generato correttamente.
        if (!$partecipazioneId) {
            // Questo errore è critico e indica un problema con l'inserimento o la configurazione del DB.
            throw new Exception("Impossibile creare la partecipazione nel database. L'ID della partecipazione non è stato generato.");
        }

        // --- PASSO 4: Salvataggio delle Risposte dell'Utente (se presenti) ---
        if (!empty($risposteUtenteProcessed)) {
            $sql_risposta_utente = "
                INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta)
                VALUES (:partecipazione, :quiz, :domanda_numero, :risposta_numero)
            ";
            $stmt_risposta_utente = $pdo->prepare($sql_risposta_utente);

            // Itera su ogni risposta processata e la inserisce nel database.
            foreach ($risposteUtenteProcessed as $risposta) {
                $stmt_risposta_utente->bindParam(':partecipazione', $partecipazioneId, PDO::PARAM_INT);
                $stmt_risposta_utente->bindParam(':quiz', $quizId, PDO::PARAM_INT);
                $stmt_risposta_utente->bindParam(':domanda_numero', $risposta['domanda_numero'], PDO::PARAM_INT);
                $stmt_risposta_utente->bindParam(':risposta_numero', $risposta['risposta_numero'], PDO::PARAM_INT);

                if (!$stmt_risposta_utente->execute()) {
                    // Logga l'errore specifico per questa risposta, ma non interrompe necessariamente
                    // l'intera transazione (a meno che non si decida di lanciare un'eccezione).
                    // Questo permette di salvare la partecipazione anche se una singola risposta fallisce.
                    error_log(
                        "Errore durante l'inserimento di RispostaUtenteQuiz: " .
                        "PartecipazioneID=$partecipazioneId, QuizID=$quizId, " .
                        "DomandaNum=" . $risposta['domanda_numero'] . ", RispostaNum=" . $risposta['risposta_numero'] . ". " .
                        "Dettagli Errore: " . implode(":", $stmt_risposta_utente->errorInfo())
                    );
                    // Opzione alternativa: lanciare un'eccezione per forzare il rollback.
                    // throw new Exception("Errore durante il salvataggio di una risposta specifica. La partecipazione non sarà registrata.");
                }
            }
        }

        // --- PASSO 5: Commit della Transazione ---
        // Se tutte le operazioni sono andate a buon fine, conferma le modifiche al database.
        $pdo->commit();

        // Salva un messaggio di successo nella sessione, utile per redirect lato client o per mostrare notifiche.
        $_SESSION['participationMessage'] = 'Partecipazione registrata con successo!';
        $_SESSION['participationMessageType'] = 'success'; // Tipo di messaggio (per styling CSS, ad esempio).

        // Prepara e invia la risposta JSON di successo.
        $response = [
            'status' => 'success',
            'message' => 'Partecipazione registrata con successo!',
            'partecipazione_id' => $partecipazioneId,
            'redirect_url' => 'quiz_results.php?participation_id=' . $partecipazioneId // URL per visualizzare i risultati
        ];
        http_response_code(201); // Created: la risorsa (partecipazione) è stata creata con successo.

    } catch (PDOException $e) {
        // Gestione degli errori specifici di PDO (es. problemi di connessione, query errate).
        if ($pdo->inTransaction()) {
            $pdo->rollBack(); // Annulla la transazione se è ancora attiva.
        }
        // Logga l'errore per il debug.
        error_log("Errore PDO in submit_participation: " . $e->getMessage() . " | Dati: quizId=$quizId, utente=$nomeUtente");
        $response['message'] = 'Errore del database durante la registrazione della partecipazione. Riprova più tardi.';
        http_response_code(500); // Internal Server Error

    } catch (Exception $e) {
        // Gestione di errori generici (es. eccezioni lanciate manualmente).
        if ($pdo->inTransaction()) {
            $pdo->rollBack();
        }
        // Logga l'errore per il debug.
        error_log("Errore generico in submit_participation: " . $e->getMessage() . " | Dati: quizId=$quizId, utente=$nomeUtente");
        $response['message'] = 'Errore del server durante la registrazione della partecipazione. Riprova più tardi.';
        http_response_code(500); // Internal Server Error
    }

    // Invia la risposta JSON finale al client.
    echo json_encode($response);
    exit();

} else {
    // Se il metodo HTTP non è POST o l'azione non è 'submit'.
    echo json_encode(['status' => 'error', 'message' => 'Richiesta non valida. Metodo POST e action "submit" richiesti.']);
    http_response_code(405); // Method Not Allowed
    exit();
}
?>