<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
session_unset(); // Rimuove tutte le variabili di sessione
session_destroy(); // Distrugge la sessione

header('Location: index.php');
exit;
