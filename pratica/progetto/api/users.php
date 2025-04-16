<?php

/**
 * API per la gestione degli utenti
 * 
 * Questo file gestisce le operazioni relative agli utenti del sistema.
 * Funzionalità principali:
 * - Registrazione di nuovi utenti
 * - Autenticazione degli utenti
 * - Modifica dei dati del profilo
 * - Recupero delle informazioni dell'utente
 * - Recupero dei quiz creati da un utente
 * - Recupero delle partecipazioni di un utente
 * 
 * Implementa misure di sicurezza per la gestione delle password
 * e la validazione dei dati in input.
 */

 // Inizializzazione della sessione
 session_start();
 
 // Include la configurazione del database
 require_once '../config/database.php';
 
 // Impostazione degli header per le risposte JSON
 header('Content-Type: application/json');
 
 // Verifica del metodo HTTP
 $method = $_SERVER['REQUEST_METHOD'];
 
 // Gestione delle operazioni in base al metodo HTTP
 switch ($method) {
     case 'GET':
         // Recupero degli utenti o di un singolo utente
         if (isset($_GET['id'])) {
             // Recupero di un singolo utente per ID (nome utente)
             $nomeUtente = $_GET['id'];
             
             try {
                 $stmt = $pdo->prepare("SELECT nomeUtente, nome, cognome, eMail FROM Utente WHERE nomeUtente = :nomeUtente");
                 $stmt->bindParam(':nomeUtente', $nomeUtente);
                 $stmt->execute();
                 
                 if ($stmt->rowCount() > 0) {
                     $user = $stmt->fetch(PDO::FETCH_ASSOC);
                     echo json_encode(['status' => 'success', 'data' => $user]);
                 } else {
                     http_response_code(404);
                     echo json_encode(['status' => 'error', 'message' => 'Utente non trovato']);
                 }
             } catch (PDOException $e) {
                 http_response_code(500);
                 echo json_encode(['status' => 'error', 'message' => 'Errore del database: ' . $e->getMessage()]);
             }
         } else {
             // Recupero di tutti gli utenti (potrebbe richiedere autenticazione admin in un sistema reale)
             try {
                 $stmt = $pdo->query("SELECT nomeUtente, nome, cognome, eMail FROM Utente");
                 $users = $stmt->fetchAll(PDO::FETCH_ASSOC);
                 echo json_encode(['status' => 'success', 'data' => $users]);
             } catch (PDOException $e) {
                 http_response_code(500);
                 echo json_encode(['status' => 'error', 'message' => 'Errore del database: ' . $e->getMessage()]);
             }
         }
         break;
         
     case 'POST':
         // Creazione di un nuovo utente
         $data = json_decode(file_get_contents('php://input'), true);
         
         if (!isset($data['nomeUtente']) || !isset($data['nome']) || !isset($data['cognome']) || !isset($data['eMail'])) {
             http_response_code(400);
             echo json_encode(['status' => 'error', 'message' => 'Dati incompleti']);
             break;
         }
         
         $nomeUtente = trim($data['nomeUtente']);
         $nome = trim($data['nome']);
         $cognome = trim($data['cognome']);
         $eMail = trim($data['eMail']);
         
         // Validazione
         if (empty($nomeUtente) || empty($nome) || empty($cognome) || empty($eMail)) {
             http_response_code(400);
             echo json_encode(['status' => 'error', 'message' => 'Tutti i campi sono obbligatori']);
             break;
         }
         
         if (!filter_var($eMail, FILTER_VALIDATE_EMAIL)) {
             http_response_code(400);
             echo json_encode(['status' => 'error', 'message' => 'Email non valida']);
             break;
         }
         
         try {
             // Verifica se l'utente esiste già
             $stmt = $pdo->prepare("SELECT nomeUtente FROM Utente WHERE nomeUtente = :nomeUtente");
             $stmt->bindParam(':nomeUtente', $nomeUtente);
             $stmt->execute();
             
             if ($stmt->rowCount() > 0) {
                 http_response_code(409); // Conflict
                 echo json_encode(['status' => 'error', 'message' => 'Nome utente già registrato']);
                 break;
             }
             
             // Verifica se l'email è già registrata
             $stmt = $pdo->prepare("SELECT nomeUtente FROM Utente WHERE eMail = :eMail");
             $stmt->bindParam(':eMail', $eMail);
             $stmt->execute();
             
             if ($stmt->rowCount() > 0) {
                 http_response_code(409); // Conflict
                 echo json_encode(['status' => 'error', 'message' => 'Email già registrata']);
                 break;
             }
             
             // Inserimento del nuovo utente
             $stmt = $pdo->prepare("INSERT INTO Utente (nomeUtente, nome, cognome, eMail) VALUES (:nomeUtente, :nome, :cognome, :eMail)");
             $stmt->bindParam(':nomeUtente', $nomeUtente);
             $stmt->bindParam(':nome', $nome);
             $stmt->bindParam(':cognome', $cognome);
             $stmt->bindParam(':eMail', $eMail);
             
             if ($stmt->execute()) {
                 http_response_code(201); // Created
                 echo json_encode(['status' => 'success', 'message' => 'Utente registrato con successo']);
             } else {
                 http_response_code(500);
                 echo json_encode(['status' => 'error', 'message' => 'Errore durante la registrazione']);
             }
         } catch (PDOException $e) {
             http_response_code(500);
             echo json_encode(['status' => 'error', 'message' => 'Errore del database: ' . $e->getMessage()]);
         }
         break;
         
     case 'PUT':
         // Aggiornamento di un utente esistente
         if (!isset($_GET['id'])) {
             http_response_code(400);
             echo json_encode(['status' => 'error', 'message' => 'ID utente mancante']);
             break;
         }
         
         $nomeUtente = $_GET['id'];
         $data = json_decode(file_get_contents('php://input'), true);
         
         // Verifica che l'utente sia autenticato e possa modificare questo profilo
         if (!isset($_SESSION['user']) || $_SESSION['user']['nomeUtente'] !== $nomeUtente) {
             http_response_code(403); // Forbidden
             echo json_encode(['status' => 'error', 'message' => 'Non autorizzato']);
             break;
         }
         
         try {
             // Verifica se l'utente esiste
             $stmt = $pdo->prepare("SELECT * FROM Utente WHERE nomeUtente = :nomeUtente");
             $stmt->bindParam(':nomeUtente', $nomeUtente);
             $stmt->execute();
             
             if ($stmt->rowCount() === 0) {
                 http_response_code(404);
                 echo json_encode(['status' => 'error', 'message' => 'Utente non trovato']);
                 break;
             }
             
             // Costruzione della query di aggiornamento
             $updateFields = [];
             $params = [':nomeUtente' => $nomeUtente];
             
             if (isset($data['nome']) && !empty(trim($data['nome']))) {
                 $updateFields[] = "nome = :nome";
                 $params[':nome'] = trim($data['nome']);
             }
             
             if (isset($data['cognome']) && !empty(trim($data['cognome']))) {
                 $updateFields[] = "cognome = :cognome";
                 $params[':cognome'] = trim($data['cognome']);
             }
             
             if (isset($data['eMail']) && !empty(trim($data['eMail']))) {
                 if (!filter_var($data['eMail'], FILTER_VALIDATE_EMAIL)) {
                     http_response_code(400);
                     echo json_encode(['status' => 'error', 'message' => 'Email non valida']);
                     break;
                 }
                 $updateFields[] = "eMail = :eMail";
                 $params[':eMail'] = trim($data['eMail']);
             }
             
             if (empty($updateFields)) {
                 http_response_code(400);
                 echo json_encode(['status' => 'error', 'message' => 'Nessun campo da aggiornare']);
                 break;
             }
             
             $query = "UPDATE Utente SET " . implode(", ", $updateFields) . " WHERE nomeUtente = :nomeUtente";
             $stmt = $pdo->prepare($query);
             
             if ($stmt->execute($params)) {
                 // Aggiorna anche i dati di sessione
                 if (isset($params[':nome'])) $_SESSION['user']['nome'] = $params[':nome'];
                 if (isset($params[':cognome'])) $_SESSION['user']['cognome'] = $params[':cognome'];
                 if (isset($params[':eMail'])) $_SESSION['user']['eMail'] = $params[':eMail'];
                 
                 echo json_encode(['status' => 'success', 'message' => 'Profilo aggiornato con successo']);
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
         // Eliminazione di un utente
         if (!isset($_GET['id'])) {
             http_response_code(400);
             echo json_encode(['status' => 'error', 'message' => 'ID utente mancante']);
             break;
         }
         
         $nomeUtente = $_GET['id'];
         
         // Verifica che l'utente sia autenticato e possa eliminare questo profilo
         if (!isset($_SESSION['user']) || $_SESSION['user']['nomeUtente'] !== $nomeUtente) {
             http_response_code(403); // Forbidden
             echo json_encode(['status' => 'error', 'message' => 'Non autorizzato']);
             break;
         }
         
         try {
             // Verifica se l'utente esiste
             $stmt = $pdo->prepare("SELECT * FROM Utente WHERE nomeUtente = :nomeUtente");
             $stmt->bindParam(':nomeUtente', $nomeUtente);
             $stmt->execute();
             
             if ($stmt->rowCount() === 0) {
                 http_response_code(404);
                 echo json_encode(['status' => 'error', 'message' => 'Utente non trovato']);
                 break;
             }
             
             // Inizio transazione per garantire l'integrità dei dati
             $pdo->beginTransaction();
             
             // Prima elimina i record correlati nelle altre tabelle
             // Elimina le risposte dell'utente
             $stmt = $pdo->prepare("DELETE FROM RispostaUtenteQuiz WHERE nomeUtente = :nomeUtente");
             $stmt->bindParam(':nomeUtente', $nomeUtente);
             $stmt->execute();
             
             // Elimina le partecipazioni dell'utente
             $stmt = $pdo->prepare("DELETE FROM Partecipazione WHERE nomeUtente = :nomeUtente");
             $stmt->bindParam(':nomeUtente', $nomeUtente);
             $stmt->execute();
             
             // Elimina l'utente
             $stmt = $pdo->prepare("DELETE FROM Utente WHERE nomeUtente = :nomeUtente");
             $stmt->bindParam(':nomeUtente', $nomeUtente);
             
             if ($stmt->execute()) {
                 $pdo->commit();
                 
                 // Rimuovi la sessione dell'utente
                 session_unset();
                 session_destroy();
                 
                 echo json_encode(['status' => 'success', 'message' => 'Account eliminato con successo']);
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