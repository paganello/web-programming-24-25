# 📘 Linee Guida di Implementazione del Progetto **Quiz Online**

## 📌 Introduzione

Il progetto **"Quiz Online"** è un'applicazione web sviluppata in **PHP** che consente agli utenti di **creare quiz personalizzati**, **partecipare ai quiz di altri utenti**, e **visualizzare risultati e statistiche**.
L'architettura segue il pattern **MVC (Model-View-Controller)**, adattato a un contesto PHP per garantire una **chiara separazione tra back-end e front-end**.

&nbsp;

## 🧱 Architettura del Sistema

### 🗃️ 1. Struttura del Database

Il database, conforme allo schema ER definito nei documenti tecnici, comprende le seguenti entità principali:

* **Utente**: credenziali, dati anagrafici e tracciamento delle attività.
* **Quiz**: metadati e configurazioni dei quiz.
* **Domanda**: contenuti delle domande associati ai quiz.
* **Risposta**: opzioni multiple per ogni domanda, con punteggio personalizzato.
* **Partecipazione**: traccia le sessioni utente-quiz.
* **RispostaUtenteQuiz**: registra le risposte date dagli utenti per ogni quiz svolto.

### 🗂️ 2. Organizzazione del Codice

```
quiz_online/
├── api/                        # Endpoint RESTful lato backend
│   ├── participation.php       # Gestione partecipazioni e risposte
│   ├── questions.php           # CRUD domande
│   ├── quiz.php                # CRUD quiz
│   └── users.php               # Autenticazione e gestione profili
│
├── assets/                     # Risorse statiche (immagini, icone)
├── css/
│   └── style.css               # Stili responsivi e UI moderna
├── js/
│   └── main.js                 # Chiamate API, validazioni, logica dinamica
│
├── config/
│   └── database.php            # Connessione PDO sicura
├── includes/
│   ├── footer.php
│   ├── header.php
│   └── nav.php
│
├── sql/
│   ├── script.sql              # Creazione schema DB
│   └── data-seed.sql           # Dati demo
│
├── index.php                   # Homepage
├── auth_login.php              # Login utente
├── auth_logout.php             # Logout
├── auth_register.php           # Registrazione utente
├── quiz_create.php             # Creazione quiz
├── quiz_search.php             # Ricerca e gestione quiz disponibili
├── quiz_modify.php             # Modifica quiz
├── quiz_info.php               # Statistiche quiz creati
├── quiz_my.php                 # I miei quiz
├── quiz_view.php               # Dettaglio quiz
├── quiz_participate.php        # Partecipazione quiz
├── quiz_results.php            # Risultato quiz svolto
└── quiz_partecipations.php     # Storico partecipazioni
```

&nbsp;

## ⚙️ Approccio Implementativo

### 🔧 3.1 Backend

* Implementazione di **API RESTful modulari**, una per ciascuna entità.
* Utilizzo di **PDO con prepared statements** per sicurezza da SQL Injection.
* **Controllo di integrità**: prevenzione di quiz duplicati lato server.

### 🎨 3.2 Frontend

* Layout HTML diviso in **header, nav, contenuto, footer**.
* **Interfaccia utente moderna e reattiva**, con stile fresco e minimal.
* **JavaScript asincrono** per comunicazione con API e UX fluida.
* **Gestione dei quiz disponibili** con:

  * Filtri per autore, data, titolo
  * Ordinamento (alfabetico, per popolarità, titolo, partecipazioni)
  * Impaginazione: visualizzazione a gruppi di **10, 20, 50 o 100 quiz per pagina**

&nbsp;

## 🚀 Funzionalità Principali

### 👤 4.1 Gestione Utenti

* Registrazione, login e logout sicuri
* Verifica sessione utente già loggato con redirect intelligente
* Profilo utente: storico quiz creati e partecipazioni

### 📝 4.2 Creazione e Modifica Quiz

* Aggiunta domande e risposte multiple con punteggi personalizzati
* Impostazione data di apertura/chiusura
* Prevenzione **quiz duplicati** tramite controllo su titolo e data
* Salvataggio progressivo in fase di creazione/modifica

### 🧩 4.3 Partecipazione ai Quiz

* Visualizzazione domande e risposte in **ordine randomico**
* Interfaccia semplice.

### 📊 4.4 Visualizzazione Risultati

* Al termine del quiz:
  * **Punteggio ottenuto**
  * **Correzione delle risposte**, con indicazione di quelle errate/corrette
* Accesso storico ai quiz svolti tramite sezione dedicata

### 📈 4.5 Statistiche Quiz Creati

* Statistiche aggregate sui quiz creati:

  * Numero partecipanti
  * Risposte effettuate dai vari partecipanti

&nbsp;

## 🔐 Considerazioni sulla Sicurezza

* **Validazioni lato server** per tutti i dati ricevuti
* **Prepared statements** per tutte le query al DB
* Filtri e controlli anti-spam lato form

&nbsp;

## ⚡ Considerazioni sulle Prestazioni

* Utilizzo di query ottimizzate e indicizzazioni nel DB
* Minimizzazione e caching delle risorse CSS/JS
* **Caricamento asincrono** dei contenuti per ridurre i tempi di attesa
* API ridotte al minimo necessario per ogni interazione