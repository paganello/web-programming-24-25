<?php

/**
 * Pagina di visualizzazione delle partecipazioni dell'utente.
 * 
 * Questa pagina mostra le partecipazioni dell'utente ai quiz.
 */

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

if (!isset($_SESSION['user'])) {
    header("Location: auth_login.php");
    exit();
}

require_once 'includes/header.php';
?>

<!DOCTYPE html>
<html lang="it">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Le Mie Partecipazioni</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>

<body>
    <div class="container">
        <h1>Le Mie Partecipazioni</h1>
        <div id="alert-container"></div>
        <div id="partecipations-container"></div>
    </div>

    <?php include 'includes/footer.php'; ?>

    <script src="assets/js/main.js"></script>
</body>

</html>