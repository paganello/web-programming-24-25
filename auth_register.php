<?php

/**
 * Pagina di Registrazione Nuovo Utente.
 *
 * Questa pagina gestisce il processo di registrazione per nuovi utenti,
 * includendo la validazione dei dati inseriti, la verifica dell'unicità
 * di nome utente ed email, e l'inserimento del nuovo utente nel database.
 */

// Inizializzazione della sessione PHP, se non già attiva.
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Se l'utente è già loggato, reindirizza alla pagina principale (index.php).
// Impedisce a un utente loggato di accedere nuovamente alla pagina di registrazione.
if (isset($_SESSION['user'])) {
    header('Location: index.php');
    exit;
}

// Include la configurazione del database per rendere disponibile $pdo.
require_once 'config/database.php';

// Inizializzazione delle variabili per messaggi di errore/successo e per
// popolare nuovamente i campi del form in caso di errore di validazione.
$error = '';        // Messaggio di errore.
$success = '';      // Messaggio di successo.
$nomeUtente = '';   // Valore per il campo 'nomeUtente'.
$nome = '';         // Valore per il campo 'nome'.
$cognome = '';      // Valore per il campo 'cognome'.
$eMail = '';        // Valore per il campo 'eMail'.

// --- Gestione del Form di Registrazione (quando inviato con metodo POST) ---
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Recupera i dati dal form, applicando trim() e usando null coalescing.
    $nomeUtente = trim($_POST['nomeUtente'] ?? '');
    $nome = trim($_POST['nome'] ?? '');
    $cognome = trim($_POST['cognome'] ?? '');
    $eMail = trim($_POST['eMail'] ?? '');

    // Validazione dei dati inseriti.
    if (empty($nomeUtente) || empty($nome) || empty($cognome) || empty($eMail)) {
        $error = 'Tutti i campi sono obbligatori';
    } elseif (!filter_var($eMail, FILTER_VALIDATE_EMAIL)) { // Validazione formato email.
        $error = 'Email non valida';
    } else {
        // Se la validazione di base è superata, procede con le verifiche sul database.
        try {
            // Verifica se il nome utente e/o l'email sono già registrati.
            // Utilizza una singola query con EXISTS per efficienza.
            $stmt = $pdo->prepare("
                SELECT 
                    EXISTS(SELECT 1 FROM Utente WHERE nomeUtente = :nomeUtente) as username_exists,
                    EXISTS(SELECT 1 FROM Utente WHERE eMail = :eMail) as email_exists
            ");
            $stmt->bindParam(':nomeUtente', $nomeUtente);
            $stmt->bindParam(':eMail', $eMail);
            $stmt->execute();
            $existence = $stmt->fetch(PDO::FETCH_ASSOC); // Recupera i risultati.

            $usernameExists = (bool)$existence['username_exists']; // Converte a booleano.
            $emailExists = (bool)$existence['email_exists'];
            
            $errorsFound = []; // Array per raccogliere errori di unicità.
            if ($usernameExists) {
                $errorsFound[] = 'Nome utente già registrato';
            }
            if ($emailExists) {
                $errorsFound[] = 'Email già registrata';
            }

            // Se sono stati trovati errori di unicità.
            if (!empty($errorsFound)) {
                $error = implode('. ', $errorsFound) . '.'; // Concatena i messaggi di errore.
            } else {
                // Nessun errore di unicità, procede con l'inserimento del nuovo utente.
                $stmt = $pdo->prepare("INSERT INTO Utente (nomeUtente, nome, cognome, eMail) VALUES (:nomeUtente, :nome, :cognome, :eMail)");
                $stmt->bindParam(':nomeUtente', $nomeUtente);
                $stmt->bindParam(':nome', $nome);
                $stmt->bindParam(':cognome', $cognome);
                $stmt->bindParam(':eMail', $eMail);

                if ($stmt->execute()) { // Se l'inserimento ha successo.
                    $success = 'Registrazione completata con successo! Ora puoi accedere.';
                    // Svuota le variabili dei campi del form per non ripopolarli dopo il successo.
                    $nomeUtente = $nome = $cognome = $eMail = ''; 
                } else {
                    $error = 'Errore durante la registrazione. Riprova.';
                }
            }
        } catch (PDOException $e) {
            // Gestione errori di connessione o query al database.
            error_log('Errore di registrazione DB (auth_register.php): ' . $e->getMessage()); // Log dell'errore.
            $error = 'Errore di connessione al database. Riprova più tardi.';
        }
    }
}
?>

<?php 
// Include l'header HTML comune.
include 'includes/header.php'; 
?>

<!-- Struttura principale della pagina di registrazione -->
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h1 class="page-main-title">Registrazione</h1> <!-- Titolo della pagina/card -->
                </div>
                <div class="card-body">
                    <?php if (!empty($error)): // Visualizza messaggio di errore, se presente ?>
                        <div class="alert alert-danger">
                            <?php echo htmlspecialchars($error, ENT_QUOTES, 'UTF-8'); ?>
                        </div>
                    <?php endif; ?>

                    <?php if (!empty($success)): // Visualizza messaggio di successo, se presente ?>
                        <div class="alert alert-success">
                            <?php echo htmlspecialchars($success, ENT_QUOTES, 'UTF-8'); ?>
                            <div class="mt-2"> <!-- Bottone per andare al login dopo successo -->
                                <a href="auth_login.php" class="btn btn-primary">Vai al login</a>
                            </div>
                        </div>
                    <?php else: // Mostra il form di registrazione solo se non c'è un messaggio di successo ?>
                        <form method="POST" action=""> <!-- Invia i dati a se stesso -->
                            <div class="form-group mb-3">
                                <label for="nomeUtente">Nome Utente</label>
                                <input type="text" class="form-control" id="nomeUtente" name="nomeUtente" required
                                    value="<?php echo htmlspecialchars($nomeUtente, ENT_QUOTES, 'UTF-8'); ?>"> <!-- Ripopola campo -->
                            </div>
                            <div class="form-group mb-3">
                                <label for="nome">Nome</label>
                                <input type="text" class="form-control" id="nome" name="nome" required
                                    value="<?php echo htmlspecialchars($nome, ENT_QUOTES, 'UTF-8'); ?>">
                            </div>
                            <div class="form-group mb-3">
                                <label for="cognome">Cognome</label>
                                <input type="text" class="form-control" id="cognome" name="cognome" required
                                    value="<?php echo htmlspecialchars($cognome, ENT_QUOTES, 'UTF-8'); ?>">
                            </div>
                            <div class="form-group mb-3">
                                <label for="eMail">Email</label>
                                <input type="email" class="form-control" id="eMail" name="eMail" required
                                    value="<?php echo htmlspecialchars($eMail, ENT_QUOTES, 'UTF-8'); ?>">
                            </div>
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary">Registrati</button>
                            </div>
                        </form>

                        <!-- Link per utenti già registrati -->
                        <div class="mt-3 text-center">
                            <p>Hai già un account? <a href="auth_login.php">Accedi</a></p>
                        </div>
                    <?php endif; // Fine del blocco condizionale per mostrare form o messaggio di successo ?>
                </div>
            </div>
        </div>
    </div>
</div>

<?php 
// Include il footer HTML comune.
include 'includes/footer.php'; 
?>