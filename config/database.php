<?php

/**
 * Configurazione e Inizializzazione della Connessione al Database.
 *
 * Questo script definisce i parametri necessari per la connessione al database MySQL
 * e stabilisce l'oggetto PDO (PHP Data Objects) che verrà utilizzato
 * in tutta l'applicazione per interagire con il database.
 *
 * Include la gestione degli errori di connessione e la configurazione
 * delle opzioni PDO per performance, sicurezza e modalità di fetch dei dati.
 *
 * È un file cruciale e viene incluso da tutti gli script che richiedono
 * accesso al database.
 */

// --- Parametri di Connessione al Database ---
// È consigliabile, per ambienti di produzione, spostare queste credenziali
// in variabili d'ambiente o file di configurazione non tracciati da Git
// per maggiore sicurezza.

/** @var string L'host del server MySQL (es. 'localhost' o un indirizzo IP). */
define('DB_HOST', 'localhost');

/** @var string Il nome utente per accedere al database. */
define('DB_USER', 'quiz_user');

/** @var string La password per l'utente del database. */
define('DB_PASS', '!*5633hH$rU7^t%65@J@');

/** @var string Il nome del database a cui connettersi. */
define('DB_NAME', 'quiz_online');

// --- Tentativo di Connessione al Database tramite PDO ---
try {
    // Costruzione del Data Source Name (DSN) per la connessione MySQL.
    // `charset=utf8mb4` è raccomandato per il supporto completo di Unicode (incluse emoji).
    $dsn = "mysql:host=" . DB_HOST . ";dbname=" . DB_NAME . ";charset=utf8mb4";

    // Opzioni di configurazione per l'oggetto PDO.
    $options = [
        // PDO::ATTR_ERRMODE: Imposta la modalità di gestione degli errori.
        // PDO::ERRMODE_EXCEPTION: Lancia eccezioni PDOException in caso di errore,
        // permettendo una gestione degli errori più robusta tramite blocchi try-catch.
        PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,

        // PDO::ATTR_DEFAULT_FETCH_MODE: Imposta la modalità di fetch di default.
        // PDO::FETCH_ASSOC: Restituisce i risultati come array associativi (nome_colonna => valore).
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,

        // PDO::ATTR_EMULATE_PREPARES: Disabilita l'emulazione dei prepared statements.
        // `false`: Utilizza i prepared statements nativi del driver MySQL.
        // Questo è generalmente più sicuro e performante, aiutando a prevenire SQL injection.
        PDO::ATTR_EMULATE_PREPARES   => false,
    ];

    // Creazione dell'istanza PDO.
    // Questa variabile $pdo sarà disponibile globalmente negli script che includono questo file.
    $pdo = new PDO($dsn, DB_USER, DB_PASS, $options);

} catch (PDOException $e) {
    // Gestione dell'errore in caso di fallimento della connessione.
    // In un ambiente di produzione, si potrebbe voler loggare l'errore in modo più dettagliato
    // e mostrare un messaggio generico all'utente, piuttosto che i dettagli dell'eccezione.
    // `die()` interrompe immediatamente l'esecuzione dello script.
    http_response_code(503); // Service Unavailable
    die("Errore critico: Impossibile connettersi al database. Si prega di riprovare più tardi. Dettagli tecnici (solo per sviluppatori): " . $e->getMessage());
}
?>