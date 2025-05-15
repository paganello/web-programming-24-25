<?php
/**
 * Pagina di Visualizzazione delle Statistiche di un Quiz.
 *
 * Questa pagina è destinata al creatore di un quiz per visualizzare
 * le statistiche aggregate delle risposte date dagli utenti.
 * Mostra il conteggio e la percentuale di scelta per ogni opzione di risposta.
 * Richiede che l'utente sia loggato e sia il creatore del quiz specificato.
 */

// Include l'header comune che gestisce session_start() e altre inclusioni.
include "includes/header.php";
// Includi la configurazione del database (già fatto da header.php se configurato correttamente).
// require_once 'config/database.php'; // Assicurati che $pdo sia disponibile.

// Assicura che la sessione sia attiva. (Potrebbe essere ridondante se header.php lo fa sempre).
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// --- Controllo Accesso Utente ---
// Verifica se l'utente è loggato. Se non lo è, reindirizza al login.
// Il blocco `php_sapi_name() == 'cli'` è per test da riga di comando e dovrebbe essere rimosso in produzione.
$nomeUtente = $_SESSION['user']['nomeUtente'] ?? null;
if (!isset($nomeUtente)) {
    // Codice di fallback per test (DA RIMUOVERE IN PRODUZIONE)
    if (php_sapi_name() == 'cli' || empty($_SESSION['user'])) { // Condizione di test
        $_SESSION['user']['nomeUtente'] = 'mario_rossi'; // Utente fittizio
        $nomeUtente = $_SESSION['user']['nomeUtente'];
        // Mostra un avviso visibile se si usa la sessione fittizia.
        echo "<div class='container' style='padding-top:10px;'><div class='alert alert-warning'>ATTENZIONE: Sessione utente fittizia per test ('$nomeUtente'). Rimuovere in produzione!</div></div>";
    } else { // Se non è un test CLI e l'utente non è loggato, reindirizza.
        header('Location: auth_login.php');
        exit;
    }
}

// --- Recupero e Validazione dell'ID del Quiz dalla Query String ---
if (!isset($_GET['id']) || !filter_var($_GET['id'], FILTER_VALIDATE_INT)) {
    // Se l'ID non è presente o non è un intero valido, mostra un errore e termina.
    die("<div class='container' style='padding-top:20px;'><div class='alert alert-danger'>ID Quiz non valido o mancante.</div></div>");
}
$quizId = (int) $_GET['id']; // Converte l'ID a intero.

