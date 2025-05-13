<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
header('Content-Type: application/json');

// Assicurati che il percorso a database.php sia corretto
// Se api/ è una sottocartella, e config/ è un'altra sottocartella della root:
require_once '../config/database.php';


if (!isset($_SESSION['user']['nomeUtente'])) {
    echo json_encode(['status' => 'error', 'message' => 'Utente non autenticato. Accesso negato.']);
    http_response_code(401);
    exit();
}

$nomeUtente = $_SESSION['user']['nomeUtente'];
$action = isset($_GET['action']) ? $_GET['action'] : (isset($_POST['action']) ? $_POST['action'] : null);

if ($_SERVER['REQUEST_METHOD'] === 'POST' && $action === 'submit') {
    // --- LOGICA PER SALVARE UNA NUOVA PARTECIPAZIONE ---
    $quizId = isset($_POST['idQuiz']) ? (int)$_POST['idQuiz'] : null; // Nome del campo hidden nel form
    // Le risposte sono inviate come answers[numero_domanda_originale][] = valore_risposta_originale
    // Ma nel tuo HTML hai: value="<?php $j++; echo $i;" che non sembra corretto.
    // Il value dovrebbe essere il 'numero' della Risposta (Risposta.numero)
    // Il name dovrebbe essere 'answers[numero_domanda_originale]' (se è una sola scelta, radio)
    // o 'answers[numero_domanda_originale][]' (se sono checkbox, scelte multiple)

    // Modifichiamo la ricezione delle risposte basandoci sulla struttura del tuo form
    // name="answers[<?php echo $question['numero'];][]"
    // value="<?php $j++; echo $i; " <-- Questo 'i' è l'indice visualizzato della domanda, NON l'ID/numero della risposta
    // Dovresti usare $answer['numero'] come value: value="<?php echo $answer['numero']; "

    // Assumendo che il value delle checkbox sia l'ID/numero della risposta
    $risposteUtenteRaw = isset($_POST['answers']) && is_array($_POST['answers']) ? $_POST['answers'] : [];
    $risposteUtenteProcessed = [];

    foreach($risposteUtenteRaw as $questionNumber => $selectedAnswersArray) {
        if (is_array($selectedAnswersArray)) {
            foreach($selectedAnswersArray as $answerNumber) {
                // Per ogni checkbox selezionata per una domanda
                $risposteUtenteProcessed[] = [
                    'domanda_numero' => (int)$questionNumber,
                    'risposta_numero' => (int)$answerNumber
                ];
            }
        } else { // Nel caso fosse un radio button o un singolo valore non array
             $risposteUtenteProcessed[] = [
                'domanda_numero' => (int)$questionNumber,
                'risposta_numero' => (int)$selectedAnswersArray
            ];
        }
    }


    $response = ['status' => 'error', 'message' => 'Errore sconosciuto.'];

    if (empty($quizId)) {
        $response['message'] = 'ID del quiz mancante.';
        http_response_code(400);
        echo json_encode($response);
        exit();
    }
    // Non è necessario controllare empty($risposteUtenteProcessed) qui,
    // una partecipazione potrebbe non avere risposte selezionate, anche se raro.

    try {
        $pdo->beginTransaction();

        $quiz_check_sql = "SELECT codice, dataFine FROM Quiz WHERE codice = :quizId";
        $quiz_stmt = $pdo->prepare($quiz_check_sql);
        $quiz_stmt->bindParam(':quizId', $quizId, PDO::PARAM_INT);
        $quiz_stmt->execute();
        $quiz_data = $quiz_stmt->fetch(PDO::FETCH_ASSOC);

        if (!$quiz_data) {
            $response['message'] = 'Quiz non trovato.';
            $pdo->rollBack(); http_response_code(404); echo json_encode($response); exit();
        }

        $today = date('Y-m-d');
        if ($quiz_data['dataFine'] < $today) {
            $response['message'] = 'Questo quiz è terminato.';
            $pdo->rollBack(); http_response_code(403); echo json_encode($response); exit();
        }

        $participation_check_sql = "SELECT codice FROM Partecipazione WHERE utente = :nomeUtente AND quiz = :quizId";
        $part_check_stmt = $pdo->prepare($participation_check_sql);
        $part_check_stmt->bindParam(':nomeUtente', $nomeUtente, PDO::PARAM_STR);
        $part_check_stmt->bindParam(':quizId', $quizId, PDO::PARAM_INT);
        $part_check_stmt->execute();
        if ($part_check_stmt->fetch()) {
            $response['message'] = 'Hai già partecipato a questo quiz.';
            $pdo->rollBack(); http_response_code(409); echo json_encode($response); exit();
        }

        $sql_partecipazione = "INSERT INTO Partecipazione (utente, quiz, data) VALUES (:utente, :quiz, CURDATE())";
        $stmt_partecipazione = $pdo->prepare($sql_partecipazione);
        $stmt_partecipazione->bindParam(':utente', $nomeUtente, PDO::PARAM_STR);
        $stmt_partecipazione->bindParam(':quiz', $quizId, PDO::PARAM_INT);
        $stmt_partecipazione->execute();
        $partecipazioneId = $pdo->lastInsertId();

        if (!$partecipazioneId) {
            throw new Exception("Impossibile creare la partecipazione.");
        }

        if (!empty($risposteUtenteProcessed)) {
            $sql_risposta_utente = "INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta)
                                    VALUES (:partecipazione, :quiz, :domanda_numero, :risposta_numero)";
            $stmt_risposta_utente = $pdo->prepare($sql_risposta_utente);

            foreach ($risposteUtenteProcessed as $risposta) {
                $stmt_risposta_utente->bindParam(':partecipazione', $partecipazioneId, PDO::PARAM_INT);
                $stmt_risposta_utente->bindParam(':quiz', $quizId, PDO::PARAM_INT);
                $stmt_risposta_utente->bindParam(':domanda_numero', $risposta['domanda_numero'], PDO::PARAM_INT);
                $stmt_risposta_utente->bindParam(':risposta_numero', $risposta['risposta_numero'], PDO::PARAM_INT);
                
                if (!$stmt_risposta_utente->execute()) {
                    error_log("Errore insert RispostaUtenteQuiz: PID=$partecipazioneId, QID=$quizId, DN=" . $risposta['domanda_numero'] . ", RN=" . $risposta['risposta_numero'] . ". Err: " . implode(":", $stmt_risposta_utente->errorInfo()));
                }
            }
        }

        $pdo->commit();
        $response = [
            'status' => 'success',
            'message' => 'Partecipazione registrata con successo!',
            'partecipazione_id' => $partecipazioneId,
            'redirect_url' => 'quiz_participations.php' // O una pagina di "grazie" / "risultati"
        ];
        http_response_code(201);

    } catch (PDOException $e) {
        if ($pdo->inTransaction()) $pdo->rollBack();
        error_log("Errore PDO submit_participation: " . $e->getMessage());
        $response['message'] = 'Errore DB.'; http_response_code(500);
    } catch (Exception $e) {
        if ($pdo->inTransaction()) $pdo->rollBack();
        error_log("Errore generico submit_participation: " . $e->getMessage());
        $response['message'] = 'Errore server.'; http_response_code(500);
    }
    echo json_encode($response);
    exit();

} elseif ($_SERVER['REQUEST_METHOD'] === 'GET') { // Assumiamo GET per recuperare l'elenco
    // --- LOGICA ESISTENTE PER RECUPERARE L'ELENCO DELLE PARTECIPAZIONI (PAGINATO) ---
    $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
    $per_page = isset($_GET['per_page']) ? (int)$_GET['per_page'] : 10;
    $valid_per_page_options = [5, 10, 20, 50, 100];

    if ($page < 1) $page = 1;
    if (!in_array($per_page, $valid_per_page_options)) $per_page = 10;

    try {
        $count_sql = "SELECT COUNT(*) as total FROM Partecipazione WHERE utente = :nomeUtente";
        $count_stmt = $pdo->prepare($count_sql);
        $count_stmt->bindParam(':nomeUtente', $nomeUtente, PDO::PARAM_STR);
        $count_stmt->execute();
        $total_participations = (int)$count_stmt->fetch(PDO::FETCH_ASSOC)['total'];

        $total_pages = ($total_participations > 0) ? ceil($total_participations / $per_page) : 1;
        if ($page > $total_pages && $total_participations > 0) $page = $total_pages;
        if ($page < 1 && $total_participations > 0) $page = 1;
        elseif ($total_participations === 0) $page = 1;

        $offset = ($page - 1) * $per_page;

        $sql = "SELECT
                    P.codice AS partecipazione_id, Q.titolo AS quiz_titolo, Q.codice AS quiz_id,
                    DATE_FORMAT(P.data, '%d/%m/%Y') AS data_partecipazione,
                    COALESCE(SUM(R.punteggio), 0) AS punteggio_ottenuto,
                    (SELECT COALESCE(SUM(R_total.punteggio), 0)
                     FROM Domanda D_total
                     JOIN Risposta R_total ON D_total.quiz = R_total.quiz AND D_total.numero = R_total.domanda
                     WHERE D_total.quiz = Q.codice AND R_total.tipo = 'Corretta') AS punteggio_massimo_quiz
                FROM Partecipazione P
                JOIN Quiz Q ON P.quiz = Q.codice
                LEFT JOIN RispostaUtenteQuiz RUQ ON P.codice = RUQ.partecipazione
                LEFT JOIN Risposta R ON RUQ.quiz = R.quiz AND RUQ.domanda = R.domanda AND RUQ.risposta = R.numero AND R.tipo = 'Corretta'
                WHERE P.utente = :nomeUtente
                GROUP BY P.codice, Q.titolo, Q.codice, P.data
                ORDER BY P.data DESC, P.codice DESC
                LIMIT :offset, :per_page";

        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':nomeUtente', $nomeUtente, PDO::PARAM_STR);
        $stmt->bindParam(':offset', $offset, PDO::PARAM_INT);
        $stmt->bindParam(':per_page', $per_page, PDO::PARAM_INT);
        $stmt->execute();
        $participations = $stmt->fetchAll(PDO::FETCH_ASSOC);

        $response = [
            'status' => 'success', 'participations' => $participations,
            'pagination' => [
                'currentPage' => $page, 'perPage' => $per_page,
                'totalPages' => $total_pages, 'totalItems' => $total_participations
            ]
        ];
        if (empty($participations) && $total_participations === 0) {
             $response['message'] = 'Nessuna partecipazione trovata.';
        }
    } catch (PDOException $e) {
        error_log("Errore API Partecipazioni (GET): " . $e->getMessage());
        $response = ['status' => 'error', 'message' => 'Errore DB recupero partecipazioni.'];
        http_response_code(500);
    } catch (Exception $e) {
        error_log("Errore API Partecipazioni (GET): " . $e->getMessage());
        $response = ['status' => 'error', 'message' => 'Errore server recupero partecipazioni.'];
        http_response_code(500);
    }
    echo json_encode($response);
    exit();

} else {
    echo json_encode(['status' => 'error', 'message' => 'Azione o metodo non valido.']);
    http_response_code(405); // Method Not Allowed or Bad Request
    exit();
}
?>