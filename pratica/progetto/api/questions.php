<?php

/**
 * API per la gestione delle domande dei quiz
 * 
 * Questo file gestisce tutte le operazioni CRUD relative alle domande dei quiz.
 * Funzionalità implementate:
 * - Creazione di nuove domande per un quiz
 * - Modifica di domande esistenti
 * - Eliminazione di domande
 * - Recupero di tutte le domande associate a un quiz specifico
 * - Recupero dei dettagli di una singola domanda
 * 
 * Include la validazione dei dati in input e controlli di autorizzazione
 * per garantire che solo il creatore del quiz possa modificare le domande.
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

// Funzione per verificare se un quiz appartiene all'utente
function isOwnerOfQuiz($pdo, $idQuiz, $nomeUtente) {
    $stmt = $pdo->prepare("SELECT * FROM Quiz WHERE idQuiz = :idQuiz AND nomeUtente = :nomeUtente");
    $stmt->bindParam(':idQuiz', $idQuiz);
    $stmt->bindParam(':nomeUtente', $nomeUtente);
    $stmt->execute();
    return $stmt->rowCount() > 0;
}

// Funzione per verificare se una domanda appartiene a un quiz dell'utente
function isOwnerOfQuestion($pdo, $idDomanda, $nomeUtente) {
    $stmt = $pdo->prepare("
        SELECT d.* 
        FROM Domanda d
        JOIN Quiz q ON d.idQuiz = q.idQuiz
WHERE d.idDomanda = :idDomanda AND q.nomeUtente = :nomeUtente
    ");
    $stmt->bindParam(':idDomanda', $idDomanda);
    $stmt->bindParam(':nomeUtente', $nomeUtente);
    $stmt->execute();
    return $stmt->rowCount() > 0;
}

// Gestione delle operazioni in base al metodo HTTP
switch ($method) {
    case 'GET':
        // Recupero delle domande
        if (isset($_GET['id'])) {
            // Recupero di una singola domanda per ID
            $idDomanda = $_GET['id'];
            
            try {
                $stmt = $pdo->prepare("SELECT * FROM Domanda WHERE idDomanda = :idDomanda");
                $stmt->bindParam(':idDomanda', $idDomanda);
                $stmt->execute();
                
                if ($stmt->rowCount() > 0) {
                    $domanda = $stmt->fetch(PDO::FETCH_ASSOC);
                    
                    // Recupera le risposte associate
                    $stmtRisposte = $pdo->prepare("SELECT * FROM Risposta WHERE idDomanda = :idDomanda");
                    $stmtRisposte->bindParam(':idDomanda', $idDomanda);
                    $stmtRisposte->execute();
                    $risposte = $stmtRisposte->fetchAll(PDO::FETCH_ASSOC);
                    
                    $domanda['risposte'] = $risposte;
                    
                    echo json_encode(['status' => 'success', 'data' => $domanda]);
                } else {
                    http_response_code(404);
                    echo json_encode(['status' => 'error', 'message' => 'Domanda non trovata']);
                }
            } catch (PDOException $e) {
                http_response_code(500);
                echo json_encode(['status' => 'error', 'message' => 'Errore del database: ' . $e->getMessage()]);
            }
        } elseif (isset($_GET['quiz_id'])) {
            // Recupero di tutte le domande di un quiz
            $idQuiz = $_GET['quiz_id'];
            
            try {
                $stmt = $pdo->prepare("SELECT * FROM Domanda WHERE idQuiz = :idQuiz ORDER BY idDomanda");
                $stmt->bindParam(':idQuiz', $idQuiz);
                $stmt->execute();
                $domande = $stmt->fetchAll(PDO::FETCH_ASSOC);
                
                // Per ogni domanda, recupera le risposte
                foreach ($domande as $key => $domanda) {
                    $stmtRisposte = $pdo->prepare("SELECT * FROM Risposta WHERE idDomanda = :idDomanda");
                    $stmtRisposte->bindParam(':idDomanda', $domanda['idDomanda']);
                    $stmtRisposte->execute();
                    $domande[$key]['risposte'] = $stmtRisposte->fetchAll(PDO::FETCH_ASSOC);
                }
                
                echo json_encode(['status' => 'success', 'data' => $domande]);
            } catch (PDOException $e) {
                http_response_code(500);
                echo json_encode(['status' => 'error', 'message' => 'Errore del database: ' . $e->getMessage()]);
            }
        } else {
            http_response_code(400);
            echo json_encode(['status' => 'error', 'message' => 'Parametro id o quiz_id mancante']);
        }
        break;
        
    case 'POST':
        // Creazione di una nuova domanda
        if (!isAuthenticated()) {
            http_response_code(401);
            echo json_encode(['status' => 'error', 'message' => 'Non autenticato']);
            break;
        }
        
        $data = json_decode(file_get_contents('php://input'), true);
        
        if (!isset($data['idQuiz']) || !isset($data['testo']) || !isset($data['risposte']) || empty($data['risposte'])) {
            http_response_code(400);
            echo json_encode(['status' => 'error', 'message' => 'Dati incompleti']);
            break;
        }
        
        $idQuiz = $data['idQuiz'];
        $testo = trim($data['testo']);
        $nomeUtente = $_SESSION['user']['nomeUtente'];
        
        // Verifica proprietà del quiz
        if (!isOwnerOfQuiz($pdo, $idQuiz, $nomeUtente)) {
            http_response_code(403); // Forbidden
            echo json_encode(['status' => 'error', 'message' => 'Non autorizzato a modificare questo quiz']);
            break;
        }
        
        try {
            $pdo->beginTransaction();
            
            // Inserimento della domanda
            $stmt = $pdo->prepare("INSERT INTO Domanda (idQuiz, testo) VALUES (:idQuiz, :testo)");
            $stmt->bindParam(':idQuiz', $idQuiz);
            $stmt->bindParam(':testo', $testo);
            
            if (!$stmt->execute()) {
                throw new Exception("Errore nell'inserimento della domanda");
            }
            
            $idDomanda = $pdo->lastInsertId();
            
            // Inserimento delle risposte
            foreach ($data['risposte'] as $risposta) {
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
            
            $pdo->commit();
            
            http_response_code(201); // Created
            echo json_encode([
                'status' => 'success', 
                'message' => 'Domanda creata con successo',
                'idDomanda' => $idDomanda
            ]);
            
        } catch (Exception $e) {
            $pdo->rollBack();
            http_response_code(500);
            echo json_encode(['status' => 'error', 'message' => $e->getMessage()]);
        }
        break;
        
    case 'PUT':
        // Aggiornamento di una domanda esistente
        if (!isAuthenticated()) {
            http_response_code(401);
            echo json_encode(['status' => 'error', 'message' => 'Non autenticato']);
            break;
        }
        
        if (!isset($_GET['id'])) {
            http_response_code(400);
            echo json_encode(['status' => 'error', 'message' => 'ID domanda mancante']);
            break;
        }
        
        $idDomanda = $_GET['id'];
        $nomeUtente = $_SESSION['user']['nomeUtente'];
        
        // Verifica proprietà della domanda
        if (!isOwnerOfQuestion($pdo, $idDomanda, $nomeUtente)) {
            http_response_code(403); // Forbidden
            echo json_encode(['status' => 'error', 'message' => 'Non autorizzato a modificare questa domanda']);
            break;
        }
        
        $data = json_decode(file_get_contents('php://input'), true);
        
        if (empty($data)) {
            http_response_code(400);
            echo json_encode(['status' => 'error', 'message' => 'Dati mancanti']);
            break;
        }
        
        try {
            $pdo->beginTransaction();
            
            // Aggiornamento della domanda
            if (isset($data['testo']) && !empty(trim($data['testo']))) {
                $testo = trim($data['testo']);
                $stmt = $pdo->prepare("UPDATE Domanda SET testo = :testo WHERE idDomanda = :idDomanda");
                $stmt->bindParam(':testo', $testo);
                $stmt->bindParam(':idDomanda', $idDomanda);
                
                if (!$stmt->execute()) {
                    throw new Exception("Errore nell'aggiornamento della domanda");
                }
            }
            
            // Aggiornamento delle risposte
            if (isset($data['risposte']) && is_array($data['risposte'])) {
                foreach ($data['risposte'] as $risposta) {
                    if (!isset($risposta['idRisposta']) || !isset($risposta['testo']) || !isset($risposta['punteggio'])) {
                        throw new Exception("Dati incompleti per la risposta");
                    }
                    
                    $idRisposta = $risposta['idRisposta'];
                    $testoRisposta = trim($risposta['testo']);
                    $punteggio = (float) $risposta['punteggio'];
                    
                    // Verifica che la risposta appartenga alla domanda
                    $stmtVerifica = $pdo->prepare("
                        SELECT * FROM Risposta WHERE idRisposta = :idRisposta AND idDomanda = :idDomanda
                    ");
                    $stmtVerifica->bindParam(':idRisposta', $idRisposta);
                    $stmtVerifica->bindParam(':idDomanda', $idDomanda);
                    $stmtVerifica->execute();
                    
                    if ($stmtVerifica->rowCount() === 0) {
                        throw new Exception("Risposta non valida per questa domanda");
                    }
                    
                    $stmtRisposta = $pdo->prepare("
                        UPDATE Risposta SET testo = :testo, punteggio = :punteggio WHERE idRisposta = :idRisposta
                    ");
                    $stmtRisposta->bindParam(':testo', $testoRisposta);
                    $stmtRisposta->bindParam(':punteggio', $punteggio);
                    $stmtRisposta->bindParam(':idRisposta', $idRisposta);
                    
                    if (!$stmtRisposta->execute()) {
                        throw new Exception("Errore nell'aggiornamento della risposta");
                    }
                }
            }
            
            $pdo->commit();
            
            echo json_encode(['status' => 'success', 'message' => 'Domanda aggiornata con successo']);
            
        } catch (Exception $e) {
            $pdo->rollBack();
            http_response_code(500);
            echo json_encode(['status' => 'error', 'message' => $e->getMessage()]);
        }
        break;
        
    case 'DELETE':
        // Eliminazione di una domanda
        if (!isAuthenticated()) {
            http_response_code(401);
            echo json_encode(['status' => 'error', 'message' => 'Non autenticato']);
            break;
        }
        
        if (!isset($_GET['id'])) {
            http_response_code(400);
            echo json_encode(['status' => 'error', 'message' => 'ID domanda mancante']);
            break;
        }
        
        $idDomanda = $_GET['id'];
        $nomeUtente = $_SESSION['user']['nomeUtente'];
        
        // Verifica proprietà della domanda
        if (!isOwnerOfQuestion($pdo, $idDomanda, $nomeUtente)) {
            http_response_code(403); // Forbidden
            echo json_encode(['status' => 'error', 'message' => 'Non autorizzato a eliminare questa domanda']);
            break;
        }
        
        try {
            $pdo->beginTransaction();
            
            // Elimina prima le risposte degli utenti
            $stmt = $pdo->prepare("DELETE FROM RispostaUtenteQuiz WHERE idDomanda = :idDomanda");
            $stmt->bindParam(':idDomanda', $idDomanda);
            $stmt->execute();
            
            // Elimina le risposte
            $stmt = $pdo->prepare("DELETE FROM Risposta WHERE idDomanda = :idDomanda");
            $stmt->bindParam(':idDomanda', $idDomanda);
            $stmt->execute();
            
            // Elimina la domanda
            $stmt = $pdo->prepare("DELETE FROM Domanda WHERE idDomanda = :idDomanda");
            $stmt->bindParam(':idDomanda', $idDomanda);
            
            if ($stmt->execute()) {
                $pdo->commit();
                echo json_encode(['status' => 'success', 'message' => 'Domanda eliminata con successo']);
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