/**
15 utenti con nomi, cognomi e email italianizzati
10 quiz su vari argomenti (Storia Italiana, Matematica, Cultura Generale, ecc.)
5 domande per ogni quiz
4 possibili risposte per ogni domanda, con indicazione della risposta corretta e dei punteggi
30 partecipazioni degli utenti ai quiz
*/

-- Popolamento tabella Utente
INSERT INTO Utente (nomeUtente, nome, cognome, eMail) VALUES
('mario_rossi', 'Mario', 'Rossi', 'mario.rossi@example.com'),
('giulia_bianchi', 'Giulia', 'Bianchi', 'giulia.bianchi@example.com'),
('luca_verdi', 'Luca', 'Verdi', 'luca.verdi@example.com'),
('anna_neri', 'Anna', 'Neri', 'anna.neri@example.com'),
('marco_blu', 'Marco', 'Blu', 'marco.blu@example.com'),
('sofia_gialli', 'Sofia', 'Gialli', 'sofia.gialli@example.com'),
('andrea_viola', 'Andrea', 'Viola', 'andrea.viola@example.com'),
('laura_rosa', 'Laura', 'Rosa', 'laura.rosa@example.com'),
('paolo_arancio', 'Paolo', 'Arancio', 'paolo.arancio@example.com'),
('chiara_azzurra', 'Chiara', 'Azzurra', 'chiara.azzurra@example.com'),
('roberto_marrone', 'Roberto', 'Marrone', 'roberto.marrone@example.com'),
('valentina_oro', 'Valentina', 'Oro', 'valentina.oro@example.com'),
('davide_argento', 'Davide', 'Argento', 'davide.argento@example.com'),
('elisa_bronzo', 'Elisa', 'Bronzo', 'elisa.bronzo@example.com'),
('fabio_platino', 'Fabio', 'Platino', 'fabio.platino@example.com');

-- Popolamento tabella Quiz
INSERT INTO Quiz (titolo, dataInizio, dataFine, creatore) VALUES
('Quiz di Storia Italiana', '2025-01-10', '2026-01-15', 'mario_rossi'),
('Matematica di Base', '2025-01-25', '2026-01-30', 'giulia_bianchi'),
('Cultura Generale', '2025-02-05', '2026-02-10', 'luca_verdi'),
('Geografia Mondiale', '2025-02-15', '2026-02-20', 'anna_neri'),
('Scienze Naturali', '2025-02-28', '2026-02-28', 'marco_blu'),
('Letteratura Italiana', '2025-03-08', '2026-03-10', 'sofia_gialli'),
('Cinema e Spettacolo', '2025-03-15', '2026-03-20', 'andrea_viola'),
('Sport e Olimpiadi', '2025-03-22', '2026-03-25', 'laura_rosa'),
('Arte e Architettura', '2025-03-29', '2026-03-30', 'paolo_arancio'),
('Musica Classica', '2025-04-05', '2026-04-10', 'chiara_azzurra');

-- Popolamento tabella Domanda per ogni Quiz
-- Quiz 1: Storia Italiana
INSERT INTO Domanda (quiz, numero, testo) VALUES
(1, 1, 'In che anno è stata proclamata l''Unità d''Italia?'),
(1, 2, 'Chi fu il primo Re d''Italia?'),
(1, 3, 'Cosa rappresentano i colori della bandiera italiana?'),
(1, 4, 'Chi è stato il primo Presidente della Repubblica Italiana?'),
(1, 5, 'In che anno è entrata in vigore la Costituzione della Repubblica Italiana?');

-- Quiz 2: Matematica di Base
INSERT INTO Domanda (quiz, numero, testo) VALUES
(2, 1, 'Quanto fa 7 × 8?'),
(2, 2, 'Qual è il valore di π (pi greco) approssimato a due decimali?'),
(2, 3, 'Quanto fa la radice quadrata di 144?'),
(2, 4, 'Qual è la formula per calcolare l''area di un triangolo?'),
(2, 5, 'Qual è il teorema di Pitagora?');

-- Quiz 3: Cultura Generale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(3, 1, 'Chi ha scritto "La Divina Commedia"?'),
(3, 2, 'Qual è l''elemento chimico più abbondante nell''universo?'),
(3, 3, 'Chi ha dipinto "La Gioconda"?'),
(3, 4, 'Qual è la capitale dell''Australia?'),
(3, 5, 'Chi ha formulato la teoria della relatività?');

