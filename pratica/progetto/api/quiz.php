<?php

/**
 * API per la gestione dei quiz
 * 
 * Questo file gestisce le operazioni CRUD relative ai quiz.
 * Funzionalità implementate:
 * - Creazione di nuovi quiz
 * - Modifica dei dettagli di un quiz esistente
 * - Eliminazione di quiz
 * - Recupero di tutti i quiz disponibili
 * - Recupero dei dettagli di un quiz specifico
 * - Filtraggio dei quiz per data, creatore o stato (aperto/chiuso)
 */

// Inizializzazione della sessione
session_start();

// Include la configurazione del database
require_once '../config/database.php';

// Impostazione degli header per le risposte JSON
header('Content-Type: application/json');

// Verifica del metodo HTTP
$method = $_SERVER['REQUEST_METHOD'];

// Verifica se l'utente è autenticato
function isAuthenticated()
{
    return isset($_SESSION['user']);
}

// Funzione per verificare se un quiz esiste e appartiene all'utente
function isOwnerOfQuiz($pdo, $idQuiz, $nomeUtente)
{
    $stmt = $pdo->prepare("SELECT * FROM Quiz WHERE idQuiz = :idQuiz AND nomeUtente = :nomeUtente");
    $stmt->bindParam(':idQuiz', $idQuiz);
    $stmt->bindParam(':nomeUtente', $nomeUtente);
    $stmt->execute();
    return $stmt->rowCount() > 0;
}

