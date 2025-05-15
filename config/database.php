<?php

/**
 * Configurazione e Inizializzazione della Connessione al Database (PDO).
 *
 * Definisce i parametri di connessione e stabilisce l'oggetto PDO
 * per l'interazione con il database MySQL nell'applicazione.
 * Include gestione degli errori e opzioni PDO standard.
 */

// --- Parametri di Connessione al Database ---
// NOTA: In produzione, gestire le credenziali tramite variabili d'ambiente o file esterni.
define('DB_HOST', 'localhost');       // Host del server MySQL
define('DB_USER', 'quiz_user');       // Nome utente database
define('DB_PASS', '!*5633hH$rU7^t%65@J@'); // Password utente database
define('DB_NAME', 'quiz_online');     // Nome del database

// --- Tentativo di Connessione al Database tramite PDO ---
try {
    // DSN (Data Source Name) per MySQL, con charset utf8mb4 per supporto Unicode completo.
    $dsn = "mysql:host=" . DB_HOST . ";dbname=" . DB_NAME . ";charset=utf8mb4";

    // Opzioni di configurazione per l'oggetto PDO.
    $options = [
        PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION, // Lancia eccezioni PDOException in caso di errore.
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,       // Restituisce risultati come array associativi.
        PDO::ATTR_EMULATE_PREPARES   => false,                  // Utilizza prepared statements nativi (più sicuro e performante).
    ];

    // Creazione dell'istanza PDO globale.
    $pdo = new PDO($dsn, DB_USER, DB_PASS, $options);

} catch (PDOException $e) {
    // Gestione fallimento connessione.
    // In produzione: loggare l'errore e mostrare un messaggio generico all'utente.
    http_response_code(503); // Service Unavailable
    error_log("Errore Connessione DB (database.php): " . $e->getMessage()); // Log dell'errore.
    die(
        "Errore critico: Impossibile connettersi al database. Si prega di riprovare più tardi."
        // Per sviluppo, si può aggiungere: . " Dettagli: " . $e->getMessage()
    );
}
?>