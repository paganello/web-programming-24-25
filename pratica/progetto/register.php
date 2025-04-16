<?php
// Inizializzazione della sessione
session_start();

// Se l'utente è già loggato, reindirizza alla home
if (isset($_SESSION['user'])) {
    header('Location: index.php');
    exit;
}

// Include la configurazione del database
require_once 'config/database.php';

$error = '';
$success = '';

// Gestione del form di registrazione
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nomeUtente = trim($_POST['nomeUtente'] ?? '');
    $nome = trim($_POST['nome'] ?? '');
    $cognome = trim($_POST['cognome'] ?? '');
    $eMail = trim($_POST['eMail'] ?? '');
    
    // Validazione di base
    if (empty($nomeUtente) || empty($nome) || empty($cognome) || empty($eMail)) {
        $error = 'Tutti i campi sono obbligatori';
    } elseif (!filter_var($eMail, FILTER_VALIDATE_EMAIL)) {
        $error = 'Email non valida';
    } else {
        try {
            // Verifica se il nome utente è già registrato
            $stmt = $pdo->prepare("SELECT nomeUtente FROM Utente WHERE nomeUtente = :nomeUtente");
            $stmt->bindParam(':nomeUtente', $nomeUtente);
            $stmt->execute();
            
            if ($stmt->rowCount() > 0) {
                $error = 'Nome utente già registrato';
            } else {
                // Verifica se l'email è già registrata
                $stmt = $pdo->prepare("SELECT nomeUtente FROM Utente WHERE eMail = :eMail");
                $stmt->bindParam(':eMail', $eMail);
                $stmt->execute();
                
                if ($stmt->rowCount() > 0) {
                    $error = 'Email già registrata';
                } else {
                    // Inserimento del nuovo utente
                    $stmt = $pdo->prepare("INSERT INTO Utente (nomeUtente, nome, cognome, eMail) VALUES (:nomeUtente, :nome, :cognome, :eMail)");
                    $stmt->bindParam(':nomeUtente', $nomeUtente);
                    $stmt->bindParam(':nome', $nome);
                    $stmt->bindParam(':cognome', $cognome);
                    $stmt->bindParam(':eMail', $eMail);
                    
                    if ($stmt->execute()) {
                        $success = 'Registrazione completata con successo! Ora puoi accedere.';
                    } else {
                        $error = 'Errore durante la registrazione';
                    }
                }
            }
        } catch (PDOException $e) {
            $error = 'Errore di connessione al database: ' . $e->getMessage();
        }
    }
}
?>

<?php include 'includes/header.php'; ?>
<?php include 'includes/nav.php'; ?>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h3 class="text-center">Registrazione</h3>
                </div>
                <div class="card-body">
                    <?php if (!empty($error)): ?>
                        <div class="alert alert-danger">
                            <?php echo htmlspecialchars($error); ?>
                        </div>
                    <?php endif; ?>
                    
                    <?php if (!empty($success)): ?>
                        <div class="alert alert-success">
                            <?php echo htmlspecialchars($success); ?>
                            <div class="mt-2">
                                <a href="login.php" class="btn btn-primary">Vai al login</a>
                            </div>
                        </div>
                    <?php else: ?>
                        <form method="POST" action="">
                            <div class="form-group mb-3">
                                <label for="nomeUtente">Nome Utente</label>
                                <input type="text" class="form-control" id="nomeUtente" name="nomeUtente" required value="<?php echo htmlspecialchars($nomeUtente ?? ''); ?>">
                            </div>
                            <div class="form-group mb-3">
                                <label for="nome">Nome</label>
                                <input type="text" class="form-control" id="nome" name="nome" required value="<?php echo htmlspecialchars($nome ?? ''); ?>">
                            </div>
                            <div class="form-group mb-3">
                                <label for="cognome">Cognome</label>
                                <input type="text" class="form-control" id="cognome" name="cognome" required value="<?php echo htmlspecialchars($cognome ?? ''); ?>">
                            </div>
                            <div class="form-group mb-3">
                                <label for="eMail">Email</label>
                                <input type="email" class="form-control" id="eMail" name="eMail" required value="<?php echo htmlspecialchars($eMail ?? ''); ?>">
                            </div>
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary">Registrati</button>
                            </div>
                        </form>
                        
                        <div class="mt-3 text-center">
                            <p>Hai già un account? <a href="login.php">Accedi</a></p>
                        </div>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </div>
</div>

<?php include 'includes/footer.php'; ?>
