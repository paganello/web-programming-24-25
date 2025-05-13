<?php

/**
 * Pagina di visualizzazione dei risultati di un quiz.
 *
 * Questa pagina mostra i risultati di un quiz a cui l'utente ha partecipato.
 */

include 'includes/header.php'; // Assicurati che questo includa il link a style.css e icone se usate
require_once 'config/database.php';

// Controllo se l'utente è loggato.
if (!isset($_SESSION['user']['nomeUtente'])) { // Modificato per coerenza con l'altro file
    header('Location: auth_login.php');
    exit;
}
$nomeUtente = $_SESSION['user']['nomeUtente'];

// Controllo se l'ID della partecipazione è stato fornito.
if (!isset($_GET['participation_id']) || !is_numeric($_GET['participation_id'])) {
    // Potresti voler reindirizzare a quiz_participations.php o mostrare un errore più specifico
    $_SESSION['error_message'] = "ID della partecipazione non specificato o non valido.";
    header('Location: quiz_participations.php'); // Reindirizza all'elenco delle partecipazioni
    exit;
}

// Modifica qui: da 'participation' a 'participation_id'
$participation_id = (int) $_GET['participation_id'];
$user = $_SESSION['user']['nomeUtente'];

try {
    // 1. Verifica proprietà della partecipazione e recupera dettagli quiz
    $sqlParticipation = "SELECT p.codice AS p_codice, p.quiz AS quiz_id, p.data AS data_partecipazione,
                                q.titolo AS quiz_titolo
                         FROM Partecipazione p
                         JOIN Quiz q ON p.quiz = q.codice
                         WHERE p.codice = :participation_id AND p.utente = :nomeUtente";
    $stmtParticipation = $pdo->prepare($sqlParticipation);
    $stmtParticipation->execute(['participation_id' => $participation_id, 'nomeUtente' => $nomeUtente]);
    $participationDetails = $stmtParticipation->fetch(PDO::FETCH_ASSOC);

    if (!$participationDetails) {
        $_SESSION['error_message'] = "Partecipazione non trovata o non autorizzata.";
        header('Location: index.php'); // O dashboard utente
        exit;
    }
    $quiz_id = $participationDetails['quiz_id'];
    $quiz_titolo = $participationDetails['quiz_titolo'];
    $data_partecipazione = $participationDetails['data_partecipazione'];


    // 2. Calcolo del punteggio totale per questa partecipazione
    // Somma i punteggi SOLO delle risposte date dall'utente CHE ERANO CORRETTE.
    $sqlScore = "SELECT SUM(r.punteggio) AS total_score
                 FROM RispostaUtenteQuiz ruq
                 JOIN Risposta r ON ruq.quiz = r.quiz AND ruq.domanda = r.domanda AND ruq.risposta = r.numero
                 WHERE ruq.partecipazione = :participation_id AND r.tipo = 'Corretta'"; // Aggiunto r.tipo = 'Corretta'
    $stmtScore = $pdo->prepare($sqlScore);
    $stmtScore->execute(['participation_id' => $participation_id]);
    $scoreData = $stmtScore->fetch(PDO::FETCH_ASSOC);
    $total_score = $scoreData['total_score'] ?? 0;


    // 3. Recupero di tutte le domande del quiz
    $sqlDomande = "SELECT numero, testo FROM Domanda WHERE quiz = :quiz_id ORDER BY numero ASC";
    $stmtDomande = $pdo->prepare($sqlDomande);
    $stmtDomande->bindParam(':quiz_id', $quiz_id, PDO::PARAM_INT);
    $stmtDomande->execute();
    $domandeQuiz = $stmtDomande->fetchAll(PDO::FETCH_ASSOC);

    if (empty($domandeQuiz)) {
        // Gestisci il caso in cui il quiz non ha domande, anche se improbabile se c'è una partecipazione
    }

    // 4. Recupero di tutte le opzioni di risposta per queste domande
    $sqlOpzioni = "SELECT domanda, numero, testo, tipo, punteggio
                   FROM Risposta
                   WHERE quiz = :quiz_id
                   ORDER BY domanda ASC, numero ASC";
    $stmtOpzioni = $pdo->prepare($sqlOpzioni);
    $stmtOpzioni->bindParam(':quiz_id', $quiz_id, PDO::PARAM_INT);
    $stmtOpzioni->execute();
    $opzioniRaw = $stmtOpzioni->fetchAll(PDO::FETCH_ASSOC);

    $opzioniOrganizzate = [];
    foreach ($opzioniRaw as $opzione) {
        $opzioniOrganizzate[$opzione['domanda']][] = $opzione;
    }

    // 5. Recupero delle risposte date dall'utente in questa partecipazione
    $sqlRisposteUtente = "SELECT domanda, risposta AS numero_risposta_data
                          FROM RispostaUtenteQuiz
                          WHERE partecipazione = :participation_id AND quiz = :quiz_id";
    $stmtRisposteUtente = $pdo->prepare($sqlRisposteUtente);
    $stmtRisposteUtente->execute(['participation_id' => $participation_id, 'quiz_id' => $quiz_id]);
    $risposteDateRaw = $stmtRisposteUtente->fetchAll(PDO::FETCH_ASSOC);

    $risposteDateUtente = []; // Mappa [numero_domanda] => numero_risposta_data
    foreach ($risposteDateRaw as $rdu) {
        $risposteDateUtente[$rdu['domanda']] = $rdu['numero_risposta_data'];
    }


} catch (PDOException $e) {
    // Logga l'errore e mostra un messaggio generico
    error_log("Errore DB in risultati_quiz.php: " . $e->getMessage());
    // Puoi usare una classe .alert dal tuo CSS qui
    die("<div class='container' style='padding-top:20px;'><div class='alert alert-danger'>Errore nel caricamento dei risultati. Riprova più tardi.</div></div>");
}
?>

