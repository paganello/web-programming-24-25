<?php
/**
 * API per la gestione dell'aggiunta di domande e relative risposte ai quiz.
 *
 * Questo script è dedicato alla creazione di nuove domande e delle loro risposte associate
 * per un quiz esistente. Implementa controlli di autenticazione per verificare
 * che l'utente sia loggato e di autorizzazione per assicurare che l'utente
 * sia il proprietario del quiz a cui sta tentando di aggiungere contenuto.
 * Le risposte sono fornite in formato JSON.
 */

// --- Inizializzazione della sessione e configurazione ---
if (session_status() === PHP_SESSION_NONE) {
    session_start(); // Avvia la sessione PHP se non è già attiva
}

require_once '../config/database.php'; // Include il file di configurazione per la connessione al database
header('Content-Type: application/json'); // Imposta l'header per indicare che le risposte saranno sempre in formato JSON

// Ottiene il metodo HTTP utilizzato per la richiesta
$method = $_SERVER['REQUEST_METHOD'];

// --- Funzioni di Utilità ---

/**
 * Verifica se l'utente corrente è autenticato.
 *
 * Controlla la presenza dell'array 'user' nella sessione, indicando
 * un utente loggato.
 *
 * @return bool True se l'utente è autenticato, false altrimenti.
 */
function isAuthenticated()
{
    return isset($_SESSION['user']); // La presenza di $_SESSION['user'] indica un utente autenticato
}

/**
 * Verifica se l'utente specificato è il creatore (proprietario) del quiz.
 *
 * Esegue una query per confrontare il nome utente fornito con il campo 'creatore'
 * del quiz identificato dall'ID.
 *
 * @param PDO $pdo L'oggetto PDO per la connessione al database.
 * @param int $idQuiz L'ID del quiz (Quiz.codice).
 * @param string $nomeUtente Il nome utente da verificare.
 * @return bool True se l'utente è il proprietario del quiz, false altrimenti.
 */
function isOwnerOfQuiz($pdo, $idQuiz, $nomeUtente)
{
    $stmt = $pdo->prepare("SELECT codice FROM Quiz WHERE codice = :idQuiz AND creatore = :nomeUtente");
    $stmt->bindParam(':idQuiz', $idQuiz, PDO::PARAM_INT);
    $stmt->bindParam(':nomeUtente', $nomeUtente, PDO::PARAM_STR);
    $stmt->execute();
    return $stmt->rowCount() > 0; // Se restituisce almeno una riga, l'utente è il proprietario
}

