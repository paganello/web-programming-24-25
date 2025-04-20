# 📘 Linee Guida di Implementazione del Progetto **Quiz Online**

## 📌 Introduzione
Il progetto **"Quiz Online"** è un'applicazione web sviluppata in PHP che permette agli utenti di **creare quiz personalizzati** e **partecipare** a quelli creati da altri. L'architettura segue il pattern **MVC (Model-View-Controller)**, adattato a un contesto PHP per una chiara separazione tra API e front-end.

## 🧱 Architettura del Sistema

### 🗃️ 1. Struttura del Database
Il database si basa sullo schema ER specificato nei documenti tecnici, e include le seguenti **entità principali**:

- **Utente**: informazioni e credenziali degli utenti registrati.
- **Quiz**: dati relativi ai quiz creati.
- **Domanda**: domande associate ai quiz.
- **Risposta**: opzioni di risposta per ogni domanda.
- **Partecipazione**: tracciamento degli utenti che partecipano ai quiz.
- **RispostaUtenteQuiz**: risposte fornite durante le sessioni di quiz.

### 🗂️ 2. Organizzazione del Codice

```
quiz_online/
├── api/                        # Endpoint API per le operazioni CRUD lato backend
│   ├── participation.php       # Gestione delle partecipazioni: registra risposte e punteggi degli utenti ai quiz
│   ├── questions.php           # Gestione delle domande: CRUD delle domande nei quiz
│   ├── quiz.php                # Gestione dei quiz: creazione, modifica, eliminazione e recupero dei quiz
│   └── users.php               # Gestione degli utenti: registrazione, login, profilo e autenticazione
│
├── assets/                     # Risorse statiche (es. immagini, icone, font)
│
├── css/                        # Fogli di stile CSS per l’interfaccia
│   └── style.css               # Foglio di stile principale, definisce layout, colori, tipografia e responsive design
│
├── js/                         # Script JavaScript per interazioni dinamiche
│   └── main.js                 # Script principale: gestisce le chiamate API, validazioni e dinamiche utente
│
├── config/                     # Configurazioni generali del sistema
│   └── database.php            # Configurazione della connessione PDO al database (host, username, password, charset)
│
├── includes/                   # Componenti HTML/PHP riutilizzabili in più pagine
│   ├── footer.php              # Footer comune per tutte le pagine
│   ├── header.php              # Intestazione HTML con meta tag, inclusione CSS/JS e apertura del body
│   └── nav.php                 # Barra di navigazione: link alle sezioni principali, login/logout dinamico
│
├── sql/                        # Script SQL per inizializzare e popolare il database
│   ├── script.sql              # Script di creazione delle tabelle e delle relazioni del database
│   └── data-seed.sql           # Script di popolamento con dati di esempio (quiz, domande, utenti, risposte)
│
├── quiz_create.php             # Interfaccia per la creazione di un nuovo quiz: aggiunta domande, risposte, date
├── quiz_modify.php             # Interfaccia per la modifica dei quiz: aggiunta e modifica domande, risposte, date
├── quiz_my.php                 # Interfaccia per la visualizzazione dei miei quiz
├── index.php                   # Homepage: introduzione al sito, accesso rapido ai quiz più recenti o consigliati
├── login.php                   # Form di login utente: invia dati a `users.php` per autenticazione
├── register.php                # Pagina per la registrazione di un nuovo utente con validazioni base
├── participate.php             # Pagina per partecipare a un quiz: visualizza domande, gestisce invio risposte
├── results.php                 # Mostra il risultato del quiz appena svolto, punteggio ottenuto, risposte corrette/errate
├── my_participations.php       # Visualizza le mie partecipazioni: quiz, data di partecipazione
└── quiz_view.php               # Dettaglio di un quiz: titolo, autore, numero di domande e date


```

## ⚙️ Approccio Implementativo

### 🔧 3.1 Backend
- **API RESTful** per le entità principali.
- Ogni file API gestisce **una singola risorsa**.
- Utilizzo di **PDO** con **prepared statements** per sicurezza e flessibilità.

### 🎨 3.2 Frontend
- Layout HTML: *header*, *nav*, *contenuto*, *footer*.
- **JavaScript** per interazioni dinamiche e chiamate API asincrone.
- **CSS** responsive per una UX ottimale su dispositivi diversi.

## 🚀 Funzionalità Principali

### 👤 4.1 Gestione Utenti
- **Registrazione** e **login**.
- **Profilo utente** con cronologia dei quiz creati e completati.

### 📝 4.2 Creazione Quiz
- Creazione di quiz con domande multiple.
- Impostazione di **date di apertura/chiusura**.
- Risposte multiple con **punteggi personalizzabili**.

### 🧩 4.3 Partecipazione ai Quiz
- Ricerca dei quiz disponibili.
- Interfaccia user-friendly per rispondere.
- Calcolo **automatico del punteggio** al termine.

### 📊 4.4 Visualizzazione Risultati
- Riepilogo quiz completati.

## 🔐 Considerazioni sulla Sicurezza

- **Validazione server-side** di tutti gli input.
- Protezione da **SQL Injection** tramite prepared statements.
- Gestione sicura delle **sessioni** utente.

## ⚡ Considerazioni sulle Prestazioni

- Query ottimizzate al database.
- **Riduzione** del numero di chiamate API.
- Caricamento **asincrono** dei contenuti.

## 📈 Estensioni Future

- Timer per quiz a tempo.
- Nuovi formati di domanda (es. immagini, audio).
- **Gamification**: badge, punteggi, classifiche.
- Esportazione risultati in **CSV, PDF** o altri formati.

## ✅ Conclusione

L'obiettivo dell'applicazione **Quiz Online** è offrire un sistema **facile da usare** che consenta una gestione completa dei quiz online. Il progetto è stato pensato per essere **espandibile**, in linea con le migliori pratiche di sviluppo web.



