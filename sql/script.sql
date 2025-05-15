/**
 * Script di Creazione del Database "quiz_online".
 *
 * Definisce la struttura completa del database per l'applicazione Quiz Online,
 * includendo la creazione delle tabelle, chiavi primarie, chiavi esterne
 * e vincoli di integrità referenziale.
 *
 * Operazioni eseguite:
 * 1. Pulizia opzionale di database e utente preesistenti.
 * 2. Creazione del database `quiz_online` con charset utf8mb4.
 * 3. Creazione dell'utente `quiz_user` e assegnazione dei privilegi.
 * 4. Selezione del database.
 * 5. Creazione delle tabelle: Utente, Quiz, Domanda, Risposta, Partecipazione, RispostaUtenteQuiz.
 */

-- Pulizia iniziale (opzionale, per sviluppo)
DROP DATABASE IF EXISTS quiz_online;
DROP USER IF EXISTS 'quiz_user'@'localhost';
DROP USER IF EXISTS 'quiz_user'@'%';

-- 1. Creazione del database
CREATE DATABASE quiz_online CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 2. Creazione utente e privilegi
CREATE USER 'quiz_user'@'localhost' IDENTIFIED BY '!*5633hH$rU7^t%65@J@';
GRANT ALL PRIVILEGES ON quiz_online.* TO 'quiz_user'@'localhost';
FLUSH PRIVILEGES;

-- 3. Selezione del database
USE quiz_online;

-- 4. Tabella Utente
CREATE TABLE Utente (
    nomeUtente VARCHAR(50) PRIMARY KEY,     -- Chiave primaria: username univoco
    nome VARCHAR(100) NOT NULL,
    cognome VARCHAR(100) NOT NULL,
    eMail VARCHAR(100) NOT NULL UNIQUE      -- Email univoca
);

-- 5. Tabella Quiz
CREATE TABLE Quiz (
    codice INT AUTO_INCREMENT PRIMARY KEY,   -- Chiave primaria: ID auto-incrementante del quiz
    titolo VARCHAR(255) NOT NULL,
    dataInizio DATE NOT NULL,
    dataFine DATE NOT NULL,
    creatore VARCHAR(50) NOT NULL,          -- FK: Utente che ha creato il quiz
    FOREIGN KEY (creatore) REFERENCES Utente(nomeUtente) ON DELETE CASCADE
);

-- 6. Tabella Domanda
CREATE TABLE Domanda (
    quiz INT NOT NULL,                      -- FK: ID del quiz (parte della PK composta)
    numero INT NOT NULL,                    -- Numero progressivo della domanda nel quiz (parte della PK composta)
    testo TEXT NOT NULL,
    PRIMARY KEY (quiz, numero),             -- PK composta
    FOREIGN KEY (quiz) REFERENCES Quiz(codice) ON DELETE CASCADE
);

-- 7. Tabella Risposta
CREATE TABLE Risposta (
    quiz INT NOT NULL,                      -- FK: ID del quiz (parte della PK composta)
    domanda INT NOT NULL,                   -- FK: Numero domanda (parte della PK composta)
    numero INT NOT NULL,                    -- Numero progressivo della risposta per la domanda (parte della PK composta)
    testo TEXT NOT NULL,
    tipo ENUM('Corretta', 'Sbagliata') NOT NULL, -- Indica se la risposta è corretta o sbagliata
    punteggio INT DEFAULT 0,                -- Punteggio assegnato alla risposta
    PRIMARY KEY (quiz, domanda, numero),    -- PK composta
    FOREIGN KEY (quiz, domanda) REFERENCES Domanda(quiz, numero) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 8. Tabella Partecipazione
CREATE TABLE Partecipazione (
    codice INT AUTO_INCREMENT PRIMARY KEY,   -- Chiave primaria: ID auto-incrementante della partecipazione
    utente VARCHAR(50) NOT NULL,           -- FK: Utente che ha partecipato
    quiz INT NOT NULL,                     -- FK: Quiz a cui si è partecipato
    data DATE NOT NULL,                    -- Data della partecipazione
    FOREIGN KEY (utente) REFERENCES Utente(nomeUtente) ON DELETE CASCADE,
    FOREIGN KEY (quiz) REFERENCES Quiz(codice) ON DELETE CASCADE
);

-- 9. Tabella RispostaUtenteQuiz
-- Associa le risposte date dall'utente a una specifica partecipazione.
CREATE TABLE RispostaUtenteQuiz (
    partecipazione INT NOT NULL,        -- FK: ID della partecipazione (parte della PK composta)
    quiz INT NOT NULL,                  -- FK: ID del quiz (parte della PK composta)
    domanda INT NOT NULL,               -- FK: Numero domanda (parte della PK composta)
    risposta INT NOT NULL,              -- FK: Numero risposta selezionata (parte della PK composta)
    PRIMARY KEY (partecipazione, quiz, domanda, risposta), -- PK composta
    FOREIGN KEY (partecipazione) REFERENCES Partecipazione(codice) ON DELETE CASCADE,
    FOREIGN KEY (quiz, domanda, risposta) REFERENCES Risposta(quiz, domanda, numero) ON DELETE CASCADE
);