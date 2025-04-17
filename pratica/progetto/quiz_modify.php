<?php
session_start();
require_once 'config/database.php'; // Assicurati di includere la tua connessione PDO ($pdo)

// --- Autenticazione ---
if (!isset($_SESSION['user'])) {
    header('Location: login.php'); // O mostra un messaggio di errore
    exit;
}
$nomeUtente = $_SESSION['user']['nomeUtente']; // Assumi che l'utente sia memorizzato qui

// --- Recupero ID Quiz ---
if (!isset($_GET['id']) || !filter_var($_GET['id'], FILTER_VALIDATE_INT)) {
    die("ID Quiz non valido o mancante.");
}
$quizId = (int) $_GET['id'];

// --- Fetch Dati Quiz, Domande, Risposte ---
try {
    // Verifica proprietà e recupera dettagli quiz
    $sqlQuiz = "SELECT codice, titolo, dataInizio, dataFine FROM Quiz WHERE codice = :quizId AND creatore = :nomeUtente";
    $stmtQuiz = $pdo->prepare($sqlQuiz);
    $stmtQuiz->bindParam(':quizId', $quizId, PDO::PARAM_INT);
    $stmtQuiz->bindParam(':nomeUtente', $nomeUtente, PDO::PARAM_STR);
    $stmtQuiz->execute();
    $quiz = $stmtQuiz->fetch(PDO::FETCH_ASSOC);

    if (!$quiz) {
        die("Quiz non trovato o non autorizzato a modificarlo.");
    }

    // Recupera Domande
    $sqlDomande = "SELECT numero, testo FROM Domanda WHERE quiz = :quizId ORDER BY numero ASC";
    $stmtDomande = $pdo->prepare($sqlDomande);
    $stmtDomande->bindParam(':quizId', $quizId, PDO::PARAM_INT);
    $stmtDomande->execute();
    $domande = $stmtDomande->fetchAll(PDO::FETCH_ASSOC);

    // Recupera Risposte (raggruppate per domanda)
    $sqlRisposte = "SELECT domanda, numero, testo, tipo, punteggio FROM Risposta WHERE quiz = :quizId ORDER BY domanda ASC, numero ASC";
    $stmtRisposte = $pdo->prepare($sqlRisposte);
    $stmtRisposte->bindParam(':quizId', $quizId, PDO::PARAM_INT);
    $stmtRisposte->execute();
    $risposteRaw = $stmtRisposte->fetchAll(PDO::FETCH_ASSOC);

    // Organizza le risposte per domanda
    $risposteOrganizzate = [];
    foreach ($risposteRaw as $risposta) {
        $risposteOrganizzate[$risposta['domanda']][] = $risposta;
    }

} catch (PDOException $e) {
    die("Errore Database: " . $e->getMessage()); // Mostra un errore generico in produzione
}

