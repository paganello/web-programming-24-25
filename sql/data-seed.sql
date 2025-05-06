/**
15 utenti con nomi, cognomi e email italianizzati
10 quiz su vari argomenti (Storia Italiana, Matematica, Cultura Generale, ecc.)
5 domande per ogni quiz
4 possibili risposte per ogni domanda, con indicazione della risposta corretta e dei punteggi
30 partecipazioni degli utenti ai quiz
*/

-- Popolamento tabella Utente con 500 record
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
('fabio_platino', 'Fabio', 'Platino', 'fabio.platino@example.com'),
('elena_ferrari', 'Elena', 'Ferrari', 'elena.ferrari@example.com'),
('massimo_romano', 'Massimo', 'Romano', 'massimo.romano@example.com'),
('silvia_marino', 'Silvia', 'Marino', 'silvia.marino@example.com'),
('riccardo_costa', 'Riccardo', 'Costa', 'riccardo.costa@example.com'),
('francesca_greco', 'Francesca', 'Greco', 'francesca.greco@example.com'),
('simone_colombo', 'Simone', 'Colombo', 'simone.colombo@example.com'),
('martina_bruno', 'Martina', 'Bruno', 'martina.bruno@example.com'),
('alessio_ricci', 'Alessio', 'Ricci', 'alessio.ricci@example.com'),
('giorgia_mancini', 'Giorgia', 'Mancini', 'giorgia.mancini@example.com'),
('gabriele_gallo', 'Gabriele', 'Gallo', 'gabriele.gallo@example.com'),
('alice_fontana', 'Alice', 'Fontana', 'alice.fontana@example.com'),
('daniele_conti', 'Daniele', 'Conti', 'daniele.conti@example.com'),
('sara_ferrara', 'Sara', 'Ferrara', 'sara.ferrara@example.com'),
('nicola_martini', 'Nicola', 'Martini', 'nicola.martini@example.com'),
('valeria_santoro', 'Valeria', 'Santoro', 'valeria.santoro@example.com'),
('leonardo_marini', 'Leonardo', 'Marini', 'leonardo.marini@example.com'),
('beatrice_leone', 'Beatrice', 'Leone', 'beatrice.leone@example.com'),
('alberto_vitale', 'Alberto', 'Vitale', 'alberto.vitale@example.com'),
('eleonora_lombardi', 'Eleonora', 'Lombardi', 'eleonora.lombardi@example.com'),
('michele_serra', 'Michele', 'Serra', 'michele.serra@example.com'),
('veronica_caruso', 'Veronica', 'Caruso', 'veronica.caruso@example.com'),
('antonio_franco', 'Antonio', 'Franco', 'antonio.franco@example.com'),
('federica_bianco', 'Federica', 'Bianco', 'federica.bianco@example.com'),
('alessandro_fabbri', 'Alessandro', 'Fabbri', 'alessandro.fabbri@example.com'),
('claudia_sala', 'Claudia', 'Sala', 'claudia.sala@example.com'),
('stefano_battaglia', 'Stefano', 'Battaglia', 'stefano.battaglia@example.com'),
('roberta_donati', 'Roberta', 'Donati', 'roberta.donati@example.com'),
('matteo_pellegrini', 'Matteo', 'Pellegrini', 'matteo.pellegrini@example.com'),
('irene_palumbo', 'Irene', 'Palumbo', 'irene.palumbo@example.com'),
('claudio_morelli', 'Claudio', 'Morelli', 'claudio.morelli@example.com'),
('erica_bernardi', 'Erica', 'Bernardi', 'erica.bernardi@example.com'),
('giovanni_ferri', 'Giovanni', 'Ferri', 'giovanni.ferri@example.com'),
('marta_marchetti', 'Marta', 'Marchetti', 'marta.marchetti@example.com'),
('emanuele_galli', 'Emanuele', 'Galli', 'emanuele.galli@example.com'),
('cristina_martino', 'Cristina', 'Martino', 'cristina.martino@example.com'),
('lorenzo_rinaldi', 'Lorenzo', 'Rinaldi', 'lorenzo.rinaldi@example.com'),
('sabrina_testa', 'Sabrina', 'Testa', 'sabrina.testa@example.com'),
('vittorio_barbieri', 'Vittorio', 'Barbieri', 'vittorio.barbieri@example.com'),
('jessica_palmieri', 'Jessica', 'Palmieri', 'jessica.palmieri@example.com'),
('enzo_pozzi', 'Enzo', 'Pozzi', 'enzo.pozzi@example.com'),
('alessandra_parisi', 'Alessandra', 'Parisi', 'alessandra.parisi@example.com'),
('tommaso_rizzi', 'Tommaso', 'Rizzi', 'tommaso.rizzi@example.com'),
('monica_de_angelis', 'Monica', 'De Angelis', 'monica.deangelis@example.com'),
('pietro_silvestri', 'Pietro', 'Silvestri', 'pietro.silvestri@example.com'),
('arianna_monti', 'Arianna', 'Monti', 'arianna.monti@example.com'),
('valerio_gentile', 'Valerio', 'Gentile', 'valerio.gentile@example.com'),
('cinzia_orlando', 'Cinzia', 'Orlando', 'cinzia.orlando@example.com'),
('salvatore_fiore', 'Salvatore', 'Fiore', 'salvatore.fiore@example.com'),
('margherita_belli', 'Margherita', 'Belli', 'margherita.belli@example.com'),
('dario_vitali', 'Dario', 'Vitali', 'dario.vitali@example.com'),
('lucia_riva', 'Lucia', 'Riva', 'lucia.riva@example.com'),
('bruno_farina', 'Bruno', 'Farina', 'bruno.farina@example.com'),
('paola_coppola', 'Paola', 'Coppola', 'paola.coppola@example.com'),
('mirko_fusi', 'Mirko', 'Fusi', 'mirko.fusi@example.com'),
('daniela_pagano', 'Daniela', 'Pagano', 'daniela.pagano@example.com'),
('giacomo_cattaneo', 'Giacomo', 'Cattaneo', 'giacomo.cattaneo@example.com'),
('nadia_valentini', 'Nadia', 'Valentini', 'nadia.valentini@example.com'),
('maurizio_bellini', 'Maurizio', 'Bellini', 'maurizio.bellini@example.com'),
('serena_grasso', 'Serena', 'Grasso', 'serena.grasso@example.com'),
('umberto_guerra', 'Umberto', 'Guerra', 'umberto.guerra@example.com'),
('tiziana_basile', 'Tiziana', 'Basile', 'tiziana.basile@example.com'),
('raffaele_lucchese', 'Raffaele', 'Lucchese', 'raffaele.lucchese@example.com'),
('viola_benedetti', 'Viola', 'Benedetti', 'viola.benedetti@example.com'),
('enrico_paganelli', 'Enrico', 'Paganelli', 'enrico.paganelli@example.com'),
('rosa_gatti', 'Rosa', 'Gatti', 'rosa.gatti@example.com'),
('flavio_rossetti', 'Flavio', 'Rossetti', 'flavio.rossetti@example.com'),
('angela_carbone', 'Angela', 'Carbone', 'angela.carbone@example.com'),
('filippo_arcuri', 'Filippo', 'Arcuri', 'filippo.arcuri@example.com'),
('tania_ferretti', 'Tania', 'Ferretti', 'tania.ferretti@example.com'),
('corrado_messina', 'Corrado', 'Messina', 'corrado.messina@example.com'),
('greta_miceli', 'Greta', 'Miceli', 'greta.miceli@example.com'),
('gianmarco_toscano', 'Gianmarco', 'Toscano', 'gianmarco.toscano@example.com'),
('carlotta_piazza', 'Carlotta', 'Piazza', 'carlotta.piazza@example.com'),
('sandro_montalto', 'Sandro', 'Montalto', 'sandro.montalto@example.com'),
('marianna_leone', 'Marianna', 'Leone', 'marianna.leone@example.com'),
('cristian_orsini', 'Cristian', 'Orsini', 'cristian.orsini@example.com'),
('giada_ruggieri', 'Giada', 'Ruggieri', 'giada.ruggieri@example.com'),
('saverio_sorrentino', 'Saverio', 'Sorrentino', 'saverio.sorrentino@example.com'),
('aurora_caputo', 'Aurora', 'Caputo', 'aurora.caputo@example.com'),
('gianni_nicoletti', 'Gianni', 'Nicoletti', 'gianni.nicoletti@example.com'),
('noemi_de_luca', 'Noemi', 'De Luca', 'noemi.deluca@example.com'),
('fabrizio_baldini', 'Fabrizio', 'Baldini', 'fabrizio.baldini@example.com'),
('ilaria_marchesi', 'Ilaria', 'Marchesi', 'ilaria.marchesi@example.com'),
('diego_bianchi', 'Diego', 'Bianchi', 'diego.bianchi@example.com'),
('camilla_romani', 'Camilla', 'Romani', 'camilla.romani@example.com'),
('vincenzo_pagani', 'Vincenzo', 'Pagani', 'vincenzo.pagani@example.com'),
('stella_negri', 'Stella', 'Negri', 'stella.negri@example.com'),
('emilio_baroni', 'Emilio', 'Baroni', 'emilio.baroni@example.com'),
('bianca_russo', 'Bianca', 'Russo', 'bianca.russo@example.com'),
('guido_moretti', 'Guido', 'Moretti', 'guido.moretti@example.com'),
('romina_amato', 'Romina', 'Amato', 'romina.amato@example.com'),
('arturo_de_santis', 'Arturo', 'De Santis', 'arturo.desantis@example.com'),
('michela_palmisano', 'Michela', 'Palmisano', 'michela.palmisano@example.com'),
('gino_damico', 'Gino', 'DAmica', 'gino.damico@example.com'),
('rachele_ventura', 'Rachele', 'Ventura', 'rachele.ventura@example.com'),
('eugenio_galasso', 'Eugenio', 'Galasso', 'eugenio.galasso@example.com'),
('zoe_vitale', 'Zoe', 'Vitale', 'zoe.vitale@example.com'),
('ignazio_gallo', 'Ignazio', 'Gallo', 'ignazio.gallo@example.com'),
('dominga_ferrero', 'Dominga', 'Ferrero', 'dominga.ferrero@example.com'),
('augusto_mazza', 'Augusto', 'Mazza', 'augusto.mazza@example.com'),
('lorena_rizzo', 'Lorena', 'Rizzo', 'lorena.rizzo@example.com'),
('maurilio_costanzo', 'Maurilio', 'Costanzo', 'maurilio.costanzo@example.com'),
('vittoria_mantovani', 'Vittoria', 'Mantovani', 'vittoria.mantovani@example.com'),
('iacopo_beltrame', 'Iacopo', 'Beltrame', 'iacopo.beltrame@example.com'),
('regina_padovano', 'Regina', 'Padovano', 'regina.padovano@example.com'),
('biagio_esposito', 'Biagio', 'Esposito', 'biagio.esposito@example.com'),
('ludmilla_sala', 'Ludmilla', 'Sala', 'ludmilla.sala@example.com'),
('rodolfo_genovesi', 'Rodolfo', 'Genovesi', 'rodolfo.genovesi@example.com'),
('adele_giordano', 'Adele', 'Giordano', 'adele.giordano@example.com'),
('ernesto_mancuso', 'Ernesto', 'Mancuso', 'ernesto.mancuso@example.com'),
('franca_venturi', 'Franca', 'Venturi', 'franca.venturi@example.com'),
('adriano_piras', 'Adriano', 'Piras', 'adriano.piras@example.com'),
('delia_lombardo', 'Delia', 'Lombardo', 'delia.lombardo@example.com'),
('carmelo_baldi', 'Carmelo', 'Baldi', 'carmelo.baldi@example.com'),
('gisella_ferraro', 'Gisella', 'Ferraro', 'gisella.ferraro@example.com'),
('costantino_donati', 'Costantino', 'Donati', 'costantino.donati@example.com'),
('viviana_romano', 'Viviana', 'Romano', 'viviana.romano@example.com'),
('norberto_marchese', 'Norberto', 'Marchese', 'norberto.marchese@example.com'),
('caterina_neri', 'Caterina', 'Neri', 'caterina.neri@example.com'),
('calogero_barbero', 'Calogero', 'Barbero', 'calogero.barbero@example.com'),
('debora_mariani', 'Debora', 'Mariani', 'debora.mariani@example.com'),
('giordano_gentili', 'Giordano', 'Gentili', 'giordano.gentili@example.com'),
('selene_marino', 'Selene', 'Marino', 'selene.marino@example.com'),
('leandro_monti', 'Leandro', 'Monti', 'leandro.monti@example.com'),
('flora_rossini', 'Flora', 'Rossini', 'flora.rossini@example.com'),
('nicolò_bellini', 'Nicolò', 'Bellini', 'nicolo.bellini@example.com'),
('mirella_barone', 'Mirella', 'Barone', 'mirella.barone@example.com'),
('oreste_vitali', 'Oreste', 'Vitali', 'oreste.vitali@example.com'),
('fulvia_lombardi', 'Fulvia', 'Lombardi', 'fulvia.lombardi@example.com'),
('rocco_palumbo', 'Rocco', 'Palumbo', 'rocco.palumbo@example.com'),
('odette_rinaldi', 'Odette', 'Rinaldi', 'odette.rinaldi@example.com'),
('lino_damico', 'Lino', 'Anico', 'lino.anico@example.com'),
('tosca_leone', 'Tosca', 'Leone', 'tosca.leone@example.com'),
('carmelo_fiorentino', 'Carmelo', 'Fiorentino', 'carmelo.fiorentino@example.com'),
('cassandra_greco', 'Cassandra', 'Greco', 'cassandra.greco@example.com'),
('serafino_costa', 'Serafino', 'Costa', 'serafino.costa@example.com'),
('matilde_mancini', 'Matilde', 'Mancini', 'matilde.mancini@example.com'),
('piermario_ferrara', 'Piermario', 'Ferrara', 'piermario.ferrara@example.com'),
('simonetta_santoro', 'Simonetta', 'Santoro', 'simonetta.santoro@example.com'),
('rocco_palmieri', 'Rocco', 'Palmieri', 'rocco.palmieri@example.com'),
('priscilla_conti', 'Priscilla', 'Conti', 'priscilla.conti@example.com'),
('attilio_longo', 'Attilio', 'Longo', 'attilio.longo@example.com'),
('berenice_martini', 'Berenice', 'Martini', 'berenice.martini@example.com'),
('luciano_galli', 'Luciano', 'Galli', 'luciano.galli@example.com'),
('benedetta_rossi', 'Benedetta', 'Rossi', 'benedetta.rossi@example.com'),
('ivano_morelli', 'Ivano', 'Morelli', 'ivano.morelli@example.com'),
('amanda_pellegrini', 'Amanda', 'Pellegrini', 'amanda.pellegrini@example.com'),
('oliviero_fabbri', 'Oliviero', 'Fabbri', 'oliviero.fabbri@example.com'),
('teodora_esposito', 'Teodora', 'Esposito', 'teodora.esposito@example.com'),
('edoardo_bernardi', 'Edoardo', 'Bernardi', 'edoardo.bernardi@example.com'),
('miranda_battaglia', 'Miranda', 'Battaglia', 'miranda.battaglia@example.com'),
('fiorenzo_ferri', 'Fiorenzo', 'Ferri', 'fiorenzo.ferri@example.com'),
('prisca_caruso', 'Prisca', 'Caruso', 'prisca.caruso@example.com'),
('orazio_franco', 'Orazio', 'Franco', 'orazio.franco@example.com'),
('marilena_marchetti', 'Marilena', 'Marchetti', 'marilena.marchetti@example.com'),
('nazzareno_bianco', 'Nazzareno', 'Bianco', 'nazzareno.bianco@example.com'),
('dorina_sala', 'Dorina', 'Sala', 'dorina.sala@example.com'),
('pierluigi_pagano', 'Pierluigi', 'Pagano', 'pierluigi.pagano@example.com'),
('olimpia_rinaldi', 'Olimpia', 'Rinaldi', 'olimpia.rinaldi@example.com'),
('livio_testa', 'Livio', 'Testa', 'livio.testa@example.com'),
('agnese_barbieri', 'Agnese', 'Barbieri', 'agnese.barbieri@example.com'),
('egidio_palumbo', 'Egidio', 'Palumbo', 'egidio.palumbo@example.com'),
('perla_morelli', 'Perla', 'Morelli', 'perla.morelli@example.com'),
('romeo_parisi', 'Romeo', 'Parisi', 'romeo.parisi@example.com'),
('zita_rizzi', 'Zita', 'Rizzi', 'zita.rizzi@example.com'),
('cirino_de_angelis', 'Cirino', 'De Angelis', 'cirino.deangelis@example.com'),
('artemisia_silvestri', 'Artemisia', 'Silvestri', 'artemisia.silvestri@example.com'),
('clemente_monti', 'Clemente', 'Monti', 'clemente.monti@example.com'),
('diamante_gentile', 'Diamante', 'Gentile', 'diamante.gentile@example.com'),
('ireneo_orlando', 'Ireneo', 'Orlando', 'ireneo.orlando@example.com'),
('donatella_fiore', 'Donatella', 'Fiore', 'donatella.fiore@example.com'),
('marcello_belli', 'Marcello', 'Belli', 'marcello.belli@example.com'),
('marisa_vitali', 'Marisa', 'Vitali', 'marisa.vitali@example.com'),
('settimo_riva', 'Settimo', 'Riva', 'settimo.riva@example.com'),
('damiana_farina', 'Damiana', 'Farina', 'damiana.farina@example.com'),
('ferruccio_coppola', 'Ferruccio', 'Coppola', 'ferruccio.coppola@example.com'),
('monia_fusi', 'Monia', 'Fusi', 'monia.fusi@example.com'),
('virgilio_cattaneo', 'Virgilio', 'Cattaneo', 'virgilio.cattaneo@example.com'),
('cosetta_valentini', 'Cosetta', 'Valentini', 'cosetta.valentini@example.com'),
('tarcisio_bellini', 'Tarcisio', 'Bellini', 'tarcisio.bellini@example.com'),
('ornella_grasso', 'Ornella', 'Grasso', 'ornella.grasso@example.com'),
('amilcare_guerra', 'Amilcare', 'Guerra', 'amilcare.guerra@example.com'),
('claretta_basile', 'Claretta', 'Basile', 'claretta.basile@example.com'),
('benito_lucchese', 'Benito', 'Lucchese', 'benito.lucchese@example.com'),
('lavinia_benedetti', 'Lavinia', 'Benedetti', 'lavinia.benedetti@example.com'),
('erminio_paganelli', 'Erminio', 'Paganelli', 'erminio.paganelli@example.com'),
('giuditta_gatti', 'Giuditta', 'Gatti', 'giuditta.gatti@example.com'),
('giuliana_rossetti', 'Giuliana', 'Rossetti', 'giuliana.rossetti@example.com'),
('fiorello_carbone', 'Fiorello', 'Carbone', 'fiorello.carbone@example.com'),
('maura_arcuri', 'Maura', 'Arcuri', 'maura.arcuri@example.com'),
('marino_ferretti', 'Marino', 'Ferretti', 'marino.ferretti@example.com'),
('flora_messina', 'Flora', 'Messina', 'flora.messina@example.com'),
('antimo_miceli', 'Antimo', 'Miceli', 'antimo.miceli@example.com'),
('pierina_toscano', 'Pierina', 'Toscano', 'pierina.toscano@example.com'),
('adolfo_piazza', 'Adolfo', 'Piazza', 'adolfo.piazza@example.com'),
('rina_montalto', 'Rina', 'Montalto', 'rina.montalto@example.com'),
('sigismondo_leone', 'Sigismondo', 'Leone', 'sigismondo.leone@example.com'),
('fiordaliso_orsini', 'Fiordaliso', 'Orsini', 'fiordaliso.orsini@example.com'),
('germano_ruggieri', 'Germano', 'Ruggieri', 'germano.ruggieri@example.com'),
('mimosa_sorrentino', 'Mimosa', 'Sorrentino', 'mimosa.sorrentino@example.com'),
('ambrogio_caputo', 'Ambrogio', 'Caputo', 'ambrogio.caputo@example.com'),
('renata_nicoletti', 'Renata', 'Nicoletti', 'renata.nicoletti@example.com'),
('ferrante_de_luca', 'Ferrante', 'De Luca', 'ferrante.deluca@example.com'),
('graziella_baldini', 'Graziella', 'Baldini', 'graziella.baldini@example.com'),
('ottone_marchesi', 'Ottone', 'Marchesi', 'ottone.marchesi@example.com'),
('primavera_bianchi', 'Primavera', 'Bianchi', 'primavera.bianchi@example.com'),
('baldassare_romani', 'Baldassare', 'Romani', 'baldassare.romani@example.com'),
('genuina_pagani', 'Genuina', 'Pagani', 'genuina.pagani@example.com'),
('raniero_negri', 'Raniero', 'Negri', 'raniero.negri@example.com'),
('daria_baroni', 'Daria', 'Baroni', 'daria.baroni@example.com'),
('tiziano_russo', 'Tiziano', 'Russo', 'tiziano.russo@example.com'),
('minerva_moretti', 'Minerva', 'Moretti', 'minerva.moretti@example.com'),
('nicodemo_amato', 'Nicodemo', 'Amato', 'nicodemo.amato@example.com'),
('quirina_de_santis', 'Quirina', 'De Santis', 'quirina.desantis@example.com'),
('iginio_palmisano', 'Iginio', 'Palmisano', 'iginio.palmisano@example.com'),
('isotta_damico', 'Isotta', 'DAmico', 'isotta.damico@example.com'),
('silverio_ventura', 'Silverio', 'Ventura', 'silverio.ventura@example.com'),
('elisa_galasso', 'Elisa', 'Galasso', 'elisa.galasso@example.com'),
('prospero_vitale', 'Prospero', 'Vitale', 'prospero.vitale@example.com'),
('anastasia_gallo', 'Anastasia', 'Gallo', 'anastasia.gallo@example.com'),
('adelmo_ferrero', 'Adelmo', 'Ferrero', 'adelmo.ferrero@example.com'),
('narcisa_mazza', 'Narcisa', 'Mazza', 'narcisa.mazza@example.com'),
('secondo_rizzo', 'Secondo', 'Rizzo', 'secondo.rizzo@example.com'),
('ambra_costanzo', 'Ambra', 'Costanzo', 'ambra.costanzo@example.com'),
('ippolito_mantovani', 'Ippolito', 'Mantovani', 'ippolito.mantovani@example.com'),
('orsola_beltrame', 'Orsola', 'Beltrame', 'orsola.beltrame@example.com'),
('iole_padovano', 'Iole', 'Padovano', 'iole.padovano@example.com'),
('crescenzo_esposito', 'Crescenzo', 'Esposito', 'crescenzo.esposito@example.com'),
('brigida_sala', 'Brigida', 'Sala', 'brigida.sala@example.com'),
('rinaldo_genovesi', 'Rinaldo', 'Genovesi', 'rinaldo.genovesi@example.com'),
('vera_giordano', 'Vera', 'Giordano', 'vera.giordano@example.com'),
('furio_mancuso', 'Furio', 'Mancuso', 'furio.mancuso@example.com'),
('violante_venturi', 'Violante', 'Venturi', 'violante.venturi@example.com'),
('armando_piras', 'Armando', 'Piras', 'armando.piras@example.com'),
('fiammetta_lombardo', 'Fiammetta', 'Lombardo', 'fiammetta.lombardo@example.com'),
('ascanio_baldi', 'Ascanio', 'Baldi', 'ascanio.baldi@example.com'),
('penelope_ferraro', 'Penelope', 'Ferraro', 'penelope.ferraro@example.com'),
('quinto_donati', 'Quinto', 'Donati', 'quinto.donati@example.com'),
('carmela_romano', 'Carmela', 'Romano', 'carmela.romano@example.com'),
('sante_marchese', 'Sante', 'Marchese', 'sante.marchese@example.com'),
('elvira_neri', 'Elvira', 'Neri', 'elvira.neri@example.com'),
('cecilio_barbero', 'Cecilio', 'Barbero', 'cecilio.barbero@example.com'),
('barbara_mariani', 'Barbara', 'Mariani', 'barbara.mariani@example.com'),
('achille_gentili', 'Achille', 'Gentili', 'achille.gentili@example.com'),
('ida_marino', 'Ida', 'Marino', 'ida.marino@example.com'),
('panfilo_monti', 'Panfilo', 'Monti', 'panfilo.monti@example.com'),
('evelina_rossini', 'Evelina', 'Rossini', 'evelina.rossini@example.com'),
('gilberto_bellini', 'Gilberto', 'Bellini', 'gilberto.bellini@example.com'),
('azzurra_barone', 'Azzurra', 'Barone', 'azzurra.barone@example.com'),
('raimondo_vitali', 'Raimondo', 'Vitali', 'raimondo.vitali@example.com'),
('olga_lombardi', 'Olga', 'Lombardi', 'olga.lombardi@example.com'),
('alcide_palumbo', 'Alcide', 'Palumbo', 'alcide.palumbo@example.com'),
('faustina_rinaldi', 'Faustina', 'Rinaldi', 'faustina.rinaldi@example.com'),
('lamberto_damico', 'Lamberto', 'Damino', 'lamberto.damino@example.com'),
('sibilla_leone', 'Sibilla', 'Leone', 'sibilla.leone@example.com'),
('osvaldo_fiorentino', 'Osvaldo', 'Fiorentino', 'osvaldo.fiorentino@example.com'),
('marina_greco', 'Marina', 'Greco', 'marina.greco@example.com'),
('modesto_costa', 'Modesto', 'Costa', 'modesto.costa@example.com'),
('fortunata_mancini', 'Fortunata', 'Mancini', 'fortunata.mancini@example.com'),
('quintilio_ferrara', 'Quintilio', 'Ferrara', 'quintilio.ferrara@example.com'),
('dafne_santoro', 'Dafne', 'Santoro', 'dafne.santoro@example.com'),
('ruggero_palmieri', 'Ruggero', 'Palmieri', 'ruggero.palmieri@example.com'),
('liberata_conti', 'Liberata', 'Conti', 'liberata.conti@example.com'),
('graziano_longo', 'Graziano', 'Longo', 'graziano.longo@example.com'),
('brunella_martini', 'Brunella', 'Martini', 'brunella.martini@example.com'),
('taddeo_galli', 'Taddeo', 'Galli', 'taddeo.galli@example.com'),
('lina_rossi', 'Lina', 'Rossi', 'lina.rossi@example.com'),
('terzo_morelli', 'Terzo', 'Morelli', 'terzo.morelli@example.com'),
('livia_pellegrini', 'Livia', 'Pellegrini', 'livia.pellegrini@example.com'),
('amleto_fabbri', 'Amleto', 'Fabbri', 'amleto.fabbri@example.com'),
('gemma_esposito', 'Gemma', 'Esposito', 'gemma.esposito@example.com'),
('costanzo_bernardi', 'Costanzo', 'Bernardi', 'costanzo.bernardi@example.com'),
('tamara_battaglia', 'Tamara', 'Battaglia', 'tamara.battaglia@example.com'),
('ernesto_ferri', 'Ernesto', 'Ferri', 'ernesto.ferri@example.com'),
('nunzia_caruso', 'Nunzia', 'Caruso', 'nunzia.caruso@example.com'),
('ugo_franco', 'Ugo', 'Franco', 'ugo.franco@example.com'),
('clementina_marchetti', 'Clementina', 'Marchetti', 'clementina.marchetti@example.com'),
('ottavio_bianco', 'Ottavio', 'Bianco', 'ottavio.bianco@example.com'),
('corinna_sala', 'Corinna', 'Sala', 'corinna.sala@example.com'),
('patrizio_pagano', 'Patrizio', 'Pagano', 'patrizio.pagano@example.com'),
('dina_rinaldi', 'Dina', 'Rinaldi', 'dina.rinaldi@example.com'),
('ennio_testa', 'Ennio', 'Testa', 'ennio.testa@example.com'),
('fedora_barbieri', 'Fedora', 'Barbieri', 'fedora.barbieri@example.com'),
('vito_palumbo', 'Vito', 'Palumbo', 'vito.palumbo@example.com'),
('tecla_morelli', 'Tecla', 'Morelli', 'tecla.morelli@example.com'),
('ubaldo_parisi', 'Ubaldo', 'Parisi', 'ubaldo.parisi@example.com'),
('ursula_rizzi', 'Ursula', 'Rizzi', 'ursula.rizzi@example.com'),
('danilo_de_angelis', 'Danilo', 'De Angelis', 'danilo.deangelis@example.com'),
('alba_silvestri', 'Alba', 'Silvestri', 'alba.silvestri@example.com'),
('remo_monti', 'Remo', 'Monti', 'remo.monti@example.com'),
('tilde_gentile', 'Tilde', 'Gentile', 'tilde.gentile@example.com'),
('renato_orlando', 'Renato', 'Orlando', 'renato.orlando@example.com'),
('sonia_fiore', 'Sonia', 'Fiore', 'sonia.fiore@example.com'),
('gustavo_belli', 'Gustavo', 'Belli', 'gustavo.belli@example.com'),
('paolina_vitali', 'Paolina', 'Vitali', 'paolina.vitali@example.com'),
('cesare_riva', 'Cesare', 'Riva', 'cesare.riva@example.com'),
('romilda_farina', 'Romilda', 'Farina', 'romilda.farina@example.com'),
('torquato_coppola', 'Torquato', 'Coppola', 'torquato.coppola@example.com'),
('dalila_fusi', 'Dalila', 'Fusi', 'dalila.fusi@example.com'),
('nicola_cattaneo', 'Nicola', 'Cattaneo', 'nicola.cattaneo@example.com'),
('berenice_valentini', 'Berenice', 'Valentini', 'berenice.valentini@example.com'),
('nazario_bellini', 'Nazario', 'Bellini', 'nazario.bellini@example.com'),
('clarissa_grasso', 'Clarissa', 'Grasso', 'clarissa.grasso@example.com'),
('fortunato_guerra', 'Fortunato', 'Guerra', 'fortunato.guerra@example.com'),
('concetta_basile', 'Concetta', 'Basile', 'concetta.basile@example.com'),
('siro_lucchese', 'Siro', 'Lucchese', 'siro.lucchese@example.com'),
('eulalia_benedetti', 'Eulalia', 'Benedetti', 'eulalia.benedetti@example.com'),
('virginio_paganelli', 'Virginio', 'Paganelli', 'virginio.paganelli@example.com'),
('mafalda_gatti', 'Mafalda', 'Gatti', 'mafalda.gatti@example.com'),
('pasquale_rossetti', 'Pasquale', 'Rossetti', 'pasquale.rossetti@example.com'),
('bartolomeo_carbone', 'Bartolomeo', 'Carbone', 'bartolomeo.carbone@example.com'),
('deanna_arcuri', 'Deanna', 'Arcuri', 'deanna.arcuri@example.com'),
('silvio_ferretti', 'Silvio', 'Ferretti', 'silvio.ferretti@example.com'),
('bice_messina', 'Bice', 'Messina', 'bice.messina@example.com'),
('eraldo_miceli', 'Eraldo', 'Miceli', 'eraldo.miceli@example.com'),
('lucrezia_toscano', 'Lucrezia', 'Toscano', 'lucrezia.toscano@example.com'),
('gioacchino_piazza', 'Gioacchino', 'Piazza', 'gioacchino.piazza@example.com'),
('fiorella_montalto', 'Fiorella', 'Montalto', 'fiorella.montalto@example.com'),
('emiliano_leone', 'Emiliano', 'Leone', 'emiliano.leone@example.com'),
('floriana_orsini', 'Floriana', 'Orsini', 'floriana.orsini@example.com'),
('alighiero_ruggieri', 'Alighiero', 'Ruggieri', 'alighiero.ruggieri@example.com'),
('iolanda_sorrentino', 'Iolanda', 'Sorrentino', 'iolanda.sorrentino@example.com'),
('adalberto_caputo', 'Adalberto', 'Caputo', 'adalberto.caputo@example.com'),
('erminia_nicoletti', 'Erminia', 'Nicoletti', 'erminia.nicoletti@example.com'),
('guglielmo_de_luca', 'Guglielmo', 'De Luca', 'guglielmo.deluca@example.com'),
('luisa_baldini', 'Luisa', 'Baldini', 'luisa.baldini@example.com'),
('cornelio_marchesi', 'Cornelio', 'Marchesi', 'cornelio.marchesi@example.com'),
('norma_bianchi', 'Norma', 'Bianchi', 'norma.bianchi@example.com'),
('riccardo_romani', 'Riccardo', 'Romani', 'riccardo.romani@example.com'),
('celestina_pagani', 'Celestina', 'Pagani', 'celestina.pagani@example.com'),
('demetrio_negri', 'Demetrio', 'Negri', 'demetrio.negri@example.com'),
('natalina_baroni', 'Natalina', 'Baroni', 'natalina.baroni@example.com'),
('jacopo_russo', 'Jacopo', 'Russo', 'jacopo.russo@example.com'),
('glenda_moretti', 'Glenda', 'Moretti', 'glenda.moretti@example.com'),
('arcangelo_amato', 'Arcangelo', 'Amato', 'arcangelo.amato@example.com'),
('luigina_de_santis', 'Luigina', 'De Santis', 'luigina.desantis@example.com'),
('rodolfo_palmisano', 'Rodolfo', 'Palmisano', 'rodolfo.palmisano@example.com'),
('agata_damico', 'Agata', 'Amico', 'agata.damico@example.com'),
('ulisse_ventura', 'Ulisse', 'Ventura', 'ulisse.ventura@example.com'),
('cassiopea_galasso', 'Cassiopea', 'Galasso', 'cassiopea.galasso@example.com'),
('terenzio_vitale', 'Terenzio', 'Vitale', 'terenzio.vitale@example.com'),
('gelsomina_gallo', 'Gelsomina', 'Gallo', 'gelsomina.gallo@example.com'),
('fulvio_ferrero', 'Fulvio', 'Ferrero', 'fulvio.ferrero@example.com'),
('fabiola_mazza', 'Fabiola', 'Mazza', 'fabiola.mazza@example.com'),
('plinio_rizzo', 'Plinio', 'Rizzo', 'plinio.rizzo@example.com'),
('genoveffa_costanzo', 'Genoveffa', 'Costanzo', 'genoveffa.costanzo@example.com'),
('ilario_mantovani', 'Ilario', 'Mantovani', 'ilario.mantovani@example.com'),
('bibiana_beltrame', 'Bibiana', 'Beltrame', 'bibiana.beltrame@example.com'),
('lucio_padovano', 'Lucio', 'Padovano', 'lucio.padovano@example.com'),
('arcibaldo_esposito', 'Arcibaldo', 'Esposito', 'arcibaldo.esposito@example.com'),
('ester_sala', 'Ester', 'Sala', 'ester.sala@example.com'),
('timoteo_genovesi', 'Timoteo', 'Genovesi', 'timoteo.genovesi@example.com'),
('gertrude_giordano', 'Gertrude', 'Giordano', 'gertrude.giordano@example.com'),
('palmiro_mancuso', 'Palmiro', 'Mancuso', 'palmiro.mancuso@example.com'),
('assunta_venturi', 'Assunta', 'Venturi', 'assunta.venturi@example.com'),
('natale_piras', 'Natale', 'Piras', 'natale.piras@example.com'),
('tullia_lombardo', 'Tullia', 'Lombardo', 'tullia.lombardo@example.com'),
('bonifacio_baldi', 'Bonifacio', 'Baldi', 'bonifacio.baldi@example.com'),
('maddalena_ferraro', 'Maddalena', 'Ferraro', 'maddalena.ferraro@example.com'),
('primo_donati', 'Primo', 'Donati', 'primo.donati@example.com'),
('eufemia_romano', 'Eufemia', 'Romano', 'eufemia.romano@example.com'),
('battista_marchese', 'Battista', 'Marchese', 'battista.marchese@example.com'),
('eleonora_neri', 'Eleonora', 'Neri', 'eleonora.neri@example.com'),
('dino_barbero', 'Dino', 'Barbero', 'dino.barbero@example.com'),
('nilde_mariani', 'Nilde', 'Mariani', 'nilde.mariani@example.com'),
('alfio_gentili', 'Alfio', 'Gentili', 'alfio.gentili@example.com'),
('cecilia_marino', 'Cecilia', 'Marino', 'cecilia.marino@example.com'),
('eustachio_monti', 'Eustachio', 'Monti', 'eustachio.monti@example.com'),
('anatolia_rossini', 'Anatolia', 'Rossini', 'anatolia.rossini@example.com'),
('amedeo_bellini', 'Amedeo', 'Bellini', 'amedeo.bellini@example.com'),
('felicita_barone', 'Felicita', 'Barone', 'felicita.barone@example.com'),
('giulia_verdi2', 'Giulia', 'Verdi', 'giulia.verdi2@example.com'),
('mario_bianchi', 'Mario', 'Bianchi', 'mario.bianchi@example.com'),
('sofia_rossi', 'Sofia', 'Rossi', 'sofia.rossi@example.com'),
('luca_bruno', 'Luca', 'Bruno', 'luca.bruno@example.com'),
('elena_ricci', 'Elena', 'Ricci', 'elena.ricci@example.com'),
('marco_esposito', 'Marco', 'Esposito', 'marco.esposito@example.com'),
('laura_romano', 'Laura', 'Romano', 'laura.romano@example.com'),
('andrea_ferrari', 'Andrea', 'Ferrari', 'andrea.ferrari@example.com'),
('chiara_martini', 'Chiara', 'Martini', 'chiara.martini@example.com'),
('giuseppe_conti', 'Giuseppe', 'Conti', 'giuseppe.conti@example.com'),
('valentina_gallo', 'Valentina', 'Gallo', 'valentina.gallo@example.com'),
('alessandro_farina', 'Alessandro', 'Farina', 'alessandro.farina@example.com'),
('paola_rinaldi', 'Paola', 'Rinaldi', 'paola.rinaldi@example.com'),
('francesco_marini', 'Francesco', 'Marini', 'francesco.marini@example.com'),
('martina_santoro', 'Martina', 'Santoro', 'martina.santoro@example.com'),
('davide_leone', 'Davide', 'Leone', 'davide.leone@example.com'),
('giorgia_costa', 'Giorgia', 'Costa', 'giorgia.costa@example.com'),
('matteo_ferri', 'Matteo', 'Ferri', 'matteo.ferri@example.com'),
('serena_vitale', 'Serena', 'Vitale', 'serena.vitale@example.com'),
('riccardo_longo', 'Riccardo', 'Longo', 'riccardo.longo@example.com'),
('federica_gatti', 'Federica', 'Gatti', 'federica.gatti@example.com'),
('antonio_ferrara', 'Antonio', 'Ferrara', 'antonio.ferrara@example.com'),
('alessia_greco', 'Alessia', 'Greco', 'alessia.greco@example.com'),
('simone_monti2', 'Simone', 'Monti', 'simone.monti2@example.com'),
('elisa_caruso', 'Elisa', 'Caruso', 'elisa.caruso@example.com'),
('daniele_guerra', 'Daniele', 'Guerra', 'daniele.guerra@example.com'),
('sara_sorrentino', 'Sara', 'Sorrentino', 'sara.sorrentino@example.com'),
('paolo_russo2', 'Paolo', 'Russo', 'paolo.russo2@example.com'),
('fabio_fiore', 'Fabio', 'Fiore', 'fabio.fiore@example.com'),
('lorenzo_de_luca', 'Lorenzo', 'De Luca', 'lorenzo.deluca@example.com'),
('francesca_rizzi', 'Francesca', 'Rizzi', 'francesca.rizzi@example.com'),
('vittorio_riva', 'Vittorio', 'Riva', 'vittorio.riva@example.com'),
('barbara_morelli', 'Barbara', 'Morelli', 'barbara.morelli@example.com'),
('giovanni_barbieri', 'Giovanni', 'Barbieri', 'giovanni.barbieri@example.com'),
('silvia_sala', 'Silvia', 'Sala', 'silvia.sala@example.com'),
('enrico_ferrero', 'Enrico', 'Ferrero', 'enrico.ferrero@example.com'),
('cristina_caputo', 'Cristina', 'Caputo', 'cristina.caputo@example.com'),
('michele_mancini', 'Michele', 'Mancini', 'michele.mancini@example.com'),
('roberta_testa', 'Roberta', 'Testa', 'roberta.testa@example.com'),
('stefano_giordano', 'Stefano', 'Giordano', 'stefano.giordano@example.com'),
('valeria_palmieri', 'Valeria', 'Palmieri', 'valeria.palmieri@example.com'),
('gabriele_coppola', 'Gabriele', 'Coppola', 'gabriele.coppola@example.com'),
('marta_mazza', 'Marta', 'Mazza', 'marta.mazza@example.com'),
('leonardo_miceli', 'Leonardo', 'Miceli', 'leonardo.miceli@example.com'),
('greta_lombardo', 'Greta', 'Lombardo', 'greta.lombardo@example.com'),
('fabio_colombo', 'Fabio', 'Colombo', 'fabio.colombo@example.com'),
('irene_grasso', 'Irene', 'Grasso', 'irene.grasso@example.com'),
('massimo_pagano', 'Massimo', 'Pagano', 'massimo.pagano@example.com'),
('claudia_orlando', 'Claudia', 'Orlando', 'claudia.orlando@example.com'),
('tommaso_marino', 'Tommaso', 'Marino', 'tommaso.marino@example.com'),
('margherita_damico', 'Margherita', 'Domico', 'margherita.domico@example.com'),
('marco_marchetti', 'Marco', 'Marchetti', 'marco.marchetti@example.com'),
('aurora_pellegrini', 'Aurora', 'Pellegrini', 'aurora.pellegrini@example.com'),
('roberto_marano', 'Roberto', 'Marano', 'roberto.marano@example.com'),
('alice_vitali', 'Alice', 'Vitali', 'alice.vitali@example.com'),
('dario_fabbri', 'Dario', 'Fabbri', 'dario.fabbri@example.com'),
('veronica_neri', 'Veronica', 'Neri', 'veronica.neri@example.com'),
('diego_rossetti', 'Diego', 'Rossetti', 'diego.rossetti@example.com'),
('giada_franco', 'Giada', 'Franco', 'giada.franco@example.com'),
('lorenzo_fusi', 'Lorenzo', 'Fusi', 'lorenzo.fusi@example.com'),
('alessandra_messina', 'Alessandra', 'Messina', 'alessandra.messina@example.com'),
('emanuele_parisi', 'Emanuele', 'Parisi', 'emanuele.parisi@example.com'),
('monica_piazza', 'Monica', 'Piazza', 'monica.piazza@example.com'),
('giovanni_ventura', 'Giovanni', 'Ventura', 'giovanni.ventura@example.com'),
('beatrice_argento', 'Beatrice', 'Argento', 'beatrice.argento@example.com'),
('alberto_gentile', 'Alberto', 'Gentile', 'alberto.gentile@example.com'),
('rossella_basile', 'Rossella', 'Basile', 'rossella.basile@example.com'),
('alessandro_galli', 'Alessandro', 'Galli', 'alessandro.galli@example.com'),
('michela_battaglia', 'Michela', 'Battaglia', 'michela.battaglia@example.com'),
('salvatore_amato', 'Salvatore', 'Amato', 'salvatore.amato@example.com'),
('matilde_silvestri', 'Matilde', 'Silvestri', 'matilde.silvestri@example.com'),
('filippo_carbone', 'Filippo', 'Carbone', 'filippo.carbone@example.com'),
('eleonora_benedetti', 'Eleonora', 'Benedetti', 'eleonora.benedetti@example.com'),
('vittorio_pagani', 'Vittorio', 'Pagani', 'vittorio.pagani@example.com'),
('carlotta_bianco', 'Carlotta', 'Bianco', 'carlotta.bianco@example.com'),
('cesare_palumbo', 'Cesare', 'Palumbo', 'cesare.palumbo@example.com'),
('ginevra_bernardi', 'Ginevra', 'Bernardi', 'ginevra.bernardi@example.com'),
('pietro_fontana', 'Pietro', 'Fontana', 'pietro.fontana@example.com'),
('daniela_mantovani', 'Daniela', 'Mantovani', 'daniela.mantovani@example.com'),
('oreste_bellini', 'Oreste', 'Bellini', 'oreste.bellini@example.com'),
('tiziana_marchese', 'Tiziana', 'Marchese', 'tiziana.marchese@example.com'),
('adriano_baroni', 'Adriano', 'Baroni', 'adriano.baroni@example.com'),
('arianna_donati', 'Arianna', 'Donati', 'arianna.donati@example.com'),
('alfredo_arcuri', 'Alfredo', 'Arcuri', 'alfredo.arcuri@example.com'),
('agnese_cattaneo', 'Agnese', 'Cattaneo', 'agnese.cattaneo@example.com'),
('flavio_orsini', 'Flavio', 'Orsini', 'flavio.orsini@example.com'),
('graziella_negri', 'Graziella', 'Negri', 'graziella.negri@example.com'),
('bruno_valentini', 'Bruno', 'Valentini', 'bruno.valentini@example.com'),
('sabrina_toscano', 'Sabrina', 'Toscano', 'sabrina.toscano@example.com'),
('eugenio_ruggieri', 'Eugenio', 'Ruggieri', 'eugenio.ruggieri@example.com'),
('immacolata_venturi', 'Immacolata', 'Venturi', 'immacolata.venturi@example.com'),
('raffaello_costanzo', 'Raffaello', 'Costanzo', 'raffaello.costanzo@example.com'),
('caterina_moretti', 'Caterina', 'Moretti', 'caterina.moretti@example.com'),
('sebastiano_beltrame', 'Sebastiano', 'Beltrame', 'sebastiano.beltrame@example.com'),
('anastasia_bianchi', 'Anastasia', 'Bianchi', 'anastasia.bianchi@example.com'),
('ferdinando_piras', 'Ferdinando', 'Piras', 'ferdinando.piras@example.com'),
('samantha_esposito', 'Samantha', 'Esposito', 'samantha.esposito@example.com'),
('bartolomeo_lucchese', 'Bartolomeo', 'Lucchese', 'bartolomeo.lucchese@example.com'),
('romina_palmisano', 'Romina', 'Palmisano', 'romina.palmisano@example.com'),
('lucio_galasso', 'Lucio', 'Galasso', 'lucio.galasso@example.com'),
('giuditta_nicoletti', 'Giuditta', 'Nicoletti', 'giuditta.nicoletti@example.com'),
('marcello_baldini', 'Marcello', 'Baldini', 'marcello.baldini@example.com'),
('viviana_padovano', 'Viviana', 'Padovano', 'viviana.padovano@example.com'),
('saverio_ferretti', 'Saverio', 'Ferretti', 'saverio.ferretti@example.com'),
('martina_paganelli', 'Martina', 'Paganelli', 'martina.paganelli@example.com');

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