// Gestione delle operazioni in base al metodo HTTP
switch ($method) {
    case 'GET':/*
        // Recupero dei quiz o di un singolo quiz
        if (isset($_GET['id'])) {
            // Recupero di un singolo quiz per ID
            $idQuiz = $_GET['id'];

            try {
                $stmt = $pdo->prepare("
                     SELECT q.*, COUNT(DISTINCT p.nomeUtente) as numPartecipanti 
                     FROM Quiz q 
                     LEFT JOIN Partecipazione p ON q.idQuiz = p.idQuiz 
                     WHERE q.idQuiz = :idQuiz 
                     GROUP BY q.idQuiz
                 ");
                $stmt->bindParam(':idQuiz', $idQuiz);
                $stmt->execute();

                if ($stmt->rowCount() > 0) {
                    $quiz = $stmt->fetch(PDO::FETCH_ASSOC);

                    // Recupera le domande associate a questo quiz
                    $stmtDomande = $pdo->prepare("SELECT * FROM Domanda WHERE idQuiz = :idQuiz");
                    $stmtDomande->bindParam(':idQuiz', $idQuiz);
                    $stmtDomande->execute();
                    $domande = $stmtDomande->fetchAll(PDO::FETCH_ASSOC);

                    // Per ogni domanda, recupera le risposte possibili
                    foreach ($domande as $key => $domanda) {
                        $stmtRisposte = $pdo->prepare("SELECT * FROM Risposta WHERE idDomanda = :idDomanda");
                        $stmtRisposte->bindParam(':idDomanda', $domanda['idDomanda']);
                        $stmtRisposte->execute();
                        $domande[$key]['risposte'] = $stmtRisposte->fetchAll(PDO::FETCH_ASSOC);
                    }

                    $quiz['domande'] = $domande;

                    echo json_encode(['status' => 'success', 'data' => $quiz]);
                } else {
                    http_response_code(404);
                    echo json_encode(['status' => 'error', 'message' => 'Quiz non trovato']);
                }
            } catch (PDOException $e) {
                http_response_code(500);
                echo json_encode(['status' => 'error', 'message' => 'Errore del database: ' . $e->getMessage()]);
            }

        } elseif (isset($_GET['delId'])) {

            if (!isset($_SESSION['user'])) {
                http_response_code(401);
                echo json_encode(['success' => false, 'messaggio' => 'Non sei autenticato']);
                exit;
            }

            $quizId = $_GET['delId'];
            $nomeUtente = $_SESSION['user']['nomeUtente'];

            // Verifica se il quiz appartiene all'utente
            $sql = "SELECT COUNT(*) FROM Quiz WHERE codice = :quizId AND creatore = :nomeUtente";
            $stmt = $pdo->prepare($sql);
            $stmt->bindParam(':quizId', $quizId, PDO::PARAM_STR);
            $stmt->bindParam(':nomeUtente', $nomeUtente, PDO::PARAM_STR);
            $stmt->execute();

            if ($stmt->fetchColumn() > 0) {
                // Elimina il quiz
                $sql = "DELETE FROM Quiz WHERE codice = :quizId";
                $stmt = $pdo->prepare($sql);
                $stmt->bindParam(':quizId', $quizId, PDO::PARAM_STR);
                if ($stmt->execute()) {
                    http_response_code(204);
                } else {
                    http_response_code(500);
                    echo json_encode(['status' => 'error', 'message' => 'Errore durante eliminazione del quiz.']);
                    exit;
                }
            } else {
                http_response_code(403);
                echo json_encode(['status' => 'error', 'message' => 'Quiz non trovato o non autorizzato a eliminarlo.']);
                exit;
            }

        } elseif (isset($_GET['action']) && $_GET['action'] === 'modify') {

            $input = file_get_contents('php://input');
            $data = json_decode($input, true);

            if (json_last_error() !== JSON_ERROR_NONE || !$data) {
                http_response_code(400); // Bad Request
                echo json_encode(['message' => 'Dati JSON non validi o mancanti.']);
                exit;
            }

            // Validazione dati base (aggiungi controlli più specifici)
            $quizId = filter_var($data['quiz_id'] ?? null, FILTER_VALIDATE_INT);
            $titolo = trim($data['titolo'] ?? '');
            $dataInizio = $data['dataInizio'] ?? ''; // Aggiungi validazione formato data
            $dataFine = $data['dataFine'] ?? '';   // Aggiungi validazione formato data
            $questions = $data['questions'] ?? [];

            if (!$quizId || empty($titolo) || empty($dataInizio) || empty($dataFine) || !is_array($questions)) {
                http_response_code(400);
                echo json_encode(['message' => 'Dati mancanti o non validi (quiz_id, titolo, date, questions).']);
                exit;
            }
            // Aggiungere validazione date (formato, dataFine >= dataInizio etc.)

            // --- Inizio Transazione e Operazioni DB ---
            $pdo->beginTransaction();

            try {
                // 1. Verifica Proprietà Quiz
                $sqlCheckOwner = "SELECT creatore FROM Quiz WHERE codice = :quizId";
                $stmtCheckOwner = $pdo->prepare($sqlCheckOwner);
                $stmtCheckOwner->bindParam(':quizId', $quizId, PDO::PARAM_INT);
                $stmtCheckOwner->execute();
                $owner = $stmtCheckOwner->fetchColumn();

                if (!$owner) {
                    $pdo->rollBack();
                    http_response_code(404); // Not Found
                    echo json_encode(['message' => 'Quiz non trovato.']);
                    exit;
                }
                if ($owner !== $nomeUtente) {
                    $pdo->rollBack();
                    http_response_code(403); // Forbidden
                    echo json_encode(['message' => 'Non sei autorizzato a modificare questo quiz.']);
                    exit;
                }

                // 2. Aggiorna Dettagli Quiz
                $sqlUpdateQuiz = "UPDATE Quiz SET titolo = :titolo, dataInizio = :dataInizio, dataFine = :dataFine WHERE codice = :quizId";
                $stmtUpdateQuiz = $pdo->prepare($sqlUpdateQuiz);
                $stmtUpdateQuiz->bindParam(':titolo', $titolo, PDO::PARAM_STR);
                $stmtUpdateQuiz->bindParam(':dataInizio', $dataInizio, PDO::PARAM_STR);
                $stmtUpdateQuiz->bindParam(':dataFine', $dataFine, PDO::PARAM_STR);
                $stmtUpdateQuiz->bindParam(':quizId', $quizId, PDO::PARAM_INT);
                if (!$stmtUpdateQuiz->execute()) {
                    throw new Exception("Errore durante l'aggiornamento dei dettagli del quiz.");
                }

                // 3. Gestione Domande e Risposte (Approccio Semplificato: Cancella e Reinserisci)
                //    ATTENZIONE: Questo approccio è semplice ma può essere inefficiente e resettare eventuali ID/numeri specifici.
                //    Un approccio migliore traccerebbe gli `original_numero` per fare UPDATE/INSERT/DELETE mirati.

                // 3a. Cancella TUTTE le domande e risposte esistenti per questo quiz
                //     (ON DELETE CASCADE si occuperà delle risposte quando le domande vengono cancellate)
                $sqlDeleteDomande = "DELETE FROM Domanda WHERE quiz = :quizId";
                $stmtDeleteDomande = $pdo->prepare($sqlDeleteDomande);
                $stmtDeleteDomande->bindParam(':quizId', $quizId, PDO::PARAM_INT);
                if (!$stmtDeleteDomande->execute()) {
                    throw new Exception("Errore durante la pulizia delle vecchie domande.");
                }
                // Nota: Le risposte associate vengono cancellate da ON DELETE CASCADE sulla FK Domanda(quiz)

                // 3b. Reinserisci Domande e Risposte dai dati ricevuti
                $sqlInsertDomanda = "INSERT INTO Domanda (quiz, numero, testo) VALUES (:quizId, :numero, :testo)";
                $stmtInsertDomanda = $pdo->prepare($sqlInsertDomanda);

                $sqlInsertRisposta = "INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES (:quizId, :domandaNum, :numero, :testo, :tipo, :punteggio)";
                $stmtInsertRisposta = $pdo->prepare($sqlInsertRisposta);

                $numeroDomandaAttuale = 1; // Riassegna i numeri sequenzialmente
                foreach ($questions as $questionData) {
                    $testoDomanda = trim($questionData['testo'] ?? '');
                    $risposte = $questionData['answers'] ?? [];

                    // Validazione minima domanda/risposte (aggiungi di più!)
                    if (empty($testoDomanda) || !is_array($risposte) || empty($risposte)) {
                        throw new Exception("Dati domanda/risposte non validi per la domanda #{$numeroDomandaAttuale}. Ogni domanda deve avere testo e almeno una risposta.");
                    }

                    // Inserisci la domanda
                    $stmtInsertDomanda->bindParam(':quizId', $quizId, PDO::PARAM_INT);
                    $stmtInsertDomanda->bindParam(':numero', $numeroDomandaAttuale, PDO::PARAM_INT);
                    $stmtInsertDomanda->bindParam(':testo', $testoDomanda, PDO::PARAM_STR);
                    if (!$stmtInsertDomanda->execute()) {
                        throw new Exception("Errore durante l'inserimento della domanda #{$numeroDomandaAttuale}.");
                    }

                    $numeroRispostaAttuale = 1; // Riassegna i numeri sequenzialmente per questa domanda
                    $hasCorrectAnswer = false;
                    foreach ($risposte as $answerData) {
                        $testoRisposta = trim($answerData['testo'] ?? '');
                        $tipoRisposta = $answerData['tipo'] ?? '';
                        $punteggioRisposta = filter_var($answerData['punteggio'] ?? 0, FILTER_VALIDATE_INT, ['options' => ['default' => 0]]); // Default a 0 se non valido

                        if (empty($testoRisposta) || !in_array($tipoRisposta, ['Corretta', 'Sbagliata'])) {
                            throw new Exception("Dati risposta non validi per domanda #{$numeroDomandaAttuale}, risposta #{$numeroRispostaAttuale}.");
                        }

                        if ($tipoRisposta == 'Corretta') {
                            $hasCorrectAnswer = true;
                        }

                        // Inserisci la risposta
                        $stmtInsertRisposta->bindParam(':quizId', $quizId, PDO::PARAM_INT);
                        $stmtInsertRisposta->bindParam(':domandaNum', $numeroDomandaAttuale, PDO::PARAM_INT); // Numero della domanda appena inserita
                        $stmtInsertRisposta->bindParam(':numero', $numeroRispostaAttuale, PDO::PARAM_INT);
                        $stmtInsertRisposta->bindParam(':testo', $testoRisposta, PDO::PARAM_STR);
                        $stmtInsertRisposta->bindParam(':tipo', $tipoRisposta, PDO::PARAM_STR);
                        $stmtInsertRisposta->bindParam(':punteggio', $punteggioRisposta, PDO::PARAM_INT);
                        if (!$stmtInsertRisposta->execute()) {
                            throw new Exception("Errore durante l'inserimento della risposta #{$numeroRispostaAttuale} per la domanda #{$numeroDomandaAttuale}.");
                        }
                        $numeroRispostaAttuale++;
                    }

                    // Validazione: Assicurati che ogni domanda abbia almeno una risposta corretta
                    if (!$hasCorrectAnswer) {
                        throw new Exception("La domanda #{$numeroDomandaAttuale} deve avere almeno una risposta segnata come 'Corretta'.");
                    }

                    $numeroDomandaAttuale++;
                }

                // Se tutto è andato bene, conferma le modifiche
                $pdo->commit();
                http_response_code(200); // OK
                echo json_encode(['message' => 'Quiz aggiornato con successo!']);
                exit;

            } catch (Exception $e) {
                // Se qualcosa va storto, annulla tutte le modifiche
                $pdo->rollBack();
                http_response_code(500); // Internal Server Error
                // Logga l'errore $e->getMessage() per il debug
                error_log("Errore API modifica quiz: " . $e->getMessage());
                echo json_encode(['message' => 'Errore del server durante l\'aggiornamento del quiz. Dettagli: ' . $e->getMessage()]); // Mostra messaggio di errore specifico per ora
                exit;
            }

        } else {
            // Recupero di tutti i quiz disponibili
            try {
                $query = "
                     SELECT q.*, u.nome, u.cognome, COUNT(DISTINCT p.nomeUtente) as numPartecipanti 
                     FROM Quiz q 
                     JOIN Utente u ON q.nomeUtente = u.nomeUtente 
                     LEFT JOIN Partecipazione p ON q.idQuiz = p.idQuiz 
                     WHERE q.dataChiusura IS NULL OR q.dataChiusura >= CURRENT_DATE()
                 ";

                // Se c'è un filtro per creatore
                if (isset($_GET['creatore'])) {
                    $query .= " AND q.nomeUtente = :creatore";
                }

                $query .= " GROUP BY q.idQuiz ORDER BY q.dataCreazione DESC";

                $stmt = $pdo->prepare($query);

                if (isset($_GET['creatore'])) {
                    $stmt->bindParam(':creatore', $_GET['creatore']);
                }

                $stmt->execute();
                $quizzes = $stmt->fetchAll(PDO::FETCH_ASSOC);

                echo json_encode(['status' => 'success', 'data' => $quizzes]);
            } catch (PDOException $e) {
                http_response_code(500);
                echo json_encode(['status' => 'error', 'message' => 'Errore del database: ' . $e->getMessage()]);
            }
        }*/
        break;

    case 'POST':
        // Creazione di un nuovo quiz
        if (!isAuthenticated()) {
            http_response_code(401);
            echo json_encode(['status' => 'error', 'message' => 'Non autenticato']);
            break;
        }

        $data = $_POST;

        if (!isset($data['title']) || !isset($data['start_date']) || !isset($data['end_date'])) {
            http_response_code(400);
            echo json_encode(['status' => 'error', 'message' => 'Dati incompleti']);
            break;
        }

        $titolo = trim($data['title']);
        $dataApertura = isset($data['start_date']) ? trim($data['start_date']) : null;
        $dataChiusura = isset($data['end_date']) ? trim($data['end_date']) : null;
        $nomeUtente = $_SESSION['user']['nomeUtente'];

        try {
            $pdo->beginTransaction();

            // Inserimento del quiz
            $stmt = $pdo->prepare("
                 INSERT INTO Quiz (titolo, dataInizio, dataFine, creatore) 
                 VALUES (:titolo, :dataApertura, :dataChiusura, :nomeUtente)
             ");
            $stmt->bindParam(':titolo', $titolo);
            $stmt->bindParam(':dataApertura', $dataApertura);
            $stmt->bindParam(':dataChiusura', $dataChiusura);
            $stmt->bindParam(':nomeUtente', $nomeUtente);

            if (!$stmt->execute()) {
                throw new Exception("Errore nell'inserimento del quiz");
            }

            $idQuiz = $pdo->lastInsertId();

            // Inserimento delle domande e risposte
            foreach ($data['domande'] as $domanda) {
                if (!isset($domanda['testo']) || !isset($domanda['risposte']) || empty($domanda['risposte'])) {
                    throw new Exception("Dati incompleti per la domanda");
                }

                $testoDomanda = trim($domanda['testo']);

                $stmtDomanda = $pdo->prepare("
                     INSERT INTO Domanda (idQuiz, testo) VALUES (:idQuiz, :testo)
                 ");
                $stmtDomanda->bindParam(':idQuiz', $idQuiz);
                $stmtDomanda->bindParam(':testo', $testoDomanda);

                if (!$stmtDomanda->execute()) {
                    throw new Exception("Errore nell'inserimento della domanda");
                }

                $idDomanda = $pdo->lastInsertId();

                foreach ($domanda['risposte'] as $risposta) {
                    if (!isset($risposta['testo']) || !isset($risposta['punteggio'])) {
                        throw new Exception("Dati incompleti per la risposta");
                    }

                    $testoRisposta = trim($risposta['testo']);
                    $punteggio = (float) $risposta['punteggio'];

                    $stmtRisposta = $pdo->prepare("
                         INSERT INTO Risposta (idDomanda, testo, punteggio) VALUES (:idDomanda, :testo, :punteggio)
                     ");
                    $stmtRisposta->bindParam(':idDomanda', $idDomanda);
                    $stmtRisposta->bindParam(':testo', $testoRisposta);
                    $stmtRisposta->bindParam(':punteggio', $punteggio);

                    if (!$stmtRisposta->execute()) {
                        throw new Exception("Errore nell'inserimento della risposta");
                    }
                }
            }

            $pdo->commit();

            http_response_code(201); // Created
            echo json_encode([
                'status' => 'success',
                'message' => 'Quiz creato con successo',
                'idQuiz' => $idQuiz
            ]);

        } catch (Exception $e) {
            $pdo->rollBack();
            http_response_code(500);
            echo json_encode(['status' => 'error', 'message' => $e->getMessage()]);
        }


        break;

    case 'PUT':
        // Aggiornamento di un quiz esistente
        if (!isAuthenticated()) {
            http_response_code(401);
            echo json_encode(['status' => 'error', 'message' => 'Non autenticato']);
            break;
        }

        if (!isset($_GET['id'])) {
            http_response_code(400);
            echo json_encode(['status' => 'error', 'message' => 'ID quiz mancante']);
            break;
        }

        $idQuiz = $_GET['id'];
        $nomeUtente = $_SESSION['user']['nomeUtente'];

        // Verifica proprietà del quiz
        if (!isOwnerOfQuiz($pdo, $idQuiz, $nomeUtente)) {
            http_response_code(403); // Forbidden
            echo json_encode(['status' => 'error', 'message' => 'Non autorizzato a modificare questo quiz']);
            break;
        }

        $data = json_decode(file_get_contents('php://input'), true);

        if (empty($data)) {
            http_response_code(400);
            echo json_encode(['status' => 'error', 'message' => 'Dati mancanti']);
            break;
        }

        try {
            $updateFields = [];
            $params = [':idQuiz' => $idQuiz];

            if (isset($data['titolo']) && !empty(trim($data['titolo']))) {
                $updateFields[] = "titolo = :titolo";
                $params[':titolo'] = trim($data['titolo']);
            }

            if (isset($data['descrizione'])) {
                $updateFields[] = "descrizione = :descrizione";
                $params[':descrizione'] = trim($data['descrizione']);
            }

            if (isset($data['dataApertura'])) {
                $updateFields[] = "dataApertura = :dataApertura";
                $params[':dataApertura'] = trim($data['dataApertura']);
            }

            if (isset($data['dataChiusura'])) {
                $updateFields[] = "dataChiusura = :dataChiusura";
                $params[':dataChiusura'] = trim($data['dataChiusura']);
            }

            if (empty($updateFields)) {
                http_response_code(400);
                echo json_encode(['status' => 'error', 'message' => 'Nessun campo da aggiornare']);
                break;
            }

            $query = "UPDATE Quiz SET " . implode(", ", $updateFields) . " WHERE idQuiz = :idQuiz";
            $stmt = $pdo->prepare($query);

            if ($stmt->execute($params)) {
                echo json_encode(['status' => 'success', 'message' => 'Quiz aggiornato con successo']);
            } else {
                http_response_code(500);
                echo json_encode(['status' => 'error', 'message' => 'Errore durante l\'aggiornamento']);
            }
        } catch (PDOException $e) {
            http_response_code(500);
            echo json_encode(['status' => 'error', 'message' => 'Errore del database: ' . $e->getMessage()]);
        }
        break;

    case 'DELETE':
        // Eliminazione di un quiz
        if (!isAuthenticated()) {
            http_response_code(401);
            echo json_encode(['status' => 'error', 'message' => 'Non autenticato']);
            break;
        }

        if (!isset($_GET['id'])) {
            http_response_code(400);
            echo json_encode(['status' => 'error', 'message' => 'ID quiz mancante']);
            break;
        }

        $idQuiz = $_GET['id'];
        $nomeUtente = $_SESSION['user']['nomeUtente'];

        // Verifica proprietà del quiz
        if (!isOwnerOfQuiz($pdo, $idQuiz, $nomeUtente)) {
            http_response_code(403); // Forbidden
            echo json_encode(['status' => 'error', 'message' => 'Non autorizzato a eliminare questo quiz']);
            break;
        }

        try {
            // Inizio transazione
            $pdo->beginTransaction();

            // Elimina prima le risposte degli utenti
            $stmt = $pdo->prepare("
                 DELETE ruq FROM RispostaUtenteQuiz ruq
                 JOIN Domanda d ON ruq.idDomanda = d.idDomanda
                 WHERE d.idQuiz = :idQuiz
             ");
            $stmt->bindParam(':idQuiz', $idQuiz);
            $stmt->execute();

            // Elimina le partecipazioni
            $stmt = $pdo->prepare("DELETE FROM Partecipazione WHERE idQuiz = :idQuiz");
            $stmt->bindParam(':idQuiz', $idQuiz);
            $stmt->execute();

            // Elimina le risposte
            $stmt = $pdo->prepare("
                 DELETE r FROM Risposta r
                 JOIN Domanda d ON r.idDomanda = d.idDomanda
                 WHERE d.idQuiz = :idQuiz
             ");
            $stmt->bindParam(':idQuiz', $idQuiz);
            $stmt->execute();

            // Elimina le domande
            $stmt = $pdo->prepare("DELETE FROM Domanda WHERE idQuiz = :idQuiz");
            $stmt->bindParam(':idQuiz', $idQuiz);
            $stmt->execute();

            // Elimina il quiz
            $stmt = $pdo->prepare("DELETE FROM Quiz WHERE idQuiz = :idQuiz");
            $stmt->bindParam(':idQuiz', $idQuiz);

            if ($stmt->execute()) {
                $pdo->commit();
                echo json_encode(['status' => 'success', 'message' => 'Quiz eliminato con successo']);
            } else {
                $pdo->rollBack();
                http_response_code(500);
                echo json_encode(['status' => 'error', 'message' => 'Errore durante l\'eliminazione']);
            }
        } catch (PDOException $e) {
            if ($pdo->inTransaction()) {
                $pdo->rollBack();
            }
            http_response_code(500);
            echo json_encode(['status' => 'error', 'message' => 'Errore del database: ' . $e->getMessage()]);
        }
        break;

    default:
        http_response_code(405); // Method Not Allowed
        echo json_encode(['status' => 'error', 'message' => 'Metodo non consentito']);
}

?>