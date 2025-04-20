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
                    SELECT p.*, q.titolo 
                    FROM Partecipazione p
                    JOIN Quiz q ON p.quiz = q.codice
                    WHERE p.codice = :idPartecipazione AND p.utente = :nomeUtente
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
                        JOIN Domanda d ON ruq.domanda = d.numero
                        JOIN Risposta r ON ruq.risposta = r.numero
                        WHERE ruq.nomeUtente = :nomeUtente AND ruq.partecipazione = :idPartecipazione
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
                        SELECT p.*, q.titolo
                        FROM Partecipazione p
                        JOIN Quiz q ON p.quiz = q.codice
                        WHERE p.quiz = :idQuiz AND p.utente = :nomeUtente
                        ORDER BY p.data DESC
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
                    SELECT p.*, q.titolo
                    FROM Partecipazione p
                    JOIN Quiz q ON p.quiz = q.codice
                    WHERE p.utente = :nomeUtente
                    ORDER BY p.codice DESC
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

            // Salvataggio delle risposte
            $risposte = $data['answers'];
            foreach ($risposte as $idDomanda => $rispostaArray) {
                foreach ($rispostaArray as $idRisposta) {

                    // Inserisci la risposta nella tabella RispostaUtenteQuiz
                    $stmtInserisciRisposta = $pdo->prepare("
                INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) 
                VALUES (:idPartecipazione, :idQuiz, :idDomanda, :idRisposta)
            ");
                    $stmtInserisciRisposta->bindParam(':idPartecipazione', $idPartecipazione);
                    $stmtInserisciRisposta->bindParam(':idQuiz', $idQuiz);
                    $stmtInserisciRisposta->bindParam(':idDomanda', $idDomanda);
                    $stmtInserisciRisposta->bindParam(':idRisposta', $idRisposta);
                    $stmtInserisciRisposta->execute();
                }
            }

            echo json_encode(['status' => 'success', 'data' => $nuovaPartecipazione, 'message' => 'Partecipazione creata con successo e risposte salvate']);
        } catch (PDOException $e) {
            http_response_code(500);
            echo json_encode(['status' => 'error', 'message' => 'Errore del database: ' . $e->getMessage()]);
        }
        break;

    default:
        http_response_code(405);
        echo json_encode(['status' => 'error', 'message' => 'Metodo non consentito']);
        break;
}
