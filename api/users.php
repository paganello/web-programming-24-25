<?php
/**
 * API per la gestione degli Utenti.
 *
 * Questo script gestisce le operazioni relative agli utenti del sistema.
 * Al momento, la sua funzionalità principale è la registrazione (creazione)
 * di nuovi utenti, includendo la validazione dei dati e la verifica
 * dell'unicità di nome utente ed email.
 * Le risposte sono fornite in formato JSON.
 *
 * Funzionalità future potrebbero includere:
 * - Autenticazione degli utenti (login);
 * - Modifica dei dati del profilo utente;
 * - Recupero delle informazioni di un utente specifico;
 * - Elenco dei quiz creati da un utente;
 * - Elenco delle partecipazioni di un utente ai quiz.
 */

// --- Inizializzazione della sessione e configurazione ---
if (session_status() === PHP_SESSION_NONE) {
    session_start(); // Avvia la sessione PHP se non è già attiva.
}

// Importa la configurazione del database, che dovrebbe definire la variabile $pdo per la connessione.
require_once '../config/database.php';

// Imposta l'header della risposta HTTP per indicare che il contenuto sarà in formato JSON.
header('Content-Type: application/json');

// Ottiene il metodo HTTP utilizzato per la richiesta corrente (es. GET, POST, PUT, DELETE).
$method = $_SERVER['REQUEST_METHOD'];

