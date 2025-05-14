<?php
/**
 * API per la gestione delle domande e delle relative risposte per i quiz.
 *
 * Questo script gestisce principalmente la creazione di nuove domande e
 * delle loro opzioni di risposta all'interno di un quiz specifico.
 * Attualmente, implementa la logica per il metodo POST per l'aggiunta
 * di un set di domande e risposte a un quiz esistente, assicurando
 * che l'utente sia autenticato e sia il proprietario del quiz.
 */

// Assicura che la sessione sia attiva per poter accedere a $_SESSION.
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Include il file di configurazione per la connessione al database.
require_once '../config/database.php';
// Imposta l'header per indicare che la risposta sarà in formato JSON.
header('Content-Type: application/json');

$method = $_SERVER['REQUEST_METHOD'];

/**
 * Verifica se l'utente corrente è autenticato.
 *
 * @return bool True se l'utente è autenticato (sessione 'user' presente), false altrimenti.
 */
function isAuthenticated()
{
    return isset($_SESSION['user']);
}

/**
 * Verifica se l'utente specificato è il creatore del quiz indicato.
 *
 * @param PDO $pdo L'oggetto PDO per la connessione al database.
 * @param int $idQuiz L'ID del quiz (Quiz.codice).
 * @param string $nomeUtente Il nome utente da verificare (Utente.nomeUtente).
 * @return bool True se l'utente è il proprietario del quiz, false altrimenti.
 */
function isOwnerOfQuiz($pdo, $idQuiz, $nomeUtente)
{
    $stmt = $pdo->prepare("SELECT codice FROM Quiz WHERE codice = :idQuiz AND creatore = :nomeUtente");
    $stmt->bindParam(':idQuiz', $idQuiz, PDO::PARAM_INT);
    $stmt->bindParam(':nomeUtente', $nomeUtente, PDO::PARAM_STR);
    $stmt->execute();
    return $stmt->rowCount() > 0;
}

