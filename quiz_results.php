<?php
/**
 * Pagina di Visualizzazione dei Risultati di una Partecipazione al Quiz.
 *
 * Questa pagina mostra all'utente i risultati dettagliati di una sua
 * specifica partecipazione a un quiz. Include il punteggio ottenuto,
 * le risposte date dall'utente e l'indicazione di quali fossero corrette.
 * Richiede che l'utente sia autenticato e che l'ID della partecipazione
 * sia valido e appartenga all'utente.
 */

// Include l'header comune (gestisce session_start, config DB, CSS, etc.).
include 'includes/header.php';

// Include il file di configurazione del database per la connessione.
require_once 'config/database.php';

// --- Controllo Autenticazione Utente ---
// Assicura che la sessione sia attiva e che l'utente sia loggato.
// (header.php dovrebbe già aver chiamato session_start()).
if (!isset($_SESSION['user']) || !isset($_SESSION['user']['nomeUtente'])) {
    $_SESSION['error_message'] = "Devi effettuare il login per visualizzare i risultati.";
    header('Location: auth_login.php'); // Reindirizza al login.
    exit;
}
$nomeUtente = $_SESSION['user']['nomeUtente']; // Nome utente loggato.

// --- Validazione ID Partecipazione ---
// Verifica che l'ID della partecipazione sia presente nella query string e sia un numero valido.
if (!isset($_GET['participation_id']) || !is_numeric($_GET['participation_id'])) {
    $_SESSION['error_message'] = "ID della partecipazione non specificato o non valido.";
    header('Location: quiz_participations.php'); // Reindirizza alla lista delle partecipazioni.
    exit;
}
$participation_id = (int) $_GET['participation_id']; // ID della partecipazione da visualizzare.

