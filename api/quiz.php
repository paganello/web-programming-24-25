<?php
/**
 * API per la gestione dei Quiz.
 *
 * Questo script gestisce le operazioni CRUD (Create, Read, Update, Delete)
 * relative ai quiz, incluse le loro domande e risposte.
 *
 * Principali funzionalità:
 * - GET:
 *   - Recupero di un elenco di quiz (filtrabili, es. per creatore, attivi).
 *   - Recupero dei dettagli completi di un singolo quiz (incluse domande e risposte).
 *   - Eliminazione di un quiz (identificato da `delId`, richiede autenticazione e proprietà).
 * - POST:
 *   - Creazione di un nuovo quiz (solo i metadati del quiz).
 *   - Aggiornamento completo di un quiz esistente (metadati, domande, risposte),
 *     identificato da `action=update` e `quiz_id`. Richiede autenticazione e proprietà.
 */

// --- Inizializzazione della sessione e configurazione ---
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
require_once '../config/database.php'; // Connessione al database
header('Content-Type: application/json'); // Risposte sempre in JSON

// --- Funzioni di Utilità ---

/**
 * Verifica se l'utente corrente è autenticato.
 *
 * @return bool True se l'utente ha una sessione attiva con 'nomeUtente', false altrimenti.
 */
function isAuthenticated()
{
    return isset($_SESSION['user']) && !empty($_SESSION['user']['nomeUtente']);
}

/**
 * Verifica se l'utente specificato è il creatore del quiz.
 *
 * @param PDO $pdo L'oggetto PDO per la connessione al database.
 * @param int $quizCodice L'ID del quiz (Quiz.codice).
 * @param string $nomeUtente Il nome utente da verificare.
 * @return bool True se l'utente è il proprietario del quiz, false altrimenti.
 */
function isOwnerOfQuizActual($pdo, $quizCodice, $nomeUtente)
{
    $stmt = $pdo->prepare("SELECT codice FROM Quiz WHERE codice = :quizCodice AND creatore = :nomeUtente");
    $stmt->bindParam(':quizCodice', $quizCodice, PDO::PARAM_INT);
    $stmt->bindParam(':nomeUtente', $nomeUtente, PDO::PARAM_STR);
    $stmt->execute();
    return $stmt->rowCount() > 0;
}

/**
 * Gestisce la risposta in caso di errore.
 * Logga l'errore, imposta il codice di stato HTTP e invia una risposta JSON.
 * Termina l'esecuzione dello script.
 *
 * @param string $message Messaggio di errore per l'utente.
 * @param int $code Codice di stato HTTP (default 500).
 * @param string $exceptionDetails Dettagli aggiuntivi per il log (es. trace dell'eccezione).
 */
function handleError($message, $code = 500, $exceptionDetails = "")
{
    $logMessage = "API Error (quiz.php): " . $message;
    if (!empty($exceptionDetails)) {
        $logMessage .= " | Details: " . $exceptionDetails;
    }
    error_log($logMessage);

    http_response_code($code);
    echo json_encode(['status' => 'error', 'message' => $message]);
    exit;
}


