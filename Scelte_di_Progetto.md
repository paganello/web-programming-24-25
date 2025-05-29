# 📄 Relazione Tecnica – Progetto *Quiz Online*

## 📌 Introduzione

Il progetto *Quiz Online* è stato sviluppato in due fasi distinte:

1. **Implementazione dell'applicazione web**, secondo i requisiti iniziali, utilizzando **PHP** e **MariaDB**, seguendo un approccio full-stack autonomo.
2. **Migrazione dell'intero sistema informativo** verso un'infrastruttura moderna, basata su **Django (Python)** e **PostgreSQL**, orchestrata tramite una **Servlet Java**.

L’obiettivo comune è stato garantire un sistema scalabile e ben strutturato, mantenendo la separazione delle responsabilità tra i vari livelli.

&nbsp;

## 🧱 Scelte Progettuali

### 🔹 **Fase 1 – Applicazione PHP + MariaDB**

#### ✅ **Architettura MVC**

L’intera applicazione PHP è costruita secondo il pattern **MVC**, che consente una chiara separazione tra:

* **Model**: gestione dei dati e accesso al database.
* **View**: interfaccia utente (HTML + CSS + JS).
* **Controller**: logica di coordinamento e routing.

Questa scelta ha migliorato la manutenibilità del codice e reso più agevole la migrazione successiva grazie all’astrazione dei dati.

#### ✅ **Struttura RESTful modulare**

Ogni entità (utenti, quiz, domande, risposte, partecipazioni) dispone di **endpoint API dedicati**, separando il frontend dal backend. Le API sono implementate in PHP come script autonomi, seguendo convenzioni REST semplificate.

Ciò ha consentito di costruire un frontend asincrono, reattivo e pronto all’interoperabilità.

#### ✅ **Sicurezza e validazione**

Le interazioni con il database utilizzano **PDO e prepared statements**, prevenendo attacchi SQL injection. La validazione dei dati avviene sia **lato client** (JavaScript) sia **lato server**, garantendo l’integrità e la correttezza dell’input utente.

Ulteriori controlli impediscono la creazione di quiz duplicati, proteggono gli endpoint sensibili e gestiscono correttamente le sessioni utente.

#### ✅ **Interfaccia responsive e user-friendly**

L’interfaccia utente è stata progettata con particolare attenzione all’usabilità:

* Layout modulare (header, nav, contenuto, footer)
* Filtro e ordinamento dei quiz per autore, data e titolo
* Paginazione scalabile (10, 20, 50, 100 quiz per pagina)
* Comportamento dinamico via **JavaScript asincrono**

#### ✅ **Progettazione del database**

Il modello dati relazionale è stato progettato secondo lo schema ER, includendo:

* Utenti e dati anagrafici
* Quiz, domande e risposte con punteggio
* Partecipazioni e risposte fornite
* Vincoli di integrità referenziale tra tutte le entità

Questa struttura ha favorito interrogazioni efficienti e ha supportato tutte le funzionalità richieste.

---

### 🔹 **Fase 2 – Migrazione verso Django + PostgreSQL**

#### ✅ **Orchestrazione centralizzata via Servlet Java**

La migrazione è stata gestita tramite una **Servlet Java** che ha il ruolo di coordinatore. La servlet:

1. Richiede l'avvio della migrazione
2. Reset di stato (mappa ID)
3. Recupera i dati via HTTP da PHP
4. Invia i dati al backend Django via POST

Questa strategia ha permesso di automatizzare la procedura mantenendo i due sistemi disaccoppiati e indipendenti.

#### ✅ **Formato di interscambio JSON standardizzato**

Tutti i dati migrati vengono esportati da PHP in formato **JSON strutturato**, con una risposta coerente del tipo:

```json
{
  "success": true,
  "data": [...],
  "message": "..."
}
```

Il formato comune ha semplificato la serializzazione, il parsing e il logging durante la migrazione.

#### ✅ **Importazione idempotente in Django**

L’API Django riceve i dati ed esegue operazioni **idempotenti** usando il metodo `update_or_create`. Questo garantisce che la stessa migrazione possa essere eseguita più volte senza creare duplicati, migliorando l’affidabilità e facilitando il debugging.

#### ✅ **Mappatura dinamica degli ID**

Poiché gli ID nei due sistemi non coincidono, Django mantiene una **mappa temporanea in memoria** (`original_to_django_ids`) per tracciare la corrispondenza tra gli ID originali (MariaDB) e i nuovi ID (PostgreSQL).

Questa scelta assicura la corretta ricostruzione delle relazioni tra entità (es. domande appartenenti a quiz, partecipazioni di utenti, risposte utente).

#### ✅ **Struttura modulare anche in Django**

Il backend Django segue la stessa logica modulare:

* Un’app `importer` dedicata alla migrazione
* Un endpoint per ogni entità (`/users/`, `/quizzes/`, ecc.)
* Un endpoint speciale `/clear_id_map/` per il reset della mappatura

Ogni entità è gestita separatamente, garantendo tracciabilità e granularità nelle operazioni di importazione.

&nbsp;

## 📌 Conclusioni

L’intero progetto è stato impostato secondo criteri di **modularità, sicurezza e futura estensibilità**. L’uso di API, il rispetto del pattern MVC e la standardizzazione dei formati hanno facilitato la migrazione e reso il sistema flessibile. La fase di migrazione ha adottato un approccio **robusto e ripetibile**, con orchestrazione centralizzata e importazione resiliente, confermando l’attenzione alla qualità progettuale e all'evoluzione tecnologica.
