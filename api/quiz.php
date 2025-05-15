<?php
/**
 * API per la gestione dei Quiz.
 *
 * Questo script gestisce le operazioni CRUD (Create, Read, Update, Delete)
 * relative ai quiz, incluse le loro domande e risposte associate.
 * L'API risponde in formato JSON.
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
    session_start(); // Avvia la sessione se non già attiva
}
require_once '../config/database.php'; // Include la configurazione per la connessione al database
header('Content-Type: application/json'); // Imposta l'header per indicare che le risposte saranno sempre in formato JSON

// --- Funzioni di Utilità ---

/**
 * Verifica se l'utente corrente è autenticato.
 *
 * Controlla la presenza e la validità dell'utente nella sessione.
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
 * Esegue una query per determinare se il nome utente fornito corrisponde
 * al creatore del quiz identificato dal codice.
 *
 * @param PDO $pdo L'oggetto PDO per la connessione al database.
 * @param int $quizCodice L'ID del quiz (colonna `Quiz.codice`).
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
 *
 * Questa funzione centralizzata logga l'errore, imposta il codice di stato HTTP appropriato,
 * invia una risposta JSON strutturata e termina l'esecuzione dello script.
 *
 * @param string $message Messaggio di errore destinato all'utente/client.
 * @param int $code Codice di stato HTTP (default: 500 - Internal Server Error).
 * @param string $exceptionDetails Dettagli aggiuntivi sull'eccezione o errore, destinati al log.
 */
function handleError($message, $code = 500, $exceptionDetails = "")
{
    // Costruisce il messaggio di log
    $logMessage = "API Error (quiz.php): " . $message;
    if (!empty($exceptionDetails)) {
        $logMessage .= " | Details: " . $exceptionDetails;
    }
    error_log($logMessage); // Registra l'errore nel log del server

    http_response_code($code); // Imposta il codice di stato HTTP
    // Invia la risposta JSON
    echo json_encode(['status' => 'error', 'message' => $message]);
    exit; // Termina l'esecuzione dello script
}