switch ($method) {
    case 'POST': // Gestione della creazione di nuove domande e risposte
        if (!isAuthenticated()) {
            http_response_code(401); // Unauthorized
            echo json_encode(['status' => 'error', 'message' => 'Non autenticato. Effettua il login per continuare.']);
            exit;
        }

        // I dati sono attesi in formato 'application/x-www-form-urlencoded' o 'multipart/form-data' via $_POST.
        $data = $_POST;

        // --- Validazione Input Base ---
        if (!isset($data['quiz_id']) || empty($data['quiz_id'])) {
            http_response_code(400); // Bad Request
            echo json_encode(['status' => 'error', 'message' => 'ID del quiz (quiz_id) mancante o non valido.']);
            exit;
        }
        if (!isset($data['questions']) || !is_array($data['questions']) || empty($data['questions'])) {
            http_response_code(400); // Bad Request
            echo json_encode(['status' => 'error', 'message' => 'Nessuna domanda fornita o formato dati non valido. L\'array "questions" è richiesto.']);
            exit;
        }

        $idQuizCorrente = filter_var($data['quiz_id'], FILTER_VALIDATE_INT);
        if ($idQuizCorrente === false) {
            http_response_code(400); // Bad Request
            echo json_encode(['status' => 'error', 'message' => 'ID del quiz (quiz_id) non è un numero intero valido.']);
            exit;
        }

        $questions_array_from_form = $data['questions'];
        $nomeUtenteLoggato = $_SESSION['user']['nomeUtente'];

        // --- Controllo Autorizzazione ---
        // Verifica che l'utente loggato sia il proprietario del quiz a cui sta cercando di aggiungere domande.
        if (!isOwnerOfQuiz($pdo, $idQuizCorrente, $nomeUtenteLoggato)) {
            http_response_code(403); // Forbidden
            echo json_encode(['status' => 'error', 'message' => 'Non sei autorizzato ad aggiungere domande a questo quiz.']);
            exit;
        }

        // Avvia una transazione per garantire l'atomicità dell'inserimento di domande e risposte.
        try {
            $pdo->beginTransaction();
            
            // 'numero' in Domanda e Risposta è un numero progressivo relativo al quiz/domanda, non un ID auto-incrementante globale.
            $numeroDomandaProgressivo = 1; // Inizia la numerazione delle domande da 1 per questo quiz.

            foreach ($questions_array_from_form as $q_key => $question_data) {
                // --- Validazione Dati Domanda ---
                if (!isset($question_data['text']) || trim($question_data['text']) === '') {
                    throw new Exception("Il testo per la domanda #" . $numeroDomandaProgressivo . " non può essere vuoto.");
                }
                if (!isset($question_data['answers']) || !is_array($question_data['answers']) || empty($question_data['answers'])) {
                    throw new Exception("La domanda #" . $numeroDomandaProgressivo . " ('" . htmlspecialchars(substr(trim($question_data['text']), 0, 30)) . "...') non ha risposte definite.");
                }

                $testoDomanda = trim($question_data['text']);

                // --- Inserimento Domanda ---
                $stmtDomanda = $pdo->prepare("INSERT INTO Domanda (quiz, numero, testo) VALUES (:quiz_fk, :numero_dom, :testo_dom)");
                $stmtDomanda->bindParam(':quiz_fk', $idQuizCorrente, PDO::PARAM_INT);
                $stmtDomanda->bindParam(':numero_dom', $numeroDomandaProgressivo, PDO::PARAM_INT);
                $stmtDomanda->bindParam(':testo_dom', $testoDomanda, PDO::PARAM_STR);

                if (!$stmtDomanda->execute()) {
                    throw new Exception("Errore durante l'inserimento della domanda #" . $numeroDomandaProgressivo . ": " . implode(" ", $stmtDomanda->errorInfo()));
                }
                // Nota: Non usiamo lastInsertId() qui perché 'Domanda.numero' non è l'ID primario auto-incrementante della tabella Domanda,
                // ma un numero sequenziale per le domande all'interno di un quiz.
                // L'ID univoco della domanda, se esistesse come colonna separata (es. 'id_domanda AUTO_INCREMENT PRIMARY KEY'),
                // potrebbe essere recuperato con $pdo->lastInsertId() se necessario per altre tabelle.

                $numeroRispostaProgressivo = 1; // Inizia la numerazione delle risposte da 1 per questa domanda.
                $almenoUnaCorrettaTrovata = false;

                foreach ($question_data['answers'] as $a_key => $answer_data) {
                    // --- Validazione Dati Risposta ---
                    if (!isset($answer_data['text']) || trim($answer_data['text']) === '') {
                        throw new Exception("Il testo per la risposta #" . $numeroRispostaProgressivo . " della domanda #" . $numeroDomandaProgressivo . " non può essere vuoto.");
                    }
                    if (!isset($answer_data['type']) || !in_array($answer_data['type'], ['Corretta', 'Sbagliata'])) {
                        throw new Exception("Tipo non valido ('" . htmlspecialchars($answer_data['type']) . "') per la risposta #" . $numeroRispostaProgressivo . " della domanda #" . $numeroDomandaProgressivo . ". Deve essere 'Corretta' o 'Sbagliata'.");
                    }

                    $testoRisposta = trim($answer_data['text']);
                    $tipoRisposta = $answer_data['type'];
                    $punti = 0; // Punteggio di default per le risposte sbagliate.

                    if ($tipoRisposta === 'Corretta') {
                        $almenoUnaCorrettaTrovata = true;
                        // Assegna punti solo se la risposta è corretta e i punti sono forniti e validi.
                        if (isset($answer_data['points']) && is_numeric($answer_data['points']) && (int)$answer_data['points'] >= 0) {
                            $punti = (int) $answer_data['points'];
                        } else {
                            $punti = 1; // Punteggio di default per una risposta corretta se non specificato o non valido.
                        }
                    }

                    // --- Inserimento Risposta ---
                    // 'domanda' qui si riferisce a 'Domanda.numero', non a un ID univoco della domanda.
                    $stmtRisposta = $pdo->prepare("
                        INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) 
                        VALUES (:quiz_fk_risp, :domanda_fk_risp, :numero_risp, :testo_risp, :tipo_risp, :punteggio_risp)
                    ");
                    $stmtRisposta->bindParam(':quiz_fk_risp', $idQuizCorrente, PDO::PARAM_INT);
                    $stmtRisposta->bindParam(':domanda_fk_risp', $numeroDomandaProgressivo, PDO::PARAM_INT); // Riferimento al numero della domanda.
                    $stmtRisposta->bindParam(':numero_risp', $numeroRispostaProgressivo, PDO::PARAM_INT);
                    $stmtRisposta->bindParam(':testo_risp', $testoRisposta, PDO::PARAM_STR);
                    $stmtRisposta->bindParam(':tipo_risp', $tipoRisposta, PDO::PARAM_STR);
                    $stmtRisposta->bindParam(':punteggio_risp', $punti, PDO::PARAM_INT);

                    if (!$stmtRisposta->execute()) {
                        throw new Exception("Errore durante l'inserimento della risposta #" . $numeroRispostaProgressivo . " per la domanda #" . $numeroDomandaProgressivo . ": " . implode(" ", $stmtRisposta->errorInfo()));
                    }
                    $numeroRispostaProgressivo++;
                }

                // Ogni domanda deve avere almeno una risposta contrassegnata come "Corretta".
                if (!$almenoUnaCorrettaTrovata) {
                    throw new Exception("La domanda #" . $numeroDomandaProgressivo . " ('" . htmlspecialchars(substr($testoDomanda, 0, 30)) . "...') deve avere almeno una risposta contrassegnata come 'Corretta'.");
                }
                $numeroDomandaProgressivo++;
            }
            
            // Se tutti gli inserimenti hanno avuto successo, conferma le modifiche.
            $pdo->commit();

            http_response_code(201); // Created
            echo json_encode(['status' => 'success', 'message' => 'Domande e risposte salvate con successo.']);

        } catch (Exception $e) {
            // Se si verifica un errore durante la transazione, annulla tutte le modifiche.
            if ($pdo->inTransaction()) {
                $pdo->rollBack();
            }
            http_response_code(500); // Internal Server Error
            // Logga l'errore per debug, includendo i dati ricevuti per facilitare l'analisi.
            error_log("ERRORE API SALVATAGGIO DOMANDE (questions.php): " . $e->getMessage() . " | Dati Ricevuti: " . print_r($data, true));
            echo json_encode(['status' => 'error', 'message' => "Errore del server durante il salvataggio: " . $e->getMessage()]);
        }
        break;

    default:
        // Gestisce qualsiasi metodo HTTP non esplicitamente supportato (es. GET, PUT, DELETE, se non implementati).
        http_response_code(405); // Method Not Allowed
        echo json_encode(['status' => 'error', 'message' => 'Metodo non consentito. Utilizzare POST per aggiungere domande.']);
        exit;
}
?>