-- Quiz 4: Geografia Mondiale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(4, 1, 'Qual è il fiume più lungo del mondo?'),
(4, 2, 'Quale è il continente più grande?'),
(4, 3, 'Qual è la montagna più alta del mondo?'),
(4, 4, 'Quale oceano è il più esteso?'),
(4, 5, 'Quale è il più piccolo stato del mondo?');

-- Quiz 5: Scienze Naturali
INSERT INTO Domanda (quiz, numero, testo) VALUES
(5, 1, 'Qual è l''organo principale del sistema circolatorio?'),
(5, 2, 'Come si chiama il processo attraverso cui le piante producono il loro nutrimento?'),
(5, 3, 'Qual è il simbolo chimico dell''oro?'),
(5, 4, 'Qual è il pianeta più vicino al Sole nel sistema solare?'),
(5, 5, 'Cosa studiano i paleontologi?');

-- Quiz 6: Letteratura Italiana
INSERT INTO Domanda (quiz, numero, testo) VALUES
(6, 1, 'Chi ha scritto "I Promessi Sposi"?'),
(6, 2, 'A quale corrente letteraria appartiene Giacomo Leopardi?'),
(6, 3, 'Chi è l''autore di "Il nome della rosa"?'),
(6, 4, 'Quale famoso poeta italiano ha scritto "L''infinito"?'),
(6, 5, 'Chi è il protagonista de "Il fu Mattia Pascal" di Luigi Pirandello?');

-- Quiz 7: Cinema e Spettacolo
INSERT INTO Domanda (quiz, numero, testo) VALUES
(7, 1, 'Chi ha diretto il film "La vita è bella"?'),
(7, 2, 'Chi interpreta James Bond nel film "Casino Royale" del 2006?'),
(7, 3, 'Quale attrice italiana ha vinto l''Oscar come miglior attrice protagonista per "La vita davanti a sé"?'),
(7, 4, 'Quale film ha vinto l''Oscar come miglior film nel 2020?'),
(7, 5, 'Chi è il regista di "Nuovo Cinema Paradiso"?');

-- Quiz 8: Sport e Olimpiadi
INSERT INTO Domanda (quiz, numero, testo) VALUES
(8, 1, 'In quale città si sono svolte le Olimpiadi del 2016?'),
(8, 2, 'Quanti giocatori compongono una squadra di pallavolo in campo?'),
(8, 3, 'Chi detiene il record mondiale dei 100 metri piani maschili?'),
(8, 4, 'In quale sport si utilizza il termine "strike"?'),
(8, 5, 'Quanti punti vale un calcio di rigore nel rugby?');

-- Quiz 9: Arte e Architettura
INSERT INTO Domanda (quiz, numero, testo) VALUES
(9, 1, 'Di che stile architettonico è la Basilica di San Pietro in Vaticano?'),
(9, 2, 'Chi ha progettato la Torre Eiffel?'),
(9, 3, 'In quale città si trova il museo del Louvre?'),
(9, 4, 'A quale movimento artistico appartiene Salvador Dalì?'),
(9, 5, 'Chi ha scolpito il David conservato a Firenze?');

-- Quiz 10: Musica Classica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(10, 1, 'Chi ha composto "Le quattro stagioni"?'),
(10, 2, 'Di quale nazionalità era Ludwig van Beethoven?'),
(10, 3, 'Qual è lo strumento principale utilizzato da Niccolò Paganini?'),
(10, 4, 'Chi ha composto l''opera "La Traviata"?'),
(10, 5, 'Quale compositore è noto come il "Salisburghese"?');

-- Popolamento tabella Risposta per Quiz 1: Storia Italiana
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(1, 1, 1, '1861', 'Corretta', 10),
(1, 1, 2, '1848', 'Sbagliata', 0),
(1, 1, 3, '1870', 'Sbagliata', 0),
(1, 1, 4, '1918', 'Sbagliata', 0);

-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(1, 2, 1, 'Vittorio Emanuele II', 'Corretta', 10),
(1, 2, 2, 'Umberto I', 'Sbagliata', 0),
(1, 2, 3, 'Carlo Alberto', 'Sbagliata', 0),
(1, 2, 4, 'Vittorio Emanuele III', 'Sbagliata', 0);

