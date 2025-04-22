<?php

/**
 * API per la gestione degli utenti.
 * 
 * Questo file gestisce le operazioni relative agli utenti del sistema.
 * Funzionalità principali:
 * - Registrazione di nuovi utenti;
 * - Autenticazione degli utenti;
 * - Modifica dei dati del profilo;
 * - Recupero delle informazioni dell'utente;
 * - Recupero dei quiz creati da un utente;
 * - Recupero delle partecipazioni di un utente;
 */

// --- Inizializzazione della sessione ---
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
require_once '../config/database.php';
header('Content-Type: application/json');
$method = $_SERVER['REQUEST_METHOD'];

// --- Gestione delle richieste API ---
switch ($method) {

    // --- Creazione utente ---
    case 'POST':
        // Creazione di un nuovo utente.
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

        // Validazione.
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
            // Verifica se l'utente esiste già.
            $stmt = $pdo->prepare("SELECT nomeUtente FROM Utente WHERE nomeUtente = :nomeUtente");
            $stmt->bindParam(':nomeUtente', $nomeUtente);
            $stmt->execute();

            // Se l'utente esiste già, restituisci un errore.
            if ($stmt->rowCount() > 0) {
                http_response_code(409); 
                echo json_encode(['status' => 'error', 'message' => 'Nome utente già registrato']);
                break;
            }

            // Verifica se l'email è già registrata.
            $stmt = $pdo->prepare("SELECT nomeUtente FROM Utente WHERE eMail = :eMail");
            $stmt->bindParam(':eMail', $eMail);
            $stmt->execute();

            // Se l'email è già registrata, restituisci un errore.
            if ($stmt->rowCount() > 0) {
                http_response_code(409);
                echo json_encode(['status' => 'error', 'message' => 'Email già registrata']);
                break;
            }

            // Inserimento del nuovo utente.
            $stmt = $pdo->prepare("INSERT INTO Utente (nomeUtente, nome, cognome, eMail) VALUES (:nomeUtente, :nome, :cognome, :eMail)");
            $stmt->bindParam(':nomeUtente', $nomeUtente);
            $stmt->bindParam(':nome', $nome);
            $stmt->bindParam(':cognome', $cognome);
            $stmt->bindParam(':eMail', $eMail);

            if ($stmt->execute()) {
                http_response_code(201); // Created.
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

    default:
        http_response_code(405); // Method Not Allowed.
        echo json_encode(['status' => 'error', 'message' => 'Metodo non consentito']);
}
?>