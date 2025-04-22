<?php

/**
 * API per la gestione dei quiz.
 * 
 * Questo file gestisce le operazioni CRUD relative ai quiz.
 * Funzionalità implementate:
 * - Creazione di nuovi quiz;
 * - Modifica dei dettagli di un quiz esistente;
 * - Eliminazione di quiz;
 * - Recupero di tutti i quiz disponibili;
 * - Recupero dei dettagli di un quiz specifico;
 * - Filtraggio dei quiz per data, creatore o stato (aperto/chiuso);
 */

// --- Inizializzazione della sessione e configurazione ---
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
require_once '../config/database.php';
header('Content-Type: application/json');

// --- Funzioni di utilità ---
function isAuthenticated() {
    return isset($_SESSION['user']) && !empty($_SESSION['user']['nomeUtente']);
}
function isOwnerOfQuiz($pdo, $idQuiz, $nomeUtente) {
    $stmt = $pdo->prepare("SELECT * FROM Quiz WHERE idQuiz = :idQuiz AND nomeUtente = :nomeUtente");
    $stmt->bindParam(':idQuiz', $idQuiz);
    $stmt->bindParam(':nomeUtente', $nomeUtente);
    $stmt->execute();
    return $stmt->rowCount() > 0;
}
function handleError($message, $code = 500) {
    http_response_code($code);
    echo json_encode(['status' => 'error', 'message' => $message]);
    exit;
}

// --- Validazione dati quiz ---
function validateQuizData($data) {
    $required = ['titolo', 'dataInizio', 'dataFine'];
    foreach ($required as $field) {
        if (empty($data[$field])) {
            handleError("Campo $field mancante", 400);
        }
    }
    
    if (new DateTime($data['dataInizio']) > new DateTime($data['dataFine'])) {
        handleError("La data di fine deve essere successiva alla data di inizio", 400);
    }
}