-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(1, 3, 1, 'Verde: speranza, Bianco: fede, Rosso: carità', 'Corretta', 10),
(1, 3, 2, 'Verde: agricoltura, Bianco: neve delle Alpi, Rosso: sangue dei caduti', 'Sbagliata', 5),
(1, 3, 3, 'Verde: libertà, Bianco: uguaglianza, Rosso: fraternità', 'Sbagliata', 0),
(1, 3, 4, 'Non hanno un significato specifico', 'Sbagliata', 0);

-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(1, 4, 1, 'Enrico De Nicola', 'Corretta', 10),
(1, 4, 2, 'Luigi Einaudi', 'Sbagliata', 0),
(1, 4, 3, 'Giovanni Gronchi', 'Sbagliata', 0),
(1, 4, 4, 'Alcide De Gasperi', 'Sbagliata', 0);

-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(1, 5, 1, '1948', 'Corretta', 10),
(1, 5, 2, '1945', 'Sbagliata', 0),
(1, 5, 3, '1946', 'Sbagliata', 0),
(1, 5, 4, '1950', 'Sbagliata', 0);

-- Popolamento tabella Risposta per Quiz 2: Matematica di Base
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(2, 1, 1, '56', 'Corretta', 10),
(2, 1, 2, '54', 'Sbagliata', 0),
(2, 1, 3, '58', 'Sbagliata', 0),
(2, 1, 4, '49', 'Sbagliata', 0);

-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(2, 2, 1, '3,14', 'Corretta', 10),
(2, 2, 2, '3,12', 'Sbagliata', 0),
(2, 2, 3, '3,16', 'Sbagliata', 0),
(2, 2, 4, '3,18', 'Sbagliata', 0);

-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(2, 3, 1, '12', 'Corretta', 10),
(2, 3, 2, '14', 'Sbagliata', 0),
(2, 3, 3, '10', 'Sbagliata', 0),
(2, 3, 4, '11', 'Sbagliata', 0);

-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(2, 4, 1, '(base × altezza) ÷ 2', 'Corretta', 10),
(2, 4, 2, 'base × altezza', 'Sbagliata', 0),
(2, 4, 3, 'base + altezza', 'Sbagliata', 0),
(2, 4, 4, 'base × altezza × 2', 'Sbagliata', 0);

-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(2, 5, 1, 'In un triangolo rettangolo, il quadrato dell''ipotenusa è uguale alla somma dei quadrati dei cateti', 'Corretta', 10),
(2, 5, 2, 'In un triangolo qualsiasi, la somma degli angoli interni è 180°', 'Sbagliata', 0),
(2, 5, 3, 'In un triangolo isoscele, due lati sono uguali', 'Sbagliata', 0),
(2, 5, 4, 'In un triangolo equilatero, tutti i lati hanno la stessa lunghezza', 'Sbagliata', 0);

-- Popolamento tabella Risposta per Quiz 3: Cultura Generale
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(3, 1, 1, 'Dante Alighieri', 'Corretta', 10),
(3, 1, 2, 'Francesco Petrarca', 'Sbagliata', 0),
(3, 1, 3, 'Giovanni Boccaccio', 'Sbagliata', 0),
(3, 1, 4, 'Ludovico Ariosto', 'Sbagliata', 0);

-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(3, 2, 1, 'Idrogeno', 'Corretta', 10),
(3, 2, 2, 'Ossigeno', 'Sbagliata', 0),
(3, 2, 3, 'Carbonio', 'Sbagliata', 0),
(3, 2, 4, 'Azoto', 'Sbagliata', 0);

-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(3, 3, 1, 'Leonardo da Vinci', 'Corretta', 10),
(3, 3, 2, 'Michelangelo Buonarroti', 'Sbagliata', 0),
(3, 3, 3, 'Raffaello Sanzio', 'Sbagliata', 0),
(3, 3, 4, 'Sandro Botticelli', 'Sbagliata', 0);

-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(3, 4, 1, 'Canberra', 'Corretta', 10),
(3, 4, 2, 'Sydney', 'Sbagliata', 0),
(3, 4, 3, 'Melbourne', 'Sbagliata', 0),
(3, 4, 4, 'Brisbane', 'Sbagliata', 0);