// --- Fetch dei Dati del Quiz, Domande, Risposte e Statistiche dal Database ---
try {
    // 1. Recupera i dettagli del quiz, verificando che l'utente loggato sia il creatore.
    $sqlQuiz = "SELECT q.codice, q.titolo, q.dataInizio, q.dataFine, u.nome AS creatore_nome, u.cognome AS creatore_cognome 
                FROM Quiz q 
                JOIN Utente u ON q.creatore = u.nomeUtente 
                WHERE q.codice = :quizId AND q.creatore = :nomeUtente";
    $stmtQuiz = $pdo->prepare($sqlQuiz);
    $stmtQuiz->bindParam(':quizId', $quizId, PDO::PARAM_INT);
    $stmtQuiz->bindParam(':nomeUtente', $nomeUtente, PDO::PARAM_STR);
    $stmtQuiz->execute();
    $quiz = $stmtQuiz->fetch(PDO::FETCH_ASSOC); // Recupera i dati del quiz.

    // Se il quiz non viene trovato o l'utente non è il creatore, mostra un errore.
    if (!$quiz) {
        die("<div class='container' style='padding-top:20px;'><div class='alert alert-danger'>Quiz non trovato o non sei autorizzato a visualizzarne le statistiche.</div></div>");
    }

    // 2. Recupera tutte le domande del quiz, ordinate per numero.
    $sqlDomande = "SELECT numero, testo FROM Domanda WHERE quiz = :quizId ORDER BY numero ASC";
    $stmtDomande = $pdo->prepare($sqlDomande);
    $stmtDomande->bindParam(':quizId', $quizId, PDO::PARAM_INT);
    $stmtDomande->execute();
    $domande = $stmtDomande->fetchAll(PDO::FETCH_ASSOC);

    // 3. Recupera tutte le risposte per tutte le domande del quiz.
    $sqlRisposte = "SELECT domanda, numero, testo, tipo FROM Risposta WHERE quiz = :quizId ORDER BY domanda ASC, numero ASC";
    $stmtRisposte = $pdo->prepare($sqlRisposte);
    $stmtRisposte->bindParam(':quizId', $quizId, PDO::PARAM_INT);
    $stmtRisposte->execute();
    $risposteRaw = $stmtRisposte->fetchAll(PDO::FETCH_ASSOC);

    // Organizza le risposte in un array associativo per domanda per facilitare l'accesso.
    // Esempio: $risposteOrganizzate[numero_domanda] = [array_risposte_per_quella_domanda]
    $risposteOrganizzate = [];
    foreach ($risposteRaw as $risposta) {
        $risposteOrganizzate[$risposta['domanda']][] = $risposta;
    }

    // 4. Recupera le statistiche: conteggio di quante volte ogni risposta è stata scelta.
    $sqlStatistiche = "SELECT
                           ruq.domanda AS numero_domanda_db,   -- Numero della domanda
                           ruq.risposta AS numero_risposta_db, -- Numero della risposta scelta
                           COUNT(ruq.partecipazione) AS conteggio_scelte -- Numero di volte che questa risposta è stata scelta
                       FROM RispostaUtenteQuiz ruq
                       WHERE ruq.quiz = :quizId
                       GROUP BY ruq.domanda, ruq.risposta"; // Raggruppa per domanda e risposta.
    $stmtStatistiche = $pdo->prepare($sqlStatistiche);
    $stmtStatistiche->bindParam(':quizId', $quizId, PDO::PARAM_INT);
    $stmtStatistiche->execute();
    $statisticheRaw = $stmtStatistiche->fetchAll(PDO::FETCH_ASSOC);

    // Organizza le statistiche e calcola il totale delle risposte date per ogni domanda.
    $statisticheConteggi = [];        
    $totaleRispostePerDomandaDB = []; 

    foreach ($statisticheRaw as $stat) {
        $statisticheConteggi[$stat['numero_domanda_db']][$stat['numero_risposta_db']] = (int) $stat['conteggio_scelte'];
        // Calcola il totale delle risposte date per la domanda corrente.
        if (!isset($totaleRispostePerDomandaDB[$stat['numero_domanda_db']])) {
            $totaleRispostePerDomandaDB[$stat['numero_domanda_db']] = 0;
        }
        $totaleRispostePerDomandaDB[$stat['numero_domanda_db']] += (int) $stat['conteggio_scelte'];
    }

} catch (PDOException $e) { // Gestione errori database.
    error_log("Errore Database in statistiche_quiz.php: " . $e->getMessage());
    die("<div class='container' style='padding-top:20px;'><div class='alert alert-danger'>Si è verificato un errore nel recupero dei dati. Riprova più tardi.</div></div>");
}

// Calcolo del numero totale di partecipanti unici al quiz.
// Un partecipante è contato una volta anche se ha risposto a più domande.
$sqlTotalePartecipazioni = "SELECT COUNT(DISTINCT partecipazione) AS totale_partecipanti FROM RispostaUtenteQuiz WHERE quiz = :quizId";
$stmtTotPartecipazioni = $pdo->prepare($sqlTotalePartecipazioni);
$stmtTotPartecipazioni->bindParam(':quizId', $quizId, PDO::PARAM_INT);
$stmtTotPartecipazioni->execute();
$risultatoPartecipazioni = $stmtTotPartecipazioni->fetch(PDO::FETCH_ASSOC);
$totalePartecipantiComplessivi = $risultatoPartecipazioni['totale_partecipanti'] ?? 0;

?>
<!-- L'HTML della pagina inizia qui, l'header è già stato incluso. -->
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Statistiche Quiz: <?php echo htmlspecialchars($quiz['titolo'], ENT_QUOTES, 'UTF-8'); ?></title>
    <!-- Il CSS è già incluso da header.php -->
    <!-- <link rel="stylesheet" href="assets/css/style.css"> -->
