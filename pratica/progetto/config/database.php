<?php

/**
 * Configurazione della connessione al database
 * 
 * Questo file gestisce la connessione al database MySQL utilizzato dall'applicazione.
 * Contiene:
 * - Parametri di connessione (host, nome database, username, password)
 * - Funzione per stabilire la connessione tramite PDO
 * - Gestione degli errori di connessione
 * - Configurazione delle opzioni PDO per una gestione ottimale
 * 
 * Utilizzato da tutti i file che necessitano di interagire con il database.
 */

define('DB_HOST', 'localhost');
define('DB_USER', 'quiz_user');
define('DB_PASS', '!*5633hH$rU7^t%65@J@');
define('DB_NAME', 'quiz_online');

function connectDB() {
    $conn = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
    
    if ($conn->connect_error) {
        die("Connessione fallita: " . $conn->connect_error);
    }
    
    $conn->set_charset("utf8mb4");
    
    return $conn;
}
