/**
15 utenti con nomi, cognomi e email italianizzati
10 quiz su vari argomenti (Storia Italiana, Matematica, Cultura Generale, ecc.)
5 domande per ogni quiz
4 possibili risposte per ogni domanda, con indicazione della risposta corretta e dei punteggi
30 partecipazioni degli utenti ai quiz
*/

-- Popolamento tabella Utente con 500 record
INSERT INTO Utente (nomeUtente, nome, cognome, eMail) VALUES
('beatrice_barberini', 'Beatrice', 'Barberini', 'beatrice.barberini@example.com'),
('rocco_fagiani', 'Rocco', 'Fagiani', 'rocco.fagiani@example.com'),
('eva_angiolello', 'Eva', 'Angiolello', 'eva.angiolello@example.com'),
('antonia_venditti', 'Antonia', 'Venditti', 'antonia.venditti@example.com'),
('patrizio_bruno', 'Patrizio', 'Bruno', 'patrizio.bruno@example.com'),
('gianluca_tommaseo', 'Gianluca', 'Tommaseo', 'gianluca.tommaseo@example.com'),
('carla_tonisto', 'Carla', 'Tonisto', 'carla.tonisto@example.com'),
('nicoletta_carriera', 'Nicoletta', 'Carriera', 'nicoletta.carriera@example.com'),
('ubaldo_paltrinieri', 'Ubaldo', 'Paltrinieri', 'ubaldo.paltrinieri@example.com'),
('goffredo_magnani', 'Goffredo', 'Magnani', 'goffredo.magnani@example.com'),
('rita_druso', 'Rita', 'Druso', 'rita.druso@example.com'),
('dina_leoncavallo', 'Dina', 'Leoncavallo', 'dina.leoncavallo@example.com'),
('gian_bacosi', 'Gian', 'Bacosi', 'gian.bacosi@example.com'),
('rosa_peranda', 'Rosa', 'Peranda', 'rosa.peranda@example.com'),
('lucia_leone', 'Lucia', 'Leone', 'lucia.leone@example.com'),
('marina_bernini', 'Marina', 'Bernini', 'marina.bernini@example.com'),
('diana_barracco', 'Diana', 'Barracco', 'diana.barracco@example.com'),
('gino_zichichi', 'Gino', 'Zichichi', 'gino.zichichi@example.com'),
('alessia_sagnelli', 'Alessia', 'Sagnelli', 'alessia.sagnelli@example.com'),
('graziella_lopresti', 'Graziella', 'Lopresti', 'graziella.lopresti@example.com'),
('griselda_bandello', 'Griselda', 'Bandello', 'griselda.bandello@example.com'),
('adelasia_gianvecchio', 'Adelasia', 'Gianvecchio', 'adelasia.gianvecchio@example.com'),
('jolanda_petralli', 'Jolanda', 'Petralli', 'jolanda.petralli@example.com'),
('lidia_agazzi', 'Lidia', 'Agazzi', 'lidia.agazzi@example.com'),
('laureano_peruzzi', 'Laureano', 'Peruzzi', 'laureano.peruzzi@example.com'),
('francesco_roero', 'Francesco', 'Roero', 'francesco.roero@example.com'),
('venancio_juvara', 'Venancio', 'Juvara', 'venancio.juvara@example.com'),
('matilda_pace', 'Matilda', 'Pace', 'matilda.pace@example.com'),
('nicoletta_fusani', 'Nicoletta', 'Fusani', 'nicoletta.fusani@example.com'),
('mercedes_ceci', 'Mercedes', 'Ceci', 'mercedes.ceci@example.com'),
('federico_zanzi', 'Federico', 'Zanzi', 'federico.zanzi@example.com'),
('lauretta_fagiani', 'Lauretta', 'Fagiani', 'lauretta.fagiani@example.com'),
('gaetano_finetti', 'Gaetano', 'Finetti', 'gaetano.finetti@example.com'),
('nedda_moschino', 'Nedda', 'Moschino', 'nedda.moschino@example.com'),
('giovanni_zaccagnini', 'Giovanni', 'Zaccagnini', 'giovanni.zaccagnini@example.com'),
('edoardo_amato', 'Edoardo', 'Amato', 'edoardo.amato@example.com'),
('calogero_ritacca', 'Calogero', 'Ritacca', 'calogero.ritacca@example.com'),
('tonino_nitti', 'Tonino', 'Nitti', 'tonino.nitti@example.com'),
('franco_faranda', 'Franco', 'Faranda', 'franco.faranda@example.com'),
('flora_ceci', 'Flora', 'Ceci', 'flora.ceci@example.com'),
('tonino_stradivari', 'Tonino', 'Stradivari', 'tonino.stradivari@example.com'),
('giulietta_lombardi', 'Giulietta', 'Lombardi', 'giulietta.lombardi@example.com'),
('carolina_tomasini', 'Carolina', 'Tomasini', 'carolina.tomasini@example.com'),
('licia_greggio', 'Licia', 'Greggio', 'licia.greggio@example.com'),
('tiziano_antonacci', 'Tiziano', 'Antonacci', 'tiziano.antonacci@example.com'),
('dina_argenti', 'Dina', 'Argenti', 'dina.argenti@example.com'),
('durante_palombi', 'Durante', 'Palombi', 'durante.palombi@example.com'),
('uberto_gravina', 'Uberto', 'Gravina', 'uberto.gravina@example.com'),
('rembrandt_bergoglio', 'Rembrandt', 'Bergoglio', 'rembrandt.bergoglio@example.com'),
('franco_garozzo', 'Franco', 'Garozzo', 'franco.garozzo@example.com'),
('goffredo_angeli', 'Goffredo', 'Angeli', 'goffredo.angeli@example.com'),
('girolamo_ferretti', 'Girolamo', 'Ferretti', 'girolamo.ferretti@example.com'),
('nicolò_manzoni', 'Nicolò', 'Manzoni', 'nicolò.manzoni@example.com'),
('orlando_zetticci', 'Orlando', 'Zetticci', 'orlando.zetticci@example.com'),
('ludovico_rapisardi', 'Ludovico', 'Rapisardi', 'ludovico.rapisardi@example.com'),
('gemma_bellò', 'Gemma', 'Bellò', 'gemma.bellò@example.com'),
('stefania_montanelli', 'Stefania', 'Montanelli', 'stefania.montanelli@example.com'),
('raimondo_micheletti', 'Raimondo', 'Micheletti', 'raimondo.micheletti@example.com'),
('sandra_ioppi', 'Sandra', 'Ioppi', 'sandra.ioppi@example.com'),
('federica_gadda', 'Federica', 'Gadda', 'federica.gadda@example.com'),
('raffaellino_trillini', 'Raffaellino', 'Trillini', 'raffaellino.trillini@example.com'),
('tonino_gulotta', 'Tonino', 'Gulotta', 'tonino.gulotta@example.com'),
('concetta_verdi', 'Concetta', 'Verdi', 'concetta.verdi@example.com'),
('gustavo_gelli', 'Gustavo', 'Gelli', 'gustavo.gelli@example.com'),
('mirko_errani', 'Mirko', 'Errani', 'mirko.errani@example.com'),
('riccardo_monaco', 'Riccardo', 'Monaco', 'riccardo.monaco@example.com'),
('luigi_liverotti', 'Luigi', 'Liverotti', 'luigi.liverotti@example.com'),
('silvia_rosmini', 'Silvia', 'Rosmini', 'silvia.rosmini@example.com'),
('costantino_gargallo', 'Costantino', 'Gargallo', 'costantino.gargallo@example.com'),
('gaspare_cortese', 'Gaspare', 'Cortese', 'gaspare.cortese@example.com'),
('gianluigi_duse', 'Gianluigi', 'Duse', 'gianluigi.duse@example.com'),
('ippazio_moresi', 'Ippazio', 'Moresi', 'ippazio.moresi@example.com'),
('isa_nitto', 'Isa', 'Nitto', 'isa.nitto@example.com'),
('graziella_bellucci', 'Graziella', 'Bellucci', 'graziella.bellucci@example.com'),
('serafina_metella', 'Serafina', 'Metella', 'serafina.metella@example.com'),
('rosaria_nitto', 'Rosaria', 'Nitto', 'rosaria.nitto@example.com'),
('antonino_rizzo', 'Antonino', 'Rizzo', 'antonino.rizzo@example.com'),
('ubaldo_calgari', 'Ubaldo', 'Calgari', 'ubaldo.calgari@example.com'),
('beppe_branciforte', 'Beppe', 'Branciforte', 'beppe.branciforte@example.com'),
('lilla_gaggini', 'Lilla', 'Gaggini', 'lilla.gaggini@example.com'),
('martina_nadi', 'Martina', 'Nadi', 'martina.nadi@example.com'),
('romana_pasqua', 'Romana', 'Pasqua', 'romana.pasqua@example.com'),
('gemma_gussoni', 'Gemma', 'Gussoni', 'gemma.gussoni@example.com'),
('raffaellino_guarneri', 'Raffaellino', 'Guarneri', 'raffaellino.guarneri@example.com'),
('cristina_coppola', 'Cristina', 'Coppola', 'cristina.coppola@example.com'),
('etta_majorana', 'Etta', 'Majorana', 'etta.majorana@example.com'),
('lauretta_bandello', 'Lauretta', 'Bandello', 'lauretta.bandello@example.com'),
('amalia_calgari', 'Amalia', 'Calgari', 'amalia.calgari@example.com'),
('ferdinando_civaschi', 'Ferdinando', 'Civaschi', 'ferdinando.civaschi@example.com'),
('mattia_lerner', 'Mattia', 'Lerner', 'mattia.lerner@example.com'),
('pompeo_murri', 'Pompeo', 'Murri', 'pompeo.murri@example.com'),
('anita_salata', 'Anita', 'Salata', 'anita.salata@example.com'),
('amedeo_pareto', 'Amedeo', 'Pareto', 'amedeo.pareto@example.com'),
('guido_nonis', 'Guido', 'Nonis', 'guido.nonis@example.com'),
('damiano_caironi', 'Damiano', 'Caironi', 'damiano.caironi@example.com'),
('aurora_detti', 'Aurora', 'Detti', 'aurora.detti@example.com'),
('amanda_petrocelli', 'Amanda', 'Petrocelli', 'amanda.petrocelli@example.com'),
('roman_schiavone', 'Roman', 'Schiavone', 'roman.schiavone@example.com'),
('fredo_mastandrea', 'Fredo', 'Mastandrea', 'fredo.mastandrea@example.com'),
('cassandra_sgalambro', 'Cassandra', 'Sgalambro', 'cassandra.sgalambro@example.com'),
('antonella_rocca', 'Antonella', 'Rocca', 'antonella.rocca@example.com'),
('maurizio_zola', 'Maurizio', 'Zola', 'maurizio.zola@example.com'),
('giulietta_gozzano', 'Giulietta', 'Gozzano', 'giulietta.gozzano@example.com'),
('guido_sorrentino', 'Guido', 'Sorrentino', 'guido.sorrentino@example.com'),
('fabio_treves', 'Fabio', 'Treves', 'fabio.treves@example.com'),
('piero_cendron', 'Piero', 'Cendron', 'piero.cendron@example.com'),
('raimondo_sabbatini', 'Raimondo', 'Sabbatini', 'raimondo.sabbatini@example.com'),
('giosuè_franscini', 'Giosuè', 'Franscini', 'giosuè.franscini@example.com'),
('danilo_busoni', 'Danilo', 'Busoni', 'danilo.busoni@example.com'),
('filippo_medici', 'Filippo', 'Medici', 'filippo.medici@example.com'),
('guarino_depero', 'Guarino', 'Depero', 'guarino.depero@example.com'),
('matteo_blasi', 'Matteo', 'Blasi', 'matteo.blasi@example.com'),
('valerio_cagnotto', 'Valerio', 'Cagnotto', 'valerio.cagnotto@example.com'),
('armando_galiazzo', 'Armando', 'Galiazzo', 'armando.galiazzo@example.com'),
('isabella_varano', 'Isabella', 'Varano', 'isabella.varano@example.com'),
('federico_bova', 'Federico', 'Bova', 'federico.bova@example.com'),
('aurora_bruscantini', 'Aurora', 'Bruscantini', 'aurora.bruscantini@example.com'),
('ettore_zetticci', 'Ettore', 'Zetticci', 'ettore.zetticci@example.com'),
('ubaldo_saraceno', 'Ubaldo', 'Saraceno', 'ubaldo.saraceno@example.com'),
('iolanda_carullo', 'Iolanda', 'Carullo', 'iolanda.carullo@example.com'),
('antonello_nugnes', 'Antonello', 'Nugnes', 'antonello.nugnes@example.com'),
('cipriano_gadda', 'Cipriano', 'Gadda', 'cipriano.gadda@example.com'),
('vincentio_trapani', 'Vincentio', 'Trapani', 'vincentio.trapani@example.com'),
('gino_castiglione', 'Gino', 'Castiglione', 'gino.castiglione@example.com'),
('gino_guarana', 'Gino', 'Guarana', 'gino.guarana@example.com'),
('nedda_condoleo', 'Nedda', 'Condoleo', 'nedda.condoleo@example.com'),
('lucrezia_semitecolo', 'Lucrezia', 'Semitecolo', 'lucrezia.semitecolo@example.com'),
('gianmarco_finotto', 'Gianmarco', 'Finotto', 'gianmarco.finotto@example.com'),
('pier_rosselli', 'Pier', 'Rosselli', 'pier.rosselli@example.com'),
('lamberto_mercalli', 'Lamberto', 'Mercalli', 'lamberto.mercalli@example.com'),
('ermanno_camanni', 'Ermanno', 'Camanni', 'ermanno.camanni@example.com'),
('costantino_greco', 'Costantino', 'Greco', 'costantino.greco@example.com'),
('gilberto_berlusconi', 'Gilberto', 'Berlusconi', 'gilberto.berlusconi@example.com'),
('olga_tamborini', 'Olga', 'Tamborini', 'olga.tamborini@example.com'),
('evangelista_argurio', 'Evangelista', 'Argurio', 'evangelista.argurio@example.com'),
('benito_cignaroli', 'Benito', 'Cignaroli', 'benito.cignaroli@example.com'),
('bettina_tremonti', 'Bettina', 'Tremonti', 'bettina.tremonti@example.com'),
('lucio_pontecorvo', 'Lucio', 'Pontecorvo', 'lucio.pontecorvo@example.com'),
('eliana_balla', 'Eliana', 'Balla', 'eliana.balla@example.com'),
('augusto_schiavo', 'Augusto', 'Schiavo', 'augusto.schiavo@example.com'),
('gioele_iannucci', 'Gioele', 'Iannucci', 'gioele.iannucci@example.com'),
('ramona_schicchi', 'Ramona', 'Schicchi', 'ramona.schicchi@example.com'),
('carmelo_leopardi', 'Carmelo', 'Leopardi', 'carmelo.leopardi@example.com'),
('fiamma_basadonna', 'Fiamma', 'Basadonna', 'fiamma.basadonna@example.com'),
('nanni_gozzi', 'Nanni', 'Gozzi', 'nanni.gozzi@example.com'),
('federico_botticelli', 'Federico', 'Botticelli', 'federico.botticelli@example.com'),
('gionata_toldo', 'Gionata', 'Toldo', 'gionata.toldo@example.com'),
('nedda_gori', 'Nedda', 'Gori', 'nedda.gori@example.com'),
('loredana_lombroso', 'Loredana', 'Lombroso', 'loredana.lombroso@example.com'),
('giulietta_scarpa', 'Giulietta', 'Scarpa', 'giulietta.scarpa@example.com'),
('eugenia_pergolesi', 'Eugenia', 'Pergolesi', 'eugenia.pergolesi@example.com'),
('antonietta_filzi', 'Antonietta', 'Filzi', 'antonietta.filzi@example.com'),
('stefani_anichini', 'Stefani', 'Anichini', 'stefani.anichini@example.com'),
('ferdinando_gaiatto', 'Ferdinando', 'Gaiatto', 'ferdinando.gaiatto@example.com'),
('graziella_bonolis', 'Graziella', 'Bonolis', 'graziella.bonolis@example.com'),
('laureano_medici', 'Laureano', 'Medici', 'laureano.medici@example.com'),
('alfio_seddio', 'Alfio', 'Seddio', 'alfio.seddio@example.com'),
('vanessa_parini', 'Vanessa', 'Parini', 'vanessa.parini@example.com'),
('giosuè_cainero', 'Giosuè', 'Cainero', 'giosuè.cainero@example.com'),
('mattia_petrocelli', 'Mattia', 'Petrocelli', 'mattia.petrocelli@example.com'),
('nicola_sanudo', 'Nicola', 'Sanudo', 'nicola.sanudo@example.com'),
('pasquale_manunta', 'Pasquale', 'Manunta', 'pasquale.manunta@example.com'),
('lazzaro_morlacchi', 'Lazzaro', 'Morlacchi', 'lazzaro.morlacchi@example.com'),
('gianluca_matteotti', 'Gianluca', 'Matteotti', 'gianluca.matteotti@example.com'),
('arsenio_crisafulli', 'Arsenio', 'Crisafulli', 'arsenio.crisafulli@example.com'),
('amanda_carli', 'Amanda', 'Carli', 'amanda.carli@example.com'),
('milo_ceri', 'Milo', 'Ceri', 'milo.ceri@example.com'),
('ninetta_scarfoglio', 'Ninetta', 'Scarfoglio', 'ninetta.scarfoglio@example.com'),
('carolina_pisacane', 'Carolina', 'Pisacane', 'carolina.pisacane@example.com'),
('veronica_giannuzzi', 'Veronica', 'Giannuzzi', 'veronica.giannuzzi@example.com'),
('stefani_soffici', 'Stefani', 'Soffici', 'stefani.soffici@example.com'),
('fabio_iacovelli', 'Fabio', 'Iacovelli', 'fabio.iacovelli@example.com'),
('delfino_niscoromni', 'Delfino', 'Niscoromni', 'delfino.niscoromni@example.com'),
('maria_mazzeo', 'Maria', 'Mazzeo', 'maria.mazzeo@example.com'),
('camilla_catalano', 'Camilla', 'Catalano', 'camilla.catalano@example.com'),
('gianmarco_innocenti', 'Gianmarco', 'Innocenti', 'gianmarco.innocenti@example.com'),
('milo_taccola', 'Milo', 'Taccola', 'milo.taccola@example.com'),
('alderano_alboni', 'Alderano', 'Alboni', 'alderano.alboni@example.com'),
('francesco_canali', 'Francesco', 'Canali', 'francesco.canali@example.com'),
('margherita_fittipaldi', 'Margherita', 'Fittipaldi', 'margherita.fittipaldi@example.com'),
('diana_gremese', 'Diana', 'Gremese', 'diana.gremese@example.com'),
('maria_salieri', 'Maria', 'Salieri', 'maria.salieri@example.com'),
('lolita_antonacci', 'Lolita', 'Antonacci', 'lolita.antonacci@example.com'),
('piero_collina', 'Piero', 'Collina', 'piero.collina@example.com'),
('arsenio_liguori', 'Arsenio', 'Liguori', 'arsenio.liguori@example.com'),
('fedele_strangio', 'Fedele', 'Strangio', 'fedele.strangio@example.com'),
('giacinto_ceri', 'Giacinto', 'Ceri', 'giacinto.ceri@example.com'),
('marco_morandi', 'Marco', 'Morandi', 'marco.morandi@example.com'),
('giada_necci', 'Giada', 'Necci', 'giada.necci@example.com'),
('costantino_tebaldi', 'Costantino', 'Tebaldi', 'costantino.tebaldi@example.com'),
('valeria_nugnes', 'Valeria', 'Nugnes', 'valeria.nugnes@example.com'),
('ezio_sgarbi', 'Ezio', 'Sgarbi', 'ezio.sgarbi@example.com'),
('sylvia_borromeo', 'Sylvia', 'Borromeo', 'sylvia.borromeo@example.com'),
('carla_impastato', 'Carla', 'Impastato', 'carla.impastato@example.com'),
('fedele_innocenti', 'Fedele', 'Innocenti', 'fedele.innocenti@example.com'),
('luigina_tosto', 'Luigina', 'Tosto', 'luigina.tosto@example.com'),
('domenico_lercari', 'Domenico', 'Lercari', 'domenico.lercari@example.com'),
('paloma_soderini', 'Paloma', 'Soderini', 'paloma.soderini@example.com'),
('diana_petralli', 'Diana', 'Petralli', 'diana.petralli@example.com'),
('carmelo_renault', 'Carmelo', 'Renault', 'carmelo.renault@example.com'),
('gionata_falloppio', 'Gionata', 'Falloppio', 'gionata.falloppio@example.com'),
('virgilio_prada', 'Virgilio', 'Prada', 'virgilio.prada@example.com'),
('dolores_scotto', 'Dolores', 'Scotto', 'dolores.scotto@example.com'),
('antonia_roth', 'Antonia', 'Roth', 'antonia.roth@example.com'),
('lucia_verri', 'Lucia', 'Verri', 'lucia.verri@example.com'),
('severino_staglieno', 'Severino', 'Staglieno', 'severino.staglieno@example.com'),
('camillo_sgarbi', 'Camillo', 'Sgarbi', 'camillo.sgarbi@example.com'),
('daniele_turati', 'Daniele', 'Turati', 'daniele.turati@example.com'),
('marina_donati', 'Marina', 'Donati', 'marina.donati@example.com'),
('lucrezia_pozzecco', 'Lucrezia', 'Pozzecco', 'lucrezia.pozzecco@example.com'),
('nina_carriera', 'Nina', 'Carriera', 'nina.carriera@example.com'),
('mariano_malaparte', 'Mariano', 'Malaparte', 'mariano.malaparte@example.com'),
('raffaele_schiavone', 'Raffaele', 'Schiavone', 'raffaele.schiavone@example.com'),
('germana_rocca', 'Germana', 'Rocca', 'germana.rocca@example.com'),
('mirko_onio', 'Mirko', 'Onio', 'mirko.onio@example.com'),
('antonietta_aulenti', 'Antonietta', 'Aulenti', 'antonietta.aulenti@example.com'),
('claudio_giunti', 'Claudio', 'Giunti', 'claudio.giunti@example.com'),
('mirko_vercelloni', 'Mirko', 'Vercelloni', 'mirko.vercelloni@example.com'),
('enzio_vecoli', 'Enzio', 'Vecoli', 'enzio.vecoli@example.com'),
('luca_boccioni', 'Luca', 'Boccioni', 'luca.boccioni@example.com'),
('serafina_verga', 'Serafina', 'Verga', 'serafina.verga@example.com'),
('daniele_mondaini', 'Daniele', 'Mondaini', 'daniele.mondaini@example.com'),
('sole_vecellio', 'Sole', 'Vecellio', 'sole.vecellio@example.com'),
('bruno_federico', 'Bruno', 'Federico', 'bruno.federico@example.com'),
('gloria_bombieri', 'Gloria', 'Bombieri', 'gloria.bombieri@example.com'),
('guarino_barese', 'Guarino', 'Barese', 'guarino.barese@example.com'),
('amanda_anguissola', 'Amanda', 'Anguissola', 'amanda.anguissola@example.com'),
('lodovico_petruzzi', 'Lodovico', 'Petruzzi', 'lodovico.petruzzi@example.com'),
('emilio_abate', 'Emilio', 'Abate', 'emilio.abate@example.com'),
('luisa_giulietti', 'Luisa', 'Giulietti', 'luisa.giulietti@example.com'),
('lilla_pugliese', 'Lilla', 'Pugliese', 'lilla.pugliese@example.com'),
('giorgia_tuzzolino', 'Giorgia', 'Tuzzolino', 'giorgia.tuzzolino@example.com'),
('renzo_tafuri', 'Renzo', 'Tafuri', 'renzo.tafuri@example.com'),
('piersanti_argurio', 'Piersanti', 'Argurio', 'piersanti.argurio@example.com'),
('greca_maderna', 'Greca', 'Maderna', 'greca.maderna@example.com'),
('stefano_brunello', 'Stefano', 'Brunello', 'stefano.brunello@example.com'),
('angelo_bertoli', 'Angelo', 'Bertoli', 'angelo.bertoli@example.com'),
('gaspare_borghese', 'Gaspare', 'Borghese', 'gaspare.borghese@example.com'),
('dionigi_trussardi', 'Dionigi', 'Trussardi', 'dionigi.trussardi@example.com'),
('zaira_boezio', 'Zaira', 'Boezio', 'zaira.boezio@example.com'),
('arnulfo_tanzini', 'Arnulfo', 'Tanzini', 'arnulfo.tanzini@example.com'),
('stella_mazzocchi', 'Stella', 'Mazzocchi', 'stella.mazzocchi@example.com'),
('lolita_bottigliero', 'Lolita', 'Bottigliero', 'lolita.bottigliero@example.com'),
('rembrandt_porcellato', 'Rembrandt', 'Porcellato', 'rembrandt.porcellato@example.com'),
('mariana_nadi', 'Mariana', 'Nadi', 'mariana.nadi@example.com'),
('martino_cerquiglini', 'Martino', 'Cerquiglini', 'martino.cerquiglini@example.com'),
('marina_crisafulli', 'Marina', 'Crisafulli', 'marina.crisafulli@example.com'),
('dolores_sforza', 'Dolores', 'Sforza', 'dolores.sforza@example.com'),
('gilberto_bodoni', 'Gilberto', 'Bodoni', 'gilberto.bodoni@example.com'),
('biagio_ramazzotti', 'Biagio', 'Ramazzotti', 'biagio.ramazzotti@example.com'),
('coriolano_ferrara', 'Coriolano', 'Ferrara', 'coriolano.ferrara@example.com'),
('lina_pometta', 'Lina', 'Pometta', 'lina.pometta@example.com'),
('giuseppe_corbo', 'Giuseppe', 'Corbo', 'giuseppe.corbo@example.com'),
('benito_errigo', 'Benito', 'Errigo', 'benito.errigo@example.com'),
('lucia_argento', 'Lucia', 'Argento', 'lucia.argento@example.com'),
('silvia_asmundo', 'Silvia', 'Asmundo', 'silvia.asmundo@example.com'),
('pier_comeriato', 'Pier', 'Comeriato', 'pier.comeriato@example.com'),
('maria_fantozzi', 'Maria', 'Fantozzi', 'maria.fantozzi@example.com'),
('rosalia_luna', 'Rosalia', 'Luna', 'rosalia.luna@example.com'),
('enzo_parisi', 'Enzo', 'Parisi', 'enzo.parisi@example.com'),
('leopoldo_verdone', 'Leopoldo', 'Verdone', 'leopoldo.verdone@example.com'),
('alphons_cuda', 'Alphons', 'Cuda', 'alphons.cuda@example.com'),
('gustavo_scaramucci', 'Gustavo', 'Scaramucci', 'gustavo.scaramucci@example.com'),
('sergius_cappelli', 'Sergius', 'Cappelli', 'sergius.cappelli@example.com'),
('francesca_govoni', 'Francesca', 'Govoni', 'francesca.govoni@example.com'),
('donatello_beccaria', 'Donatello', 'Beccaria', 'donatello.beccaria@example.com'),
('paoletta_roth', 'Paoletta', 'Roth', 'paoletta.roth@example.com'),
('clelia_fusani', 'Clelia', 'Fusani', 'clelia.fusani@example.com'),
('gustavo_montalcini', 'Gustavo', 'Montalcini', 'gustavo.montalcini@example.com'),
('serena_verdone', 'Serena', 'Verdone', 'serena.verdone@example.com'),
('severino_trentini', 'Severino', 'Trentini', 'severino.trentini@example.com'),
('osvaldo_ceci', 'Osvaldo', 'Ceci', 'osvaldo.ceci@example.com'),
('gianni_scarpa', 'Gianni', 'Scarpa', 'gianni.scarpa@example.com'),
('rosina_cimarosa', 'Rosina', 'Cimarosa', 'rosina.cimarosa@example.com'),
('piergiuseppe_cherubini', 'Piergiuseppe', 'Cherubini', 'piergiuseppe.cherubini@example.com'),
('giada_migliaccio', 'Giada', 'Migliaccio', 'giada.migliaccio@example.com'),
('sole_toscanini', 'Sole', 'Toscanini', 'sole.toscanini@example.com'),
('fiorino_berrè', 'Fiorino', 'Berrè', 'fiorino.berrè@example.com'),
('simone_saffi', 'Simone', 'Saffi', 'simone.saffi@example.com'),
('costanzo_lucciano', 'Costanzo', 'Lucciano', 'costanzo.lucciano@example.com'),
('caterina_berengario', 'Caterina', 'Berengario', 'caterina.berengario@example.com'),
('pomponio_parmitano', 'Pomponio', 'Parmitano', 'pomponio.parmitano@example.com'),
('salvatore_padovano', 'Salvatore', 'Padovano', 'salvatore.padovano@example.com'),
('maurilio_toninelli', 'Maurilio', 'Toninelli', 'maurilio.toninelli@example.com'),
('giorgia_tassoni', 'Giorgia', 'Tassoni', 'giorgia.tassoni@example.com'),
('eva_camilleri', 'Eva', 'Camilleri', 'eva.camilleri@example.com'),
('gioachino_angeli', 'Gioachino', 'Angeli', 'gioachino.angeli@example.com'),
('paloma_naccari', 'Paloma', 'Naccari', 'paloma.naccari@example.com'),
('isabella_interiano', 'Isabella', 'Interiano', 'isabella.interiano@example.com'),
('arsenio_accardo', 'Arsenio', 'Accardo', 'arsenio.accardo@example.com'),
('maria_pavone', 'Maria', 'Pavone', 'maria.pavone@example.com'),
('margherita_buscetta', 'Margherita', 'Buscetta', 'margherita.buscetta@example.com'),
('ranieri_montanariello', 'Ranieri', 'Montanariello', 'ranieri.montanariello@example.com'),
('olga_vittadello', 'Olga', 'Vittadello', 'olga.vittadello@example.com'),
('elmo_cafarchia', 'Elmo', 'Cafarchia', 'elmo.cafarchia@example.com'),
('nina_pastine', 'Nina', 'Pastine', 'nina.pastine@example.com'),
('damiano_iannotti', 'Damiano', 'Iannotti', 'damiano.iannotti@example.com'),
('ansaldo_trotta', 'Ansaldo', 'Trotta', 'ansaldo.trotta@example.com'),
('stefano_valmarana', 'Stefano', 'Valmarana', 'stefano.valmarana@example.com'),
('marissa_serlupi', 'Marissa', 'Serlupi', 'marissa.serlupi@example.com'),
('susanna_iannucci', 'Susanna', 'Iannucci', 'susanna.iannucci@example.com'),
('gioachino_greco', 'Gioachino', 'Greco', 'gioachino.greco@example.com'),
('vito_gabba', 'Vito', 'Gabba', 'vito.gabba@example.com'),
('jacopo_orengo', 'Jacopo', 'Orengo', 'jacopo.orengo@example.com'),
('mercedes_ajello', 'Mercedes', 'Ajello', 'mercedes.ajello@example.com'),
('gianmarco_zabarella', 'Gianmarco', 'Zabarella', 'gianmarco.zabarella@example.com'),
('giada_chiesa', 'Giada', 'Chiesa', 'giada.chiesa@example.com'),
('annibale_letta', 'Annibale', 'Letta', 'annibale.letta@example.com'),
('maria_tornatore', 'Maria', 'Tornatore', 'maria.tornatore@example.com'),
('alberto_foconi', 'Alberto', 'Foconi', 'alberto.foconi@example.com'),
('germana_segrè', 'Germana', 'Segrè', 'germana.segrè@example.com'),
('graziella_valentino', 'Graziella', 'Valentino', 'graziella.valentino@example.com'),
('massimo_marini', 'Massimo', 'Marini', 'massimo.marini@example.com'),
('lara_spinelli', 'Lara', 'Spinelli', 'lara.spinelli@example.com'),
('stefano_tognazzi', 'Stefano', 'Tognazzi', 'stefano.tognazzi@example.com'),
('simone_proietti', 'Simone', 'Proietti', 'simone.proietti@example.com'),
('pasqual_valentino', 'Pasqual', 'Valentino', 'pasqual.valentino@example.com'),
('fiorino_giammusso', 'Fiorino', 'Giammusso', 'fiorino.giammusso@example.com'),
('valentina_jacuzzi', 'Valentina', 'Jacuzzi', 'valentina.jacuzzi@example.com'),
('elena_benigni', 'Elena', 'Benigni', 'elena.benigni@example.com'),
('martino_meucci', 'Martino', 'Meucci', 'martino.meucci@example.com'),
('ricciotti_orsini', 'Ricciotti', 'Orsini', 'ricciotti.orsini@example.com'),
('ottavio_orlando', 'Ottavio', 'Orlando', 'ottavio.orlando@example.com'),
('guarino_celentano', 'Guarino', 'Celentano', 'guarino.celentano@example.com'),
('marcella_pace', 'Marcella', 'Pace', 'marcella.pace@example.com'),
('rosa_galtarossa', 'Rosa', 'Galtarossa', 'rosa.galtarossa@example.com'),
('victoria_gadda', 'Victoria', 'Gadda', 'victoria.gadda@example.com'),
('valerio_babati', 'Valerio', 'Babati', 'valerio.babati@example.com'),
('mirco_ricolfi', 'Mirco', 'Ricolfi', 'mirco.ricolfi@example.com'),
('alessio_ariosto', 'Alessio', 'Ariosto', 'alessio.ariosto@example.com'),
('iolanda_montesano', 'Iolanda', 'Montesano', 'iolanda.montesano@example.com'),
('vittorio_mozart', 'Vittorio', 'Mozart', 'vittorio.mozart@example.com'),
('beppe_gentili', 'Beppe', 'Gentili', 'beppe.gentili@example.com'),
('francesca_forza', 'Francesca', 'Forza', 'francesca.forza@example.com'),
('ramona_caetani', 'Ramona', 'Caetani', 'ramona.caetani@example.com'),
('lorenzo_zoppetto', 'Lorenzo', 'Zoppetto', 'lorenzo.zoppetto@example.com'),
('elena_curiel', 'Elena', 'Curiel', 'elena.curiel@example.com'),
('pasqual_lombardo', 'Pasqual', 'Lombardo', 'pasqual.lombardo@example.com'),
('santino_mattarella', 'Santino', 'Mattarella', 'santino.mattarella@example.com'),
('sandra_cilibrasi', 'Sandra', 'Cilibrasi', 'sandra.cilibrasi@example.com'),
('lucio_maderna', 'Lucio', 'Maderna', 'lucio.maderna@example.com'),
('patrizia_sansoni', 'Patrizia', 'Sansoni', 'patrizia.sansoni@example.com'),
('telemaco_argenti', 'Telemaco', 'Argenti', 'telemaco.argenti@example.com'),
('raffaello_gregorio', 'Raffaello', 'Gregorio', 'raffaello.gregorio@example.com'),
('salvi_petruzzi', 'Salvi', 'Petruzzi', 'salvi.petruzzi@example.com'),
('lara_giulietti', 'Lara', 'Giulietti', 'lara.giulietti@example.com'),
('ivo_tutino', 'Ivo', 'Tutino', 'ivo.tutino@example.com'),
('ronaldo_salandra', 'Ronaldo', 'Salandra', 'ronaldo.salandra@example.com'),
('antonia_metella', 'Antonia', 'Metella', 'antonia.metella@example.com'),
('lina_torricelli', 'Lina', 'Torricelli', 'lina.torricelli@example.com'),
('adele_contarini', 'Adele', 'Contarini', 'adele.contarini@example.com'),
('lando_combi', 'Lando', 'Combi', 'lando.combi@example.com'),
('luciana_galuppi', 'Luciana', 'Galuppi', 'luciana.galuppi@example.com'),
('lolita_bruscantini', 'Lolita', 'Bruscantini', 'lolita.bruscantini@example.com'),
('romina_morandini', 'Romina', 'Morandini', 'romina.morandini@example.com'),
('corrado_rossi', 'Corrado', 'Rossi', 'corrado.rossi@example.com'),
('arturo_rosiello', 'Arturo', 'Rosiello', 'arturo.rosiello@example.com'),
('romolo_iannotti', 'Romolo', 'Iannotti', 'romolo.iannotti@example.com'),
('annetta_vecellio', 'Annetta', 'Vecellio', 'annetta.vecellio@example.com'),
('loretta_capuana', 'Loretta', 'Capuana', 'loretta.capuana@example.com'),
('zaira_udinesi', 'Zaira', 'Udinesi', 'zaira.udinesi@example.com'),
('arnulfo_draghi', 'Arnulfo', 'Draghi', 'arnulfo.draghi@example.com'),
('giulietta_bonaventura', 'Giulietta', 'Bonaventura', 'giulietta.bonaventura@example.com'),
('concetta_zoppetto', 'Concetta', 'Zoppetto', 'concetta.zoppetto@example.com'),
('piergiorgio_fabbri', 'Piergiorgio', 'Fabbri', 'piergiorgio.fabbri@example.com'),
('rosaria_trombetta', 'Rosaria', 'Trombetta', 'rosaria.trombetta@example.com'),
('lucia_liguori', 'Lucia', 'Liguori', 'lucia.liguori@example.com'),
('vanessa_pigafetta', 'Vanessa', 'Pigafetta', 'vanessa.pigafetta@example.com'),
('pierina_monteverdi', 'Pierina', 'Monteverdi', 'pierina.monteverdi@example.com'),
('riccardo_benedetti', 'Riccardo', 'Benedetti', 'riccardo.benedetti@example.com'),
('priscilla_ortolani', 'Priscilla', 'Ortolani', 'priscilla.ortolani@example.com'),
('ruggero_cavanna', 'Ruggero', 'Cavanna', 'ruggero.cavanna@example.com'),
('antonello_leonardi', 'Antonello', 'Leonardi', 'antonello.leonardi@example.com'),
('gianluigi_guidone', 'Gianluigi', 'Guidone', 'gianluigi.guidone@example.com'),
('giulia_galilei', 'Giulia', 'Galilei', 'giulia.galilei@example.com'),
('costantino_traversa', 'Costantino', 'Traversa', 'costantino.traversa@example.com'),
('dolores_condoleo', 'Dolores', 'Condoleo', 'dolores.condoleo@example.com'),
('enzio_dallara', 'Enzio', 'Dallara', 'enzio.dallara@example.com'),
('ippazio_sansoni', 'Ippazio', 'Sansoni', 'ippazio.sansoni@example.com'),
('livio_lattuada', 'Livio', 'Lattuada', 'livio.lattuada@example.com'),
('ivo_donati', 'Ivo', 'Donati', 'ivo.donati@example.com'),
('pierina_antonello', 'Pierina', 'Antonello', 'pierina.antonello@example.com'),
('raffaello_spallanzani', 'Raffaello', 'Spallanzani', 'raffaello.spallanzani@example.com'),
('ramona_satta', 'Ramona', 'Satta', 'ramona.satta@example.com'),
('tiziano_marazzi', 'Tiziano', 'Marazzi', 'tiziano.marazzi@example.com'),
('rosa_brambilla', 'Rosa', 'Brambilla', 'rosa.brambilla@example.com'),
('zaira_morpurgo', 'Zaira', 'Morpurgo', 'zaira.morpurgo@example.com'),
('ornella_niscoromni', 'Ornella', 'Niscoromni', 'ornella.niscoromni@example.com'),
('olga_inzaghi', 'Olga', 'Inzaghi', 'olga.inzaghi@example.com'),
('francesca_sgarbi', 'Francesca', 'Sgarbi', 'francesca.sgarbi@example.com'),
('ludovica_federico', 'Ludovica', 'Federico', 'ludovica.federico@example.com'),
('luchino_zanichelli', 'Luchino', 'Zanichelli', 'luchino.zanichelli@example.com'),
('camillo_pausini', 'Camillo', 'Pausini', 'camillo.pausini@example.com'),
('santino_spadafora', 'Santino', 'Spadafora', 'santino.spadafora@example.com'),
('alfio_visintini', 'Alfio', 'Visintini', 'alfio.visintini@example.com'),
('mario_zola', 'Mario', 'Zola', 'mario.zola@example.com'),
('antonina_palumbo', 'Antonina', 'Palumbo', 'antonina.palumbo@example.com'),
('elladio_morandini', 'Elladio', 'Morandini', 'elladio.morandini@example.com'),
('carlo_barozzi', 'Carlo', 'Barozzi', 'carlo.barozzi@example.com'),
('raimondo_balotelli', 'Raimondo', 'Balotelli', 'raimondo.balotelli@example.com'),
('maurizio_gaito', 'Maurizio', 'Gaito', 'maurizio.gaito@example.com'),
('costanzo_borghese', 'Costanzo', 'Borghese', 'costanzo.borghese@example.com'),
('francesca_nosiglia', 'Francesca', 'Nosiglia', 'francesca.nosiglia@example.com'),
('viridiana_pagnotto', 'Viridiana', 'Pagnotto', 'viridiana.pagnotto@example.com'),
('ida_jilani', 'Ida', 'Jilani', 'ida.jilani@example.com'),
('angelo_scalera', 'Angelo', 'Scalera', 'angelo.scalera@example.com'),
('patrizio_pertile', 'Patrizio', 'Pertile', 'patrizio.pertile@example.com'),
('dante_respighi', 'Dante', 'Respighi', 'dante.respighi@example.com'),
('sergius_ravaglioli', 'Sergius', 'Ravaglioli', 'sergius.ravaglioli@example.com'),
('ubaldo_biagiotti', 'Ubaldo', 'Biagiotti', 'ubaldo.biagiotti@example.com'),
('alphons_morandi', 'Alphons', 'Morandi', 'alphons.morandi@example.com'),
('luchino_iadanza', 'Luchino', 'Iadanza', 'luchino.iadanza@example.com'),
('federigo_cesarotti', 'Federigo', 'Cesarotti', 'federigo.cesarotti@example.com'),
('lando_galilei', 'Lando', 'Galilei', 'lando.galilei@example.com'),
('rocco_baggio', 'Rocco', 'Baggio', 'rocco.baggio@example.com'),
('severino_scarpa', 'Severino', 'Scarpa', 'severino.scarpa@example.com'),
('iolanda_casellati', 'Iolanda', 'Casellati', 'iolanda.casellati@example.com'),
('sante_baracca', 'Sante', 'Baracca', 'sante.baracca@example.com'),
('mattia_mazzacurati', 'Mattia', 'Mazzacurati', 'mattia.mazzacurati@example.com'),
('tonia_gucci', 'Tonia', 'Gucci', 'tonia.gucci@example.com'),
('flavio_cilea', 'Flavio', 'Cilea', 'flavio.cilea@example.com'),
('nino_versace', 'Nino', 'Versace', 'nino.versace@example.com'),
('barbara_babbo', 'Barbara', 'Babbo', 'barbara.babbo@example.com'),
('ignazio_stefanelli', 'Ignazio', 'Stefanelli', 'ignazio.stefanelli@example.com'),
('tonia_ferrata', 'Tonia', 'Ferrata', 'tonia.ferrata@example.com'),
('lucia_boaga', 'Lucia', 'Boaga', 'lucia.boaga@example.com'),
('rodolfo_filippini', 'Rodolfo', 'Filippini', 'rodolfo.filippini@example.com'),
('loretta_mercadante', 'Loretta', 'Mercadante', 'loretta.mercadante@example.com'),
('cecilia_tomei', 'Cecilia', 'Tomei', 'cecilia.tomei@example.com'),
('calogero_scarlatti', 'Calogero', 'Scarlatti', 'calogero.scarlatti@example.com'),
('irma_novaro', 'Irma', 'Novaro', 'irma.novaro@example.com'),
('lauretta_sauli', 'Lauretta', 'Sauli', 'lauretta.sauli@example.com'),
('gelsomina_doria', 'Gelsomina', 'Doria', 'gelsomina.doria@example.com'),
('salvatore_stoppani', 'Salvatore', 'Stoppani', 'salvatore.stoppani@example.com'),
('gaspare_rossini', 'Gaspare', 'Rossini', 'gaspare.rossini@example.com'),
('gino_trupiano', 'Gino', 'Trupiano', 'gino.trupiano@example.com'),
('luisa_fieramosca', 'Luisa', 'Fieramosca', 'luisa.fieramosca@example.com'),
('amalia_cagnin', 'Amalia', 'Cagnin', 'amalia.cagnin@example.com'),
('paloma_borsellino', 'Paloma', 'Borsellino', 'paloma.borsellino@example.com'),
('baccio_torlonia', 'Baccio', 'Torlonia', 'baccio.torlonia@example.com'),
('gaspare_montalti', 'Gaspare', 'Montalti', 'gaspare.montalti@example.com'),
('bartolomeo_florio', 'Bartolomeo', 'Florio', 'bartolomeo.florio@example.com'),
('liana_casaleggio', 'Liana', 'Casaleggio', 'liana.casaleggio@example.com'),
('eleanora_salgari', 'Eleanora', 'Salgari', 'eleanora.salgari@example.com'),
('adriana_scalera', 'Adriana', 'Scalera', 'adriana.scalera@example.com'),
('nedda_camanni', 'Nedda', 'Camanni', 'nedda.camanni@example.com'),
('liliana_costalonga', 'Liliana', 'Costalonga', 'liliana.costalonga@example.com'),
('vincenzo_gentili', 'Vincenzo', 'Gentili', 'vincenzo.gentili@example.com'),
('lauretta_capuana', 'Lauretta', 'Capuana', 'lauretta.capuana@example.com'),
('flora_bernardini', 'Flora', 'Bernardini', 'flora.bernardini@example.com'),
('margherita_fantini', 'Margherita', 'Fantini', 'margherita.fantini@example.com'),
('vincentio_sgalambro', 'Vincentio', 'Sgalambro', 'vincentio.sgalambro@example.com'),
('gian_odescalchi', 'Gian', 'Odescalchi', 'gian.odescalchi@example.com'),
('antonina_capone', 'Antonina', 'Capone', 'antonina.capone@example.com'),
('rosario_beccheria', 'Rosario', 'Beccheria', 'rosario.beccheria@example.com'),
('raffaellino_ajello', 'Raffaellino', 'Ajello', 'raffaellino.ajello@example.com'),
('fulvio_onisto', 'Fulvio', 'Onisto', 'fulvio.onisto@example.com'),
('santino_coppola', 'Santino', 'Coppola', 'santino.coppola@example.com'),
('elisa_milanesi', 'Elisa', 'Milanesi', 'elisa.milanesi@example.com'),
('chiara_santoro', 'Chiara', 'Santoro', 'chiara.santoro@example.com'),
('graziano_giradello', 'Graziano', 'Giradello', 'graziano.giradello@example.com'),
('amanda_flaiano', 'Amanda', 'Flaiano', 'amanda.flaiano@example.com'),
('maria_casagrande', 'Maria', 'Casagrande', 'maria.casagrande@example.com'),
('marissa_procacci', 'Marissa', 'Procacci', 'marissa.procacci@example.com'),
('ippazio_maccanelli', 'Ippazio', 'Maccanelli', 'ippazio.maccanelli@example.com'),
('oreste_giannotti', 'Oreste', 'Giannotti', 'oreste.giannotti@example.com'),
('pierina_ligorio', 'Pierina', 'Ligorio', 'pierina.ligorio@example.com'),
('morena_baggio', 'Morena', 'Baggio', 'morena.baggio@example.com'),
('guido_costalonga', 'Guido', 'Costalonga', 'guido.costalonga@example.com'),
('tina_vecoli', 'Tina', 'Vecoli', 'tina.vecoli@example.com'),
('cassandra_marino', 'Cassandra', 'Marino', 'cassandra.marino@example.com'),
('ansaldo_rismondo', 'Ansaldo', 'Rismondo', 'ansaldo.rismondo@example.com'),
('antonietta_sibilia', 'Antonietta', 'Sibilia', 'antonietta.sibilia@example.com'),
('melina_bianchi', 'Melina', 'Bianchi', 'melina.bianchi@example.com'),
('giustino_nolcini', 'Giustino', 'Nolcini', 'giustino.nolcini@example.com'),
('virginia_montalcini', 'Virginia', 'Montalcini', 'virginia.montalcini@example.com'),
('riccardo_marsili', 'Riccardo', 'Marsili', 'riccardo.marsili@example.com'),
('venancio_vidoni', 'Venancio', 'Vidoni', 'venancio.vidoni@example.com'),
('zaira_mazzacurati', 'Zaira', 'Mazzacurati', 'zaira.mazzacurati@example.com'),
('nicolò_ceravolo', 'Nicolò', 'Ceravolo', 'nicolò.ceravolo@example.com'),
('fausto_carnera', 'Fausto', 'Carnera', 'fausto.carnera@example.com'),
('adriano_malatesta', 'Adriano', 'Malatesta', 'adriano.malatesta@example.com'),
('silvestro_luria', 'Silvestro', 'Luria', 'silvestro.luria@example.com'),
('rosario_ajello', 'Rosario', 'Ajello', 'rosario.ajello@example.com'),
('alderano_corcos', 'Alderano', 'Corcos', 'alderano.corcos@example.com'),
('gianna_necci', 'Gianna', 'Necci', 'gianna.necci@example.com'),
('rodolfo_ramazzotti', 'Rodolfo', 'Ramazzotti', 'rodolfo.ramazzotti@example.com'),
('claudio_cilibrasi', 'Claudio', 'Cilibrasi', 'claudio.cilibrasi@example.com'),
('guglielmo_iannuzzi', 'Guglielmo', 'Iannuzzi', 'guglielmo.iannuzzi@example.com'),
('pompeo_romiti', 'Pompeo', 'Romiti', 'pompeo.romiti@example.com'),
('alberico_lussu', 'Alberico', 'Lussu', 'alberico.lussu@example.com'),
('orazio_nordio', 'Orazio', 'Nordio', 'orazio.nordio@example.com'),
('pierangelo_stein', 'Pierangelo', 'Stein', 'pierangelo.stein@example.com'),
('giuliana_carnera', 'Giuliana', 'Carnera', 'giuliana.carnera@example.com'),
('pierpaolo_iannotti', 'Pierpaolo', 'Iannotti', 'pierpaolo.iannotti@example.com'),
('cesare_cocci', 'Cesare', 'Cocci', 'cesare.cocci@example.com'),
('rosario_cossiga', 'Rosario', 'Cossiga', 'rosario.cossiga@example.com'),
('antonietta_virgilio', 'Antonietta', 'Virgilio', 'antonietta.virgilio@example.com'),
('lucio_gritti', 'Lucio', 'Gritti', 'lucio.gritti@example.com'),
('olga_barillaro', 'Olga', 'Barillaro', 'olga.barillaro@example.com');

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