<div class="main-content">
    <div class="content">
        <h1 style="text-align:center; margin-bottom: 10px; padding-bottom:10px; border-bottom: 1px solid var(--border-color);">
            Risultati Quiz: <?php echo htmlspecialchars($quiz_titolo); ?>
        </h1>

        <div class="card" style="margin-bottom: 25px;">
            <div class="card-content">
                <h2 class="card-title" style="margin-bottom:15px;">Riepilogo Partecipazione</h2>
                <p><strong class="bold">Data partecipazione:</strong> <?php echo htmlspecialchars(date('d/m/Y H:i', strtotime($data_partecipazione))); ?></p>
                <p><strong class="bold">Punteggio totale ottenuto:</strong> <span style="font-size: 1.2em; color: var(--primary-blue); font-weight: bold;"><?php echo $total_score; ?></span> punti</p>
                <hr style="border: 0; border-top: 1px solid var(--border-color); margin: 15px 0;">
                <a href="quiz_view.php?id=<?php echo $quiz_id; ?>" class="btn btn-secondary" style="margin-right:10px;">
                    <?php // <i class="fas fa-eye"></i> ?> Torna alla Scheda Quiz
                </a>
                <a href="index.php" class="btn">
                    <?php // <i class="fas fa-list-alt"></i> ?> Vedi altri Quiz
                </a>
            </div>
        </div>

        <h2 style="margin-top: 30px; margin-bottom: 20px; color: var(--dark-color); font-size:1.6rem; border-bottom: 1px solid var(--border-color); padding-bottom:10px;">
            Le Tue Risposte
        </h2>

        <?php if (empty($domandeQuiz)): ?>
            <div class="no-results">
                <p>Nessuna domanda trovata per questo quiz.</p>
            </div>
        <?php else: ?>
            <?php foreach ($domandeQuiz as $idx => $domanda): ?>
                <div class="card" style="margin-bottom: 20px;"> <!-- Blocco per ogni domanda -->
                    <div class="card-content">
                        <h3 class="card-title" style="font-size: 1.2rem; color: var(--dark-color);">
                            Domanda <?php echo ($idx + 1); // O $domanda['numero'] se preferisci l'ID DB ?>:
                        </h3>
                        <div style="background-color: var(--light-gray-bg); padding: 10px; border-radius: 4px; margin-bottom: 15px; border: 1px solid var(--border-color);">
                            <p style="margin:0;"><?php echo nl2br(htmlspecialchars($domanda['testo'])); ?></p>
                        </div>

                        <div class="answer-options-list"> <!-- Contenitore per le opzioni -->
                            <?php if (isset($opzioniOrganizzate[$domanda['numero']])): ?>
                                <?php foreach ($opzioniOrganizzate[$domanda['numero']] as $opzione): ?>
                                    <?php
                                    $rispostaDataPerQuestaDomanda = $risposteDateUtente[$domanda['numero']] ?? null;
                                    $isSelezionataDallUtente = ($rispostaDataPerQuestaDomanda !== null && $rispostaDataPerQuestaDomanda == $opzione['numero']);
                                    
                                    $opzioneStyle = 'padding: 10px; border: 1px solid var(--border-color); border-radius: 4px; margin-bottom: 10px; display: flex; align-items: center; justify-content: space-between;';
                                    $feedbackIcon = '';
                                    $feedbackText = '';

                                    if ($isSelezionataDallUtente) {
                                        if ($opzione['tipo'] === 'Corretta') {
                                            $opzioneStyle .= 'background-color: #d4edda; border-left: 5px solid #155724; color: #155724;'; // Simile a alert-success
                                            // $feedbackIcon = '<i class="fas fa-check-circle" style="color: #155724; margin-right: 8px;"></i> '; // Se usi FontAwesome
                                            $feedbackIcon = '<span style="color: #155724; margin-right: 8px; font-weight:bold;">✓</span> ';
                                            $feedbackText = '<span class="status-badge" style="background-color: #155724; color:white; border:none; padding:3px 8px; font-size:0.8rem;">Risposta Corretta</span>';
                                        } else { // Selezionata ma Sbagliata
                                            $opzioneStyle .= 'background-color: #f8d7da; border-left: 5px solid #721c24; color: #721c24;'; // Simile a alert-danger
                                            // $feedbackIcon = '<i class="fas fa-times-circle" style="color: #721c24; margin-right: 8px;"></i> ';
                                            $feedbackIcon = '<span style="color: #721c24; margin-right: 8px; font-weight:bold;">✗</span> ';
                                            $feedbackText = '<span class="status-badge" style="background-color: #721c24; color:white; border:none; padding:3px 8px; font-size:0.8rem;">Risposta Sbagliata</span>';
                                        }
                                    } elseif ($opzione['tipo'] === 'Corretta') {
                                        // Evidenzia la risposta corretta anche se non selezionata dall'utente, ma in modo più tenue
                                        $opzioneStyle .= 'background-color: #e9ecef; border-left: 5px solid var(--secondary-gray);'; // Grigio chiaro
                                        $feedbackText = '<span class="status-badge" style="background-color: var(--secondary-gray); color:white; border:none; padding:3px 8px; font-size:0.8rem;">Soluzione Corretta</span>';
                                    }
                                    ?>
                                    <div style="<?php echo $opzioneStyle; ?>">
                                        <div>
                                            <?php echo $feedbackIcon; ?>
                                            <?php echo htmlspecialchars($opzione['testo']); ?>
                                            <?php if ($opzione['tipo'] === 'Corretta' && !$isSelezionataDallUtente): ?>
                                                <em class="text-muted" style="font-size:0.9em;"> (Punti: <?php echo $opzione['punteggio']; ?>)</em>
                                            <?php elseif ($isSelezionataDallUtente && $opzione['tipo'] === 'Corretta'): ?>
                                                <em style="font-size:0.9em; color: #155724;"> (Punti: +<?php echo $opzione['punteggio']; ?>)</em>
                                            <?php endif; ?>
                                        </div>
                                        <?php if ($isSelezionataDallUtente || $opzione['tipo'] === 'Corretta'): ?>
                                            <div style="margin-left:15px; white-space:nowrap;">
                                                <?php echo $feedbackText; ?>
                                            </div>
                                        <?php endif; ?>
                                    </div>
                                <?php endforeach; ?>
                            <?php else: ?>
                                <p class="text-muted"><em>Nessuna opzione di risposta trovata per questa domanda.</em></p>
                            <?php endif; ?>
                        </div>
                    </div>
                </div>
            <?php endforeach; ?>
        <?php endif; ?>
    </div> <!-- Fine .content -->
</div> <!-- Fine .main-content -->

<?php include 'includes/footer.php'; ?>