// --- Gestione delle richieste API ---
switch ($_SERVER['REQUEST_METHOD']) {
    // --- Recupero dei quiz ---
    case 'GET':
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

                    // Recupera le domande associate a questo quiz.
                    $stmtDomande = $pdo->prepare("SELECT * FROM Domanda WHERE idQuiz = :idQuiz");
                    $stmtDomande->bindParam(':idQuiz', $idQuiz);
                    $stmtDomande->execute();
                    $domande = $stmtDomande->fetchAll(PDO::FETCH_ASSOC);

                    // Per ogni domanda, recupera le risposte possibili.
                    foreach ($domande as $key => $domanda) {
                        $stmtRisposte = $pdo->prepare("SELECT * FROM Risposta WHERE idDomanda = :idDomanda");
                        $stmtRisposte->bindParam(':idDomanda', $domanda['idDomanda']);
                        $stmtRisposte->execute();
                        $domande[$key]['risposte'] = $stmtRisposte->fetchAll(PDO::FETCH_ASSOC);
                    }
                    $quiz['domande'] = $domande;
                    echo json_encode(['status' => 'success', 'data' => $quiz]);
                } else {
                    handleError('Quiz non trovato', 404);
                }
            } catch (PDOException $e) {
                handleError('Errore del database: ' . $e->getMessage());
            }

        } elseif (isset($_GET['delId'])) {
            if (!isAuthenticated()) {
                handleError('Non sei autenticato', 401);
            }

            $quizId = $_GET['delId'];
            $nomeUtente = $_SESSION['user']['nomeUtente'];

            // Verifica se il quiz appartiene all'utente.
            $sql = "SELECT COUNT(*) FROM Quiz WHERE codice = :quizId AND creatore = :nomeUtente";
            $stmt = $pdo->prepare($sql);
            $stmt->bindParam(':quizId', $quizId, PDO::PARAM_STR);
            $stmt->bindParam(':nomeUtente', $nomeUtente, PDO::PARAM_STR);
            $stmt->execute();

            if ($stmt->fetchColumn() > 0) {
                try {
                    $pdo->beginTransaction();

                    // Elimina prima le risposte degli utenti.
                    $stmt = $pdo->prepare("
                        DELETE ruq FROM RispostaUtenteQuiz ruq
                        JOIN Domanda d ON ruq.domanda = d.numero
                        WHERE d.quiz = :quizId
                    ");
                    $stmt->bindParam(':quizId', $quizId);
                    $stmt->execute();

                    // Elimina le partecipazioni.
                    $stmt = $pdo->prepare("DELETE FROM Partecipazione WHERE quiz = :quizId");
                    $stmt->bindParam(':quizId', $quizId);
                    $stmt->execute();

                    // Elimina le risposte.
                    $stmt = $pdo->prepare("
                        DELETE r FROM Risposta r
                        JOIN Domanda d ON r.domanda = d.numero
                        WHERE d.quiz = :quizId
                    ");
                    $stmt->bindParam(':quizId', $quizId);
                    $stmt->execute();

                    // Elimina le domande.
                    $stmt = $pdo->prepare("DELETE FROM Domanda WHERE quiz = :quizId");
                    $stmt->bindParam(':quizId', $quizId);
                    $stmt->execute();

                    // Elimina il quiz.
                    $stmt = $pdo->prepare("DELETE FROM Quiz WHERE codice = :quizId");
                    $stmt->bindParam(':quizId', $quizId);
                    $stmt->execute();

                    $pdo->commit();
                    http_response_code(204); // No Content.
                } catch (PDOException $e) {
                    $pdo->rollBack();
                    handleError('Errore durante eliminazione del quiz: ' . $e->getMessage());
                }
            } else {
                handleError('Quiz non trovato o non autorizzato a eliminarlo', 403);
            }

        } else {
            // Recupero di tutti i quiz disponibili.
            try {
                $query = "
                    SELECT q.*, u.nome, u.cognome, COUNT(DISTINCT p.nomeUtente) as numPartecipanti 
                    FROM Quiz q 
                    JOIN Utente u ON q.creatore = u.nomeUtente 
                    LEFT JOIN Partecipazione p ON q.codice = p.quiz 
                    WHERE q.dataFine IS NULL OR q.dataFine >= CURRENT_DATE()
                ";

                if (isset($_GET['creatore'])) {
                    $query .= " AND q.creatore = :creatore";
                }

                $query .= " GROUP BY q.codice ORDER BY q.dataInizio DESC";

                $stmt = $pdo->prepare($query);

                if (isset($_GET['creatore'])) {
                    $stmt->bindParam(':creatore', $_GET['creatore']);
                }

                $stmt->execute();
                $quizzes = $stmt->fetchAll(PDO::FETCH_ASSOC);

                echo json_encode(['status' => 'success', 'data' => $quizzes]);
            } catch (PDOException $e) {
                handleError('Errore del database: ' . $e->getMessage());
            }
        }
        break;

        // --- Creazione di un nuovo quiz ---
        case 'POST':
            if (!isAuthenticated()) {
                http_response_code(401);
                echo json_encode(['status' => 'error', 'message' => 'Non autenticato']);
                break;
            }
            
            $data = $_POST;
            
            if (!isset($data['titolo']) || !isset($data['dataInizio']) || !isset($data['dataFine'])) {
                http_response_code(400);
                echo json_encode(['status' => 'error', 'message' => 'Dati incompleti']);
                break;
            }
            
            $titolo = trim($data['titolo']);
            $dataApertura = isset($data['dataInizio']) ? trim($data['dataInizio']) : null;
            $dataChiusura = isset($data['dataFine']) ? trim($data['dataFine']) : null;
            $nomeUtente = $_SESSION['user']['nomeUtente'];
            
            try {
                $pdo->beginTransaction();
                
                // Inserimento del quiz.
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
                
                $pdo->commit();
                
                http_response_code(201); // Created.
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

        // --- Aggiornamento di un quiz esistente ---
        case 'PUT':
            if (!isAuthenticated()) {
                handleError('Non autenticato', 401);
            }
        
            // Parse dei dati dalla richiesta.
            parse_str(file_get_contents('php://input'), $putData);
            $data = $putData;
        
            if (empty($data)) {
                handleError('Dati mancanti', 400);
            }
        
            if (!isset($data['quiz_id'])) {
                handleError('ID quiz mancante', 400);
            }
        
            $quizId = (int)$data['quiz_id'];
            $nomeUtente = $_SESSION['user']['nomeUtente'];
        
            // Verifica proprietà del quiz.
            $stmt = $pdo->prepare("SELECT 1 FROM Quiz WHERE codice = :quizId AND creatore = :nomeUtente LIMIT 1");
            $stmt->bindParam(':quizId', $quizId, PDO::PARAM_INT);
            $stmt->bindParam(':nomeUtente', $nomeUtente, PDO::PARAM_STR);
            $stmt->execute();
        
            if (!$stmt->fetchColumn()) {
                handleError('Non autorizzato a modificare questo quiz', 403);
            }
        
            try {
                $pdo->beginTransaction();
        
                // Aggiorna i dati base del quiz.
                $updateFields = [];
                $params = [':quizId' => $quizId];
        
                if (isset($data['titolo']) && !empty(trim($data['titolo']))) {
                    $updateFields[] = "titolo = :titolo";
                    $params[':titolo'] = trim($data['titolo']);
                }
        
                if (isset($data['dataInizio'])) {
                    $updateFields[] = "dataInizio = :dataInizio";
                    $params[':dataInizio'] = $data['dataInizio'];
                }
        
                if (isset($data['dataFine'])) {
                    $updateFields[] = "dataFine = :dataFine";
                    $params[':dataFine'] = $data['dataFine'];
                }
        
                if (!empty($updateFields)) {
                    $query = "UPDATE Quiz SET " . implode(", ", $updateFields) . " WHERE codice = :quizId";
                    $stmt = $pdo->prepare($query);
                    $stmt->execute($params);
                }
        
                // Gestione delle domande e risposte.
                if (isset($data['questions']) && is_array($data['questions'])) {
                    foreach ($data['questions'] as $indexDomanda => $question) {
                        $isExistingQuestion = isset($question['original_numero']);
                        $domandaNumero = $isExistingQuestion ? $question['original_numero'] : null;
                        if ($isExistingQuestion) {
                            // Domanda esistente - aggiorna.
                            $stmt = $pdo->prepare("UPDATE Domanda SET testo = :testo 
                                                  WHERE quiz = :quizId AND numero = :numero");
                            $stmt->execute([
                                ':testo' => $question['testo'],
                                ':quizId' => $quizId,
                                ':numero' => $domandaNumero
                            ]);
                        } else {
                            // Nuova domanda - inserisci.
                            // Trova il prossimo numero disponibile.
                            $stmt = $pdo->prepare("SELECT COALESCE(MAX(numero), 0) + 1 FROM Domanda WHERE quiz = :quizId");
                            $stmt->execute([':quizId' => $quizId]);
                            $domandaNumero = $stmt->fetchColumn();
        
                            $stmt = $pdo->prepare("INSERT INTO Domanda (quiz, numero, testo) 
                                                  VALUES (:quizId, :numero, :testo)");
                            $stmt->execute([
                                ':quizId' => $quizId,
                                ':numero' => $domandaNumero,
                                ':testo' => $question['testo']
                            ]);
                        }
        
                        // Gestione risposte.
                        if (isset($question['answers']) && is_array($question['answers'])) {
                            foreach ($question['answers'] as $indexRisposta => $answer) {
                                $isExistingAnswer = isset($answer['original_numero']);
                                $rispostaNumero = $isExistingAnswer ? $answer['original_numero'] : null;
                                if ($isExistingAnswer) {
                                    // Risposta esistente - aggiorna.
                                    $stmt = $pdo->prepare("UPDATE Risposta 
                                                          SET testo = :testo, tipo = :tipo, punteggio = :punteggio
                                                          WHERE quiz = :quizId AND domanda = :domanda AND numero = :numero");
                                    $stmt->execute([
                                        ':testo' => $answer['testo'],
                                        ':tipo' => $answer['tipo'],
                                        ':punteggio' => $answer['punteggio'],
                                        ':quizId' => $quizId,
                                        ':domanda' => $domandaNumero,
                                        ':numero' => $rispostaNumero
                                    ]);
                                } else {
                                    // Nuova risposta - inserisci.
                                    // Trova il prossimo numero disponibile per questa domanda.
                                    $stmt = $pdo->prepare("SELECT COALESCE(MAX(numero), 0) + 1 
                                                          FROM Risposta 
                                                          WHERE quiz = :quizId AND domanda = :domanda");
                                    $stmt->execute([':quizId' => $quizId, ':domanda' => $domandaNumero]);
                                    $rispostaNumero = $stmt->fetchColumn();
        
                                    $stmt = $pdo->prepare("INSERT INTO Risposta 
                                                          (quiz, domanda, numero, testo, tipo, punteggio)
                                                          VALUES (:quizId, :domanda, :numero, :testo, :tipo, :punteggio)");
                                    $stmt->execute([
                                        ':quizId' => $quizId,
                                        ':domanda' => $domandaNumero,
                                        ':numero' => $rispostaNumero,
                                        ':testo' => $answer['testo'],
                                        ':tipo' => $answer['tipo'],
                                        ':punteggio' => $answer['punteggio']
                                    ]);
                                }
                            }
                        }
                    }
                }
                $pdo->commit();
                echo json_encode(['status' => 'success', 'message' => 'Quiz aggiornato con successo']);
            } catch (PDOException $e) {
                $pdo->rollBack();
                handleError('Errore del database: ' . $e->getMessage());
            }
            break;
    default:
        handleError('Metodo non consentito', 405);
}