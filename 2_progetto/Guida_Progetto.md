# 🖥️ Guida - Quiz Online (Fase 2) su Windows 10

Gentile Professore,

questa guida le spiega come avviare il progetto **"Quiz Online - Fase 2"** in pochi minuti grazie a **Docker Desktop**.

## ✅ COSA SERVE

### 🔹 Requisito Unico: **Docker Desktop**

Docker è un programma che semplifica moltissimo l’avvio dei progetti. Una volta installato, fa tutto in automatico.

## 📥 1. Installazione di Docker Desktop

### Passaggi:

1. Aprire il browser (es. Chrome, Firefox, Edge).
2. Andare al sito ufficiale:  
   👉 [https://www.docker.com/products/docker-desktop/](https://www.docker.com/products/docker-desktop/)
3. Puntare con il cursore verso **Download Docker Desktop** e cliccare sul bottone **Download for Windows - AMD64**.
4. Attendere il completamento del download.
5. Fare **doppio clic** sul file scaricato (si chiama qualcosa come `Docker Desktop Installer.exe`).
6. Quando compare la finestra di installazione:
   - Lasciare tutte le opzioni predefinite.
   - Cliccare su **"OK"** o **"Avanti"** finché non parte l’installazione.
7. Al termine, se richiesto, **riavviare il computer**.
8. Dopo il riavvio, **avviare Docker Desktop**:
   - Cercare **Docker Desktop** nel menu Start e cliccare sull'icona della **balena** 🐳.

🔄 **Attendere che Docker sia pronto:**
- Vicino all’orologio (in basso a destra), appare l’icona della balena.
- Quando **non lampeggia più** e resta **bianca o verde**, Docker è pronto.

&nbsp;

## 📂 2. Preparazione del Progetto

### Estrazione della cartella ZIP

1. Ha ricevuto una **cartella compressa (.zip)**.
2. Fare **clic destro** sul file `.zip`, selezionare **"Estrai tutto..."**.
3. Scegliere una posizione facile da ricordare, come il **Desktop**.
4. Una volta estratto, aprire la nuova cartella, es: `QuizOnline`.

All'interno troverà:
- Questo file di istruzioni.
- Una cartella chiamata `QuizOnline_Docker_Setup`.

&nbsp;

## ▶️ 3. Avvio del Progetto

1. Aprire la cartella `QuizOnline_Docker_Setup`.
2. Fare **doppio clic** sul file `AVVIA_PROGETTO.bat`.

🔧 Cosa succede:
- Si apre una **finestra nera** (terminale).
- Docker **scaricherà automaticamente** tutto ciò che serve.
- Questo passaggio può durare **qualche minuto**, **solo la prima volta**.

⏳ **Attenda con pazienza**, anche se sembra fermo: il sistema sta lavorando.

&nbsp;

## 🌐 4. Accedere al Progetto

Quando il terminale mostra messaggi come **"running"** o **"listening"**, può aprire il browser e visitare:

- 🌍 Applicazione principale (Django):  
  👉 [http://localhost:8000/](http://localhost:8000/)

- 🌐 Applicazione Java Servlet:  
  👉 [http://localhost:8080/migration-servlet-app/](http://localhost:8080/migration-servlet-app/)

&nbsp;

## ⛔ 5. Come Fermare il Progetto

### Metodo semplice:

1. Tornare nella cartella `QuizOnline_Docker_Setup`.
2. Fare **doppio clic** su `ARRESTA_PROGETTO.bat`.

### Metodo alternativo (se preferisce farlo manualmente):

1. Nella finestra nera aperta durante l’avvio, premere sulla tastiera:
2. Poi, aprire una nuova finestra del prompt dei comandi e scrivere:

(Questo spegne tutto in modo pulito.)

&nbsp;

## ❓ Risoluzione dei Problemi Comuni

| Problema | Soluzione |
|---------|-----------|
| 🔴 Docker non parte | Verificare che **Docker Desktop sia avviato** (icona balena attiva). |
| 🔒 Messaggio del firewall | Se compare una finestra del firewall, cliccare su **"Consenti accesso"**. |
| 🌐 Nessun sito si apre | Verificare che la finestra nera non abbia mostrato errori. Attendere almeno 3–5 minuti. |
