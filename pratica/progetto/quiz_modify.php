<?php

/**
 * Pagina di modifica quiz.
 * 
 * Questa pagina permette all'utente di modificare un quiz esistente.
 */

include "includes/header.php";
require_once 'config/database.php';

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// --- Controllo accesso ---
$nomeUtente = $_SESSION['user']['nomeUtente'];
if (!isset($nomeUtente)) {
    header('Location: auth_login.php');
    echo "<p>Devi effettuare l'accesso per vedere i tuoi quiz.</p>";
    include 'includes/footer.php';
    exit;
}

// --- Recupero ID Quiz ---
if (!isset($_GET['id']) || !filter_var($_GET['id'], FILTER_VALIDATE_INT)) {
    die("ID Quiz non valido o mancante.");
}
$quizId = (int) $_GET['id'];

// --- Fetch Dati Quiz, Domande, Risposte ---
try {
    // Verifica proprietà e recupera dettagli quiz.
    $sqlQuiz = "SELECT codice, titolo, dataInizio, dataFine FROM Quiz WHERE codice = :quizId AND creatore = :nomeUtente";
    $stmtQuiz = $pdo->prepare($sqlQuiz);
    $stmtQuiz->bindParam(':quizId', $quizId, PDO::PARAM_INT);
    $stmtQuiz->bindParam(':nomeUtente', $nomeUtente, PDO::PARAM_STR);
    $stmtQuiz->execute();
    $quiz = $stmtQuiz->fetch(PDO::FETCH_ASSOC);

    if (!$quiz) {
        die("Quiz non trovato o non autorizzato a modificarlo.");
    }

    // Recupera Domande.
    $sqlDomande = "SELECT numero, testo FROM Domanda WHERE quiz = :quizId ORDER BY numero ASC";
    $stmtDomande = $pdo->prepare($sqlDomande);
    $stmtDomande->bindParam(':quizId', $quizId, PDO::PARAM_INT);
    $stmtDomande->execute();
    $domande = $stmtDomande->fetchAll(PDO::FETCH_ASSOC);

    // Recupera Risposte (raggruppate per domanda).
    $sqlRisposte = "SELECT domanda, numero, testo, tipo, punteggio FROM Risposta WHERE quiz = :quizId ORDER BY domanda ASC, numero ASC";
    $stmtRisposte = $pdo->prepare($sqlRisposte);
    $stmtRisposte->bindParam(':quizId', $quizId, PDO::PARAM_INT);
    $stmtRisposte->execute();
    $risposteRaw = $stmtRisposte->fetchAll(PDO::FETCH_ASSOC);

    // Organizza le risposte per domanda.
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
    <script src='assets/js/main.js'></script>
    <title>Modifica Quiz - <?php echo htmlspecialchars($quiz['titolo']); ?></title>
</head>

<body>

    <h1>Modifica Quiz: <?php echo htmlspecialchars($quiz['titolo']); ?></h1><br>

    <form id="edit-quiz-form">
        <input type="hidden" name="quiz_id" value="<?php echo $quiz['codice']; ?>">

        <div>
            <label class="bold" for="titolo">Titolo:</label>
            <input type="text" id="titolo" name="titolo" value="<?php echo htmlspecialchars($quiz['titolo']); ?>"
                required>
        </div>
        <div>
            <label class="bold" for="dataInizio">Data Inizio:</label>
            <input type="date" id="dataInizio" name="dataInizio"
                value="<?php echo htmlspecialchars($quiz['dataInizio']); ?>" required>
        </div>
        <div>
            <label class="bold" for="dataFine">Data Fine:</label>
            <input type="date" id="dataFine" name="dataFine" value="<?php echo htmlspecialchars($quiz['dataFine']); ?>"
                required>
        </div>

        <br>
        <div id="questions-container">
            <?php foreach ($domande as $indexDomanda => $domanda): ?>
                <div class="question-block" data-question-index="<?php echo $indexDomanda; ?>">
                    <input type="hidden" name="questions[<?php echo $indexDomanda; ?>][original_numero]"
                        value="<?php echo $domanda['numero']; ?>">
                    <h2>Domanda <?php echo $indexDomanda + 1; ?></h2>
                    <div>
                        <textarea class="textarea" name="questions[<?php echo $indexDomanda; ?>][testo]"
                            required><?php echo htmlspecialchars($domanda['testo']); ?></textarea>
                    </div>
                    <button type="button" class="remove-question-btn">Rimuovi Domanda</button>


                    <div class="answers-container">
                        <?php if (isset($risposteOrganizzate[$domanda['numero']])): ?>

                            <?php foreach ($risposteOrganizzate[$domanda['numero']] as $indexRisposta => $risposta): ?>

                                <div class="answer-block div" data-answer-index="<?php echo $indexRisposta; ?>">
                                    <input type="hidden"
                                        name="questions[<?php echo $indexDomanda; ?>][answers][<?php echo $indexRisposta; ?>][original_numero]"
                                        value="<?php echo $risposta['numero']; ?>">
                                    <h3>Risposta <?php echo $indexRisposta + 1; ?></h3>
                                    <div>
                                        <textarea class="textarea"
                                            name="questions[<?php echo $indexDomanda; ?>][answers][<?php echo $indexRisposta; ?>][testo]"
                                            required><?php echo htmlspecialchars($risposta['testo']); ?></textarea>
                                    </div>
                                    <button type="button" class="remove-answer-btn">Rimuovi Risposta</button>

                                    <div>
                                        <label>Punteggio:
                                            <input type="number"
                                                name="questions[<?php echo $indexDomanda; ?>][answers][<?php echo $indexRisposta; ?>][punteggio]"
                                                value="<?php echo htmlspecialchars($risposta['punteggio'] ?? 0); ?>" required>
                                        </label>
                                    </div>
                                    <div class="risposta-corretta">
                                        <label>
                                            Tipo:
                                            <input type="radio"
                                                name="questions[<?php echo $indexDomanda; ?>][answers][<?php echo $indexRisposta; ?>][tipo]"
                                                value="Corretta" <?php echo ($risposta['tipo'] == 'Corretta') ? 'checked' : ''; ?>
                                                required>
                                            Corretta
                                            <input type="radio"
                                                name="questions[<?php echo $indexDomanda; ?>][answers][<?php echo $indexRisposta; ?>][tipo]"
                                                value="Sbagliata" <?php echo ($risposta['tipo'] == 'Sbagliata') ? 'checked' : ''; ?>
                                                required>
                                            Sbagliata
                                        </label>
                                    </div>
                                </div>
                            <?php endforeach; ?>
                        <?php endif; ?>
                    </div>
                    <br>
                    <button type="button" class="add-btn add-answer-btn">Aggiungi Risposta a questa Domanda</button>
                    <br>
                </div>
                <br>
            <?php endforeach; ?>
        </div>
        <button type="button" id="add-question-btn" class="add-btn">Aggiungi Nuova Domanda</button>

        <div id="form-messages"></div>
        <br>
        <button type="submit" class="submit-btn">Salva Modifiche al Quiz</button>

    </form>

    <!-- Template per Nuova Domanda (nascosto) -->
    <template id="question-template">
        <div class="question-block" data-question-index="__Q_INDEX__">
            <!-- Non c'è original_numero per le nuove domande -->
            <h2>Domanda __Q_DISPLAY_NUM__</h2>
            <div>
                <textarea class="textarea" name="questions[__Q_INDEX__][testo]" required></textarea>
            </div>
            <button type="button" class="remove-btn remove-question-btn">Rimuovi Domanda</button>

            <div class="answers-container">
                <!-- Le risposte verranno aggiunte qui -->
            </div>
            <br>
            <button type="button" class="add-btn add-answer-btn">Aggiungi Risposta a questa Domanda</button>
            <br>
        </div>
    </template>

    <!-- Template per Nuova Risposta (nascosto) -->
    <template id="answer-template">
        <div class="answer-block div" data-answer-index="__A_INDEX__">
            <h3>Risposta __A_DISPLAY_NUM__</h3>
            <div>
                <textarea class="textarea"name="questions[__Q_INDEX__][answers][__A_INDEX__][testo]" required></textarea>
            </div>
            <button type="button" class="remove-btn remove-answer-btn">Rimuovi Risposta</button>
            <div>
                <label>Punteggio:
                    <input type="number" name="questions[__Q_INDEX__][answers][__A_INDEX__][punteggio]" value="0"
                        required>
                </label>
            </div>
            <div class="risposta-corretta">
                <label>
                    Tipo:
                    <input type="radio" name="questions[__Q_INDEX__][answers][__A_INDEX__][tipo]" value="Corretta"
                        required>
                    Corretta
                    <input type="radio" name="questions[__Q_INDEX__][answers][__A_INDEX__][tipo]" value="Sbagliata"
                        checked required> <!-- Default Sbagliata -->
                    Sbagliata
                </label>
            </div>
        </div>
    </template>
</body>
<?php include 'includes/footer.php'; ?>
</html>