<?php

/**
 * API per la gestione delle partecipazioni ai quiz
 * 
 * Questo file gestisce le operazioni relative alle partecipazioni degli utenti ai quiz.
 * Funzionalità principali:
 * - Registrazione di una nuova partecipazione
 * - Recupero delle partecipazioni di un utente specifico
 * - Recupero delle partecipazioni per un quiz specifico
 * - Salvataggio delle risposte fornite dagli utenti
 * - Calcolo del punteggio ottenuto in un quiz
 * 
 * Implementa controlli per verificare che l'utente partecipi solo a quiz aperti
 * e che risponda solo a domande del quiz associato alla partecipazione.
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

// Gestione delle operazioni in base al metodo HTTP
switch ($method) {
    case 'GET':
        // Recupero delle partecipazioni
        if (!isAuthenticated()) {
            http_response_code(401);
            echo json_encode(['status' => 'error', 'message' => 'Non autenticato']);
            break;
        }
        
        $nomeUtente = $_SESSION['user']['nomeUtente'];
        
        if (isset($_GET['id'])) {
            // Recupero di una singola partecipazione per ID
            $idPartecipazione = $_GET['id'];
            
            try {
                $stmt = $pdo->prepare("
                    SELECT p.*, q.titolo, q.descrizione 
                    FROM Partecipazione p
                    JOIN Quiz q ON p.idQuiz = q.idQuiz
                    WHERE p.idPartecipazione = :idPartecipazione AND p.nomeUtente = :nomeUtente
                ");
                $stmt->bindParam(':idPartecipazione', $idPartecipazione);
                $stmt->bindParam(':nomeUtente', $nomeUtente);
                $stmt->execute();
                
                if ($stmt->rowCount() > 0) {
                    $partecipazione = $stmt->fetch(PDO::FETCH_ASSOC);
                    
                    // Recupera le risposte fornite dall'utente
                    $stmtRisposte = $pdo->prepare("
                        SELECT ruq.*, d.testo as testoDomanda, r.testo as testoRisposta, r.punteggio
                        FROM RispostaUtenteQuiz ruq
                        JOIN Domanda d ON ruq.idDomanda = d.idDomanda
                        JOIN Risposta r ON ruq.idRisposta = r.idRisposta
                        WHERE ruq.nomeUtente = :nomeUtente AND ruq.idPartecipazione = :idPartecipazione
                    ");
                    $stmtRisposte->bindParam(':nomeUtente', $nomeUtente);
                    $stmtRisposte->bindParam(':idPartecipazione', $idPartecipazione);
                    $stmtRisposte->execute();
                    $risposte = $stmtRisposte->fetchAll(PDO::FETCH_ASSOC);
                    
                    $partecipazione['risposte'] = $risposte;
                    
                    echo json_encode(['status' => 'success', 'data' => $partecipazione]);
                } else {
                    http_response_code(404);
                    echo json_encode(['status' => 'error', 'message' => 'Partecipazione non trovata']);
                }
            } catch (PDOException $e) {
                http_response_code(500);
                echo json_encode(['status' => 'error', 'message' => 'Errore del database: ' . $e->getMessage()]);
            }
        } elseif (isset($_GET['quiz_id'])) {
            // Recupero di tutte le partecipazioni a un quiz specifico
            $idQuiz = $_GET['quiz_id'];
            
            try {
                // Prima verifica se l'utente è il creatore del quiz
                $stmtCreatore = $pdo->prepare("SELECT * FROM Quiz WHERE idQuiz = :idQuiz AND nomeUtente = :nomeUtente");
                $stmtCreatore->bindParam(':idQuiz', $idQuiz);
                $stmtCreatore->bindParam(':nomeUtente', $nomeUtente);
                $stmtCreatore->execute();
                
                if ($stmtCreatore->rowCount() > 0) {
                    // L'utente è il creatore, mostra tutte le partecipazioni
                    $stmt = $pdo->prepare("
                        SELECT p.*, u.nome, u.cognome, u.eMail
                        FROM Partecipazione p
                        JOIN Utente u ON p.nomeUtente = u.nomeUtente
                        WHERE p.idQuiz = :idQuiz
                        ORDER BY p.dataOra DESC
                    ");
                    $stmt->bindParam(':idQuiz', $idQuiz);
                    $stmt->execute();
                    $partecipazioni = $stmt->fetchAll(PDO::FETCH_ASSOC);
                    
                    echo json_encode(['status' => 'success', 'data' => $partecipazioni]);
                } else {
                    // L'utente non è il creatore, mostra solo le sue partecipazioni
                    $stmt = $pdo->prepare("
                        SELECT p.*, q.titolo, q.descrizione
                        FROM Partecipazione p
                        JOIN Quiz q ON p.idQuiz = q.idQuiz
                        WHERE p.idQuiz = :idQuiz AND p.nomeUtente = :nomeUtente
                        ORDER BY p.dataOra DESC
                    ");
                    $stmt->bindParam(':idQuiz', $idQuiz);
                    $stmt->bindParam(':nomeUtente', $nomeUtente);
                    $stmt->execute();
                    $partecipazioni = $stmt->fetchAll(PDO::FETCH_ASSOC);
                    
                    echo json_encode(['status' => 'success', 'data' => $partecipazioni]);
                }
            } catch (PDOException $e) {
                http_response_code(500);
                echo json_encode(['status' => 'error', 'message' => 'Errore del database: ' . $e->getMessage()]);
            }
        } else {
            // Recupero di tutte le partecipazioni dell'utente
            try {
                $stmt = $pdo->prepare("
                    SELECT p.*, q.titolo, q.descrizione 
                    FROM Partecipazione p
                    JOIN Quiz q ON p.idQuiz = q.idQuiz
                    WHERE p.nomeUtente = :nomeUtente
                    ORDER BY p.dataOra DESC
                ");
                $stmt->bindParam(':nomeUtente', $nomeUtente);
                $stmt->execute();
                $partecipazioni = $stmt->fetchAll(PDO::FETCH_ASSOC);
                
                echo json_encode(['status' => 'success', 'data' => $partecipazioni]);
            } catch (PDOException $e) {
                http_response_code(500);
                echo json_encode(['status' => 'error', 'message' => 'Errore del database: ' . $e->getMessage()]);
            }
        }
        break;
        
    case 'POST':
        // Creazione di una nuova partecipazione
        if (!isAuthenticated()) {
            http_response_code(401);
            echo json_encode(['status' => 'error', 'message' => 'Non autenticato']);
            break;
        }
        
        // Recupero dei dati dalla richiesta JSON
        $data = $_POST;
        if (!$data || !isset($data['idQuiz'])) {
            http_response_code(400);
            echo json_encode(['status' => 'error', 'message' => 'Dati mancanti o formato non valido']);
            break;
        }
        
        $idQuiz = $data['idQuiz'];
        $nomeUtente = $_SESSION['user']['nomeUtente'];
        
        try {
            // Verifica se il quiz esiste ed è aperto
            $stmtQuiz = $pdo->prepare("
                SELECT * FROM Quiz 
                WHERE codice = :idQuiz 
                AND dataInizio <= NOW() 
                AND (dataFine IS NULL OR dataFine >= NOW())
            ");
            $stmtQuiz->bindParam(':idQuiz', $idQuiz);
            $stmtQuiz->execute();
            
            if ($stmtQuiz->rowCount() === 0) {
                http_response_code(400);
                echo json_encode(['status' => 'error', 'message' => 'Quiz non disponibile o non aperto']);
                break;
            }
            
            // Verifica se l'utente ha già partecipato a questo quiz
            $stmtPartecipazione = $pdo->prepare("
                SELECT * FROM Partecipazione 
                WHERE quiz = :idQuiz AND utente = :nomeUtente
            ");
            $stmtPartecipazione->bindParam(':idQuiz', $idQuiz);
            $stmtPartecipazione->bindParam(':nomeUtente', $nomeUtente);
            $stmtPartecipazione->execute();
            
            if ($stmtPartecipazione->rowCount() > 0) {
                // L'utente ha già una partecipazione, restituisci quella esistente
                $partecipazione = $stmtPartecipazione->fetch(PDO::FETCH_ASSOC);
                echo json_encode(['status' => 'success', 'data' => $partecipazione, 'message' => 'Partecipazione già esistente']);
                break;
            }
            
            // Crea una nuova partecipazione
            $stmt = $pdo->prepare("
                INSERT INTO Partecipazione (quiz, utente, data) 
                VALUES (:idQuiz, :nomeUtente, NOW())
            ");
            $stmt->bindParam(':idQuiz', $idQuiz);
            $stmt->bindParam(':nomeUtente', $nomeUtente);
            $stmt->execute();
            
            $idPartecipazione = $pdo->lastInsertId();
            
            // Recupera la nuova partecipazione
            $stmtSelect = $pdo->prepare("
                SELECT p.*, q.titolo
                FROM Partecipazione p
                JOIN Quiz q ON p.quiz = q.codice
                WHERE p.codice = :idPartecipazione
            ");
            $stmtSelect->bindParam(':idPartecipazione', $idPartecipazione);
            $stmtSelect->execute();
            $nuovaPartecipazione = $stmtSelect->fetch(PDO::FETCH_ASSOC);
            
            echo json_encode(['status' => 'success', 'data' => $nuovaPartecipazione, 'message' => 'Partecipazione creata con successo']);
        } catch (PDOException $e) {
            http_response_code(500);
            echo json_encode(['status' => 'error', 'message' => 'Errore del database: ' . $e->getMessage()]);
        }
        break;
        
    case 'PUT':
        // Aggiornamento di una partecipazione (registrazione risposte)
        if (!isAuthenticated()) {
            http_response_code(401);
            echo json_encode(['status' => 'error', 'message' => 'Non autenticato']);
            break;
        }
        
        $data = json_decode(file_get_contents('php://input'), true);
        if (!$data || !isset($data['idPartecipazione']) || !isset($data['risposte'])) {
            http_response_code(400);
            echo json_encode(['status' => 'error', 'message' => 'Dati mancanti o formato non valido']);
            break;
        }
        
        $idPartecipazione = $data['idPartecipazione'];
        $risposte = $data['risposte'];
        $nomeUtente = $_SESSION['user']['nomeUtente'];
        
        try {
            // Verifica che la partecipazione appartenga all'utente
            $stmtVerifica = $pdo->prepare("
                SELECT p.*, q.codice 
                FROM Partecipazione p
                JOIN Quiz q ON p.quiz = q.codice
                WHERE p.codice = :idPartecipazione AND p.utente = :nomeUtente
            ");
            $stmtVerifica->bindParam(':idPartecipazione', $idPartecipazione);
            $stmtVerifica->bindParam(':nomeUtente', $nomeUtente);
            $stmtVerifica->execute();
            
            if ($stmtVerifica->rowCount() === 0) {
                http_response_code(404);
                echo json_encode(['status' => 'error', 'message' => 'Partecipazione non trovata o non autorizzata']);
                break;
            }
            
            $partecipazione = $stmtVerifica->fetch(PDO::FETCH_ASSOC);
            $idQuiz = $partecipazione['idQuiz'];
            
            // Inizia la transazione
            $pdo->beginTransaction();
            
            // Rimuovi eventuali risposte precedenti
            $stmtCancella = $pdo->prepare("
                DELETE FROM RispostaUtenteQuiz 
                WHERE partecipazione = :idPartecipazione AND nomeUtente = :nomeUtente
            ");
            $stmtCancella->bindParam(':idPartecipazione', $idPartecipazione);
            $stmtCancella->bindParam(':nomeUtente', $nomeUtente);
            $stmtCancella->execute();
            
            // Salva le nuove risposte
            $punteggioTotale = 0;
            foreach ($risposte as $risposta) {
                // Verifica che la domanda appartenga al quiz
                $stmtDomanda = $pdo->prepare("
                    SELECT * FROM Domanda WHERE idDomanda = :idDomanda AND idQuiz = :idQuiz
                ");
                $stmtDomanda->bindParam(':idDomanda', $risposta['idDomanda']);
                $stmtDomanda->bindParam(':idQuiz', $idQuiz);
                $stmtDomanda->execute();
                
                if ($stmtDomanda->rowCount() === 0) {
                    $pdo->rollBack();
                    http_response_code(400);
                    echo json_encode(['status' => 'error', 'message' => 'Domanda non valida per questo quiz']);
                    exit;
                }
                
                // Verifica che la risposta appartenga alla domanda
                $stmtRisposta = $pdo->prepare("
                    SELECT * FROM Risposta WHERE idRisposta = :idRisposta AND idDomanda = :idDomanda
                ");
                $stmtRisposta->bindParam(':idRisposta', $risposta['idRisposta']);
                $stmtRisposta->bindParam(':idDomanda', $risposta['idDomanda']);
                $stmtRisposta->execute();
                
                if ($stmtRisposta->rowCount() === 0) {
                    $pdo->rollBack();
                    http_response_code(400);
                    echo json_encode(['status' => 'error', 'message' => 'Risposta non valida per questa domanda']);
                    exit;
                }
                
                // Ottieni il punteggio per questa risposta
                $rispostaData = $stmtRisposta->fetch(PDO::FETCH_ASSOC);
                $punteggio = $rispostaData['punteggio'];
                $punteggioTotale += $punteggio;
                
                // Salva la risposta dell'utente
                $stmtInserisci = $pdo->prepare("
                    INSERT INTO RispostaUtenteQuiz (idPartecipazione, nomeUtente, idDomanda, idRisposta) 
                    VALUES (:idPartecipazione, :nomeUtente, :idDomanda, :idRisposta)
                ");
                $stmtInserisci->bindParam(':idPartecipazione', $idPartecipazione);
                $stmtInserisci->bindParam(':nomeUtente', $nomeUtente);
                $stmtInserisci->bindParam(':idDomanda', $risposta['idDomanda']);
                $stmtInserisci->bindParam(':idRisposta', $risposta['idRisposta']);
                $stmtInserisci->execute();
            }
            
            // Aggiorna il punteggio totale e imposta la partecipazione come completata
            $stmtAggiorna = $pdo->prepare("
                UPDATE Partecipazione 
                SET punteggio = :punteggio, dataOraFine = NOW(), completato = 1
                WHERE idPartecipazione = :idPartecipazione AND nomeUtente = :nomeUtente
            ");
            $stmtAggiorna->bindParam(':punteggio', $punteggioTotale);
            $stmtAggiorna->bindParam(':idPartecipazione', $idPartecipazione);
            $stmtAggiorna->bindParam(':nomeUtente', $nomeUtente);
            $stmtAggiorna->execute();
            
            // Commit della transazione
            $pdo->commit();
            
            // Recupera la partecipazione aggiornata
            $stmtSelect = $pdo->prepare("
                SELECT p.*, q.titolo, q.descrizione 
                FROM Partecipazione p
                JOIN Quiz q ON p.idQuiz = q.idQuiz
                WHERE p.idPartecipazione = :idPartecipazione
            ");
            $stmtSelect->bindParam(':idPartecipazione', $idPartecipazione);
            $stmtSelect->execute();
            $partecipazioneAggiornata = $stmtSelect->fetch(PDO::FETCH_ASSOC);
            
            echo json_encode([
                'status' => 'success', 
                'data' => $partecipazioneAggiornata, 
                'message' => 'Risposte registrate con successo',
                'punteggio' => $punteggioTotale
            ]);
        } catch (PDOException $e) {
            if ($pdo->inTransaction()) {
                $pdo->rollBack();
            }
            http_response_code(500);
            echo json_encode(['status' => 'error', 'message' => 'Errore del database: ' . $e->getMessage()]);
        }
        break;
        
    case 'DELETE':
        // Eliminazione di una partecipazione (solo se non è completata)
        if (!isAuthenticated()) {
            http_response_code(401);
            echo json_encode(['status' => 'error', 'message' => 'Non autenticato']);
            break;
        }
        
        $data = json_decode(file_get_contents('php://input'), true);
        if (!$data || !isset($data['idPartecipazione'])) {
            http_response_code(400);
            echo json_encode(['status' => 'error', 'message' => 'Dati mancanti o formato non valido']);
            break;
        }
        
        $idPartecipazione = $data['idPartecipazione'];
        $nomeUtente = $_SESSION['user']['nomeUtente'];
        
        try {
            // Verifica che la partecipazione appartenga all'utente e non sia già completata
            $stmtVerifica = $pdo->prepare("
                SELECT * FROM Partecipazione 
                WHERE idPartecipazione = :idPartecipazione AND nomeUtente = :nomeUtente AND (completato = 0 OR completato IS NULL)
            ");
            $stmtVerifica->bindParam(':idPartecipazione', $idPartecipazione);
            $stmtVerifica->bindParam(':nomeUtente', $nomeUtente);
            $stmtVerifica->execute();
            
            if ($stmtVerifica->rowCount() === 0) {
                http_response_code(404);
                echo json_encode(['status' => 'error', 'message' => 'Partecipazione non trovata, non autorizzata o già completata']);
                break;
            }
            
            // Inizia la transazione
            $pdo->beginTransaction();
            
            // Rimuovi eventuali risposte
            $stmtCancellaRisposte = $pdo->prepare("
                DELETE FROM RispostaUtenteQuiz 
                WHERE idPartecipazione = :idPartecipazione AND nomeUtente = :nomeUtente
            ");
            $stmtCancellaRisposte->bindParam(':idPartecipazione', $idPartecipazione);
            $stmtCancellaRisposte->bindParam(':nomeUtente', $nomeUtente);
            $stmtCancellaRisposte->execute();
            
            // Elimina la partecipazione
            $stmtCancellaPartecipazione = $pdo->prepare("
                DELETE FROM Partecipazione 
                WHERE idPartecipazione = :idPartecipazione AND nomeUtente = :nomeUtente
            ");
            $stmtCancellaPartecipazione->bindParam(':idPartecipazione', $idPartecipazione);
            $stmtCancellaPartecipazione->bindParam(':nomeUtente', $nomeUtente);
            $stmtCancellaPartecipazione->execute();
            
            // Commit della transazione
            $pdo->commit();
            
            echo json_encode(['status' => 'success', 'message' => 'Partecipazione eliminata con successo']);
        } catch (PDOException $e) {
            if ($pdo->inTransaction()) {
                $pdo->rollBack();
            }
            http_response_code(500);
            echo json_encode(['status' => 'error', 'message' => 'Errore del database: ' . $e->getMessage()]);
        }
        break;
        
    default:
        http_response_code(405);
        echo json_encode(['status' => 'error', 'message' => 'Metodo non consentito']);
        break;
}
?>