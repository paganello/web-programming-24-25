<?php

/**
 * Header comune dell'applicazione
 * 
 * Questo file contiene l'intestazione HTML comune a tutte le pagine.
 * Include:
 * - Dichiarazione del doctype e tag meta
 * - Collegamenti ai fogli di stile CSS
 * - Collegamenti agli script JavaScript
 * - Logo e titolo dell'applicazione
 * - Gestione della sessione utente
 * - Inizio della struttura della pagina
 */

session_start();
require_once 'config/database.php';
?>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz Online - UniBG</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <header>
        <div class="container header-content">
            <div class="logo">
                <a href="index.php">QuizBG</a>
            </div>
                  
            <div class="user-info">
                <?php if(isset($_SESSION['user'])): ?>
                    <span class="user-welcome-text">
                        Benvenuto, <?php echo htmlspecialchars($_SESSION['user']['nome'], ENT_QUOTES, 'UTF-8'); ?>! &nbsp;
                    </span>
                    <a href="auth_logout.php" class="btn-header-auth btn-header-logout">Logout</a>
                <?php else: ?>
                    <a href="auth_login.php" class="btn-header-auth btn-header-login">Login</a> &nbsp;
                    <a href="auth_register.php" class="btn-header-auth btn-header-register">Registrati</a>
                <?php endif; ?>
            </div>

        </div>
    </header>
    
    <?php include 'includes/nav.php'; ?>
    
    <div class="container">
        <div id="alert-container"></div>
