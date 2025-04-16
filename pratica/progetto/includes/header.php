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
    <title>Quiz Online - UniVR</title>
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
                    <span>Benvenuto, <?php echo $_SESSION['user']['nome']; ?></span>
                    <a href="logout.php">Logout</a>
                <?php else: ?>
                    <a href="login.php">Login</a>
                    <a href="register.php">Registrati</a>
                <?php endif; ?>
            </div>
        </div>
    </header>
    
    <?php include 'includes/nav.php'; ?>
    
    <div class="container">
        <div id="alert-container"></div>