-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(3, 5, 1, 'Albert Einstein', 'Corretta', 10),
(3, 5, 2, 'Isaac Newton', 'Sbagliata', 0),
(3, 5, 3, 'Galileo Galilei', 'Sbagliata', 0),
(3, 5, 4, 'Stephen Hawking', 'Sbagliata', 0);

-- Popolamento tabella Risposta per Quiz 4: Geografia Mondiale
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(4, 1, 1, 'Nilo', 'Corretta', 10),
(4, 1, 2, 'Amazzoni', 'Sbagliata', 5),
(4, 1, 3, 'Mississippi', 'Sbagliata', 0),
(4, 1, 4, 'Gange', 'Sbagliata', 0);

-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(4, 2, 1, 'Asia', 'Corretta', 10),
(4, 2, 2, 'Africa', 'Sbagliata', 0),
(4, 2, 3, 'America', 'Sbagliata', 0),
(4, 2, 4, 'Europa', 'Sbagliata', 0);

-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(4, 3, 1, 'Monte Everest', 'Corretta', 10),
(4, 3, 2, 'K2', 'Sbagliata', 0),
(4, 3, 3, 'Monte Bianco', 'Sbagliata', 0),
(4, 3, 4, 'Kilimanjaro', 'Sbagliata', 0);

-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(4, 4, 1, 'Oceano Pacifico', 'Corretta', 10),
(4, 4, 2, 'Oceano Atlantico', 'Sbagliata', 0),
(4, 4, 3, 'Oceano Indiano', 'Sbagliata', 0),
(4, 4, 4, 'Oceano Artico', 'Sbagliata', 0);

-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(4, 5, 1, 'Città del Vaticano', 'Corretta', 10),
(4, 5, 2, 'Monaco', 'Sbagliata', 5),
(4, 5, 3, 'San Marino', 'Sbagliata', 0),
(4, 5, 4, 'Nauru', 'Sbagliata', 0);

-- Popolamento tabella Risposta per Quiz 5: Scienze Naturali
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(5, 1, 1, 'Cuore', 'Corretta', 10),
(5, 1, 2, 'Polmoni', 'Sbagliata', 0),
(5, 1, 3, 'Fegato', 'Sbagliata', 0),
(5, 1, 4, 'Cervello', 'Sbagliata', 0);

-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(5, 2, 1, 'Fotosintesi', 'Corretta', 10),
(5, 2, 2, 'Respirazione', 'Sbagliata', 0),
(5, 2, 3, 'Osmosi', 'Sbagliata', 0),
(5, 2, 4, 'Digestione', 'Sbagliata', 0);

-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(5, 3, 1, 'Au', 'Corretta', 10),
(5, 3, 2, 'Ag', 'Sbagliata', 0),
(5, 3, 3, 'Or', 'Sbagliata', 0),
(5, 3, 4, 'Go', 'Sbagliata', 0);

-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(5, 4, 1, 'Mercurio', 'Corretta', 10),
(5, 4, 2, 'Venere', 'Sbagliata', 0),
(5, 4, 3, 'Marte', 'Sbagliata', 0),
(5, 4, 4, 'Terra', 'Sbagliata', 0);

-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(5, 5, 1, 'Fossili', 'Corretta', 10),
(5, 5, 2, 'Rocce', 'Sbagliata', 0),
(5, 5, 3, 'Vulcani', 'Sbagliata', 0),
(5, 5, 4, 'Terremoti', 'Sbagliata', 0);

-- Popolamento tabella Risposta per Quiz 6: Letteratura Italiana
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(6, 1, 1, 'Alessandro Manzoni', 'Corretta', 10),
(6, 1, 2, 'Giacomo Leopardi', 'Sbagliata', 0),
(6, 1, 3, 'Giovanni Verga', 'Sbagliata', 0),
(6, 1, 4, 'Italo Calvino', 'Sbagliata', 0);

-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(6, 2, 1, 'Romanticismo', 'Corretta', 10),
(6, 2, 2, 'Illuminismo', 'Sbagliata', 0),
(6, 2, 3, 'Verismo', 'Sbagliata', 0),
(6, 2, 4, 'Futurismo', 'Sbagliata', 0);

