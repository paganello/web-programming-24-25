<?php
// Inizializzazione della sessione PHP.
// È necessario per utilizzare le variabili di sessione (es. $_SESSION['user']).
// Controlla se una sessione è già attiva per evitare errori.
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// --- Reindirizzamento Utente Loggato ---
// Se l'utente ha già una sessione attiva (cioè è già loggato),
// viene reindirizzato immediatamente alla pagina principale (index.php)
// per evitare che visualizzi nuovamente la pagina di login.
if (isset($_SESSION['user'])) {
    header('Location: index.php'); // Esegue il reindirizzamento.
    exit; // Termina l'esecuzione dello script per assicurare che il reindirizzamento avvenga.
}

// Include il file di configurazione del database.
// Questo file stabilisce la connessione al database e rende disponibile la variabile $pdo.
require_once 'config/database.php';

$error = ''; // Inizializza la variabile per i messaggi di errore del form.

// --- Gestione del Form di Login (quando inviato con metodo POST) ---
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Recupera il nome utente dal form, applicando trim() per rimuovere spazi bianchi
    // e usando l'operatore null coalescing (??) per default a stringa vuota se non presente.
    $nomeUtente = trim($_POST['nomeUtente'] ?? '');

    // Validazione di base: controlla se il campo nome utente è stato compilato.
    if (empty($nomeUtente)) {
        $error = 'Inserisci il nome utente'; // Imposta messaggio di errore.
    } else {
        // Se il nome utente è fornito, tenta di autenticarlo.
        try {
            // Prepara una query SQL per selezionare l'utente dal database in base al nome utente.
            // L'uso di prepared statements (con bindParam) previene SQL injection.
            $stmt = $pdo->prepare("SELECT nomeUtente, nome, cognome, eMail FROM Utente WHERE nomeUtente = :nomeUtente");
            $stmt->bindParam(':nomeUtente', $nomeUtente, PDO::PARAM_STR); // Lega il valore alla variabile.
            $stmt->execute(); // Esegue la query.

            // Controlla se la query ha restituito almeno una riga (utente trovato).
            if ($stmt->rowCount() > 0) {
                $user = $stmt->fetch(PDO::FETCH_ASSOC); // Recupera i dati dell'utente come array associativo.

                // Login riuscito.

                // Salva le informazioni dell'utente nella sessione.
                // Questo marca l'utente come loggato per le richieste successive.
                $_SESSION['user'] = [
                    'nomeUtente' => $user['nomeUtente'],
                    'nome' => $user['nome'],
                    'cognome' => $user['cognome'],
                    'eMail' => $user['eMail']
                ];

                header('Location: index.php'); // Reindirizza l'utente alla pagina principale.
                exit; // Termina lo script.
            } else {
                // Se la query non restituisce righe, l'utente non è stato trovato.
                $error = 'Nome utente non trovato';
            }
        } catch (PDOException $e) {
            // Gestione degli errori di connessione o query al database.
            // In produzione, loggare l'errore e mostrare un messaggio più generico.
            $error = 'Errore di connessione al database: ' . $e->getMessage();
            // Per debug: error_log("Errore Login DB: " . $e->getMessage());
        }
    }
}
?>

<?php 
// Include l'header HTML comune della pagina.
// Questo file contiene l'inizio della struttura HTML, i tag <head>, l'header visivo, ecc.
include 'includes/header.php'; 
?>

<!-- Struttura principale della pagina di login -->
<div class="container mt-5"> <!-- mt-5 è una classe Bootstrap per margine superiore -->
    <div class="row justify-content-center"> <!-- Riga Bootstrap per centrare il contenuto -->
        <div class="col-md-6"> <!-- Colonna Bootstrap, occupa 6/12 della larghezza su schermi medi e grandi -->
            <div class="card"> <!-- Card Bootstrap per raggruppare il form -->
                <div class="card-header">
                    <h3 class="text-center">Accesso</h3> <!-- Titolo del form -->
                </div>
                <div class="card-body">
                    <?php if (!empty($error)): // Se ci sono messaggi di errore, visualizzali ?>
                        <div class="alert alert-danger"> <!-- Alert Bootstrap per errori -->
                            <?php echo htmlspecialchars($error, ENT_QUOTES, 'UTF-8'); // Visualizza l'errore, sanitizzandolo ?>
                        </div>
                    <?php endif; ?>

                    <!-- Form di Login -->
                    <form method="POST" action=""> <!-- Invia i dati a se stesso (questa pagina) con metodo POST -->
                        <div class="form-group mb-3"> <!-- Gruppo form Bootstrap con margine inferiore -->
                            <label for="nomeUtente">Nome Utente</label>
                            <input type="text" class="form-control" id="nomeUtente" name="nomeUtente" required> <!-- Campo input per nome utente -->
                        </div>
                        <div class="d-grid"> <!-- Contenitore Bootstrap per bottoni a larghezza piena -->
                            <button type="submit" class="btn btn-primary">Accedi</button> <!-- Bottone di submit -->
                        </div>
                    </form>

                    <!-- Link per la registrazione -->
                    <div class="mt-3 text-center">
                        <p>Non hai un account? <a href="auth_register.php">Registrati</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<?php 
// Include il footer HTML comune della pagina.
// Questo file contiene la chiusura dei tag HTML, script JavaScript, ecc.
include 'includes/footer.php'; 
?>