try {
    // --- PASSO 1: Verifica Proprietà Partecipazione e Recupero Dettagli Quiz ---
    // Controlla se la partecipazione appartiene all'utente loggato e recupera info base.
    $sqlParticipation = "SELECT p.codice AS p_codice, p.quiz AS quiz_id, p.data AS data_partecipazione,
                                q.titolo AS quiz_titolo
                         FROM Partecipazione p
                         JOIN Quiz q ON p.quiz = q.codice
                         WHERE p.codice = :participation_id AND p.utente = :nomeUtente";
    $stmtParticipation = $pdo->prepare($sqlParticipation);
    $stmtParticipation->execute(['participation_id' => $participation_id, 'nomeUtente' => $nomeUtente]);
    $participationDetails = $stmtParticipation->fetch(PDO::FETCH_ASSOC);

    // Se la partecipazione non esiste o non appartiene all'utente, reindirizza.
    if (!$participationDetails) {
        $_SESSION['error_message'] = "Partecipazione non trovata o non sei autorizzato a visualizzarne i risultati.";
        header('Location: index.php'); // O alla dashboard utente.
        exit;
    }
    $quiz_id = $participationDetails['quiz_id'];             // ID del quiz associato.
    $quiz_titolo = $participationDetails['quiz_titolo'];     // Titolo del quiz.
    $data_partecipazione = $participationDetails['data_partecipazione']; // Data della partecipazione.

    // --- PASSO 2: Calcolo Punteggio Ottenuto per questa Partecipazione ---
    // Somma i punteggi SOLO delle risposte date dall'utente CHE ERANO effettivamente CORRETTE.
    $sqlScore = "SELECT SUM(r.punteggio) AS total_score
                 FROM RispostaUtenteQuiz ruq
                 JOIN Risposta r ON ruq.quiz = r.quiz AND ruq.domanda = r.domanda AND ruq.risposta = r.numero
                 WHERE ruq.partecipazione = :participation_id AND r.tipo = 'Corretta'"; // Considera solo risposte corrette.
    $stmtScore = $pdo->prepare($sqlScore);
    $stmtScore->execute(['participation_id' => $participation_id]);
    $scoreData = $stmtScore->fetch(PDO::FETCH_ASSOC);
    $total_score = $scoreData['total_score'] ?? 0; // Punteggio ottenuto.

    // --- Calcolo Punteggio Massimo Possibile per il Quiz ---
    // Somma i punteggi di tutte le risposte corrette disponibili per quel quiz.
    $sqlPunteggioMassimo = "SELECT COALESCE(SUM(R_total.punteggio), 0) AS punteggio_massimo
                            FROM Domanda D_total
                            JOIN Risposta R_total ON D_total.quiz = R_total.quiz AND D_total.numero = R_total.domanda
                            WHERE D_total.quiz = :quiz_id AND R_total.tipo = 'Corretta'";
    $stmtPunteggioMassimo = $pdo->prepare($sqlPunteggioMassimo);
    $stmtPunteggioMassimo->bindParam(':quiz_id', $quiz_id, PDO::PARAM_INT);
    $stmtPunteggioMassimo->execute();
    $punteggioMassimoData = $stmtPunteggioMassimo->fetch(PDO::FETCH_ASSOC);
    $punteggio_massimo_quiz = $punteggioMassimoData['punteggio_massimo'] ?? 0; // Punteggio massimo possibile.

    // --- PASSO 3: Recupero di Tutte le Domande del Quiz ---
    $sqlDomande = "SELECT numero, testo FROM Domanda WHERE quiz = :quiz_id ORDER BY numero ASC";
    $stmtDomande = $pdo->prepare($sqlDomande);
    $stmtDomande->bindParam(':quiz_id', $quiz_id, PDO::PARAM_INT);
    $stmtDomande->execute();
    $domandeQuiz = $stmtDomande->fetchAll(PDO::FETCH_ASSOC); // Array di tutte le domande del quiz.

    // Gestione caso (improbabile se c'è una partecipazione) in cui il quiz non ha domande.
    if (empty($domandeQuiz)) {
        // Si potrebbe voler mostrare un messaggio specifico o gestire l'errore diversamente.
        // Per ora, se $domandeQuiz è vuoto, il loop successivo non verrà eseguito.
    }

    // --- PASSO 4: Recupero di Tutte le Opzioni di Risposta per le Domande del Quiz ---
    $sqlOpzioni = "SELECT domanda, numero, testo, tipo, punteggio
                   FROM Risposta
                   WHERE quiz = :quiz_id
                   ORDER BY domanda ASC, numero ASC"; // Ordina per domanda e poi per numero risposta.
    $stmtOpzioni = $pdo->prepare($sqlOpzioni);
    $stmtOpzioni->bindParam(':quiz_id', $quiz_id, PDO::PARAM_INT);
    $stmtOpzioni->execute();
    $opzioniRaw = $stmtOpzioni->fetchAll(PDO::FETCH_ASSOC); // Array di tutte le opzioni di risposta.

    // Organizza le opzioni di risposta in un array associativo per domanda.
    // Esempio: $opzioniOrganizzate[numero_domanda] = [array_opzioni_per_quella_domanda]
    $opzioniOrganizzate = [];
    foreach ($opzioniRaw as $opzione) {
        $opzioniOrganizzate[$opzione['domanda']][] = $opzione;
    }

    // --- PASSO 5: Recupero delle Risposte Date dall'Utente in Questa Partecipazione ---
    $sqlRisposteUtente = "SELECT domanda, risposta AS numero_risposta_data
                          FROM RispostaUtenteQuiz
                          WHERE partecipazione = :participation_id AND quiz = :quiz_id";
    $stmtRisposteUtente = $pdo->prepare($sqlRisposteUtente);
    $stmtRisposteUtente->execute(['participation_id' => $participation_id, 'quiz_id' => $quiz_id]);
    $risposteDateRaw = $stmtRisposteUtente->fetchAll(PDO::FETCH_ASSOC);

    // Mappa le risposte date dall'utente per un accesso facile: [numero_domanda] => numero_risposta_data.
    $risposteDateUtente = [];
    foreach ($risposteDateRaw as $rdu) {
        $risposteDateUtente[$rdu['domanda']] = $rdu['numero_risposta_data'];
    }

} catch (PDOException $e) { // Gestione errori database.
    error_log("Errore DB in quiz_results.php: " . $e->getMessage());
    // Mostra un messaggio di errore generico all'utente.
    die("<div class='container' style='padding-top:20px;'><div class='alert alert-danger'>Errore nel caricamento dei risultati. Riprova più tardi.</div></div>");
}

