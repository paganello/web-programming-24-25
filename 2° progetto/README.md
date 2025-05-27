# Progetto di Migrazione Dati Quiz Online

Questo repository contiene il codice e le istruzioni per migrare i dati dell'applicazione "Quiz Online" da un database MariaDB (ospitato su Oracle e servito da un'applicazione PHP) a un database locale PostgreSQL (o MongoDB), utilizzando una pipeline di web service.

## Architettura della Migrazione

Il processo di migrazione coinvolge tre componenti principali:

1.  **Web Service Remoto (PHP):**
    *   **Posizione:** `1_PROGETTO_PHP_REMOTO/`
    *   **Tecnologia:** PHP
    *   **Database Sorgente:** MariaDB (esistente, parte del progetto "1° Progetto Quiz Online")
    *   **Funzione:** Espone i dati dal database MariaDB tramite endpoint API RESTful (nella sottocartella `migration_api/`).
    *   **Hosting:** Si assume sia hostato su una macchina Oracle o Altervista.

2.  **Strato Intermedio (Servlet Java):**
    *   **Posizione:** `3_SERVLET_JAVA_INTERMEDIA/`
    *   **Tecnologia:** Java Servlet (da deployare su Apache Tomcat)
    *   **Funzione:**
        *   Interroga il Web Service Remoto PHP per recuperare i dati.
        *   Trasforma/elabora i dati se necessario (attualmente agisce principalmente da proxy).
        *   Invia i dati al Web Service Locale Python/Django.

3.  **Web Service Locale (Python/Django):**
    *   **Posizione:** `2_PROGETTO_DJANGO_LOCALE/`
    *   **Tecnologia:** Python, Django, Django REST framework
    *   **Database Destinazione:** PostgreSQL (o MongoDB, configurabile) locale.
    *   **Funzione:**
        *   Riceve i dati dalla Servlet Java tramite endpoint API RESTful.
        *   Esegue la validazione e l'inserimento dei dati nel database locale (PostgreSQL/MongoDB).
        *   Gestisce la mappatura degli ID tra il database sorgente e quello di destinazione.

## Struttura della Repository

*   **`1_PROGETTO_PHP_REMOTO/`**: Contiene il codice sorgente del progetto PHP originale, inclusi gli script specifici per l'esportazione dei dati (`migration_api/`).
*   **`2_PROGETTO_DJANGO_LOCALE/`**: Contiene il progetto Django responsabile dell'importazione e del salvataggio dei dati nel database locale.
    *   `data_migrator/`: Cartella di configurazione del progetto Django.
    *   `importer/`: Applicazione Django che gestisce la logica di importazione (modelli, viste, serializers).
*   **`3_SERVLET_JAVA_INTERMEDIA/`**: Contiene il codice sorgente della Servlet Java.
    *   `target/migrator.war`: (Esempio) Il file WAR pre-compilato della servlet pronto per il deploy su Tomcat.
*   **`ISTRUZIONI_PROFESSORE.txt`**: Guida dettagliata per la configurazione e l'esecuzione del processo di migrazione.
*   **`start_migration_services.sh`**: (Opzionale) Script Bash per automatizzare l'avvio dei servizi Django e Tomcat in ambiente Linux.
*   **`README.md`**: Questo file.

## Prerequisiti Software (per l'ambiente locale)

Si assume che i seguenti software siano già installati e configurati sulla macchina locale dove verrà eseguita la migrazione:

*   Java JDK (versione 11+ consigliata per `java.net.http.HttpClient`, altrimenti Apache HttpClient)
*   Apache Tomcat (versione 8.5+ consigliata)
*   Python (versione 3.8+ consigliata)
*   pip (Python package installer)
*   Virtualenv (per creare ambienti Python isolati)
*   PostgreSQL (versione 12+ consigliata) O MongoDB (versione 4.x+ consigliata)
*   Git (per clonare questa repository)

## Istruzioni per la Configurazione e l'Esecuzione

Per istruzioni dettagliate sulla configurazione dell'ambiente, l'avvio dei servizi e l'esecuzione del processo di migrazione, fare riferimento al file:
**`ISTRUZIONI_PROFESSORE.txt`**

**Riassunto dei passaggi principali:**

1.  **Clonare la repository.**
2.  **Configurare il Web Service Remoto PHP:** Assicurarsi che sia deployato e accessibile.
3.  **Configurare il Database Locale:** Creare il database PostgreSQL/MongoDB e l'utente necessario.
4.  **Configurare il Progetto Django:**
    *   Creare e attivare un ambiente virtuale Python.
    *   Installare le dipendenze da `2_PROGETTO_DJANGO_LOCALE/requirements.txt`.
    *   Configurare la connessione al database in `2_PROGETTO_DJANGO_LOCALE/data_migrator/settings.py`.
    *   Eseguire le migrazioni Django (per PostgreSQL): `python manage.py migrate`.
5.  **Compilare e/o Configurare la Servlet Java:**
    *   Assicurarsi che gli URL dei servizi PHP e Django siano corretti nel codice della servlet (`MigrationServlet.java`).
    *   Compilare la servlet in un file `.war` (es. `migrator.war`).
6.  **Avviare i Servizi:**
    *   Avviare il server Django locale (`python manage.py runserver`).
    *   Deployare il file `.war` su Apache Tomcat e avviare Tomcat.
    *   (Opzionale) Usare lo script `start_migration_services.sh` dopo averlo configurato.
7.  **Eseguire la Migrazione:** Accedere all'URL della servlet Java tramite un browser web (es. `http://localhost:8080/migrator/migrate`).

## Entità da Migrare

Il processo mira a migrare le seguenti entità principali dal database MariaDB originale:

*   Utenti (`Utente`)
*   Quiz (`Quiz`)
*   Domande (`Domanda`)
*   Risposte (`Risposta`)
*   Partecipazioni ai Quiz (`Partecipazione`)
*   Risposte date dagli utenti ai quiz (`RispostaUtenteQuiz`)