-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(6, 3, 1, 'Umberto Eco', 'Corretta', 10),
(6, 3, 2, 'Italo Calvino', 'Sbagliata', 0),
(6, 3, 3, 'Andrea Camilleri', 'Sbagliata', 0),
(6, 3, 4, 'Alberto Moravia', 'Sbagliata', 0);

-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(6, 4, 1, 'Giacomo Leopardi', 'Corretta', 10),
(6, 4, 2, 'Ugo Foscolo', 'Sbagliata', 0),
(6, 4, 3, 'Giuseppe Ungaretti', 'Sbagliata', 0),
(6, 4, 4, 'Eugenio Montale', 'Sbagliata', 0);

-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(6, 5, 1, 'Mattia Pascal', 'Corretta', 10),
(6, 5, 2, 'Vitangelo Moscarda', 'Sbagliata', 0),
(6, 5, 3, 'Serafino Gubbio', 'Sbagliata', 0),
(6, 5, 4, 'Adriano Meis', 'Sbagliata', 5);

-- Popolamento tabella Risposta per Quiz 7: Cinema e Spettacolo
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(7, 1, 1, 'Roberto Benigni', 'Corretta', 10),
(7, 1, 2, 'Federico Fellini', 'Sbagliata', 0),
(7, 1, 3, 'Giuseppe Tornatore', 'Sbagliata', 0),
(7, 1, 4, 'Paolo Sorrentino', 'Sbagliata', 0);

-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(7, 2, 1, 'Daniel Craig', 'Corretta', 10),
(7, 2, 2, 'Pierce Brosnan', 'Sbagliata', 0),
(7, 2, 3, 'Sean Connery', 'Sbagliata', 0),
(7, 2, 4, 'Roger Moore', 'Sbagliata', 0);

-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(7, 3, 1, 'Sophia Loren', 'Corretta', 10),
(7, 3, 2, 'Anna Magnani', 'Sbagliata', 0),
(7, 3, 3, 'Monica Bellucci', 'Sbagliata', 0),
(7, 3, 4, 'Isabella Rossellini', 'Sbagliata', 0);

-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(7, 4, 1, 'Parasite', 'Corretta', 10),
(7, 4, 2, '1917', 'Sbagliata', 0),
(7, 4, 3, 'C''era una volta... a Hollywood', 'Sbagliata', 0),
(7, 4, 4, 'Joker', 'Sbagliata', 0);

-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(7, 5, 1, 'Giuseppe Tornatore', 'Corretta', 10),
(7, 5, 2, 'Federico Fellini', 'Sbagliata', 0),
(7, 5, 3, 'Roberto Benigni', 'Sbagliata', 0),
(7, 5, 4, 'Bernardo Bertolucci', 'Sbagliata', 0);

-- Popolamento tabella Risposta per Quiz 8: Sport e Olimpiadi
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(8, 1, 1, 'Rio de Janeiro', 'Corretta', 10),
(8, 1, 2, 'Tokyo', 'Sbagliata', 0),
(8, 1, 3, 'Londra', 'Sbagliata', 0),
(8, 1, 4, 'Pechino', 'Sbagliata', 0);

-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(8, 2, 1, '6', 'Corretta', 10),
(8, 2, 2, '5', 'Sbagliata', 0),
(8, 2, 3, '7', 'Sbagliata', 0),
(8, 2, 4, '8', 'Sbagliata', 0);

-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(8, 3, 1, 'Usain Bolt', 'Corretta', 10),
(8, 3, 2, 'Justin Gatlin', 'Sbagliata', 0),
(8, 3, 3, 'Carl Lewis', 'Sbagliata', 0),
(8, 3, 4, 'Marcell Jacobs', 'Sbagliata', 0);

-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(8, 4, 1, 'Bowling', 'Corretta', 10),
(8, 4, 2, 'Baseball', 'Sbagliata', 5),
(8, 4, 3, 'Cricket', 'Sbagliata', 0),
(8, 4, 4, 'Golf', 'Sbagliata', 0);

-- Domanda 5 (Quiz 8: Sport e Olimpiadi)
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(8, 5, 1, '3', 'Corretta', 10),
(8, 5, 2, '2', 'Sbagliata', 0),
(8, 5, 3, '5', 'Sbagliata', 0),
(8, 5, 4, '1', 'Sbagliata', 0);