// --- Calcolo Percentuale Punteggio e Stile Colore ---
$scorePercentage = 0;
$scoreColorStyle = 'color: var(--primary-blue);'; // Colore di default per il punteggio.

if ($punteggio_massimo_quiz > 0) { // Se il punteggio massimo è calcolabile.
    $scorePercentage = ($total_score / $punteggio_massimo_quiz) * 100;
    // Applica uno stile di colore diverso in base alla percentuale.
    if ($scorePercentage >= 75) {
        $scoreColorStyle = 'color: var(--score-high-color);'; // Verde per punteggi alti.
    } elseif ($scorePercentage >= 50) {
        $scoreColorStyle = 'color: var(--score-medium-color);'; // Arancio per punteggi medi.
    } else {
        $scoreColorStyle = 'color: var(--score-low-color);'; // Rosso per punteggi bassi.
    }
} elseif ($total_score > 0) { // Se il massimo non è calcolabile ma c'è un punteggio positivo.
    $scoreColorStyle = 'color: var(--score-high-color);'; // Verde di default.
}
// Se total_score è 0 e punteggio_massimo_quiz è 0 (o non calcolabile), il colore rimane quello di default.
?>

<!-- Contenuto principale della pagina dei risultati -->
<div class="main-content"> <!-- Questo potrebbe essere .container main-content-page-padding per coerenza -->
    <div class="content"> <!-- Contenitore interno per il contenuto effettivo -->
        <h1 class="page-main-title" style="text-align:center; margin-bottom: 20px; padding-bottom:10px; border-bottom: 1px solid var(--border-color);"> <!-- Stile titolo pagina -->
            Risultati Quiz: <?php echo htmlspecialchars($quiz_titolo, ENT_QUOTES, 'UTF-8'); ?>
        </h1>

        <!-- Card di Riepilogo Partecipazione -->
        <div class="card quiz-results-summary-card" style="margin-bottom: 25px;"> <!-- Applica classe specifica se definita -->
            <div class="card-body"> <!-- card-content è usato altrove, card-body è più Bootstrap-like -->
                <h2 class="card-title" style="margin-bottom:15px;">Riepilogo Partecipazione</h2>
                <p><strong class="bold">Data partecipazione:</strong> <?php echo htmlspecialchars(date('d/m/Y', strtotime($data_partecipazione)), ENT_QUOTES, 'UTF-8'); ?></p>
                <p><strong class="bold">Punteggio totale ottenuto:</strong> 
                    <span style="font-size: 1.1em; <?php echo $scoreColorStyle; ?> font-weight: bold;"><?php echo htmlspecialchars($total_score, ENT_QUOTES, 'UTF-8'); ?></span>
                    <?php if ($punteggio_massimo_quiz > 0): ?>
                        <span style="font-size: 1em; color: var(--text-muted);"> / <?php echo htmlspecialchars($punteggio_massimo_quiz, ENT_QUOTES, 'UTF-8'); ?> punti</span>
                        <!-- Percentuale, se si vuole visualizzare -->
                        <span style="font-size: 0.9em; color: var(--text-muted); margin-left: 0.5em;">(<?php echo number_format($scorePercentage, 1); ?>%)</span>
                    <?php else: // Se punteggio massimo non calcolabile ?>
                        <span style="font-size: 1em; color: var(--text-muted);"> punti</span>
                    <?php endif; ?>
                </p>
                <!-- Barra di progresso (opzionale, se si vuole visualizzare qui) -->
                <?php if ($punteggio_massimo_quiz > 0): ?>
                    <div class="progress-bar-container" style="margin-top: 10px;">
                        <div class="progress-bar" role="progressbar" style="width: <?php echo number_format($scorePercentage, 2); ?>%; background-color: <?php echo str_replace(['color: ',';'],'', $scoreColorStyle);?>;" 
                             aria-valuenow="<?php echo number_format($scorePercentage, 2); ?>" aria-valuemin="0" aria-valuemax="100">
                        </div>
                    </div>
                <?php endif; ?>

                <hr style="border: 0; border-top: 1px solid var(--border-color); margin: 20px 0;"> <!-- Separatore -->
                <!-- Bottoni di navigazione -->
                <a href="quiz_view.php?id=<?php echo $quiz_id; ?>" class="btn btn-secondary" style="margin-right:10px;">
                    Torna alla Scheda Quiz <!-- Icona rimossa per pulizia, può essere aggiunta se preferito -->
                </a>
                <a href="index.php" class="btn">
                    Vedi altri Quiz
                </a>
            </div>
        </div>

        <!-- Titolo per la sezione delle risposte date -->
        <h2 class="page-section-title" style="margin-top: 30px; margin-bottom: 20px; font-size:1.6rem; border-bottom: 1px solid var(--border-color); padding-bottom:10px;">
            Le Tue Risposte
        </h2>

        <?php if (empty($domandeQuiz)): // Se non ci sono domande per questo quiz ?>
            <div class="no-results card"> <!-- Usa .card per coerenza se si vuole lo sfondo -->
                <p>Nessuna domanda trovata per questo quiz.</p>
            </div>
        <?php else: // Se ci sono domande, itera e visualizza ogni domanda e le relative risposte ?>
            <?php foreach ($domandeQuiz as $idx => $domanda): ?>
                <div class="card answered-question-item" style="margin-bottom: 20px;"> <!-- Card per ogni domanda -->
                    <div class="card-body"> <!-- card-content o card-body -->
                        <h3 class="card-title" style="font-size: 1.2rem; color: var(--dark-color);">
                            Domanda <?php echo ($idx + 1); // Numero progressivo della domanda ?>:
                        </h3>
                        <!-- Testo della domanda -->
                        <div class="question-text-display" style="background-color: var(--light-gray-bg); padding: 10px; border-radius: 4px; margin-bottom: 15px; border: 1px solid var(--border-color);">
                            <p style="margin:0;"><?php echo nl2br(htmlspecialchars($domanda['testo'], ENT_QUOTES, 'UTF-8')); ?></p>
                        </div>

                        <!-- Contenitore per le opzioni di risposta -->
                        <div class="answer-options-display">
                            <?php if (isset($opzioniOrganizzate[$domanda['numero']])): // Se ci sono opzioni per questa domanda ?>
                                <?php foreach ($opzioniOrganizzate[$domanda['numero']] as $opzione): ?>
                                    <?php
                                    // Determina se questa opzione è stata selezionata dall'utente.
                                    $rispostaDataPerQuestaDomanda = $risposteDateUtente[$domanda['numero']] ?? null;
                                    $isSelezionataDallUtente = ($rispostaDataPerQuestaDomanda !== null && $rispostaDataPerQuestaDomanda == $opzione['numero']);
                                    
                                    // Inizializza stili e feedback per l'opzione.
                                    $opzioneClass = 'answer-option-display'; // Classe base.
                                    $feedbackIconHtml = ''; // Icona di feedback (✓ o ✗).
                                    $feedbackTextHtml = ''; // Testo di feedback (Risposta Corretta/Sbagliata).

                                    if ($isSelezionataDallUtente) {
                                        $opzioneClass .= ' user-selected'; // Aggiunge classe se selezionata.
                                        if ($opzione['tipo'] === 'Corretta') {
                                            $opzioneClass .= ' correct-answer'; // Aggiunge classe se corretta e selezionata.
                                            $feedbackIconHtml = '<span class="option-icon icon-correct" style="color: var(--score-high-color); font-weight:bold;">✓</span> ';
                                            $feedbackTextHtml = '<span class="status-badge feedback-badge-correct">Risposta Corretta</span>';
                                        } else { // Selezionata ma Sbagliata.
                                            $opzioneClass .= ' incorrect-answer'; // Aggiunge classe se sbagliata e selezionata.
                                            $feedbackIconHtml = '<span class="option-icon icon-incorrect" style="color: var(--score-low-color); font-weight:bold;">✗</span> ';
                                            $feedbackTextHtml = '<span class="status-badge feedback-badge-incorrect">Risposta Sbagliata</span>';
                                        }
                                    } elseif ($opzione['tipo'] === 'Corretta') {
                                        // Evidenzia la risposta corretta anche se non selezionata dall'utente.
                                        $opzioneClass .= ' correct-answer-unselected'; // Classe per corretta non selezionata.
                                        $feedbackIconHtml = '<span class="option-icon icon-neutral" style="color: var(--text-muted); font-weight:bold;"> </span> '; // Spazio per allineamento.
                                        $feedbackTextHtml = '<span class="status-badge feedback-badge-solution">Soluzione Corretta</span>';
                                    } else {
                                        $feedbackIconHtml = '<span class="option-icon icon-neutral" style="color: var(--text-muted); font-weight:bold;"> </span> ';
                                    }
                                    ?>
                                    <!-- Visualizzazione della singola opzione di risposta -->
                                    <div class="<?php echo $opzioneClass; ?>" style="display: flex; align-items: center; justify-content: space-between;">
                                        <div> <!-- Contenitore per icona e testo opzione -->
                                            <?php echo $feedbackIconHtml; ?>
                                            <?php echo htmlspecialchars($opzione['testo'], ENT_QUOTES, 'UTF-8'); ?>
                                            <!-- Mostra punteggio se rilevante -->
                                            <?php if ($opzione['tipo'] === 'Corretta' && !$isSelezionataDallUtente): ?>
                                                <em class="text-muted" style="font-size:0.9em;"> (Punti: <?php echo htmlspecialchars($opzione['punteggio'], ENT_QUOTES, 'UTF-8'); ?>)</em>
                                            <?php elseif ($isSelezionataDallUtente && $opzione['tipo'] === 'Corretta'): ?>
                                                <em style="font-size:0.9em; color: var(--score-high-color);"> (Punti: +<?php echo htmlspecialchars($opzione['punteggio'], ENT_QUOTES, 'UTF-8'); ?>)</em>
                                            <?php endif; ?>
                                        </div>
                                        <?php if ($isSelezionataDallUtente || ($opzione['tipo'] === 'Corretta' && !$isSelezionataDallUtente) ): // Mostra feedback testuale se rilevante ?>
                                            <div style="margin-left:15px; white-space:nowrap;">
                                                <?php echo $feedbackTextHtml; ?>
                                            </div>
                                        <?php endif; ?>
                                    </div>
                                <?php endforeach; // Fine loop opzioni ?>
                            <?php else: // Se non ci sono opzioni per questa domanda (caso anomalo) ?>
                                <p class="text-muted"><em>Nessuna opzione di risposta trovata per questa domanda.</em></p>
                            <?php endif; // Fine controllo opzioniOrganizzate ?>
                        </div> <!-- fine .answer-options-display -->
                    </div> <!-- fine .card-body -->
                </div> <!-- fine .answered-question-item .card -->
            <?php endforeach; // Fine loop domandeQuiz ?>
        <?php endif; // Fine controllo empty($domandeQuiz) ?>
    </div> <!-- Fine .content -->
</div> <!-- Fine .main-content -->

<?php 
// Include il footer HTML comune.
include 'includes/footer.php'; 
?>
<!-- La chiusura del tag </body> è in footer.php -->