?>
<!DOCTYPE html>
<html lang="it">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src='assets/js/edit_quiz_script.js'></script>
    <title>Modifica Quiz - <?php echo htmlspecialchars($quiz['titolo']); ?></title>
    <style>
        /* Aggiungi un po' di stile base */
        body {
            font-family: sans-serif;
        }

        .question-block,
        .answer-block {
            border: 1px solid #ccc;
            padding: 15px;
            margin-bottom: 15px;
            background-color: #f9f9f9;
        }

        .question-block {
            border-color: #aaa;
        }

        .answer-block {
            margin-left: 20px;
            background-color: #eef;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="date"],
        textarea {
            width: 95%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
        }

        textarea {
            min-height: 60px;
        }

        button {
            padding: 8px 15px;
            margin: 5px;
            cursor: pointer;
        }

        .remove-btn {
            background-color: #f44336;
            color: white;
            border: none;
        }

        .add-btn {
            background-color: #4CAF50;
            color: white;
            border: none;
        }

        .submit-btn {
            background-color: #008CBA;
            color: white;
            border: none;
            font-size: 1.1em;
        }

        .risposta-corretta label {
            display: inline-block;
            margin-right: 10px;
        }

        /* Stile per radio button */
        .error-message {
            color: red;
            font-weight: bold;
            margin-top: 15px;
        }

        .success-message {
            color: green;
            font-weight: bold;
            margin-top: 15px;
        }
    </style>
</head>

<body>

    <h1>Modifica Quiz: <?php echo htmlspecialchars($quiz['titolo']); ?></h1>

    <form id="edit-quiz-form">
        <input type="hidden" name="quiz_id" value="<?php echo $quiz['codice']; ?>">

        <fieldset>
            <legend>Dettagli Quiz</legend>
            <div>
                <label for="titolo">Titolo:</label>
                <input type="text" id="titolo" name="titolo" value="<?php echo htmlspecialchars($quiz['titolo']); ?>"
                    required>
            </div>
            <div>
                <label for="dataInizio">Data Inizio:</label>
                <input type="date" id="dataInizio" name="dataInizio"
                    value="<?php echo htmlspecialchars($quiz['dataInizio']); ?>" required>
            </div>
            <div>
                <label for="dataFine">Data Fine:</label>
                <input type="date" id="dataFine" name="dataFine"
                    value="<?php echo htmlspecialchars($quiz['dataFine']); ?>" required>
            </div>
        </fieldset>

        <fieldset>
            <legend>Domande e Risposte</legend>
            <div id="questions-container">
                <?php foreach ($domande as $indexDomanda => $domanda): ?>
                    <div class="question-block" data-question-index="<?php echo $indexDomanda; ?>">
                        <input type="hidden" name="questions[<?php echo $indexDomanda; ?>][original_numero]"
                            value="<?php echo $domanda['numero']; ?>">
                        <h4>Domanda <?php echo $indexDomanda + 1; ?></h4>
                        <button type="button" class="remove-btn remove-question-btn">Rimuovi Domanda</button>
                        <div>
                            <label>Testo Domanda:</label>
                            <textarea name="questions[<?php echo $indexDomanda; ?>][testo]"
                                required><?php echo htmlspecialchars($domanda['testo']); ?></textarea>
                        </div>

                        <div class="answers-container">
                            <h5>Risposte:</h5>
                            <?php if (isset($risposteOrganizzate[$domanda['numero']])): ?>
                                <?php foreach ($risposteOrganizzate[$domanda['numero']] as $indexRisposta => $risposta): ?>
                                    <div class="answer-block" data-answer-index="<?php echo $indexRisposta; ?>">
                                        <input type="hidden"
                                            name="questions[<?php echo $indexDomanda; ?>][answers][<?php echo $indexRisposta; ?>][original_numero]"
                                            value="<?php echo $risposta['numero']; ?>">
                                        <h6>Risposta <?php echo $indexRisposta + 1; ?></h6>
                                        <button type="button" class="remove-btn remove-answer-btn">Rimuovi Risposta</button>
                                        <div>
                                            <label>Testo Risposta:</label>
                                            <textarea
                                                name="questions[<?php echo $indexDomanda; ?>][answers][<?php echo $indexRisposta; ?>][testo]"
                                                required><?php echo htmlspecialchars($risposta['testo']); ?></textarea>
                                        </div>
                                        <div>
                                            <label>Punteggio:</label>
                                            <input type="number"
                                                name="questions[<?php echo $indexDomanda; ?>][answers][<?php echo $indexRisposta; ?>][punteggio]"
                                                value="<?php echo htmlspecialchars($risposta['punteggio'] ?? 0); ?>" required>
                                        </div>
                                        <div class="risposta-corretta">
                                            <label>Tipo:</label>
                                            <label>
                                                <input type="radio"
                                                    name="questions[<?php echo $indexDomanda; ?>][answers][<?php echo $indexRisposta; ?>][tipo]"
                                                    value="Corretta" <?php echo ($risposta['tipo'] == 'Corretta') ? 'checked' : ''; ?>
                                                    required>
                                                Corretta
                                            </label>
                                            <label>
                                                <input type="radio"
                                                    name="questions[<?php echo $indexDomanda; ?>][answers][<?php echo $indexRisposta; ?>][tipo]"
                                                    value="Sbagliata" <?php echo ($risposta['tipo'] == 'Sbagliata') ? 'checked' : ''; ?> required>
                                                Sbagliata
                                            </label>
                                        </div>
                                    </div>
                                <?php endforeach; ?>
                            <?php endif; ?>
                        </div>
                        <button type="button" class="add-btn add-answer-btn">Aggiungi Risposta a questa Domanda</button>
                        <hr>
                    </div>
                <?php endforeach; ?>
            </div>
            <button type="button" id="add-question-btn" class="add-btn">Aggiungi Nuova Domanda</button>
        </fieldset>

        <div id="form-messages"></div>
        <button type="submit" class="submit-btn">Salva Modifiche al Quiz</button>

    </form>

    <!-- Template per Nuova Domanda (nascosto) -->
    <template id="question-template">
        <div class="question-block" data-question-index="__Q_INDEX__">
            <!-- Non c'è original_numero per le nuove domande -->
            <h4>Domanda __Q_DISPLAY_NUM__</h4>
            <button type="button" class="remove-btn remove-question-btn">Rimuovi Domanda</button>
            <div>
                <label>Testo Domanda:</label>
                <textarea name="questions[__Q_INDEX__][testo]" required></textarea>
            </div>
            <div class="answers-container">
                <h5>Risposte:</h5>
                <!-- Le risposte verranno aggiunte qui -->
            </div>
            <button type="button" class="add-btn add-answer-btn">Aggiungi Risposta a questa Domanda</button>
            <hr>
        </div>
    </template>

    <!-- Template per Nuova Risposta (nascosto) -->
    <template id="answer-template">
        <div class="answer-block" data-answer-index="__A_INDEX__">
            <!-- Non c'è original_numero per le nuove risposte -->
            <h6>Risposta __A_DISPLAY_NUM__</h6>
            <button type="button" class="remove-btn remove-answer-btn">Rimuovi Risposta</button>
            <div>
                <label>Testo Risposta:</label>
                <textarea name="questions[__Q_INDEX__][answers][__A_INDEX__][testo]" required></textarea>
            </div>
            <div>
                <label>Punteggio:</label>
                <input type="number" name="questions[__Q_INDEX__][answers][__A_INDEX__][punteggio]" value="0" required>
            </div>
            <div class="risposta-corretta">
                <label>Tipo:</label>
                <label>
                    <input type="radio" name="questions[__Q_INDEX__][answers][__A_INDEX__][tipo]" value="Corretta"
                        required>
                    Corretta
                </label>
                <label>
                    <input type="radio" name="questions[__Q_INDEX__][answers][__A_INDEX__][tipo]" value="Sbagliata"
                        checked required> <!-- Default Sbagliata -->
                    Sbagliata
                </label>
            </div>
        </div>
    </template>

    <script src="js/edit_quiz_script.js"></script> <!-- Assicurati che il percorso sia corretto -->

</body>

</html>