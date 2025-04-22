<?php

/**
 * API per la gestione delle domande dei quiz.
 * 
 * Questo file gestisce tutte le operazioni CRUD relative alle domande dei quiz.
 * Funzionalità implementate:
 * - Creazione di nuove domande per un quiz;
 * - Modifica di domande esistenti;
 * - Eliminazione di domande;
 * - Recupero di tutte le domande associate a un quiz specifico;
 * - Recupero dei dettagli di una singola domanda;
 */


// Inizializzazione della sessione se non già avviata.
if (session_status() === PHP_SESSION_NONE){
    session_start();
}

// Include la configurazione del database
require_once '../config/database.php';
header('Content-Type: application/json');
$method = $_SERVER['REQUEST_METHOD'];

// Verifica se l'utente è autenticato.
function isAuthenticated()
{
    return isset($_SESSION['user']);
}

// Funzione per verificare se un quiz appartiene all'utente.
function isOwnerOfQuiz($pdo, $idQuiz, $nomeUtente)
{
    $stmt = $pdo->prepare("SELECT * FROM Quiz WHERE idQuiz = :idQuiz AND nomeUtente = :nomeUtente");
    $stmt->bindParam(':idQuiz', $idQuiz);
    $stmt->bindParam(':nomeUtente', $nomeUtente);
    $stmt->execute();
    return $stmt->rowCount() > 0;
}

// Funzione per verificare se una domanda appartiene a un quiz dell'utente.
function isOwnerOfQuestion($pdo, $idDomanda, $nomeUtente)
{
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

// --- Gestione delle richieste API ---
switch ($method) {

    // --- Recupero delle domande per un quiz specifico ---
    case 'POST':
        if (!isAuthenticated()) {
            http_response_code(401);
            echo json_encode(['status' => 'error', 'message' => 'Non autenticato']);
            break;
        }

        // Recupera i dati dal corpo della richiesta.
        $data = $_POST;
        if (!isset($data['idQuiz']) || !isset($data['questions'])) {
            http_response_code(400);
            echo json_encode(['status' => 'error', 'message' => 'Dati incompleti']);
            break;
        }
        $idQuiz = $data['idQuiz'];
        $questions = $data['questions'];
        $nomeUtente = $_SESSION['user']['nomeUtente'];

        try {
            $pdo->beginTransaction();
            $numeroDomanda = 1;
            foreach ($questions as $question) {
                if (!isset($question['text']) || !isset($question['answers'])) {
                    throw new Exception("Dati incompleti per la domanda");
                }
                $testoDomanda = trim($question['text']);
                // Inserisci la domanda.
                $stmt = $pdo->prepare("INSERT INTO Domanda (quiz, numero, testo) VALUES (:idQuiz, :numero, :testo)");
                $stmt->bindParam(':idQuiz', $idQuiz);
                $stmt->bindParam(':numero', $numeroDomanda);
                $stmt->bindParam(':testo', $testoDomanda);
                if (!$stmt->execute()) {
                    throw new Exception("Errore nell'inserimento della domanda");
                }
                $idDomanda = $pdo->lastInsertId();

                // Inserisci le risposte associate.
                $numeroRisposta = 1;
                foreach ($question['answers'] as $answer) {
                    if (!isset($answer['text']) || !isset($answer['points'])) {
                        throw new Exception("Dati incompleti per la risposta");
                    }
                    $testoRisposta = trim($answer['text']);
                    $punti = (float) $answer['points'];
                    $tipoRisposta = $answer['type'];
                    $stmtRisposta = $pdo->prepare("
                    INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) 
                    VALUES (:idQuiz, :numeroDomanda, :numero, :testo, :tipo, :punteggio)
                ");
                    $stmtRisposta->bindParam(':idQuiz', $idQuiz);
                    $stmtRisposta->bindParam(':numeroDomanda', $numeroDomanda);
                    $stmtRisposta->bindParam(':numero', $numeroRisposta);
                    $stmtRisposta->bindParam(':testo', $testoRisposta);
                    $stmtRisposta->bindParam(':tipo', $tipoRisposta);
                    $stmtRisposta->bindParam(':punteggio', $punti);

                    if (!$stmtRisposta->execute()) {
                        throw new Exception("Errore nell'inserimento della risposta");
                    }
                    $numeroRisposta++;
                }
                $numeroDomanda++;
            }
            $pdo->commit();

            http_response_code(201); // Created.
            echo json_encode([
                'status' => 'success',
                'message' => 'Domande e risposte salvate con successo'
            ]);
        } catch (Exception $e) {
            $pdo->rollBack();
            http_response_code(500);
            echo json_encode(['status' => 'error', 'message' => $e->getMessage()]);
        }
        break;

    default:
        http_response_code(405); // Method Not Allowed.
        echo json_encode(['status' => 'error', 'message' => 'Metodo non consentito']);
}
