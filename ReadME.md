# 📘 Linee Guida di Implementazione del Progetto **Quiz Online**

## 📌 Introduzione

Il progetto **"Quiz Online"** è una piattaforma web che consente agli utenti di **creare quiz personalizzati**, **partecipare ai quiz creati da altri utenti**, e **visualizzare risultati e statistiche** in maniera chiara e strutturata.

Lo sviluppo si articola in **due fasi distinte**:

1. **Prima fase**: implementazione iniziale con tecnologie classiche (PHP, HTML, CSS, JavaScript)
2. **Seconda fase**: conversione tecnica al framework Django (Python, Django, Bootstrap)

&nbsp;

## 🔁 Fasi di Sviluppo

### 🔹 Fase 1 – Implementazione con PHP

#### ⚙️ Tecnologie Utilizzate

* **PHP** per la logica server-side
* **HTML/CSS** per struttura e stile
* **JavaScript** per interattività e comunicazione asincrona
* **MySQL** come database relazionale

#### 📐 Architettura

* Architettura ispirata al pattern **MVC**
* Separazione tra logica, dati e presentazione
* Interazione tramite API REST-like sviluppate in PHP

#### 🧱 Funzionalità

* Gestione utenti con autenticazione sicura
* Creazione, modifica e pubblicazione quiz
* Partecipazione ai quiz con randomizzazione delle domande
* Visualizzazione risultati e storico quiz
* Statistiche riepilogative per i quiz creati
* Interfaccia utente reattiva e modulare

#### 🔐 Sicurezza

* Validazioni lato server
* Protezione da SQL injection con **PDO e prepared statements**
* Controlli su input e sessioni

#### ⚡ Prestazioni

* Query ottimizzate e indicizzazione del database
* Risorse ottimizzate (minificazione, caching)
* Comunicazione asincrona per una migliore esperienza utente

---

### 🔸 Fase 2 – Conversione con Django

#### ⚙️ Tecnologie Utilizzate

* **Python** con **Django** per il backend
* **Django ORM** per la gestione dei dati
* **Bootstrap** per la struttura front-end
* **SQLite/MySQL** come motore relazionale

#### 🧭 Obiettivi della Conversione

* Ristrutturare il progetto mantenendo le stesse funzionalità già sviluppate
* Riutilizzare lo stile e la struttura esistenti con eventuali piccole migliorie
* Organizzare il codice secondo il modello **app-based** di Django
* Migliorare la manutenibilità e l’estensibilità futura

#### 📦 Caratteristiche Tecniche

* Utilizzo del **template engine di Django** per il rendering server-side
* Routing e gestione URL tramite **URL dispatcher**
* Sistema di autenticazione integrato di Django
* Migrazione dei modelli dati su Django ORM mantenendo la logica originale

&nbsp;

### 🔄 Confronto tra le due fasi di sviluppo

| Aspetto                | **Fase 1 – PHP**                            | **Fase 2 – Django**                               |
| ---------------------- | ------------------------------------------- | ------------------------------------------------- |
| **Linguaggio Backend** | PHP                                         | Python                                            |
| **Framework**          | Nessuno (struttura modulare personalizzata) | Django                                            |
| **Architettura**       | Ispirata al pattern MVC                     | Model-View-Template (MVT)                         |
| **Database**           | MySQL, con accesso via PDO                  | SQLite/MySQL, gestito con Django ORM              |
| **Frontend**           | HTML, CSS personalizzato, JS                | Stesse strutture riutilizzate, con Bootstrap      |
| **Interfaccia Utente** | Base esistente                              | Stessa base, con piccoli adattamenti se necessari |
| **Autenticazione**     | Manuale (sessioni PHP)                      | Sistema built-in di Django                        |
| **API/Interazioni**    | REST-like in PHP + JavaScript               | Routing Django + eventuale uso di fetch/AJAX      |
| **Sicurezza**          | Validazioni + PDO                           | Middleware e strumenti integrati                  |
| **Gestione Codice**    | File separati per funzionalità              | Django apps modulari                              |
| **Estensibilità**      | Limitata senza refactoring                  | Elevata grazie alla struttura di Django           |
| **Obiettivo**          | Prima implementazione funzionale            | Conversione strutturale con tecnologia moderna    |

&nbsp;

## ✅ Conclusione

Il progetto **Quiz Online** viene sviluppato in due fasi con l’obiettivo di creare una piattaforma **modulare**, **scalabile** e **facilmente manutenibile**.
La prima fase pone le basi funzionali attraverso un’implementazione classica, mentre la seconda fase si concentra sulla ristrutturazione tecnica con un framework moderno, mantenendo la coerenza dell’esperienza utente.

Questo approccio permette una **migliore comprensione dei principi fondamentali dello sviluppo web**, con una successiva **adozione di buone pratiche di progettazione avanzata**.