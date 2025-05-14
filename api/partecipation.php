<?php
// participation.php

// Assicura che la sessione sia attiva per poter accedere a $_SESSION.
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
// Imposta l'header per indicare che la risposta sarà in formato JSON.
header('Content-Type: application/json');

// Include il file di configurazione per la connessione al database.
require_once '../config/database.php';

// Verifica l'autenticazione dell'utente. Solo gli utenti loggati possono partecipare.
if (!isset($_SESSION['user']['nomeUtente'])) {
    echo json_encode(['status' => 'error', 'message' => 'Utente non autenticato. Accesso negato.']);
    http_response_code(401); // Unauthorized
    exit();
}

$nomeUtente = $_SESSION['user']['nomeUtente'];

// L'azione (es. 'submit') è attesa via POST, tipicamente da un FormData.
$action = isset($_POST['action']) ? $_POST['action'] : null;

// Processa la richiesta solo se è di tipo POST e l'azione specificata è 'submit'.
if ($_SERVER['REQUEST_METHOD'] === 'POST' && $action === 'submit') {
    $quizId = isset($_POST['idQuiz']) ? (int)$_POST['idQuiz'] : null;
    $risposteUtenteRaw = isset($_POST['answers']) && is_array($_POST['answers']) ? $_POST['answers'] : [];
    $risposteUtenteProcessed = [];

    // Trasforma le risposte ricevute dal form (potenzialmente un array di array per checkbox)
    // in un formato strutturato per l'inserimento nel database.
    // Ogni elemento di $risposteUtenteProcessed sarà un array associativo con 'domanda_numero' e 'risposta_numero'.
    foreach ($risposteUtenteRaw as $questionNumber => $selectedAnswersArray) {
        if (is_array($selectedAnswersArray)) {
            // Caso di input multipli per una singola domanda (es. checkbox)
            foreach ($selectedAnswersArray as $answerNumber) {
                $risposteUtenteProcessed[] = [
                    'domanda_numero' => (int)$questionNumber,
                    'risposta_numero' => (int)$answerNumber
                ];
            }
        } else {
            // Caso di input singolo per una domanda (es. radio button o select)
            // Questo è meno probabile con checkbox, ma gestito per robustezza.
            $risposteUtenteProcessed[] = [
                'domanda_numero' => (int)$questionNumber,
                'risposta_numero' => (int)$selectedAnswersArray
            ];
        }
    }

    // Risposta di default in caso di errore non gestito specificamente.
    $response = ['status' => 'error', 'message' => 'Errore sconosciuto durante l\'invio.'];

    if (empty($quizId)) {
        $response['message'] = 'ID del quiz mancante.';
        http_response_code(400); // Bad Request
        echo json_encode($response);
        exit();
    }
    // Nota: la partecipazione è consentita anche senza risposte fornite,
    // a meno che non sia un requisito specifico bloccarla.

    // Avvia una transazione per garantire l'atomicità delle operazioni sul database.
    try {
        $pdo->beginTransaction();

        // --- Validazione del Quiz ---
        $quiz_check_sql = "SELECT codice, dataFine FROM Quiz WHERE codice = :quizId";
        $quiz_stmt = $pdo->prepare($quiz_check_sql);
        $quiz_stmt->bindParam(':quizId', $quizId, PDO::PARAM_INT);
        $quiz_stmt->execute();
        $quiz_data = $quiz_stmt->fetch(PDO::FETCH_ASSOC);

        if (!$quiz_data) {
            $response['message'] = 'Quiz non trovato (ID: ' . $quizId . ').';
            $pdo->rollBack();
            http_response_code(404); // Not Found
            echo json_encode($response);
            exit();
        }

        // Controlla se il quiz è scaduto.
        $today = date('Y-m-d');
        if ($quiz_data['dataFine'] < $today) {
            $response['message'] = 'Questo quiz è terminato e non accetta più partecipazioni.';
            $pdo->rollBack();
            http_response_code(403); // Forbidden
            echo json_encode($response);
            exit();
        }

        // --- Controllo Partecipazione Esistente ---
        $participation_check_sql = "SELECT codice FROM Partecipazione WHERE utente = :nomeUtente AND quiz = :quizId";
        $part_check_stmt = $pdo->prepare($participation_check_sql);
        $part_check_stmt->bindParam(':nomeUtente', $nomeUtente, PDO::PARAM_STR);
        $part_check_stmt->bindParam(':quizId', $quizId, PDO::PARAM_INT);
        $part_check_stmt->execute();
        if ($part_check_stmt->fetch()) {
            $response['message'] = 'Hai già partecipato a questo quiz.';
            $pdo->rollBack();
            http_response_code(409); // Conflict
            echo json_encode($response);
            exit();
        }

        // --- Registrazione Partecipazione ---
        $sql_partecipazione = "INSERT INTO Partecipazione (utente, quiz, data) VALUES (:utente, :quiz, CURDATE())";
        $stmt_partecipazione = $pdo->prepare($sql_partecipazione);
        $stmt_partecipazione->bindParam(':utente', $nomeUtente, PDO::PARAM_STR);
        $stmt_partecipazione->bindParam(':quiz', $quizId, PDO::PARAM_INT);
        $stmt_partecipazione->execute();
        $partecipazioneId = $pdo->lastInsertId();

        if (!$partecipazioneId) {
            // Se lastInsertId() non restituisce un ID valido, qualcosa è andato storto nell'insert.
            throw new Exception("Impossibile creare la partecipazione nel database. L'ID della partecipazione non è stato generato.");
        }

        // --- Salvataggio Risposte Utente (se presenti) ---
        if (!empty($risposteUtenteProcessed)) {
            $sql_risposta_utente = "INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta)
                                    VALUES (:partecipazione, :quiz, :domanda_numero, :risposta_numero)";
            $stmt_risposta_utente = $pdo->prepare($sql_risposta_utente);

            foreach ($risposteUtenteProcessed as $risposta) {
                $stmt_risposta_utente->bindParam(':partecipazione', $partecipazioneId, PDO::PARAM_INT);
                $stmt_risposta_utente->bindParam(':quiz', $quizId, PDO::PARAM_INT); // Il quizId è ridondante se già in Partecipazione, ma può aiutare in query dirette
                $stmt_risposta_utente->bindParam(':domanda_numero', $risposta['domanda_numero'], PDO::PARAM_INT);
                $stmt_risposta_utente->bindParam(':risposta_numero', $risposta['risposta_numero'], PDO::PARAM_INT);
                
                if (!$stmt_risposta_utente->execute()) {
                    // Logga l'errore specifico per il salvataggio della risposta.
                    // Si potrebbe decidere di far fallire l'intera transazione (throw new Exception)
                    // o permettere una partecipazione parziale (solo log).
                    error_log("Errore durante l'inserimento di RispostaUtenteQuiz: PartecipazioneID=$partecipazioneId, QuizID=$quizId, DomandaNum=" . $risposta['domanda_numero'] . ", RispostaNum=" . $risposta['risposta_numero'] . ". Dettagli Errore: " . implode(":", $stmt_risposta_utente->errorInfo()));
                    // throw new Exception("Errore durante il salvataggio di una risposta specifica."); // Opzione per far fallire la transazione.
                }
            }
        }

        // Finalizza la transazione, rendendo permanenti le modifiche al database.
        $pdo->commit();

        // Messaggio di successo da mostrare nella pagina successiva (es. tramite redirect).
        $_SESSION['participationMessage'] = 'Partecipazione registrata con successo!';
        $_SESSION['participationMessageType'] = 'success';

        // Prepara la risposta di successo con l'ID della partecipazione e l'URL di reindirizzamento.
        $response = [
            'status' => 'success',
            'message' => 'Partecipazione registrata con successo!',
            'partecipazione_id' => $partecipazioneId,
            'redirect_url' => 'quiz_results.php?participation_id=' . $partecipazioneId
        ];
        http_response_code(201); // Created

    } catch (PDOException $e) {
        // Gestione specifica per errori PDO (es. problemi di connessione, query errate).
        if ($pdo->inTransaction()) {
            $pdo->rollBack();
        }
        error_log("Errore PDO in submit_participation: " . $e->getMessage() . " | Dati: quizId=$quizId, utente=$nomeUtente");
        $response['message'] = 'Errore del database durante la registrazione della partecipazione. Riprova più tardi.'; 
        http_response_code(500); // Internal Server Error
    } catch (Exception $e) {
        // Gestione per eccezioni generiche non catturate precedentemente.
        if ($pdo->inTransaction()) {
            $pdo->rollBack();
        }
        error_log("Errore generico in submit_participation: " . $e->getMessage() . " | Dati: quizId=$quizId, utente=$nomeUtente");
        $response['message'] = 'Errore del server durante la registrazione della partecipazione. Riprova più tardi.'; 
        http_response_code(500); // Internal Server Error
    }
    
    echo json_encode($response);
    exit();

} else {
    // Gestisce i casi in cui il metodo HTTP non è POST o l'azione non è 'submit'.
    echo json_encode(['status' => 'error', 'message' => 'Richiesta non valida. Metodo POST e action "submit" richiesti.']);
    http_response_code(405); // Method Not Allowed
    exit();
}
?>