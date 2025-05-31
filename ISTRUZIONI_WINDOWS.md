ISTRUZIONI PER L'AVVIO DEL PROGETTO QUIZ ONLINE SU WINDOWS 10

Gentile Professore,

Questo script tenterà di automatizzare il setup e l'avvio del progetto.
Prima di eseguirlo, la preghiamo di assicurarsi di avere:

1.  PREREQUISITI INSTALLATI E NEL PATH DI SISTEMA:
    *   Python (3.8+): 'python' e 'pip' eseguibili.
    *   Java JDK (11+): 'java', 'javac' eseguibili, JAVA_HOME impostato.
    *   PostgreSQL (12+): Server PostgreSQL installato e IN ESECUZIONE. 'psql' eseguibile.
        Avrà bisogno della password dell'utente 'postgres'.
    *   Apache Maven (3.6+): 'mvn' eseguibile, M2_HOME impostato.
    *   APACHE TOMCAT (11 preferibilmente): Già installato e configurato.
        Lo script le chiederà il percorso della cartella 'webapps' di Tomcat.
        Dovrà assicurarsi che Tomcat sia in esecuzione dopo il deploy della servlet.

2.  ESECUZIONE DELLO SCRIPT:
    *   Faccia clic destro su "setup_avvio_progetto.bat" e scelga "Esegui come amministratore".
    *   Lo script le chiederà:
        *   La password dell'utente 'postgres' di PostgreSQL.
        *   Il percorso completo della cartella 'webapps' della sua installazione di Tomcat
            (es. C:\Program Files\Apache Software Foundation\Tomcat 11.0\webapps).

3.  UTILIZZO:
    *   Se tutto va bene, si aprirà una nuova finestra del Prompt dei Comandi per il server Django.
    *   Dovrà assicurarsi che il suo server Tomcat sia in esecuzione (o riavviarlo manualmente)
        dopo che lo script ha copiato il file della servlet.
    *   Django sarà su: http://127.0.0.1:8000/
    *   La Servlet su Tomcat (una volta avviato/riavviato) sarà su: http://localhost:8080/migration-servlet-app/