// --- Gestione delle Richieste API basata sul Metodo HTTP ---
switch ($_SERVER['REQUEST_METHOD']) {
    case 'GET':
        // --- Logica per le richieste GET ---

        // --- Recupero Dettagli Singolo Quiz (con domande e risposte) ---
        if (isset($_GET['id'])) {
            $quizId = filter_var($_GET['id'], FILTER_VALIDATE_INT);
            if ($quizId === false) {
                handleError('ID Quiz non valido per il recupero.', 400); // Bad Request
            }
            try {
                // Prepara e esegue la query per recuperare i dati base del quiz
                // e il numero di partecipanti distinti.
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

                    // Recupera le domande associate al quiz, ordinate per il loro numero progressivo.
                    $stmtDomande = $pdo->prepare("SELECT numero, testo FROM Domanda WHERE quiz = :quizId ORDER BY numero ASC");
                    $stmtDomande->bindParam(':quizId', $quizId, PDO::PARAM_INT);
                    $stmtDomande->execute();
                    $domande = $stmtDomande->fetchAll(PDO::FETCH_ASSOC);

                    // Per ogni domanda, recupera le relative risposte, ordinate per il loro numero progressivo.
                    foreach ($domande as $key => $domanda) {
                        $stmtRisposte = $pdo->prepare("
                            SELECT numero, testo, tipo, punteggio 
                            FROM Risposta 
                            WHERE quiz = :quizId AND domanda = :numeroDomanda 
                            ORDER BY numero ASC
                        ");
                        $stmtRisposte->bindParam(':quizId', $quizId, PDO::PARAM_INT);
                        // 'domanda' nella tabella Risposta si riferisce al 'numero' della Domanda.
                        $stmtRisposte->bindParam(':numeroDomanda', $domanda['numero'], PDO::PARAM_INT);
                        $stmtRisposte->execute();
                        $domande[$key]['risposte'] = $stmtRisposte->fetchAll(PDO::FETCH_ASSOC);
                    }
                    $quiz['domande_complete'] = $domande; // Aggiunge l'array di domande e risposte al quiz
                    echo json_encode(['status' => 'success', 'data' => $quiz]);
                } else {
                    handleError('Quiz non trovato con ID: ' . $quizId, 404); // Not Found
                }
            } catch (PDOException $e) {
                handleError('Errore del database durante il recupero del quiz.', 500, $e->getMessage() . "\n" . $e->getTraceAsString());
            }
        // --- Eliminazione Quiz ---
        // Utilizza un parametro specifico `delId` per distinguere dall'operazione di recupero standard,
        // sebbene l'eliminazione tramite GET non sia strettamente RESTful (sarebbe preferibile DELETE).
        } elseif (isset($_GET['delId'])) {
            if (!isAuthenticated()) {
                handleError('Autenticazione richiesta per eliminare un quiz.', 401); // Unauthorized
            }
            $quizIdToDelete = filter_var($_GET['delId'], FILTER_VALIDATE_INT);
            if ($quizIdToDelete === false) {
                handleError('ID Quiz non valido per l\'eliminazione.', 400); // Bad Request
            }
            $nomeUtente = $_SESSION['user']['nomeUtente'];

            // Verifica che l'utente autenticato sia il proprietario del quiz prima di procedere con l'eliminazione.
            if (isOwnerOfQuizActual($pdo, $quizIdToDelete, $nomeUtente)) {
                try {
                    $pdo->beginTransaction(); // Inizia una transazione per garantire l'atomicità dell'eliminazione.

                    // L'ordine di eliminazione è fondamentale per rispettare i vincoli di integrità referenziale (foreign keys).
                    // Si eliminano prima i record nelle tabelle dipendenti (figlie).

                    // 1. Elimina le Risposte associate al quiz.
                    $stmt = $pdo->prepare("DELETE FROM Risposta WHERE quiz = :quizId");
                    $stmt->bindParam(':quizId', $quizIdToDelete, PDO::PARAM_INT);
                    $stmt->execute();

                    // 2. Elimina le Domande associate al quiz.
                    $stmt = $pdo->prepare("DELETE FROM Domanda WHERE quiz = :quizId");
                    $stmt->bindParam(':quizId', $quizIdToDelete, PDO::PARAM_INT);
                    $stmt->execute();

                    // 3. Elimina le Partecipazioni associate al quiz.
                    $stmt = $pdo->prepare("DELETE FROM Partecipazione WHERE quiz = :quizId");
                    $stmt->bindParam(':quizId', $quizIdToDelete, PDO::PARAM_INT);
                    $stmt->execute();

                    // 4. Infine, elimina il Quiz stesso.
                    $stmt = $pdo->prepare("DELETE FROM Quiz WHERE codice = :quizId");
                    $stmt->bindParam(':quizId', $quizIdToDelete, PDO::PARAM_INT);
                    $stmt->execute();

                    $pdo->commit(); // Conferma le modifiche se tutte le operazioni hanno avuto successo.
                    http_response_code(200); // OK (o 204 No Content se non si restituisce un corpo)
                    echo json_encode(['status' => 'success', 'message' => 'Quiz eliminato con successo.']);
                } catch (PDOException $e) {
                    $pdo->rollBack(); // Annulla le modifiche in caso di errore.
                    handleError('Errore durante l\'eliminazione del quiz.', 500, $e->getMessage() . "\n" . $e->getTraceAsString());
                }
            } else {
                // L'utente non è proprietario o il quiz non esiste.
                handleError('Quiz non trovato o non sei autorizzato a eliminarlo.', 403); // Forbidden (o 404 se si preferisce nascondere l'esistenza della risorsa)
            }
        // --- Recupero Lista Quiz (con filtri opzionali) ---
        } else {
            try {
                // Query base per recuperare i quiz.
                // Include informazioni sul creatore (nome, cognome) e il numero di partecipanti.
                // Di default, mostra solo quiz attivi (non scaduti o senza data di fine).
                $query = "
                    SELECT q.codice, q.titolo, q.dataInizio, q.dataFine, q.creatore, 
                           u.nome as creatoreNome, u.cognome as creatoreCognome, 
                           COUNT(DISTINCT p.utente) as numPartecipanti
                    FROM Quiz q
                    JOIN Utente u ON q.creatore = u.nomeUtente
                    LEFT JOIN Partecipazione p ON q.codice = p.quiz
                    WHERE (q.dataFine IS NULL OR q.dataFine >= CURRENT_DATE()) 
                ";
                $queryParams = []; // Array per i parametri della query

                // Filtro opzionale: per creatore del quiz.
                if (isset($_GET['creatore'])) {
                    $query .= " AND q.creatore = :creatore";
                    $queryParams[':creatore'] = $_GET['creatore'];
                }

                // Raggruppa i risultati per quiz e ordina per data di inizio (più recenti prima) e poi per titolo.
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
        // --- Logica per le richieste POST (Creazione e Aggiornamento) ---
        if (!isAuthenticated()) {
            handleError('Autenticazione richiesta per questa operazione.', 401); // Unauthorized
        }
        $currentUser = $_SESSION['user']['nomeUtente'];
        // I dati sono attesi da un form (application/x-www-form-urlencoded o multipart/form-data).
        $data = $_POST;

        // --- Aggiornamento Quiz Esistente (con gestione di domande e risposte) ---
        if (isset($_GET['action']) && $_GET['action'] === 'update') {
            // Verifica la presenza e validità dell'ID del quiz da aggiornare.
            if (!isset($data['quiz_id']) || !($quizId = filter_var($data['quiz_id'], FILTER_VALIDATE_INT))) {
                handleError('ID quiz mancante o non valido per l\'aggiornamento.', 400); // Bad Request
            }

            // Verifica che l'utente autenticato sia il proprietario del quiz.
            if (!isOwnerOfQuizActual($pdo, $quizId, $currentUser)) {
                handleError('Non autorizzato a modificare questo quiz o quiz non trovato.', 403); // Forbidden (o 404)
            }

            try {
                $pdo->beginTransaction(); // Inizia una transazione per l'intera operazione di aggiornamento.

                // --- PASSO 1: Aggiorna i dettagli del Quiz (titolo, dataInizio, dataFine) ---
                $updateQuizDetailsSqlParts = []; // Array per costruire dinamicamente la query di update
                $quizUpdateParams = [':quiz_id' => $quizId, ':current_user' => $currentUser]; // Parametri base per la query

                // Aggiunge i campi da aggiornare solo se forniti e validi.
                if (isset($data['titolo']) && trim($data['titolo']) !== '') {
                    $updateQuizDetailsSqlParts[] = "titolo = :titolo";
                    $quizUpdateParams[':titolo'] = trim($data['titolo']);
                }
                if (isset($data['dataInizio']) && !empty($data['dataInizio'])) {
                    $updateQuizDetailsSqlParts[] = "dataInizio = :dataInizio";
                    $quizUpdateParams[':dataInizio'] = $data['dataInizio'];
                }
                if (isset($data['dataFine']) && !empty($data['dataFine'])) {
                    $updateQuizDetailsSqlParts[] = "dataFine = :dataFine";
                    $quizUpdateParams[':dataFine'] = $data['dataFine'];
                }

                // Se ci sono dettagli del quiz da aggiornare, esegue la query.
                if (!empty($updateQuizDetailsSqlParts)) {
                    $sqlQuizUpdate = "UPDATE Quiz SET " . implode(', ', $updateQuizDetailsSqlParts) .
                                     " WHERE codice = :quiz_id AND creatore = :current_user"; // Sicurezza aggiuntiva sul creatore
                    $stmtQuizUpdate = $pdo->prepare($sqlQuizUpdate);
                    if (!$stmtQuizUpdate->execute($quizUpdateParams)) {
                        // Lancia un'eccezione se l'aggiornamento fallisce, per triggerare il rollback.
                        throw new PDOException("Errore aggiornamento dettagli quiz: " . implode(" ", $stmtQuizUpdate->errorInfo()));
                    }
                    error_log("API Update: Dettagli Quiz ID $quizId aggiornati. Righe modificate: " . $stmtQuizUpdate->rowCount());
                }

                // --- PASSO 2: Gestione delle Domande Rimosse ---
                // Identifica le domande attualmente esistenti nel database per questo quiz.
                $stmtDbQ_Pre = $pdo->prepare("SELECT numero FROM Domanda WHERE quiz = :quizId");
                $stmtDbQ_Pre->execute([':quizId' => $quizId]);
                $dbExistingQuestionNumbers = $stmtDbQ_Pre->fetchAll(PDO::FETCH_COLUMN, 0); // Array di numeri di domanda (es. [1, 2, 5])
                $dbExistingQuestionNumbers = array_map('intval', $dbExistingQuestionNumbers);


                // Identifica i numeri delle domande 'originali' inviate dal form.
                // Le domande preesistenti inviate dal client dovrebbero avere un campo `original_numero_domanda`.
                $formSentOriginalQuestionNumbers = [];
                if (isset($data['questions']) && is_array($data['questions'])) {
                    foreach ($data['questions'] as $qData) {
                        if (isset($qData['original_numero_domanda']) && $qData['original_numero_domanda'] !== '' && (int)$qData['original_numero_domanda'] > 0) {
                            $formSentOriginalQuestionNumbers[] = (int)$qData['original_numero_domanda'];
                        }
                    }
                }

                // Determina le domande da cancellare: quelle presenti nel DB ma non più nell'elenco inviato dal form.
                $questionsToDelete = array_diff($dbExistingQuestionNumbers, $formSentOriginalQuestionNumbers);

                if (!empty($questionsToDelete)) {
                    $placeholdersDQ = implode(',', array_fill(0, count($questionsToDelete), '?')); // Crea placeholder per la query (es. ?,?,?)

                    // Prima di cancellare le domande, è necessario gestire le dipendenze:
                    // 1. Cancellare le righe in `RispostaUtenteQuiz` che si riferiscono a risposte delle domande da eliminare.
                    //    Questo previene violazioni di foreign key se `RispostaUtenteQuiz` ha un FK diretto a `Risposta`
                    //    o se le FK non hanno `ON DELETE CASCADE` appropriato.
                    $sqlSelectRisposteToDelete = "SELECT quiz, domanda, numero FROM Risposta WHERE quiz = ? AND domanda IN ($placeholdersDQ)";
                    $stmtSelectR = $pdo->prepare($sqlSelectRisposteToDelete);
                    $paramsSelectR = array_merge([$quizId], $questionsToDelete);
                    $stmtSelectR->execute($paramsSelectR);
                    $risposteDiDomandeCancellate = $stmtSelectR->fetchAll(PDO::FETCH_ASSOC);

                    if (!empty($risposteDiDomandeCancellate)) {
                        $deleteRUQConditions = [];
                        $deleteRUQParams = [];
                        foreach ($risposteDiDomandeCancellate as $r) {
                            // 'risposta' in RispostaUtenteQuiz corrisponde a 'numero' in Risposta.
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

                    // 2. Poi, cancella le Risposte associate alle domande da eliminare.
                    $stmtDelR = $pdo->prepare("DELETE FROM Risposta WHERE quiz = ? AND domanda IN ($placeholdersDQ)");
                    $stmtDelR->execute(array_merge([$quizId], $questionsToDelete));
                    error_log("API Update: Risposte cancellate per quiz $quizId, domande " . implode(', ', $questionsToDelete));

                    // 3. Infine, cancella le Domande stesse.
                    $stmtDelQ = $pdo->prepare("DELETE FROM Domanda WHERE quiz = ? AND numero IN ($placeholdersDQ)");
                    $stmtDelQ->execute(array_merge([$quizId], $questionsToDelete));
                    error_log("API Update: Domande cancellate (quiz $quizId): " . implode(', ', $questionsToDelete));
                }

                // --- PASSO 3: Itera sulle Domande Inviate per Aggiornarle o Inserirle ---
                if (isset($data['questions']) && is_array($data['questions'])) {
                    // Il 'numero' per le nuove domande viene determinato dinamicamente come MAX(numero attuale) + 1 per quel quiz.

                    foreach ($data['questions'] as $q_idx => $q_data) {
                        if (!is_array($q_data)) {
                             throw new Exception("Dati domanda non validi per l'indice form $q_idx. Atteso un array.");
                        }
                        $q_text = trim($q_data['text'] ?? '');
                        if (empty($q_text)) {
                            $qIdentifier = isset($q_data['original_numero_domanda']) && !empty($q_data['original_numero_domanda']) ?
                                "domanda esistente DB #" . $q_data['original_numero_domanda'] :
                                "nuova domanda (indice form $q_idx)";
                            // Lancia eccezione per indicare un dato mancante essenziale, che verrà gestita come Bad Request.
                            throw new Exception("Il testo per $qIdentifier non può essere vuoto. Dati: " . json_encode($q_data));
                        }

                        // Determina se la domanda è nuova o preesistente.
                        $isNewQuestion = !isset($q_data['original_numero_domanda']) || $q_data['original_numero_domanda'] === '' || (int)$q_data['original_numero_domanda'] <= 0;
                        $currentQuestionDbNumber = null; // Questo sarà il numero della domanda nel DB (per update o dopo insert).

                        if ($isNewQuestion) {
                            // NUOVA DOMANDA: determina il prossimo 'numero' progressivo e inserisci.
                            $stmtNextQNum = $pdo->prepare("SELECT COALESCE(MAX(numero), 0) + 1 as next_num FROM Domanda WHERE quiz = :quizId");
                            $stmtNextQNum->execute([':quizId' => $quizId]);
                            $currentQuestionDbNumber = (int)$stmtNextQNum->fetchColumn(); // Ottiene il prossimo numero disponibile.

                            $stmtInsertQ = $pdo->prepare("INSERT INTO Domanda (quiz, numero, testo) VALUES (:quizId, :numero, :testo)");
                            $stmtInsertQ->execute([
                                ':quizId' => $quizId,
                                ':numero' => $currentQuestionDbNumber,
                                ':testo' => $q_text
                            ]);
                            error_log("API Update: Nuova domanda inserita (quiz $quizId, #$currentQuestionDbNumber): '$q_text'");
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

                            // Per le domande esistenti, è necessario gestire anche le risposte rimosse.
                            // Identifica le risposte esistenti nel DB per questa domanda.
                            $stmtDbA_Pre = $pdo->prepare("SELECT numero FROM Risposta WHERE quiz = :quizId AND domanda = :domandaNum");
                            $stmtDbA_Pre->execute([':quizId' => $quizId, ':domandaNum' => $currentQuestionDbNumber]);
                            $dbExistingAnswerNumbers = array_map('intval', $stmtDbA_Pre->fetchAll(PDO::FETCH_COLUMN, 0));

                            // Identifica i numeri delle risposte 'originali' inviate dal form per questa domanda.
                            $formSentOriginalAnswerNumbers = [];
                            if (isset($q_data['answers']) && is_array($q_data['answers'])) {
                                foreach ($q_data['answers'] as $a_data_check) {
                                     if (is_array($a_data_check) && isset($a_data_check['original_numero_risposta']) && $a_data_check['original_numero_risposta'] !== '' && (int)$a_data_check['original_numero_risposta'] > 0) {
                                        $formSentOriginalAnswerNumbers[] = (int)$a_data_check['original_numero_risposta'];
                                    }
                                }
                            }
                            // Determina le risposte da cancellare per questa domanda.
                            $answersToDelete = array_diff($dbExistingAnswerNumbers, $formSentOriginalAnswerNumbers);

                            if (!empty($answersToDelete)) {
                                $placeholdersDA = implode(',', array_fill(0, count($answersToDelete), '?'));
                                // 1. Cancella da `RispostaUtenteQuiz` per le risposte eliminate.
                                $stmtDelRUQ_A = $pdo->prepare("DELETE FROM RispostaUtenteQuiz WHERE quiz = ? AND domanda = ? AND risposta IN ($placeholdersDA)");
                                $stmtDelRUQ_A->execute(array_merge([$quizId, $currentQuestionDbNumber], $answersToDelete));
                                error_log("API Update: RispostaUtenteQuiz cancellate per domanda #$currentQuestionDbNumber, quiz $quizId, risposte " . implode(', ', $answersToDelete));

                                // 2. Cancella le Risposte stesse.
                                $stmtDelA = $pdo->prepare("DELETE FROM Risposta WHERE quiz = ? AND domanda = ? AND numero IN ($placeholdersDA)");
                                $stmtDelA->execute(array_merge([$quizId, $currentQuestionDbNumber], $answersToDelete));
                                error_log("API Update: Risposte eliminate (quiz $quizId, domanda #$currentQuestionDbNumber): " . implode(', ', $answersToDelete));
                            }
                        }

                        // --- PASSO 3.1: Gestisci le Risposte per la domanda corrente (sia nuova che aggiornata) ---
                        if (isset($q_data['answers']) && is_array($q_data['answers'])) {
                            foreach ($q_data['answers'] as $a_idx => $a_data) {
                                if (!is_array($a_data)) {
                                    throw new Exception("Dati risposta non validi per domanda #$currentQuestionDbNumber, indice form $a_idx. Atteso un array.");
                                }
                                $a_text = trim($a_data['text'] ?? '');
                                if (empty($a_text)) {
                                    // Salta le risposte con testo vuoto, ma logga l'occorrenza.
                                    error_log("API Update: Risposta saltata (testo vuoto) per domanda #$currentQuestionDbNumber, quiz $quizId, indice form $a_idx.");
                                    continue;
                                }

                                // Valida il tipo di risposta.
                                if (!isset($a_data['type']) || !in_array($a_data['type'], ['Corretta', 'Sbagliata'])) {
                                    throw new Exception("Tipo risposta non valido per domanda #$currentQuestionDbNumber, indice form $a_idx. Ricevuto: '" . htmlspecialchars($a_data['type'] ?? 'NULL') . "'. Valori attesi: 'Corretta' o 'Sbagliata'.");
                                }
                                $a_type = $a_data['type'];
                                $a_points = 0; // Default punti per risposta sbagliata.
                                if ($a_type === 'Corretta') {
                                    // Se la risposta è corretta, assegna i punti (default 1 se non specificato o non valido).
                                    if (isset($a_data['points']) && is_numeric($a_data['points']) && (int)$a_data['points'] >= 0) {
                                        $a_points = (int)$a_data['points'];
                                    } else {
                                        $a_points = 1; // Default punti per risposta corretta se non specificato diversamente.
                                    }
                                }

                                // Determina se la risposta è nuova o preesistente.
                                $isNewAnswer = !isset($a_data['original_numero_risposta']) || $a_data['original_numero_risposta'] === '' || (int)$a_data['original_numero_risposta'] <= 0;

                                if ($isNewAnswer) {
                                    // NUOVA RISPOSTA: determina il prossimo 'numero' progressivo per questa domanda e inserisci.
                                    $stmtNextANum = $pdo->prepare("SELECT COALESCE(MAX(numero), 0) + 1 as next_num FROM Risposta WHERE quiz = :quizId AND domanda = :domandaNum");
                                    $stmtNextANum->execute([':quizId' => $quizId, ':domandaNum' => $currentQuestionDbNumber]);
                                    $currentAnswerDbNumber = (int)$stmtNextANum->fetchColumn(); // Ottiene il prossimo numero disponibile.

                                    $stmtInsertA = $pdo->prepare("
                                        INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) 
                                        VALUES (:quizId, :domanda_numero, :numero_risposta, :testo, :tipo, :punteggio)
                                    ");
                                    $stmtInsertA->execute([
                                        ':quizId' => $quizId,
                                        ':domanda_numero' => $currentQuestionDbNumber,
                                        ':numero_risposta' => $currentAnswerDbNumber,
                                        ':testo' => $a_text,
                                        ':tipo' => $a_type,
                                        ':punteggio' => $a_points
                                    ]);
                                    error_log("API Update: Nuova risposta inserita (q#$currentQuestionDbNumber, r#$currentAnswerDbNumber): '$a_text'");
                                } else {
                                    // RISPOSTA ESISTENTE: aggiorna testo, tipo e punteggio.
                                    $original_a_num = (int)$a_data['original_numero_risposta'];
                                    $stmtUpdateA = $pdo->prepare("
                                        UPDATE Risposta 
                                        SET testo = :testo, tipo = :tipo, punteggio = :punteggio 
                                        WHERE quiz = :quizId AND domanda = :domanda_numero AND numero = :original_a_num
                                    ");
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
                $pdo->commit(); // Conferma tutte le modifiche al database se non ci sono state eccezioni.
                echo json_encode(['status' => 'success', 'message' => 'Quiz aggiornato con successo.']);

            } catch (PDOException $e) { // Gestisce errori specifici del database
                if ($pdo->inTransaction()) $pdo->rollBack(); // Annulla la transazione in caso di errore DB
                handleError('Errore database durante l\'aggiornamento del quiz: ' . $e->getMessage(), 500, $e->getTraceAsString() . " | Dati POST: " . print_r($data, true));
            } catch (Exception $e) { // Gestisce eccezioni personalizzate (es. dati mancanti, formato non valido)
                if ($pdo->inTransaction()) $pdo->rollBack(); // Annulla la transazione in caso di errore applicativo
                handleError('Errore durante l\'aggiornamento del quiz: ' . $e->getMessage(), 400, "Dati POST: " . print_r($data, true)); // Bad Request
            }
        // --- Creazione Nuovo Quiz (solo metadati: titolo, date) ---
        } else {
            // Questa sezione gestisce solo la creazione del record principale 'Quiz'.
            // Le domande e risposte dovrebbero essere aggiunte in un secondo momento,
            // ad esempio tramite l'endpoint di aggiornamento o un'interfaccia dedicata.
            if (!isset($data['titolo']) || !isset($data['dataInizio']) || !isset($data['dataFine'])) {
                handleError('Dati incompleti per la creazione del quiz (titolo, dataInizio, dataFine richiesti).', 400); // Bad Request
            }
            $titolo = trim($data['titolo']);
            $dataInizio = $data['dataInizio'];
            $dataFine = $data['dataFine'];

            if (empty($titolo)) {
                handleError('Il titolo del quiz non può essere vuoto.', 400); // Bad Request
            }

            try {
                // Controlla se esiste già un quiz con lo stesso titolo creato dallo stesso utente.
                // Questo aiuta a prevenire duplicati accidentali.
                $stmtCheck = $pdo->prepare("SELECT COUNT(*) FROM Quiz WHERE titolo = :titolo AND creatore = :creatore");
                $stmtCheck->execute([':titolo' => $titolo, ':creatore' => $currentUser]);
                if ($stmtCheck->fetchColumn() > 0) {
                    handleError('Esiste già un quiz con questo titolo creato da te. Scegli un titolo diverso.', 409); // Conflict
                }

                // Inserisce il nuovo quiz nel database.
                $stmt = $pdo->prepare("INSERT INTO Quiz (titolo, dataInizio, dataFine, creatore) VALUES (:titolo, :dataInizio, :dataFine, :creatore)");
                $stmt->execute([
                    ':titolo' => $titolo,
                    ':dataInizio' => $dataInizio,
                    ':dataFine' => $dataFine,
                    ':creatore' => $currentUser
                ]);
                $newQuizId = $pdo->lastInsertId(); // Recupera l'ID del quiz appena inserito.
                http_response_code(201); // Created
                echo json_encode(['status' => 'success', 'message' => 'Quiz creato con successo.', 'idQuiz' => $newQuizId]);
            } catch (PDOException $e) {
                handleError('Errore database durante la creazione del quiz.', 500, $e->getMessage() . "\n" . $e->getTraceAsString());
            }
        }
        break;

    case 'PUT':
        // Il metodo PUT è semanticamente inteso per la sostituzione completa di una risorsa.
        // L'approccio comune di utilizzare POST con un parametro 'action=update' (come fatto qui)
        // è spesso preferito per la sua semplicità con i form HTML e per API che non seguono strettamente
        // tutti i dettami RESTful per l'aggiornamento parziale o completo.
        // L'implementazione di PUT richiederebbe che il client invii l'intera rappresentazione della risorsa.
        handleError('Metodo PUT non supportato. Utilizzare POST con action=update per gli aggiornamenti.', 405); // Method Not Allowed
        break;

    default:
        // Gestisce qualsiasi altro metodo HTTP non esplicitamente supportato.
        handleError('Metodo HTTP non consentito per questa risorsa.', 405); // Method Not Allowed
}
?>