-- Popolamento tabella Risposta per Quiz 9: Arte e Architettura
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(9, 1, 1, 'Barocco', 'Corretta', 10),
(9, 1, 2, 'Gotico', 'Sbagliata', 0),
(9, 1, 3, 'Romanico', 'Sbagliata', 0),
(9, 1, 4, 'Rinascimentale', 'Sbagliata', 5);

-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(9, 2, 1, 'Gustave Eiffel', 'Corretta', 10),
(9, 2, 2, 'Antoni Gaudí', 'Sbagliata', 0),
(9, 2, 3, 'Le Corbusier', 'Sbagliata', 0),
(9, 2, 4, 'Frank Lloyd Wright', 'Sbagliata', 0);

-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(9, 3, 1, 'Parigi', 'Corretta', 10),
(9, 3, 2, 'Roma', 'Sbagliata', 0),
(9, 3, 3, 'Madrid', 'Sbagliata', 0),
(9, 3, 4, 'Londra', 'Sbagliata', 0);

-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(9, 4, 1, 'Surrealismo', 'Corretta', 10),
(9, 4, 2, 'Cubismo', 'Sbagliata', 0),
(9, 4, 3, 'Impressionismo', 'Sbagliata', 0),
(9, 4, 4, 'Futurismo', 'Sbagliata', 0);

-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(9, 5, 1, 'Michelangelo Buonarroti', 'Corretta', 10),
(9, 5, 2, 'Leonardo da Vinci', 'Sbagliata', 0),
(9, 5, 3, 'Donatello', 'Sbagliata', 0),
(9, 5, 4, 'Gian Lorenzo Bernini', 'Sbagliata', 0);

-- Popolamento tabella Risposta per Quiz 10: Musica Classica
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(10, 1, 1, 'Antonio Vivaldi', 'Corretta', 10),
(10, 1, 2, 'Johann Sebastian Bach', 'Sbagliata', 0),
(10, 1, 3, 'Wolfgang Amadeus Mozart', 'Sbagliata', 0),
(10, 1, 4, 'Ludwig van Beethoven', 'Sbagliata', 0);

-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(10, 2, 1, 'Tedesca', 'Corretta', 10),
(10, 2, 2, 'Austriaca', 'Sbagliata', 5),
(10, 2, 3, 'Italiana', 'Sbagliata', 0),
(10, 2, 4, 'Francese', 'Sbagliata', 0);

-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(10, 3, 1, 'Violino', 'Corretta', 10),
(10, 3, 2, 'Pianoforte', 'Sbagliata', 0),
(10, 3, 3, 'Violoncello', 'Sbagliata', 0),
(10, 3, 4, 'Flauto', 'Sbagliata', 0);

-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(10, 4, 1, 'Giuseppe Verdi', 'Corretta', 10),
(10, 4, 2, 'Giacomo Puccini', 'Sbagliata', 0),
(10, 4, 3, 'Gioachino Rossini', 'Sbagliata', 0),
(10, 4, 4, 'Gaetano Donizetti', 'Sbagliata', 0);

-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(10, 5, 1, 'Wolfgang Amadeus Mozart', 'Corretta', 10),
(10, 5, 2, 'Franz Schubert', 'Sbagliata', 0),
(10, 5, 3, 'Johann Sebastian Bach', 'Sbagliata', 0),
(10, 5, 4, 'Franz Joseph Haydn', 'Sbagliata', 0);