// --- Gestione delle Richieste API basata sul Metodo HTTP ---
switch ($method) {
    case 'POST':
        // --- Logica per la Creazione (Registrazione) di un Nuovo Utente ---
        
        // I dati per la registrazione sono attesi in formato JSON nel corpo della richiesta.
        // file_get_contents('php://input') legge il corpo grezzo della richiesta.
        // json_decode con il secondo parametro true converte l'oggetto JSON in un array associativo.
        $data = json_decode(file_get_contents('php://input'), true);

        // --- Validazione preliminare dei dati di input ---
        // Verifica la presenza di tutti i campi obbligatori nel payload JSON.
        if (!isset($data['nomeUtente']) || !isset($data['nome']) || !isset($data['cognome']) || !isset($data['eMail'])) {
            http_response_code(400); // Bad Request: richiesta malformata o dati mancanti.
            echo json_encode([
                'status' => 'error', 
                'message' => 'Dati incompleti per la registrazione. Sono richiesti: nomeUtente, nome, cognome, eMail.'
            ]);
            exit; // Termina l'esecuzione dello script dopo aver inviato la risposta di errore.
        }

        // Estrae i dati dal payload e applica trim() per rimuovere spazi bianchi iniziali e finali.
        $nomeUtente = trim($data['nomeUtente']);
        $nome = trim($data['nome']);
        $cognome = trim($data['cognome']);
        $eMail = trim($data['eMail']);

        // --- Validazione ulteriore dei dati sanitizzati ---
        
        // Verifica che i campi obbligatori non siano stringhe vuote dopo l'applicazione di trim().
        if (empty($nomeUtente) || empty($nome) || empty($cognome) || empty($eMail)) {
            http_response_code(400); // Bad Request
            echo json_encode([
                'status' => 'error', 
                'message' => 'Tutti i campi (nomeUtente, nome, cognome, eMail) sono obbligatori e non possono essere vuoti.'
            ]);
            exit;
        }

        // Validazione del formato dell'indirizzo email.
        if (!filter_var($eMail, FILTER_VALIDATE_EMAIL)) {
            http_response_code(400); // Bad Request
            echo json_encode([
                'status' => 'error', 
                'message' => 'Il formato dell\'email fornita non è valido.'
            ]);
            exit;
        }

        try {
            // --- Logica di Interazione con il Database ---

            // --- Verifica Unicità Nome Utente ed Email ---
            // Controlla se il nomeUtente o l'eMail forniti sono già presenti nel database.
            // Si utilizza una singola query con subquery EXISTS per efficienza,
            // evitando query multiple e recuperando solo un booleano per ciascun controllo.
            $stmt = $pdo->prepare("
                SELECT 
                    EXISTS(SELECT 1 FROM Utente WHERE nomeUtente = :nomeUtente) as username_exists,
                    EXISTS(SELECT 1 FROM Utente WHERE eMail = :eMail) as email_exists
            ");
            $stmt->bindParam(':nomeUtente', $nomeUtente, PDO::PARAM_STR);
            $stmt->bindParam(':eMail', $eMail, PDO::PARAM_STR);
            $stmt->execute();
            $existence = $stmt->fetch(PDO::FETCH_ASSOC); // Recupera i risultati come array associativo.

            // Converte i risultati booleani (0 o 1 dal DB) in veri booleani PHP.
            $usernameExists = (bool)$existence['username_exists'];
            $emailExists = (bool)$existence['email_exists'];

            // Costruisce un messaggio di errore specifico se ci sono conflitti di unicità.
            $errorMessages = [];
            if ($usernameExists) {
                $errorMessages[] = 'Il nome utente scelto è già in uso';
            }
            if ($emailExists) {
                $errorMessages[] = 'L\'indirizzo email fornito è già registrato';
            }

            // Se sono stati trovati conflitti, invia una risposta di errore.
            if (!empty($errorMessages)) {
                http_response_code(409); // Conflict: la richiesta non può essere completata a causa di un conflitto con lo stato corrente della risorsa.
                echo json_encode([
                    'status' => 'error', 
                    'message' => implode('. ', $errorMessages) . '. Si prega di sceglierne altri.'
                ]);
                exit;
            }

            // --- Inserimento Nuovo Utente nel Database ---
            // Se non ci sono conflitti di unicità e i dati sono validi, procedi con l'inserimento.
            $stmt = $pdo->prepare("INSERT INTO Utente (nomeUtente, nome, cognome, eMail) VALUES (:nomeUtente, :nome, :cognome, :eMail)");
            $stmt->bindParam(':nomeUtente', $nomeUtente, PDO::PARAM_STR);
            $stmt->bindParam(':nome', $nome, PDO::PARAM_STR);
            $stmt->bindParam(':cognome', $cognome, PDO::PARAM_STR);
            $stmt->bindParam(':eMail', $eMail, PDO::PARAM_STR);

            // Esegue la query di inserimento.
            if ($stmt->execute()) {
                // Se l'inserimento ha successo.
                http_response_code(201); // Created: la risorsa (utente) è stata creata con successo.
                echo json_encode([
                    'status' => 'success', 
                    'message' => 'Utente registrato con successo.'
                ]);
            } else {
                // Errore generico se $stmt->execute() restituisce false, ma non lancia una PDOException.
                // Questo scenario è meno comune ma possibile.
                http_response_code(500); // Internal Server Error
                // Logga l'errore lato server per debug.
                error_log('API User (user.php): Errore durante l\'inserimento nel database. L\'execute() ha restituito false.');
                echo json_encode([
                    'status' => 'error', 
                    'message' => 'Si è verificato un errore durante la registrazione. Riprova.'
                ]);
            }
        } catch (PDOException $e) {
            // Gestione specifica per errori PDO (es. problemi di connessione, query SQL errate, violazioni di vincoli non gestite prima).
            http_response_code(500); // Internal Server Error
            // Logga i dettagli dell'eccezione PDO per il debug.
            error_log('API User (user.php) - PDOException: ' . $e->getMessage() . "\n" . $e->getTraceAsString());
            echo json_encode([
                'status' => 'error', 
                'message' => 'Errore del database durante la registrazione. Riprova più tardi.'
            ]);
        }
        break; // Fine del case 'POST'
        
    default:
        // Gestisce qualsiasi metodo HTTP non esplicitamente supportato da questo endpoint.
        http_response_code(405); // Method Not Allowed
        echo json_encode([
            'status' => 'error', 
            'message' => 'Metodo HTTP non consentito per questa risorsa.'
        ]);
        break;
}
?>