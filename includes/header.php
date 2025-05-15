<?php

/**
 * Header Comune dell'Applicazione Quiz Online.
 *
 * Contiene l'intestazione HTML standard per tutte le pagine:
 * - Inizializzazione sessione e inclusione configurazione DB.
 * - Tag HTML base, metadati, collegamenti CSS.
 * - Logo, titolo, e gestione dinamica dei link utente (login/logout).
 * - Inclusione della barra di navigazione.
 * - Apertura dei contenitori principali del layout.
 */

// Avvia la sessione PHP se non già attiva.
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Include la configurazione del database.
require_once 'config/database.php';

// --- Determinazione della Classe del Body ---
// Aggiunge una classe CSS al tag <body> in base alla pagina corrente
// per permettere stili specifici per pagina.
$bodyClass = '';
$currentPage = basename($_SERVER['PHP_SELF']); // Nome del file corrente.

if ($currentPage == 'index.php') {
    $bodyClass = 'page-index';
} elseif ($currentPage == 'quiz_create.php') {
    $bodyClass = 'page-quiz-create';
} elseif ($currentPage == 'quiz_modify.php') {
    $bodyClass = 'page-quiz-modify';
}
// Aggiungere altre condizioni per classi body specifiche per altre pagine.

?>
<!DOCTYPE html>
<html lang="it"> <!-- Lingua del documento: Italiano -->
<head>
    <meta charset="UTF-8"> <!-- Codifica caratteri UTF-8 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- Viewport per responsività -->
    <title>Quiz Online - UniBG</title> <!-- Titolo pagina -->

    <!-- CSS principale -->
    <link rel="stylesheet" href="assets/css/style.css">
    
    <!-- Font Awesome (icone) da CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body class="<?php echo htmlspecialchars($bodyClass, ENT_QUOTES, 'UTF-8'); ?>"> <!-- Classe dinamica per il body -->
    <header>
        <div class="container header-content"> <!-- Contenitore header -->
            <div class="logo">
                <a href="index.php" title="Homepage Quiz UniBG">
                    <img src="https://upload.wikimedia.org/wikipedia/it/b/b4/UNIBG_Logo_2018.svg" alt="Logo Università degli Studi di Bergamo" id="header-logo">
                </a>
            </div>

            <div class="user-info"> <!-- Info utente e autenticazione -->
                <?php if(isset($_SESSION['user'])): // Se l'utente è loggato ?>
                    <span class="user-welcome-text">
                        Benvenuto, <?php echo htmlspecialchars($_SESSION['user']['nome'], ENT_QUOTES, 'UTF-8'); ?>!  
                    </span>
                    <a href="auth_logout.php" class="btn-header-auth btn-header-logout">Logout</a>
                <?php else: // Se l'utente non è loggato ?>
                    <a href="auth_login.php" class="btn-header-auth btn-header-login">Login</a>  
                    <a href="auth_register.php" class="btn-header-auth btn-header-register">Registrati</a>
                <?php endif; ?>
            </div>
        </div>
    </header>

    <?php 
        // Inclusione barra di navigazione.
        include 'includes/nav.php'; 
    ?>

    <!-- Contenitore principale del contenuto della pagina -->
    <div class="container main-page-container"> 
        <!-- Contenitore per alert globali della pagina -->
        <div id="alert-container-page" class="alert-container-fixed-top"></div>
    
    <!-- La chiusura di .main-page-container, </body> e </html> è nel footer.php -->