// --- Gestione delle Richieste API basata sul Metodo HTTP ---
switch ($_SERVER['REQUEST_METHOD']) {
    case 'GET':
        // --- Recupero Dettagli Singolo Quiz (con domande e risposte) ---
        if (isset($_GET['id'])) {
            $quizId = filter_var($_GET['id'], FILTER_VALIDATE_INT);
            if ($quizId === false) {
                handleError('ID Quiz non valido per il recupero.', 400);
            }
            try {
                // Recupera i dati base del quiz e il numero di partecipanti
                $stmt = $pdo->prepare("
                    SELECT q.codice, q.titolo, q.dataInizio, q.dataFine, q.creatore, COUNT(DISTINCT p.utente) as numPartecipanti
                    FROM Quiz q
                    LEFT JOIN Partecipazione p ON q.codice = p.quiz
                    WHERE q.codice = :quizId
                    GROUP BY q.codice
                ");
                $stmt->bindParam(':quizId', $quizId, PDO::PARAM_INT);
                $stmt->execute();

                if ($stmt->rowCount() > 0) {
                    $quiz = $stmt->fetch(PDO::FETCH_ASSOC);

                    // Recupera le domande associate al quiz
                    $stmtDomande = $pdo->prepare("SELECT numero, testo FROM Domanda WHERE quiz = :quizId ORDER BY numero ASC");
                    $stmtDomande->bindParam(':quizId', $quizId, PDO::PARAM_INT);
                    $stmtDomande->execute();
                    $domande = $stmtDomande->fetchAll(PDO::FETCH_ASSOC);

                    // Per ogni domanda, recupera le relative risposte
                    foreach ($domande as $key => $domanda) {
                        $stmtRisposte = $pdo->prepare("SELECT numero, testo, tipo, punteggio FROM Risposta WHERE quiz = :quizId AND domanda = :numeroDomanda ORDER BY numero ASC");
                        $stmtRisposte->bindParam(':quizId', $quizId, PDO::PARAM_INT);
                        $stmtRisposte->bindParam(':numeroDomanda', $domanda['numero'], PDO::PARAM_INT); // 'domanda' in Risposta è il 'numero' di Domanda
                        $stmtRisposte->execute();
                        $domande[$key]['risposte'] = $stmtRisposte->fetchAll(PDO::FETCH_ASSOC);
                    }
                    $quiz['domande_complete'] = $domande;
                    echo json_encode(['status' => 'success', 'data' => $quiz]);
                } else {
                    handleError('Quiz non trovato con ID: ' . $quizId, 404);
                }
            } catch (PDOException $e) {
                handleError('Errore del database durante il recupero del quiz.', 500, $e->getMessage() . "\n" . $e->getTraceAsString());
            }
        // --- Eliminazione Quiz ---
        // Utilizza un parametro specifico `delId` per distinguere dall'operazione di recupero.
        } elseif (isset($_GET['delId'])) {
            if (!isAuthenticated()) {
                handleError('Autenticazione richiesta per eliminare un quiz.', 401);
            }
            $quizIdToDelete = filter_var($_GET['delId'], FILTER_VALIDATE_INT);
            if ($quizIdToDelete === false) {
                handleError('ID Quiz non valido per l\'eliminazione.', 400);
            }
            $nomeUtente = $_SESSION['user']['nomeUtente'];

            // Verifica che l'utente sia il proprietario del quiz prima di eliminarlo.
            if (isOwnerOfQuizActual($pdo, $quizIdToDelete, $nomeUtente)) {
                try {
                    $pdo->beginTransaction(); // Transazione per garantire l'eliminazione atomica

                    // L'ordine di eliminazione è importante per rispettare i vincoli di integrità referenziale (foreign keys).
                    // Si eliminano prima i record nelle tabelle dipendenti.
                    // 1. Risposte Utente (se presenti e con FK verso Risposta, altrimenti direttamente verso Domanda/Quiz)
                    //    Nel tuo schema, RispostaUtenteQuiz ha FK verso Partecipazione, Quiz, Domanda, Risposta.
                    //    Cancellare le Risposte e le Domande dovrebbe propagare (se ON DELETE CASCADE)
                    //    o richiedere una cancellazione esplicita qui.
                    //    Assumiamo che cancellare Partecipazione, Risposta, Domanda copra RispostaUtenteQuiz.

                    // 2. Risposte (figlie di Domanda)
                    $stmt = $pdo->prepare("DELETE FROM Risposta WHERE quiz = :quizId");
                    $stmt->bindParam(':quizId', $quizIdToDelete, PDO::PARAM_INT);
                    $stmt->execute();

                    // 3. Domande (figlie di Quiz)
                    $stmt = $pdo->prepare("DELETE FROM Domanda WHERE quiz = :quizId");
                    $stmt->bindParam(':quizId', $quizIdToDelete, PDO::PARAM_INT);
                    $stmt->execute();

                    // 4. Partecipazioni (legate a Quiz)
                    $stmt = $pdo->prepare("DELETE FROM Partecipazione WHERE quiz = :quizId");
                    $stmt->bindParam(':quizId', $quizIdToDelete, PDO::PARAM_INT);
                    $stmt->execute();

                    // 5. Infine, il Quiz stesso
                    $stmt = $pdo->prepare("DELETE FROM Quiz WHERE codice = :quizId");
                    $stmt->bindParam(':quizId', $quizIdToDelete, PDO::PARAM_INT);
                    $stmt->execute();

                    $pdo->commit();
                    http_response_code(200); // OK (o 204 No Content se non si restituisce corpo)
                    echo json_encode(['status' => 'success', 'message' => 'Quiz eliminato con successo.']);
                } catch (PDOException $e) {
                    $pdo->rollBack();
                    handleError('Errore durante l\'eliminazione del quiz.', 500, $e->getMessage() . "\n" . $e->getTraceAsString());
                }
            } else {
                handleError('Quiz non trovato o non sei autorizzato a eliminarlo.', 403); // Forbidden o 404
            }
        // --- Recupero Lista Quiz (con filtri opzionali) ---
        } else {
            try {
                // Query base per recuperare i quiz, includendo nome/cognome del creatore e numero partecipanti.
                // Di default, mostra solo quiz non scaduti o senza data di fine.
                $query = "
                    SELECT q.codice, q.titolo, q.dataInizio, q.dataFine, q.creatore, 
                           u.nome as creatoreNome, u.cognome as creatoreCognome, 
                           COUNT(DISTINCT p.utente) as numPartecipanti
                    FROM Quiz q
                    JOIN Utente u ON q.creatore = u.nomeUtente
                    LEFT JOIN Partecipazione p ON q.codice = p.quiz
                    WHERE (q.dataFine IS NULL OR q.dataFine >= CURRENT_DATE()) 
                ";
                $queryParams = [];

                // Filtro opzionale per creatore
                if (isset($_GET['creatore'])) {
                    $query .= " AND q.creatore = :creatore";
                    $queryParams[':creatore'] = $_GET['creatore'];
                }
                // TODO: Aggiungere altri filtri se necessario (es. per stato aperto/chiuso, range di date).

                $query .= " GROUP BY q.codice, q.titolo, q.dataInizio, q.dataFine, q.creatore, u.nome, u.cognome 
                            ORDER BY q.dataInizio DESC, q.titolo ASC";

                $stmt = $pdo->prepare($query);
                $stmt->execute($queryParams);
                $quizzes = $stmt->fetchAll(PDO::FETCH_ASSOC);
                echo json_encode(['status' => 'success', 'data' => $quizzes]);
            } catch (PDOException $e) {
                handleError('Errore del database nel recupero della lista dei quiz.', 500, $e->getMessage() . "\n" . $e->getTraceAsString());
            }
        }
        break;

    case 'POST':
        if (!isAuthenticated()) {
            handleError('Autenticazione richiesta per questa operazione.', 401);
        }
        $currentUser = $_SESSION['user']['nomeUtente'];
        $data = $_POST; // Dati provenienti dal form (application/x-www-form-urlencoded o multipart/form-data)

        // --- Aggiornamento Quiz Esistente (con domande e risposte) ---
        if (isset($_GET['action']) && $_GET['action'] === 'update') {
            if (!isset($data['quiz_id']) || !($quizId = filter_var($data['quiz_id'], FILTER_VALIDATE_INT))) {
                handleError('ID quiz mancante o non valido per l\'aggiornamento.', 400);
            }

            // Verifica proprietà del quiz
            if (!isOwnerOfQuizActual($pdo, $quizId, $currentUser)) {
                handleError('Non autorizzato a modificare questo quiz o quiz non trovato.', 403); // Forbidden o 404
            }

            try {
                $pdo->beginTransaction(); // Transazione per l'intera operazione di aggiornamento

                // --- PASSO 1: Aggiorna i dettagli del Quiz (titolo, dataInizio, dataFine) ---
                $updateQuizDetailsSqlParts = [];
                $quizUpdateParams = [':quiz_id' => $quizId, ':current_user' => $currentUser]; // :current_user per ulteriore sicurezza

                if (isset($data['titolo']) && trim($data['titolo']) !== '') {
                    $updateQuizDetailsSqlParts[] = "titolo = :titolo";
                    $quizUpdateParams[':titolo'] = trim($data['titolo']);
                }
                if (isset($data['dataInizio']) && !empty($data['dataInizio'])) {
                    // TODO: Aggiungere validazione formato data
                    $updateQuizDetailsSqlParts[] = "dataInizio = :dataInizio";
                    $quizUpdateParams[':dataInizio'] = $data['dataInizio'];
                }
                if (isset($data['dataFine']) && !empty($data['dataFine'])) {
                    // TODO: Aggiungere validazione formato data e logica (es. dataFine >= dataInizio)
                    $updateQuizDetailsSqlParts[] = "dataFine = :dataFine";
                    $quizUpdateParams[':dataFine'] = $data['dataFine'];
                }

                if (!empty($updateQuizDetailsSqlParts)) {
                    $sqlQuizUpdate = "UPDATE Quiz SET " . implode(', ', $updateQuizDetailsSqlParts) .
                                     " WHERE codice = :quiz_id AND creatore = :current_user";
                    $stmtQuizUpdate = $pdo->prepare($sqlQuizUpdate);
                    if (!$stmtQuizUpdate->execute($quizUpdateParams)) {
                        throw new PDOException("Errore aggiornamento dettagli quiz: " . implode(" ", $stmtQuizUpdate->errorInfo()));
                    }
                    error_log("API Update: Dettagli Quiz ID $quizId aggiornati. Righe: " . $stmtQuizUpdate->rowCount());
                }

                // --- PASSO 2: Gestione Domande Rimosse ---
                // Identifica le domande esistenti nel DB per questo quiz.
                $stmtDbQ_Pre = $pdo->prepare("SELECT numero FROM Domanda WHERE quiz = :quizId");
                $stmtDbQ_Pre->execute([':quizId' => $quizId]);
                $dbExistingQuestionNumbers = $stmtDbQ_Pre->fetchAll(PDO::FETCH_COLUMN, 0); // Array di numeri di domanda
                $dbExistingQuestionNumbers = array_map('intval', $dbExistingQuestionNumbers);


                // Identifica i numeri delle domande 'originali' inviate dal form.
                // Le domande inviate dovrebbero avere un campo `original_numero_domanda` se sono preesistenti.
                $formSentOriginalQuestionNumbers = [];
                if (isset($data['questions']) && is_array($data['questions'])) {
                    foreach ($data['questions'] as $qData) {
                        if (isset($qData['original_numero_domanda']) && $qData['original_numero_domanda'] !== '' && (int)$qData['original_numero_domanda'] > 0) {
                            $formSentOriginalQuestionNumbers[] = (int)$qData['original_numero_domanda'];
                        }
                    }
                }

                // Le domande da cancellare sono quelle presenti nel DB ma non più nell'elenco inviato dal form.
                $questionsToDelete = array_diff($dbExistingQuestionNumbers, $formSentOriginalQuestionNumbers);

                if (!empty($questionsToDelete)) {
                    $placeholdersDQ = implode(',', array_fill(0, count($questionsToDelete), '?'));

                    // Prima, cancella le righe in RispostaUtenteQuiz che si riferiscono a risposte delle domande da eliminare.
                    // Questo è necessario per evitare violazioni di foreign key se RispostaUtenteQuiz ha un FK diretto a Risposta.
                    $sqlSelectRisposteToDelete = "SELECT quiz, domanda, numero FROM Risposta WHERE quiz = ? AND domanda IN ($placeholdersDQ)";
                    $stmtSelectR = $pdo->prepare($sqlSelectRisposteToDelete);
                    $paramsSelectR = array_merge([$quizId], $questionsToDelete);
                    $stmtSelectR->execute($paramsSelectR);
                    $risposteDiDomandeCancellate = $stmtSelectR->fetchAll(PDO::FETCH_ASSOC);

                    if (!empty($risposteDiDomandeCancellate)) {
                        $deleteRUQConditions = [];
                        $deleteRUQParams = [];
                        foreach ($risposteDiDomandeCancellate as $r) {
                            // 'risposta' in RispostaUtenteQuiz è 'numero' in Risposta
                            $deleteRUQConditions[] = "(quiz = ? AND domanda = ? AND risposta = ?)";
                            array_push($deleteRUQParams, $r['quiz'], $r['domanda'], $r['numero']);
                        }
                        if (!empty($deleteRUQConditions)) {
                            $sqlDeleteRUQ = "DELETE FROM RispostaUtenteQuiz WHERE " . implode(" OR ", $deleteRUQConditions);
                            $stmtDelRUQ = $pdo->prepare($sqlDeleteRUQ);
                            $stmtDelRUQ->execute($deleteRUQParams);
                            error_log("API Update: RispostaUtenteQuiz cancellate per quiz $quizId, domande " . implode(', ', $questionsToDelete));
                        }
                    }

                    // Poi, cancella le Risposte associate alle domande da eliminare.
                    $stmtDelR = $pdo->prepare("DELETE FROM Risposta WHERE quiz = ? AND domanda IN ($placeholdersDQ)");
                    $stmtDelR->execute(array_merge([$quizId], $questionsToDelete));
                    error_log("API Update: Risposte cancellate per quiz $quizId, domande " . implode(', ', $questionsToDelete));

                    // Infine, cancella le Domande stesse.
                    $stmtDelQ = $pdo->prepare("DELETE FROM Domanda WHERE quiz = ? AND numero IN ($placeholdersDQ)");
                    $stmtDelQ->execute(array_merge([$quizId], $questionsToDelete));
                    error_log("API Update: Domande cancellate (quiz $quizId): " . implode(', ', $questionsToDelete));
                }

                // --- PASSO 3: Itera sulle Domande Inviate per Aggiornarle o Inserirle ---
                if (isset($data['questions']) && is_array($data['questions'])) {
                    // $newQuestionOrder non sembra usato attivamente per riordinare, ma per assegnare 'numero' a nuove domande.
                    // Per nuove domande, il 'numero' è determinato da MAX(numero)+1 per quel quiz.

                    foreach ($data['questions'] as $q_idx => $q_data) {
                        if (!is_array($q_data)) {
                             throw new Exception("Dati domanda non validi per l'indice form $q_idx. Atteso array.");
                        }
                        $q_text = trim($q_data['text'] ?? '');
                        if (empty($q_text)) {
                            $qIdentifier = isset($q_data['original_numero_domanda']) && !empty($q_data['original_numero_domanda']) ?
                                "domanda esistente DB #" . $q_data['original_numero_domanda'] :
                                "nuova domanda (indice form $q_idx)";
                            throw new Exception("Il testo per $qIdentifier non può essere vuoto. Dati: " . json_encode($q_data));
                        }

                        $isNewQuestion = !isset($q_data['original_numero_domanda']) || $q_data['original_numero_domanda'] === '' || (int)$q_data['original_numero_domanda'] <= 0;
                        $currentQuestionDbNumber = null; // Numero della domanda nel DB (sia per update che per insert)

                        if ($isNewQuestion) {
                            // NUOVA DOMANDA: determina il prossimo 'numero' e inserisci.
                            $stmtNextQNum = $pdo->prepare("SELECT COALESCE(MAX(numero), 0) + 1 as next_num FROM Domanda WHERE quiz = :quizId");
                            $stmtNextQNum->execute([':quizId' => $quizId]);
                            $currentQuestionDbNumber = (int)$stmtNextQNum->fetchColumn();

                            $stmtInsertQ = $pdo->prepare("INSERT INTO Domanda (quiz, numero, testo) VALUES (:quizId, :numero, :testo)");
                            $stmtInsertQ->execute([
                                ':quizId' => $quizId,
                                ':numero' => $currentQuestionDbNumber,
                                ':testo' => $q_text
                            ]);
                            error_log("API Update: Nuova domanda (quiz $quizId, #$currentQuestionDbNumber): '$q_text'");
                        } else {
                            // DOMANDA ESISTENTE: aggiorna il testo.
                            $currentQuestionDbNumber = (int)$q_data['original_numero_domanda'];
                            $stmtUpdateQ = $pdo->prepare("UPDATE Domanda SET testo = :testo WHERE quiz = :quizId AND numero = :original_q_num");
                            $stmtUpdateQ->execute([
                                ':testo' => $q_text,
                                ':quizId' => $quizId,
                                ':original_q_num' => $currentQuestionDbNumber
                            ]);
                            error_log("API Update: Aggiornata domanda (quiz $quizId, #$currentQuestionDbNumber): '$q_text'");

                            // Per le domande esistenti, gestisci le risposte rimosse.
                            $stmtDbA_Pre = $pdo->prepare("SELECT numero FROM Risposta WHERE quiz = :quizId AND domanda = :domandaNum");
                            $stmtDbA_Pre->execute([':quizId' => $quizId, ':domandaNum' => $currentQuestionDbNumber]);
                            $dbExistingAnswerNumbers = array_map('intval', $stmtDbA_Pre->fetchAll(PDO::FETCH_COLUMN, 0));

                            $formSentOriginalAnswerNumbers = [];
                            if (isset($q_data['answers']) && is_array($q_data['answers'])) {
                                foreach ($q_data['answers'] as $a_data_check) {
                                     if (is_array($a_data_check) && isset($a_data_check['original_numero_risposta']) && $a_data_check['original_numero_risposta'] !== '' && (int)$a_data_check['original_numero_risposta'] > 0) {
                                        $formSentOriginalAnswerNumbers[] = (int)$a_data_check['original_numero_risposta'];
                                    }
                                }
                            }
                            $answersToDelete = array_diff($dbExistingAnswerNumbers, $formSentOriginalAnswerNumbers);

                            if (!empty($answersToDelete)) {
                                $placeholdersDA = implode(',', array_fill(0, count($answersToDelete), '?'));
                                // Cancella da RispostaUtenteQuiz per le risposte eliminate
                                $stmtDelRUQ_A = $pdo->prepare("DELETE FROM RispostaUtenteQuiz WHERE quiz = ? AND domanda = ? AND risposta IN ($placeholdersDA)");
                                $stmtDelRUQ_A->execute(array_merge([$quizId, $currentQuestionDbNumber], $answersToDelete));
                                error_log("API Update: RispostaUtenteQuiz cancellate per domanda #$currentQuestionDbNumber, quiz $quizId, risposte " . implode(', ', $answersToDelete));

                                // Cancella le Risposte
                                $stmtDelA = $pdo->prepare("DELETE FROM Risposta WHERE quiz = ? AND domanda = ? AND numero IN ($placeholdersDA)");
                                $stmtDelA->execute(array_merge([$quizId, $currentQuestionDbNumber], $answersToDelete));
                                error_log("API Update: Risposte eliminate (quiz $quizId, domanda #$currentQuestionDbNumber): " . implode(', ', $answersToDelete));
                            }
                        }

                        // --- PASSO 3.1: Gestisci le Risposte per la domanda corrente (nuova o aggiornata) ---
                        if (isset($q_data['answers']) && is_array($q_data['answers'])) {
                            foreach ($q_data['answers'] as $a_idx => $a_data) {
                                if (!is_array($a_data)) {
                                    throw new Exception("Dati risposta non validi per domanda #$currentQuestionDbNumber, indice form $a_idx. Atteso array.");
                                }
                                $a_text = trim($a_data['text'] ?? '');
                                if (empty($a_text)) {
                                    error_log("API Update: Risposta saltata (testo vuoto) per domanda #$currentQuestionDbNumber, quiz $quizId, indice form $a_idx.");
                                    continue; // Salta risposte con testo vuoto
                                }

                                if (!isset($a_data['type']) || !in_array($a_data['type'], ['Corretta', 'Sbagliata'])) {
                                    throw new Exception("Tipo risposta non valido per domanda #$currentQuestionDbNumber, indice form $a_idx. Ricevuto: '" . htmlspecialchars($a_data['type'] ?? 'NULL') . "'.");
                                }
                                $a_type = $a_data['type'];
                                $a_points = 0;
                                if ($a_type === 'Corretta') {
                                    if (isset($a_data['points']) && is_numeric($a_data['points']) && (int)$a_data['points'] >= 0) {
                                        $a_points = (int)$a_data['points'];
                                    } else {
                                        $a_points = 1; // Default punti per risposta corretta
                                    }
                                }

                                $isNewAnswer = !isset($a_data['original_numero_risposta']) || $a_data['original_numero_risposta'] === '' || (int)$a_data['original_numero_risposta'] <= 0;

                                if ($isNewAnswer) {
                                    // NUOVA RISPOSTA: determina il prossimo 'numero' e inserisci.
                                    $stmtNextANum = $pdo->prepare("SELECT COALESCE(MAX(numero), 0) + 1 as next_num FROM Risposta WHERE quiz = :quizId AND domanda = :domandaNum");
                                    $stmtNextANum->execute([':quizId' => $quizId, ':domandaNum' => $currentQuestionDbNumber]);
                                    $currentAnswerDbNumber = (int)$stmtNextANum->fetchColumn();

                                    $stmtInsertA = $pdo->prepare("INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES (:quizId, :domanda_numero, :numero_risposta, :testo, :tipo, :punteggio)");
                                    $stmtInsertA->execute([
                                        ':quizId' => $quizId,
                                        ':domanda_numero' => $currentQuestionDbNumber,
                                        ':numero_risposta' => $currentAnswerDbNumber,
                                        ':testo' => $a_text,
                                        ':tipo' => $a_type,
                                        ':punteggio' => $a_points
                                    ]);
                                    error_log("API Update: Nuova risposta (q#$currentQuestionDbNumber, r#$currentAnswerDbNumber): '$a_text'");
                                } else {
                                    // RISPOSTA ESISTENTE: aggiorna.
                                    $original_a_num = (int)$a_data['original_numero_risposta'];
                                    $stmtUpdateA = $pdo->prepare("UPDATE Risposta SET testo = :testo, tipo = :tipo, punteggio = :punteggio WHERE quiz = :quizId AND domanda = :domanda_numero AND numero = :original_a_num");
                                    $stmtUpdateA->execute([
                                        ':testo' => $a_text,
                                        ':tipo' => $a_type,
                                        ':punteggio' => $a_points,
                                        ':quizId' => $quizId,
                                        ':domanda_numero' => $currentQuestionDbNumber,
                                        ':original_a_num' => $original_a_num
                                    ]);
                                    error_log("API Update: Aggiornata risposta (q#$currentQuestionDbNumber, r#$original_a_num): '$a_text'");
                                }
                            }
                        }
                    }
                }
                $pdo->commit(); // Conferma tutte le modifiche
                echo json_encode(['status' => 'success', 'message' => 'Quiz aggiornato con successo.']);

            } catch (PDOException $e) {
                if ($pdo->inTransaction()) $pdo->rollBack();
                handleError('Errore database durante l\'aggiornamento del quiz: ' . $e->getMessage(), 500, $e->getTraceAsString() . " | Dati POST: " . print_r($data, true));
            } catch (Exception $e) { // Per eccezioni personalizzate (es. testo vuoto)
                if ($pdo->inTransaction()) $pdo->rollBack();
                handleError('Errore durante l\'aggiornamento del quiz: ' . $e->getMessage(), 400, "Dati POST: " . print_r($data, true));
            }
        // --- Creazione Nuovo Quiz (solo metadati) ---
        } else {
            // Questa sezione gestisce solo la creazione del record 'Quiz'.
            // Le domande e risposte andrebbero aggiunte in un secondo momento,
            // ad esempio tramite l'endpoint `questions.php` o un'interfaccia dedicata.
            if (!isset($data['titolo']) || !isset($data['dataInizio']) || !isset($data['dataFine'])) {
                handleError('Dati incompleti per la creazione del quiz (titolo, dataInizio, dataFine richiesti).', 400);
            }
            $titolo = trim($data['titolo']);
            $dataInizio = $data['dataInizio']; // TODO: Validare formato data
            $dataFine = $data['dataFine'];     // TODO: Validare formato data

            if (empty($titolo)) {
                handleError('Il titolo del quiz non può essere vuoto.', 400);
            }
            // TODO: Aggiungere validazione che dataFine >= dataInizio se entrambe presenti.

            try {
                // Controlla se esiste già un quiz con lo stesso titolo creato dallo stesso utente.
                // Questo previene duplicati accidentali.
                $stmtCheck = $pdo->prepare("SELECT COUNT(*) FROM Quiz WHERE titolo = :titolo AND creatore = :creatore");
                $stmtCheck->execute([':titolo' => $titolo, ':creatore' => $currentUser]);
                if ($stmtCheck->fetchColumn() > 0) {
                    handleError('Esiste già un quiz con questo titolo creato da te. Scegli un titolo diverso.', 409); // Conflict
                }

                $stmt = $pdo->prepare("INSERT INTO Quiz (titolo, dataInizio, dataFine, creatore) VALUES (:titolo, :dataInizio, :dataFine, :creatore)");
                $stmt->execute([
                    ':titolo' => $titolo,
                    ':dataInizio' => $dataInizio,
                    ':dataFine' => $dataFine,
                    ':creatore' => $currentUser
                ]);
                $newQuizId = $pdo->lastInsertId();
                http_response_code(201); // Created
                echo json_encode(['status' => 'success', 'message' => 'Quiz creato con successo.', 'idQuiz' => $newQuizId]);
            } catch (PDOException $e) {
                handleError('Errore database durante la creazione del quiz.', 500, $e->getMessage() . "\n" . $e->getTraceAsString());
            }
        }
        break;

    case 'PUT':
        // Il metodo PUT è semanticamente per la sostituzione completa di una risorsa.
        // L'approccio POST con action=update è comune per form HTML e API più semplici.
        // Si potrebbe implementare PUT se si adotta un approccio REST più rigoroso.
        handleError('Metodo PUT non supportato. Utilizzare POST con action=update per gli aggiornamenti.', 405);
        break;

    default:
        handleError('Metodo HTTP non consentito per questa risorsa.', 405);
}
?>