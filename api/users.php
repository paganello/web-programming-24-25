<?php
/**
 * API per la gestione degli Utenti.
 *
 * Questo script gestisce le operazioni relative agli utenti del sistema.
 * Al momento, implementa principalmente la funzionalità di registrazione (creazione)
 * di nuovi utenti.
 *
 * Funzionalità future potrebbero includere:
 * - Autenticazione degli utenti (login);
 * - Modifica dei dati del profilo;
 * - Recupero delle informazioni dell'utente;
 * - Recupero dei quiz creati da un utente;
 * - Recupero delle partecipazioni di un utente.
 */

// --- Inizializzazione della sessione e configurazione ---
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
require_once '../config/database.php'; // Assicura che $pdo sia disponibile per le query
header('Content-Type: application/json'); // Imposta il tipo di contenuto della risposta a JSON

$method = $_SERVER['REQUEST_METHOD'];

// --- Gestione delle Richieste API basata sul Metodo HTTP ---
switch ($method) {
    case 'POST':
        // --- Creazione (Registrazione) di un Nuovo Utente ---
        // I dati sono attesi in formato JSON nel corpo della richiesta.
        $data = json_decode(file_get_contents('php://input'), true);

        // Verifica la presenza dei campi obbligatori.
        if (!isset($data['nomeUtente']) || !isset($data['nome']) || !isset($data['cognome']) || !isset($data['eMail'])) {
            http_response_code(400); // Bad Request
            echo json_encode(['status' => 'error', 'message' => 'Dati incompleti per la registrazione. Sono richiesti: nomeUtente, nome, cognome, eMail.']);
            exit; // Termina l'esecuzione dopo aver inviato l'errore.
        }

        // Estrai e sanitizza (trim) i dati.
        $nomeUtente = trim($data['nomeUtente']);
        $nome = trim($data['nome']);
        $cognome = trim($data['cognome']);
        $eMail = trim($data['eMail']);

        // --- Validazione dei Dati ---
        if (empty($nomeUtente) || empty($nome) || empty($cognome) || empty($eMail)) {
            http_response_code(400); // Bad Request
            echo json_encode(['status' => 'error', 'message' => 'Tutti i campi (nomeUtente, nome, cognome, eMail) sono obbligatori e non possono essere vuoti.']);
            exit;
        }

        if (!filter_var($eMail, FILTER_VALIDATE_EMAIL)) {
            http_response_code(400); // Bad Request
            echo json_encode(['status' => 'error', 'message' => 'Il formato dell\'email fornita non è valido.']);
            exit;
        }

        try {
            // --- Verifica Unicità Nome Utente ed Email ---
            // Controlla se nomeUtente o eMail sono già presenti nel database con una singola query per efficienza.
            $stmt = $pdo->prepare("
                SELECT 
                    EXISTS(SELECT 1 FROM Utente WHERE nomeUtente = :nomeUtente) as username_exists,
                    EXISTS(SELECT 1 FROM Utente WHERE eMail = :eMail) as email_exists
            ");
            $stmt->bindParam(':nomeUtente', $nomeUtente, PDO::PARAM_STR);
            $stmt->bindParam(':eMail', $eMail, PDO::PARAM_STR);
            $stmt->execute();
            $existence = $stmt->fetch(PDO::FETCH_ASSOC);

            $usernameExists = (bool)$existence['username_exists'];
            $emailExists = (bool)$existence['email_exists'];

            // Costruisci un messaggio di errore specifico se ci sono conflitti.
            $errorMessages = [];
            if ($usernameExists) {
                $errorMessages[] = 'Il nome utente scelto è già in uso';
            }
            if ($emailExists) {
                $errorMessages[] = 'L\'indirizzo email fornito è già registrato';
            }

            if (!empty($errorMessages)) {
                http_response_code(409); // Conflict
                echo json_encode(['status' => 'error', 'message' => implode('. ', $errorMessages) . '. Si prega di sceglierne altri.']);
                exit;
            }

            // --- Inserimento Nuovo Utente ---
            // Se non ci sono conflitti, procedi con l'inserimento del nuovo utente.
            $stmt = $pdo->prepare("INSERT INTO Utente (nomeUtente, nome, cognome, eMail) VALUES (:nomeUtente, :nome, :cognome, :eMail)");
            $stmt->bindParam(':nomeUtente', $nomeUtente, PDO::PARAM_STR);
            $stmt->bindParam(':nome', $nome, PDO::PARAM_STR);
            $stmt->bindParam(':cognome', $cognome, PDO::PARAM_STR);
            $stmt->bindParam(':eMail', $eMail, PDO::PARAM_STR);

            if ($stmt->execute()) {
                http_response_code(201); // Created
                // Potrebbe essere utile restituire l'ID del nuovo utente o alcuni dei suoi dati.
                echo json_encode(['status' => 'success', 'message' => 'Utente registrato con successo.']);
            } else {
                // Errore generico se l'execute fallisce per motivi non legati a una PDOException.
                http_response_code(500); // Internal Server Error
                error_log('API User (user.php): Errore durante l\'inserimento nel database. L\'execute() ha restituito false.');
                echo json_encode(['status' => 'error', 'message' => 'Si è verificato un errore durante la registrazione. Riprova.']);
            }
        } catch (PDOException $e) {
            // Gestione specifica per errori PDO (es. problemi di connessione, query errate).
            http_response_code(500); // Internal Server Error
            error_log('API User (user.php) - PDOException: ' . $e->getMessage() . "\n" . $e->getTraceAsString());
            echo json_encode(['status' => 'error', 'message' => 'Errore del database durante la registrazione. Riprova più tardi.']);
        }
        break; // Fine del case 'POST'
    default:
        // Gestisce qualsiasi metodo HTTP non esplicitamente supportato.
        http_response_code(405); // Method Not Allowed
        echo json_encode(['status' => 'error', 'message' => 'Metodo HTTP non consentito per questa risorsa.']);
        break;
}
?>