// --- Gestione delle Richieste API basata sul Metodo HTTP ---
switch ($method) {
    case 'POST':
        // --- Logica per la creazione di domande e risposte (Metodo POST) ---

        // Verifica preliminare: l'utente deve essere autenticato per procedere.
        if (!isAuthenticated()) {
            http_response_code(401); // Unauthorized
            echo json_encode(['status' => 'error', 'message' => 'Non autenticato. Effettua il login per continuare.']);
            exit;
        }

        // Recupera i dati inviati tramite POST (tipicamente da un form).
        $data = $_POST;

        // --- Validazione dell'input di base ---
        // Verifica la presenza e la non nullità dell'ID del quiz.
        if (!isset($data['quiz_id']) || empty($data['quiz_id'])) {
            http_response_code(400); // Bad Request
            echo json_encode(['status' => 'error', 'message' => 'ID del quiz (quiz_id) mancante o non valido.']);
            exit;
        }
        // Verifica la presenza, il tipo (array) e la non nullità dell'array delle domande.
        if (!isset($data['questions']) || !is_array($data['questions']) || empty($data['questions'])) {
            http_response_code(400); // Bad Request
            echo json_encode(['status' => 'error', 'message' => 'Nessuna domanda fornita o formato dati non valido. L\'array "questions" è richiesto.']);
            exit;
        }

        // Validazione specifica dell'ID del quiz: deve essere un intero.
        $idQuizCorrente = filter_var($data['quiz_id'], FILTER_VALIDATE_INT);
        if ($idQuizCorrente === false) {
            http_response_code(400); // Bad Request
            echo json_encode(['status' => 'error', 'message' => 'ID del quiz (quiz_id) non è un numero intero valido.']);
            exit;
        }

        $questions_array_from_form = $data['questions']; // Array delle domande dal payload
        $nomeUtenteLoggato = $_SESSION['user']['nomeUtente']; // Nome utente dell'utente autenticato

        // --- Controllo di Autorizzazione ---
        // Verifica se l'utente loggato è effettivamente il proprietario del quiz specificato.
        if (!isOwnerOfQuiz($pdo, $idQuizCorrente, $nomeUtenteLoggato)) {
            http_response_code(403); // Forbidden
            echo json_encode(['status' => 'error', 'message' => 'Non sei autorizzato ad aggiungere domande a questo quiz.']);
            exit;
        }

        try {
            // --- Elaborazione e Inserimento Dati ---
            $pdo->beginTransaction(); // Avvia una transazione per garantire l'atomicità degli inserimenti.
                                      // Tutte le domande e risposte vengono salvate o nessuna.

            $numeroDomandaProgressivo = 1; // Contatore per assegnare il numero progressivo alle domande

            // Itera su ciascuna domanda fornita nel payload.
            foreach ($questions_array_from_form as $question_data) {
                // Validazione del testo della domanda: non deve essere vuoto.
                if (!isset($question_data['text']) || trim($question_data['text']) === '') {
                    throw new Exception("Il testo per la domanda #$numeroDomandaProgressivo non può essere vuoto.");
                }
                // Validazione delle risposte associate: devono esistere, essere un array e non vuote.
                if (!isset($question_data['answers']) || !is_array($question_data['answers']) || empty($question_data['answers'])) {
                    throw new Exception("La domanda #$numeroDomandaProgressivo non ha risposte definite.");
                }

                $testoDomanda = trim($question_data['text']); // Rimuove spazi bianchi iniziali e finali

                // Prepara e esegue l'inserimento della domanda nel database.
                $stmtDomanda = $pdo->prepare("INSERT INTO Domanda (quiz, numero, testo) VALUES (:quiz_fk, :numero_dom, :testo_dom)");
                $stmtDomanda->bindParam(':quiz_fk', $idQuizCorrente, PDO::PARAM_INT);
                $stmtDomanda->bindParam(':numero_dom', $numeroDomandaProgressivo, PDO::PARAM_INT);
                $stmtDomanda->bindParam(':testo_dom', $testoDomanda, PDO::PARAM_STR);

                if (!$stmtDomanda->execute()) {
                    // Se l'inserimento fallisce, lancia un'eccezione per triggerare il rollback.
                    throw new Exception("Errore durante l'inserimento della domanda #$numeroDomandaProgressivo: " . implode(" ", $stmtDomanda->errorInfo()));
                }

                $numeroRispostaProgressivo = 1; // Contatore per il numero progressivo delle risposte per la domanda corrente
                $almenoUnaCorrettaTrovata = false; // Flag per verificare la presenza di almeno una risposta corretta

                // Itera su ciascuna risposta associata alla domanda corrente.
                foreach ($question_data['answers'] as $answer_data) {
                    // Validazione del testo della risposta: non deve essere vuoto.
                    if (!isset($answer_data['text']) || trim($answer_data['text']) === '') {
                        throw new Exception("Il testo per la risposta #$numeroRispostaProgressivo della domanda #$numeroDomandaProgressivo non può essere vuoto.");
                    }
                    // Validazione del tipo di risposta: deve essere 'Corretta' o 'Sbagliata'.
                    if (!isset($answer_data['type']) || !in_array($answer_data['type'], ['Corretta', 'Sbagliata'])) {
                        throw new Exception("Tipo non valido ('" . htmlspecialchars($answer_data['type'] ?? 'NULL') . "') per la risposta #$numeroRispostaProgressivo della domanda #$numeroDomandaProgressivo.");
                    }

                    $testoRisposta = trim($answer_data['text']);
                    $tipoRisposta = $answer_data['type'];

                    // Calcolo del punteggio per la risposta.
                    // Se corretta e con punti specificati (numerici e >=0), usa quel valore.
                    // Se corretta e senza punti validi, default a 1.
                    // Se sbagliata, default a 0.
                    $punti = 0;
                    if ($tipoRisposta === 'Corretta') {
                        if (isset($answer_data['points']) && is_numeric($answer_data['points']) && (int)$answer_data['points'] >= 0) {
                            $punti = (int)$answer_data['points'];
                        } else {
                            $punti = 1; // Punteggio di default per risposte corrette se non specificato o non valido
                        }
                        $almenoUnaCorrettaTrovata = true; // Segna che è stata trovata almeno una risposta corretta
                    }

                    // Prepara e esegue l'inserimento della risposta nel database.
                    $stmtRisposta = $pdo->prepare("
                        INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) 
                        VALUES (:quiz_fk_risp, :domanda_fk_risp, :numero_risp, :testo_risp, :tipo_risp, :punteggio_risp)
                    ");
                    $stmtRisposta->bindParam(':quiz_fk_risp', $idQuizCorrente, PDO::PARAM_INT);
                    $stmtRisposta->bindParam(':domanda_fk_risp', $numeroDomandaProgressivo, PDO::PARAM_INT); // Numero della domanda a cui questa risposta appartiene
                    $stmtRisposta->bindParam(':numero_risp', $numeroRispostaProgressivo, PDO::PARAM_INT);
                    $stmtRisposta->bindParam(':testo_risp', $testoRisposta, PDO::PARAM_STR);
                    $stmtRisposta->bindParam(':tipo_risp', $tipoRisposta, PDO::PARAM_STR);
                    $stmtRisposta->bindParam(':punteggio_risp', $punti, PDO::PARAM_INT);

                    if (!$stmtRisposta->execute()) {
                        // Se l'inserimento fallisce, lancia un'eccezione.
                        throw new Exception("Errore durante l'inserimento della risposta #$numeroRispostaProgressivo per la domanda #$numeroDomandaProgressivo: " . implode(" ", $stmtRisposta->errorInfo()));
                    }
                    $numeroRispostaProgressivo++; // Incrementa il contatore per la prossima risposta
                }

                // Validazione cruciale: ogni domanda deve avere almeno una risposta marcata come 'Corretta'.
                if (!$almenoUnaCorrettaTrovata) {
                    throw new Exception("La domanda #$numeroDomandaProgressivo deve avere almeno una risposta contrassegnata come 'Corretta'.");
                }

                $numeroDomandaProgressivo++; // Incrementa il contatore per la prossima domanda
            }

            // Se tutte le operazioni sono state eseguite con successo, conferma la transazione.
            $pdo->commit();
            http_response_code(201); // Created
            echo json_encode(['status' => 'success', 'message' => 'Domande e risposte salvate con successo.']);

        } catch (Exception $e) {
            // In caso di qualsiasi eccezione durante il processo:
            // 1. Esegue il rollback della transazione se è ancora attiva.
            if ($pdo->inTransaction()) {
                $pdo->rollBack();
            }
            // 2. Imposta un codice di errore HTTP (genericamente 500, ma potrebbe essere 400 per errori di validazione).
            //    Qui si usa 500 perché l'eccezione può derivare da errori DB o validazioni che causano l'interruzione.
            //    Se l'eccezione è per dati utente errati (es. testo mancante), un 400 sarebbe più appropriato
            //    ma la gestione attuale delle eccezioni le raggruppa.
            http_response_code(500); // Internal Server Error (o 400 Bad Request se l'eccezione è dovuta a dati utente)

            // 3. Logga l'errore dettagliato per scopi di debug (non visibile all'utente finale).
            error_log("ERRORE API SALVATAGGIO DOMANDE (questions.php): " . $e->getMessage() . " | Dati Ricevuti: " . print_r($data, true));
            // 4. Invia una risposta JSON con il messaggio di errore.
            echo json_encode(['status' => 'error', 'message' => "Errore del server durante il salvataggio: " . $e->getMessage()]);
        }
        break;

    default:
        // Gestione di metodi HTTP non supportati (es. GET, PUT, DELETE).
        http_response_code(405); // Method Not Allowed
        echo json_encode(['status' => 'error', 'message' => 'Metodo non consentito. Utilizzare POST per aggiungere domande.']);
        exit;
}
?>