# 🛠️ Progetto di Migrazione Dati: Quiz Online

## 📌 Obiettivo

Migrare i dati dell’applicazione **"Quiz Online"**, originariamente sviluppata in PHP con database **MariaDB** e ostato da una macchina in Oracle, verso una nuova infrastruttura moderna basata su **Python/Django** e **PostgreSQL**.
La migrazione è orchestrata da una **Servlet Java** che agisce da intermediario tra i due sistemi.

&nbsp;

## 🏗️ Architettura Generale

Il sistema è suddiviso in **tre componenti principali**:

### 1. 🌐 Web Service Remoto PHP (Esportazione)

* **Tecnologia:** PHP
* **Database Sorgente:** MariaDB
* **Funzione:** Esportazione dei dati in formato JSON tramite endpoint (`.php`)
* **Formato di risposta JSON atteso:**

  ```json
  {
    "success": true,
    "data": [ /* array di oggetti */ ],
    "message": "Messaggio opzionale"
  }
  ```

### 2. 🐍 Web Service Locale Django (Importazione)

* **Tecnologia:** Python + Django + Django REST Framework
* **Database Destinazione:** PostgreSQL
* **Funzione:** Importazione dei dati JSON ricevuti, con gestione delle relazioni tramite `update_or_create`.
* **Note:**

  * Utilizza una **mappa temporanea in memoria** (`original_to_django_ids`) per tenere traccia della corrispondenza tra ID originali e ID nuovi.
  * Assicura **idempotenza** per rendere la migrazione ripetibile senza creare duplicati.


### 3. ☕ Servlet Java (Orchestrazione)

* **Tecnologia:** Java Servlet
* **Funzione:**

  1. Riceve la richiesta di avvio migrazione (`/migrate`)
  2. Chiama Django per **resettare la mappa ID**
  3. Recupera i dati da PHP ed effettua POST a Django per ogni entità
  4. Logga l’intero processo.

&nbsp;

## 🔄 Flusso di Migrazione Dati

Orchestrato dalla **Servlet Java**:

1. **Avvio Migrazione** → Richiesta GET a `/migrate`
2. **Reset Mappa ID Django**
   `POST /api/importer/clear_id_map/`
3. **Migrazione Entità (ordine importante):**

   * **Utenti**
     `GET export_users.php` → `POST /api/importer/users/`
   * **Quiz**
     `GET export_quizzes.php` → `POST /api/importer/quizzes/`
   * **Domande**
     `GET export_questions.php` → `POST /api/importer/questions/`
   * **Risposte**
     `GET export_answers.php` → `POST /api/importer/answers/`
   * **Partecipazioni**
     `GET export_participations.php` → `POST /api/importer/participations/`
   * **Risposte Utente a Quiz**
     `GET export_user_quiz_answers.php` → `POST /api/importer/user_quiz_answers/`
4. **Completamento** → Restituzione log dettagliato

&nbsp;

## 🗂️ Struttura del Progetto

### 📁 1. Web Service PHP (`quiz_online/migration_api/`)

* `export_users.php`
* `export_quizzes.php`
* `export_questions.php`
* `export_answers.php`
* `export_participations.php`
* `export_user_quiz_answers.php`

### 📁 2. Web Service Django (`data_migration_django/`)

#### 📌 Progetto Django: `data_migrator`

* `settings.py`: Configura app e database PostgreSQL
* `urls.py`: Include gli endpoint di `importer` (`/api/importer/`)

#### 📦 App Django: `importer`

* `models.py`: Definisce i modelli con campo per l'ID originale
* `serializers.py`: Serializer DRF (base)
* `views.py`:

  * Riceve JSON
  * Risolve Foreign Keys con la mappa ID
  * Usa `update_or_create`
  * Aggiorna la mappa ID in memoria
* `urls.py`: Endpoints per entità:

  * `/users/`, `/quizzes/`, `/questions/`, `/answers/`, `/participations/`, `/user_quiz_answers/`
  * `/clear_id_map/` per resettare la mappa
* `migrations/`: Migrazioni database

#### 📄 Script Django:

* `manage.py`: Script CLI di Django

---

### 📁 3. Servlet Java (Progetto Maven)

* `pom.xml`: Dipendenze: `servlet-api`, `jackson-databind`
* `MigrationServlet.java`:

  * Annotazione: `@WebServlet("/migrate")`
  * Costanti: `PHP_BASE_URL`, `DJANGO_BASE_URL`
  * Richieste: `HttpClient` per GET e POST
  * JSON: `ObjectMapper` per parsing
  * Metodo: `doGet()` esegue la migrazione passo-passo

&nbsp;

## ⚙️ Setup e Testing

1. **Avviare il Servizio PHP**

   * Verifica accesso agli script `.php`
   * Configura connessione a MariaDB

2. **Configurare PostgreSQL**

   * Creare database e utente con permessi

3. **Setup Django**

   ```bash
   python manage.py makemigrations importer
   python manage.py migrate
   python manage.py runserver
   ```

4. **Compilare e Deployare la Servlet**

   ```bash
   mvn clean package
   # Deploy su Apache Tomcat o altro server compatibile
   ```

5. **Avvio Migrazione**

   * Accedi da browser o terminale:
     `http://localhost:8080/<nome-progetto-servlet>/migrate`

6. **Verifica Risultati**

   * Controlla il database PostgreSQL
   * Analizza log servlet, Django e PHP per errori

&nbsp;

## ⚠️ Considerazioni Chiave

* **Ordine Entità:** Fondamentale per la corretta risoluzione delle Foreign Key
* **Idempotenza:** Migrazione ripetibile grazie a `update_or_create`
* **Mappa ID:** Gestita in memoria su Django, resettata dalla Servlet
* **Gestione Errori:** Ogni componente deve loggare correttamente per debugging efficace
* **Formato JSON:** Deve corrispondere perfettamente tra output PHP e input Django