</head>
<body> <!-- Questo tag <body> dovrebbe essere aperto in header.php -->

    <div class="main-content"> <!-- Contenitore principale del contenuto -->
        <div class="content">
            <!-- Titolo della pagina di statistiche -->
            <h1 style="text-align:center; margin-bottom: 20px; padding-bottom:10px; border-bottom: 1px solid var(--border-color);">
                Statistiche: <?php echo htmlspecialchars($quiz['titolo'], ENT_QUOTES, 'UTF-8'); ?>
            </h1>

            <!-- Card con i dettagli del quiz -->
            <div class="quiz-detail-card" style="margin-bottom: 25px;">
                <div class="quiz-info-grid"> <!-- Griglia per visualizzare le info del quiz -->
                    <div class="quiz-info-item">
                        <i class="fas fa-user-edit"></i> <!-- Icona creatore -->
                        <div>
                            <span class="info-label">Creato da</span>
                            <span class="info-value">
                                <?php echo htmlspecialchars($quiz['creatore_nome'] . ' ' . $quiz['creatore_cognome'], ENT_QUOTES, 'UTF-8'); ?>
                            </span>
                        </div>
                    </div>
                    <div class="quiz-info-item">
                        <i class="fas fa-calendar-alt"></i> <!-- Icona data inizio -->
                        <div>
                            <span class="info-label">Data di inizio</span>
                            <span class="info-value"><?php echo date('d/m/Y', strtotime($quiz['dataInizio'])); ?></span>
                        </div>
                    </div>
                    <div class="quiz-info-item">
                        <i class="fas fa-calendar-check"></i> <!-- Icona data fine -->
                        <div>
                            <span class="info-label">Data di fine</span>
                            <span class="info-value"><?php echo date('d/m/Y', strtotime($quiz['dataFine'])); ?></span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Sezione per visualizzare le statistiche per ogni domanda -->
            <?php if (empty($domande)): // Se il quiz non ha domande ?>
                <div class="no-results">
                    <p>Questo quiz non ha ancora domande definite.</p>
                </div>
            <?php else: // Se ci sono domande, itera e visualizza statistiche per ciascuna ?>
                <?php foreach ($domande as $indexDomanda => $domanda): ?>
                    <div class="card" style="margin-bottom: 25px;"> <!-- Card per ogni domanda -->
                        <div class="card-content" style="padding: 20px;"> <!-- Aggiunto padding per coerenza con altre card -->
                            <h2 class="card-title" style="font-size: 1.3rem; margin-bottom: 15px;"> <!-- Stile titolo domanda -->
                                Domanda <?php echo $indexDomanda + 1; ?>
                            </h2>
                            <!-- Testo della domanda -->
                            <div class="form-group" style="background-color: var(--light-gray-bg); padding: 12px; border-radius: 4px; border: 1px solid var(--border-color); margin-bottom:15px;">
                                <p style="margin-bottom:0;"><?php echo nl2br(htmlspecialchars($domanda['testo'], ENT_QUOTES, 'UTF-8')); ?></p>
                            </div>

                            <?php
                            // Totale risposte date per questa specifica domanda.
                            $totaleSceltePerQuestaDomanda = $totaleRispostePerDomandaDB[$domanda['numero']] ?? 0;
                            ?>
                            <!-- Mostra il totale delle risposte per questa domanda -->
                            <p class="text-muted" style="font-style: italic; margin-bottom: 15px; text-align: right; font-size: 0.9em;">
                                Totale risposte per questa domanda: <strong class="bold" style="color: var(--text-dark);"><?php echo $totaleSceltePerQuestaDomanda; ?></strong>
                            </p>

                            <!-- Itera sulle opzioni di risposta per questa domanda -->
                            <?php if (isset($risposteOrganizzate[$domanda['numero']]) && !empty($risposteOrganizzate[$domanda['numero']])): ?>
                                <?php foreach ($risposteOrganizzate[$domanda['numero']] as $risposta): ?>
                                    <?php
                                    // Conteggio e percentuale per l'opzione di risposta corrente.
                                    $conteggioSceltaCorrente = $statisticheConteggi[$domanda['numero']][$risposta['numero']] ?? 0;
                                    $percentuale = 0;
                                    if ($totaleSceltePerQuestaDomanda > 0) {
                                        $percentuale = round(($conteggioSceltaCorrente / $totaleSceltePerQuestaDomanda) * 100, 1);
                                    }

                                    // Stili dinamici per la barra e il badge in base al tipo di risposta (Corretta/Sbagliata).
                                    $tipoRisposta = $risposta['tipo'];
                                    $barColorClass = ''; // Classe CSS per il colore della barra (da definire in style.css).
                                    $badgeStyle = '';    // Stile inline per il badge (può essere sostituito da classi).
                                    $bgColorClass = '';  // Classe CSS per lo sfondo del blocco risposta.

                                    if ($tipoRisposta == 'Corretta') {
                                        $barColorClass = 'progress-bar-correct';
                                        $badgeStyle = 'background-color: var(--score-high-color); color: white;';
                                        $bgColorClass = 'answer-block-highlight-correct';
                                    } elseif ($tipoRisposta == 'Sbagliata') {
                                        $barColorClass = 'progress-bar-incorrect';
                                        $badgeStyle = 'background-color: var(--score-low-color); color: white;';
                                        $bgColorClass = 'answer-block-highlight-default'; // Nessun highlight speciale o grigio chiaro.
                                    }
                                    ?>
                                    <!-- Blocco per visualizzare una singola opzione di risposta e le sue statistiche -->
                                    <div class="answer-stat-block <?php echo $bgColorClass; ?>" style="margin-bottom: 15px; padding: 12px; border-radius: 4px; border: 1px solid var(--border-color); border-left-width: 4px; border-left-style:solid;" data-bar-color-class="<?php echo $barColorClass; ?>">
                                        <div style="display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 8px;">
                                            <span style="flex-grow: 1; padding-right:10px;"><?php echo nl2br(htmlspecialchars($risposta['testo'], ENT_QUOTES, 'UTF-8')); ?></span>
                                            <!-- Badge per tipo risposta (Corretta/Sbagliata) -->
                                            <span class="status-badge" style="<?php echo $badgeStyle; ?> padding: 4px 10px; font-size:0.75rem; border-radius:10px; border:none;">
                                                <?php echo htmlspecialchars($tipoRisposta, ENT_QUOTES, 'UTF-8'); ?>
                                            </span>
                                        </div>
                                        <!-- Barra di Progresso Percentuale -->
                                        <div class="progress-bar-container" style="height: 20px; margin-bottom: 5px;"> <!-- Usa classe CSS -->
                                            <div class="progress-bar <?php echo $barColorClass; ?>" role="progressbar" style="width: <?php echo $percentuale; ?>%;" 
                                                 aria-valuenow="<?php echo $percentuale; ?>" aria-valuemin="0" aria-valuemax="100">
                                                <?php if ($percentuale > 15): // Mostra testo solo se c'è spazio ?>
                                                    <?php echo $percentuale; ?>%
                                                <?php endif; ?>
                                            </div>
                                             <?php if ($percentuale <= 15 && $percentuale > 0): // Mostra testo fuori se barra troppo corta ?>
                                                <span class="progress-bar-text-outside"><?php echo $percentuale; ?>%</span>
                                            <?php elseif($percentuale == 0): ?>
                                                 <span class="progress-bar-text-empty">0%</span>
                                            <?php endif; ?>
                                        </div>
                                        <!-- Conteggio scelte per questa opzione -->
                                        <p class="text-muted" style="font-size: 0.85em; margin-top: 3px; text-align: right;">
                                            Scelta da <strong class="bold" style="color: var(--text-dark);"><?php echo $conteggioSceltaCorrente; ?></strong>
                                            utent<?php echo ($conteggioSceltaCorrente == 1) ? 'e' : 'i'; ?>
                                        </p>
                                    </div>
                                <?php endforeach; ?>
                            <?php else: // Se non ci sono opzioni di risposta definite (caso anomalo) ?>
                                <p class="text-muted"><em>Nessuna opzione di risposta definita per questa domanda.</em></p>
                            <?php endif; ?>

                            <?php // Messaggio se nessuno ha ancora risposto a questa domanda.
                            if ($totaleSceltePerQuestaDomanda == 0 && isset($risposteOrganizzate[$domanda['numero']]) && !empty($risposteOrganizzate[$domanda['numero']])): ?>
                                <div class="alert alert-info" style="margin-top:15px;">
                                    Nessun utente ha ancora risposto a questa domanda.
                                </div>
                            <?php endif; ?>
                        </div> <!-- fine .card-content -->
                    </div> <!-- fine .card (domanda) -->
                <?php endforeach; // fine loop domande ?>
            <?php endif; // fine controllo empty($domande) ?>

            <?php // Messaggio sul totale dei partecipanti o se nessuno ha partecipato.
            if ($totalePartecipantiComplessivi == 0 && !empty($domande)) {
                echo '<div class="no-results"><p>';
                echo 'Nessun utente ha ancora partecipato a questo quiz.</p></div>';
            } elseif ($totalePartecipantiComplessivi > 0) {
                echo '<div class="card" style="text-align:center; margin-top:30px;"><div class="card-content" style="padding:15px;">Numero totale di partecipanti unici al quiz: <strong class="bold">' . $totalePartecipantiComplessivi . '</strong></div></div>';
            }
            ?>
        </div> <!-- fine .content -->
    </div> <!-- fine .main-content -->

    <?php 
    // Include il footer comune.
    include 'includes/footer.php'; 
    ?>
    <!-- Inizializzazione JavaScript per le barre di progresso e altri elementi dinamici -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Applica il colore corretto alle barre di progresso usando la classe definita nel data attribute.
            document.querySelectorAll('.answer-stat-block').forEach(block => {
                const progressBar = block.querySelector('.progress-bar');
                const barColorClass = block.dataset.barColorClass;
                if (progressBar && barColorClass) {
                    //progressBar.classList.add(barColorClass); // Aggiunge la classe per il colore
                     progressBar.style.backgroundColor = `var(--${barColorClass.replace('progress-bar-', 'score-')}-color, var(--primary-blue))`;
                }
            });
        });
    </script>
</body>
</html>