-- Popolamento tabella Partecipazione (30 partecipazioni)
INSERT INTO Partecipazione (utente, quiz, data) VALUES
('mario_rossi', 2, '2025-01-20'),
('giulia_bianchi', 1, '2025-01-30'),
('luca_verdi', 3, '2025-02-10'),
('anna_neri', 4, '2025-02-18'),
('marco_blu', 5, '2025-03-02'),
('sofia_gialli', 6, '2025-03-10'),
('andrea_viola', 7, '2025-03-18'),
('laura_rosa', 8, '2025-03-25'),
('paolo_arancio', 9, '2025-04-01'),
('chiara_azzurra', 10, '2025-04-08'),
('roberto_marrone', 1, '2025-01-22'),
('valentina_oro', 2, '2025-02-01'),
('davide_argento', 3, '2025-02-12'),
('elisa_bronzo', 4, '2025-02-22'),
('fabio_platino', 5, '2025-03-04'),
('mario_rossi', 6, '2025-03-12'),
('giulia_bianchi', 7, '2025-03-20'),
('luca_verdi', 8, '2025-03-26'),
('anna_neri', 9, '2025-04-03'),
('marco_blu', 10, '2025-04-09'),
('sofia_gialli', 1, '2025-01-25'),
('andrea_viola', 2, '2025-02-03'),
('laura_rosa', 3, '2025-02-15'),
('paolo_arancio', 4, '2025-02-25'),
('chiara_azzurra', 5, '2025-03-06'),
('roberto_marrone', 6, '2025-03-14'),
('valentina_oro', 7, '2025-03-21'),
('davide_argento', 8, '2025-03-28'),
('elisa_bronzo', 9, '2025-04-04'),
('fabio_platino', 10, '2025-04-10');

-- Popolamento tabella RispostaUtenteQuiz (risposte degli utenti alle domande)
-- Partecipazione 1: mario_rossi al Quiz 2
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(1, 2, 1, 1), -- Corretta
(1, 2, 2, 1), -- Corretta
(1, 2, 3, 2), -- Sbagliata
(1, 2, 4, 1), -- Corretta
(1, 2, 5, 1); -- Corretta

-- Partecipazione 2: giulia_bianchi al Quiz 1
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(2, 1, 1, 1), -- Corretta
(2, 1, 2, 1), -- Corretta
(2, 1, 3, 1), -- Corretta
(2, 1, 4, 2), -- Sbagliata
(2, 1, 5, 1); -- Corretta

-- Partecipazione 3: luca_verdi al Quiz 3
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(3, 3, 1, 1), -- Corretta
(3, 3, 2, 1), -- Corretta
(3, 3, 3, 1), -- Corretta
(3, 3, 4, 1), -- Corretta
(3, 3, 5, 1); -- Corretta

-- Partecipazione 4: anna_neri al Quiz 4
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(4, 4, 1, 1), -- Corretta
(4, 4, 2, 2), -- Sbagliata
(4, 4, 3, 1), -- Corretta
(4, 4, 4, 1), -- Corretta
(4, 4, 5, 1); -- Corretta

-- Partecipazione 5: marco_blu al Quiz 5
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(5, 5, 1, 1), -- Corretta
(5, 5, 2, 1), -- Corretta
(5, 5, 3, 3), -- Sbagliata
(5, 5, 4, 1), -- Corretta
(5, 5, 5, 2); -- Sbagliata

-- Aggiungo altre 5 partecipazioni dettagliate
-- Partecipazione 6: sofia_gialli al Quiz 6
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(6, 6, 1, 1), -- Corretta
(6, 6, 2, 1), -- Corretta
(6, 6, 3, 2), -- Sbagliata
(6, 6, 4, 1), -- Corretta
(6, 6, 5, 4); -- Parzialmente corretta (5 punti)

-- Partecipazione 7: andrea_viola al Quiz 7
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(7, 7, 1, 1), -- Corretta
(7, 7, 2, 1), -- Corretta
(7, 7, 3, 3), -- Sbagliata
(7, 7, 4, 2), -- Sbagliata
(7, 7, 5, 1); -- Corretta

-- Partecipazione 8: laura_rosa al Quiz 8
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(8, 8, 1, 1), -- Corretta
(8, 8, 2, 3), -- Sbagliata
(8, 8, 3, 1), -- Corretta
(8, 8, 4, 2), -- Parzialmente corretta (5 punti)
(8, 8, 5, 1); -- Corretta

-- Partecipazione 9: paolo_arancio al Quiz 9
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(9, 9, 1, 4), -- Parzialmente corretta (5 punti)
(9, 9, 2, 1), -- Corretta
(9, 9, 3, 1), -- Corretta
(9, 9, 4, 1), -- Corretta
(9, 9, 5, 1); -- Corretta

-- Partecipazione 10: chiara_azzurra al Quiz 10
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(10, 10, 1, 1), -- Corretta
(10, 10, 2, 2), -- Parzialmente corretta (5 punti)
(10, 10, 3, 1), -- Corretta
(10, 10, 4, 1), -- Corretta
(10, 10, 5, 1); -- Corretta
