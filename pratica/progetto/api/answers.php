<?php

/**
 * API per la gestione delle risposte
 * 
 * Questo file gestisce le operazioni CRUD relative alle risposte delle domande dei quiz.
 * Consente di:
 * - Recuperare tutte le risposte di una domanda specifica
 * - Aggiungere nuove risposte a una domanda
 * - Modificare risposte esistenti
 * - Eliminare risposte
 * - Verificare la correttezza delle risposte selezionate da un utente
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
 function isAuthenticated() {
     return isset($_SESSION['user']);
 }
 
 // Funzione per verificare se una risposta appartiene a una domanda di un quiz dell'utente
 function isOwnerOfAnswer($pdo, $idRisposta, $nomeUtente) {
     $stmt = $pdo->prepare("
         SELECT r.* 
         FROM Risposta r
         JOIN Domanda d ON r.idDomanda = d.idDomanda
         JOIN Quiz q ON d.idQuiz = q.idQuiz
         WHERE r.idRisposta = :idRisposta AND q.nomeUtente = :nomeUtente
     ");
     $stmt->bindParam(':idRisposta', $idRisposta);
     $stmt->bindParam(':nomeUtente', $nomeUtente);
     $stmt->execute();
     return $stmt->rowCount() > 0;
 }
 
 // Gestione delle operazioni in base al metodo HTTP
 switch ($method) {
     case 'GET':
         // Recupero delle risposte
         if (isset($_GET['id'])) {
             // Recupero di una singola risposta per ID
             $idRisposta = $_GET['id'];
             
             try {
                 $stmt = $pdo->prepare("SELECT * FROM Risposta WHERE idRisposta = :idRisposta");
                 $stmt->bindParam(':idRisposta', $idRisposta);
                 $stmt->execute();
                 
                 if ($stmt->rowCount() > 0) {
                     $risposta = $stmt->fetch(PDO::FETCH_ASSOC);
                     echo json_encode(['status' => 'success', 'data' => $risposta]);
                 } else {
                     http_response_code(404);
                     echo json_encode(['status' => 'error', 'message' => 'Risposta non trovata']);
                 }
             } catch (PDOException $e) {
                 http_response_code(500);
                 echo json_encode(['status' => 'error', 'message' => 'Errore del database: ' . $e->getMessage()]);
             }
         } elseif (isset($_GET['question_id'])) {
             // Recupero di tutte le risposte di una domanda
             $idDomanda = $_GET['question_id'];
             
             try {
                 $stmt = $pdo->prepare("SELECT * FROM Risposta WHERE idDomanda = :idDomanda");
                 $stmt->bindParam(':idDomanda', $idDomanda);
                 $stmt->execute();
                 $risposte = $stmt->fetchAll(PDO::FETCH_ASSOC);
                 
                 echo json_encode(['status' => 'success', 'data' => $risposte]);
             } catch (PDOException $e) {
                 http_response_code(500);
                 echo json_encode(['status' => 'error', 'message' => 'Errore del database: ' . $e->getMessage()]);
             }
         } else {
             http_response_code(400);
             echo json_encode(['status' => 'error', 'message' => 'Parametro id o question_id mancante']);
         }
         break;
         
     case 'POST':
         // Creazione di una nuova risposta
         if (!isAuthenticated()) {
             http_response_code(401);
             echo json_encode(['status' => 'error', 'message' => 'Non autenticato']);
             break;
         }
         
         $data = json_decode(file_get_contents('php://input'), true);
         
         if (!isset($data['idDomanda']) || !isset($data['testo']) || !isset($data['punteggio'])) {
             http_response_code(400);
             echo json_encode(['status' => 'error', 'message' => 'Dati incompleti']);
             break;
         }
         
         $idDomanda = $data['idDomanda'];
         $testo = trim($data['testo']);
         $punteggio = (float) $data['punteggio'];
         $nomeUtente = $_SESSION['user']['nomeUtente'];
         
         // Verifica che la domanda appartenga a un quiz dell'utente
         try {
             $stmt = $pdo->prepare("
                 SELECT d.* 
                 FROM Domanda d
                 JOIN Quiz q ON d.idQuiz = q.idQuiz
                 WHERE d.idDomanda = :idDomanda AND q.nomeUtente = :nomeUtente
             ");
             $stmt->bindParam(':idDomanda', $idDomanda);
             $stmt->bindParam(':nomeUtente', $nomeUtente);
             $stmt->execute();
             
             if ($stmt->rowCount() === 0) {
                 http_response_code(403); // Forbidden
                 echo json_encode(['status' => 'error', 'message' => 'Non autorizzato a modificare questa domanda']);
                 break;
             }
             
             // Inserimento della risposta
             $stmt = $pdo->prepare("
                 INSERT INTO Risposta (idDomanda, testo, punteggio) VALUES (:idDomanda, :testo, :punteggio)
             ");
             $stmt->bindParam(':idDomanda', $idDomanda);
             $stmt->bindParam(':testo', $testo);
             $stmt->bindParam(':punteggio', $punteggio);
             
             if ($stmt->execute()) {
                 $idRisposta = $pdo->lastInsertId();
                 http_response_code(201); // Created
                 echo json_encode([
                     'status' => 'success', 
                     'message' => 'Risposta creata con successo',
                     'idRisposta' => $idRisposta
                 ]);
             } else {
                 http_response_code(500);
                 echo json_encode(['status' => 'error', 'message' => 'Errore durante la creazione della risposta']);
             }
         } catch (PDOException $e) {
             http_response_code(500);
             echo json_encode(['status' => 'error', 'message' => 'Errore del database: ' . $e->getMessage()]);
         }
         break;
         
     case 'PUT':
         // Aggiornamento di una risposta esistente
         if (!isAuthenticated()) {
             http_response_code(401);
             echo json_encode(['status' => 'error', 'message' => 'Non autenticato']);
             break;
         }
         
         if (!isset($_GET['id'])) {
             http_response_code(400);
             echo json_encode(['status' => 'error', 'message' => 'ID risposta mancante']);
             break;
         }
         
         $idRisposta = $_GET['id'];
         $nomeUtente = $_SESSION['user']['nomeUtente'];
         
         // Verifica proprietà della risposta
         if (!isOwnerOfAnswer($pdo, $idRisposta, $nomeUtente)) {
             http_response_code(403); // Forbidden
             echo json_encode(['status' => 'error', 'message' => 'Non autorizzato a modificare questa risposta']);
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
             $params = [':idRisposta' => $idRisposta];
             
             if (isset($data['testo']) && !empty(trim($data['testo']))) {
                 $updateFields[] = "testo = :testo";
                 $params[':testo'] = trim($data['testo']);
             }
             
             if (isset($data['punteggio'])) {
                 $updateFields[] = "punteggio = :punteggio";
                 $params[':punteggio'] = (float) $data['punteggio'];
             }
             
             if (empty($updateFields)) {
                 http_response_code(400);
                 echo json_encode(['status' => 'error', 'message' => 'Nessun campo da aggiornare']);
                 break;
             }
             
             $query = "UPDATE Risposta SET " . implode(", ", $updateFields) . " WHERE idRisposta = :idRisposta";
             $stmt = $pdo->prepare($query);
             
             if ($stmt->execute($params)) {
                 echo json_encode(['status' => 'success', 'message' => 'Risposta aggiornata con successo']);
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
         // Eliminazione di una risposta
         if (!isAuthenticated()) {
             http_response_code(401);
             echo json_encode(['status' => 'error', 'message' => 'Non autenticato']);
             break;
         }
         
         if (!isset($_GET['id'])) {
             http_response_code(400);
             echo json_encode(['status' => 'error', 'message' => 'ID risposta mancante']);
             break;
         }
         
         $idRisposta = $_GET['id'];
         $nomeUtente = $_SESSION['user']['nomeUtente'];
         
         // Verifica proprietà della risposta
         if (!isOwnerOfAnswer($pdo, $idRisposta, $nomeUtente)) {
             http_response_code(403); // Forbidden
             echo json_encode(['status' => 'error', 'message' => 'Non autorizzato a eliminare questa risposta']);
             break;
         }
         
         try {
             $pdo->beginTransaction();
             
             // Elimina prima le risposte degli utenti
             $stmt = $pdo->prepare("DELETE FROM RispostaUtenteQuiz WHERE idRisposta = :idRisposta");
             $stmt->bindParam(':idRisposta', $idRisposta);
             $stmt->execute();
             
             // Elimina la risposta
             $stmt = $pdo->prepare("DELETE FROM Risposta WHERE idRisposta = :idRisposta");
             $stmt->bindParam(':idRisposta', $idRisposta);
             
             if ($stmt->execute()) {
                 $pdo->commit();
                 echo json_encode(['status' => 'success', 'message' => 'Risposta eliminata con successo']);
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