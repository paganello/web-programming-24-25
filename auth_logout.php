<?php
// Inizializzazione della sessione PHP, se non già attiva.
// Necessario per poter manipolare la sessione.
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// --- Logout Utente ---

// 1. Rimuove tutte le variabili memorizzate nella sessione corrente.
// Ad esempio, se $_SESSION['user'] conteneva i dati dell'utente, viene svuotato.
session_unset();

// 2. Distrugge completamente la sessione sul server.
// Questo invalida l'ID di sessione e rimuove i dati associati.
session_destroy();

// --- Reindirizzamento Post-Logout ---
// Reindirizza l'utente alla pagina principale (index.php).
// In alternativa, potrebbe reindirizzare alla pagina di login (auth_login.php).
header('Location: index.php');
exit; // Termina l'esecuzione dello script per completare il reindirizzamento.
?>