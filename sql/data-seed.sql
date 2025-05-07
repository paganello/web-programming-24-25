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

-- Popolamento tabella Quiz con  record
INSERT INTO Quiz (titolo, dataInizio, dataFine, creatore) VALUES
('Storia dellarte', '2025-01-01', '2025-01-10', 'beatrice_barberini'),
('Matematica avanzata', '2025-01-05', '2025-01-15', 'rocco_fagiani'),
('Fisica moderna', '2025-01-10', '2025-01-20', 'eva_angiolello'),
('Letteratura italiana', '2025-01-15', '2025-01-25', 'antonia_venditti'),
('Geografia mondiale', '2025-01-20', '2025-01-30', 'patrizio_bruno'),
('Chimica organica', '2025-01-25', '2025-02-05', 'gianluca_tommaseo'),
('Biologia cellulare', '2025-02-01', '2025-02-10', 'carla_tonisto'),
('Storia contemporanea', '2025-02-05', '2025-02-15', 'nicoletta_carriera'),
('Astronomia', '2025-02-10', '2025-02-20', 'ubaldo_paltrinieri'),
('Informatica di base', '2025-02-15', '2025-02-25', 'goffredo_magnani'),
('Filosofia antica', '2025-02-20', '2025-03-01', 'rita_druso'),
('Psicologia', '2025-02-25', '2025-03-05', 'dina_leoncavallo'),
('Economia', '2025-03-01', '2025-03-10', 'gian_bacosi'),
('Sociologia', '2025-03-05', '2025-03-15', 'rosa_peranda'),
('Antropologia', '2025-03-10', '2025-03-20', 'lucia_leone'),
('Storia medievale', '2025-03-15', '2025-03-25', 'marina_bernini'),
('Letteratura inglese', '2025-03-20', '2025-03-30', 'diana_barracco'),
('Fisica quantistica', '2025-03-25', '2025-04-05', 'gino_zichichi'),
('Chimica inorganica', '2025-03-30', '2025-04-10', 'alessia_sagnelli'),
('Geologia', '2025-04-01', '2025-04-11', 'graziella_lopresti'),
('Storia romana', '2025-04-05', '2025-04-15', 'griselda_bandello'),
('Matematica di base', '2025-04-10', '2025-04-20', 'adelasia_gianvecchio'),
('Fisica classica', '2025-04-15', '2025-04-25', 'jolanda_petralli'),
('Letteratura francese', '2025-04-20', '2025-04-30', 'lidia_agazzi'),
('Geografia italiana', '2025-04-25', '2025-05-05', 'laureano_peruzzi'),
('Chimica analitica', '2025-05-01', '2025-05-10', 'francesco_roero'),
('Biologia molecolare', '2025-05-05', '2025-05-15', 'venancio_juvara'),
('Storia greca', '2025-05-10', '2025-05-20', 'matilda_pace'),
('Letteratura spagnola', '2025-05-15', '2025-05-25', 'nicoletta_fusani'),
('Filosofia moderna', '2025-05-20', '2025-05-30', 'mercedes_ceci'),
('Psicologia sociale', '2025-05-25', '2025-06-05', 'federico_zanzi'),
('Economia aziendale', '2025-06-01', '2025-06-10', 'lauretta_fagiani'),
('Sociologia urbana', '2025-06-05', '2025-06-15', 'gaetano_finetti'),
('Antropologia culturale', '2025-06-10', '2025-06-20', 'nedda_moschino'),
('Storia moderna', '2025-06-15', '2025-06-25', 'giovanni_zaccagnini'),
('Letteratura tedesca', '2025-06-20', '2025-06-30', 'edoardo_amato'),
('Fisica applicata', '2025-06-25', '2025-07-05', 'calogero_ritacca'),
('Chimica fisica', '2025-07-01', '2025-07-10', 'tonino_nitti'),
('Geografia fisica', '2025-07-05', '2025-07-15', 'franco_faranda'),
('Storia dellEuropa', '2025-07-10', '2025-07-20', 'flora_ceci'),
('Matematica finanziaria', '2025-07-15', '2025-07-25', 'tonino_stradivari'),
('Fisica teorica', '2025-07-20', '2025-07-30', 'giulietta_lombardi'),
('Letteratura russa', '2025-07-25', '2025-08-05', 'carolina_tomasini'),
('Geografia politica', '2025-08-01', '2025-08-10', 'licia_greggio'),
('Chimica industriale', '2025-08-05', '2025-08-15', 'tiziano_antonacci'),
('Biologia evolutiva', '2025-08-10', '2025-08-20', 'dina_argenti'),
('Storia dellAsia', '2025-08-15', '2025-08-25', 'durante_palombi'),
('Letteratura americana', '2025-08-20', '2025-08-30', 'uberto_gravina'),
('Filosofia contemporanea', '2025-08-25', '2025-09-05', 'rembrandt_bergoglio'),
('Psicologia clinica', '2025-09-01', '2025-09-10', 'franco_garozzo'),
('Economia politica', '2025-09-05', '2025-09-15', 'goffredo_angeli'),
('Sociologia rurale', '2025-09-10', '2025-09-20', 'girolamo_ferretti'),
('Antropologia fisica', '2025-09-15', '2025-09-25', 'nicolò_manzoni'),
('Storia dell Africa', '2025-09-20', '2025-09-30', 'orlando_zetticci'),
('Letteratura giapponese', '2025-09-25', '2025-10-05', 'ludovico_rapisardi'),
('Fisica nucleare', '2025-10-01', '2025-10-10', 'gemma_bellò'),
('Chimica ambientale', '2025-10-05', '2025-10-15', 'stefania_montanelli'),
('Geografia economica', '2025-10-10', '2025-10-20', 'raimondo_micheletti'),
('Storia dell America', '2025-10-15', '2025-10-25', 'sandra_ioppi'),
('Matematica discreta', '2025-10-20', '2025-10-30', 'federica_gadda'),
('Fisica dei materiali', '2025-10-25', '2025-11-05', 'raffaellino_trillini'),
('Letteratura cinese', '2025-11-01', '2025-11-10', 'tonino_gulotta'),
('Geografia culturale', '2025-11-05', '2025-11-15', 'concetta_verdi'),
('Chimica biologica', '2025-11-10', '2025-11-20', 'gustavo_gelli'),
('Biologia marina', '2025-11-15', '2025-11-25', 'mirko_errani'),
('Storia dell Oceania', '2025-11-20', '2025-11-30', 'riccardo_monaco'),
('Letteratura africana', '2025-11-25', '2025-12-05', 'luigi_liverotti'),
('Filosofia orientale', '2025-12-01', '2025-12-10', 'silvia_rosmini'),
('Psicologia dello sviluppo', '2025-12-05', '2025-12-15', 'costantino_gargallo'),
('Economia internazionale', '2025-12-10', '2025-12-20', 'gaspare_cortese'),
('Sociologia della famiglia', '2025-12-15', '2025-12-25', 'gianluigi_duse'),
('Antropologia linguistica', '2025-12-20', '2025-12-30', 'ippazio_moresi'),
('Storia dell antica Grecia', '2025-01-01', '2025-01-10', 'pompeo_romiti'),
('Matematica per principianti', '2025-01-05', '2025-01-15', 'alberico_lussu'),
('Fisica delle particelle', '2025-01-10', '2025-01-20', 'orazio_nordio'),
('Letteratura russa', '2025-01-15', '2025-01-25', 'pierangelo_stein'),
('Geografia dell Italia', '2025-01-20', '2025-01-30', 'giuliana_carnera'),
('Chimica dei materiali', '2025-01-25', '2025-02-05', 'pierpaolo_iannotti'),
('Biologia marina', '2025-02-01', '2025-02-10', 'cesare_cocci'),
('Storia del Rinascimento', '2025-02-05', '2025-02-15', 'rosario_cossiga'),
('Astronomia moderna', '2025-02-10', '2025-02-20', 'antonietta_virgilio'),
('Informatica avanzata', '2025-02-15', '2025-02-25', 'lucio_gritti'),
('Filosofia contemporanea', '2025-02-20', '2025-03-01', 'olga_barillaro'),
('Psicologia cognitiva', '2025-02-25', '2025-03-05', 'beatrice_barberini'),
('Economia globale', '2025-03-01', '2025-03-10', 'rocco_fagiani'),
('Sociologia delle migrazioni', '2025-03-05', '2025-03-15', 'eva_angiolello'),
('Antropologia sociale', '2025-03-10', '2025-03-20', 'antonia_venditti'),
('Storia dell Impero Romano', '2025-03-15', '2025-03-25', 'patrizio_bruno'),
('Letteratura francese', '2025-03-20', '2025-03-30', 'gianluca_tommaseo'),
('Fisica quantistica', '2025-03-25', '2025-04-05', 'carla_tonisto'),
('Chimica organica', '2025-03-30', '2025-04-10', 'nicoletta_carriera'),
('Geologia applicata', '2025-04-01', '2025-04-11', 'ubaldo_paltrinieri'),
('Storia medievale', '2025-04-05', '2025-04-15', 'goffredo_magnani'),
('Matematica discreta', '2025-04-10', '2025-04-20', 'rita_druso'),
('Fisica classica', '2025-04-15', '2025-04-25', 'dina_leoncavallo'),
('Letteratura italiana', '2025-04-20', '2025-04-30', 'gian_bacosi'),
('Geografia politica', '2025-04-25', '2025-05-05', 'rosa_peranda'),
('Chimica analitica', '2025-05-01', '2025-05-10', 'lucia_leone'),
('Biologia molecolare', '2025-05-05', '2025-05-15', 'marina_bernini'),
('Storia dell Asia', '2025-05-10', '2025-05-20', 'diana_barracco'),
('Letteratura spagnola', '2025-05-15', '2025-05-25', 'gino_zichichi'),
('Filosofia antica', '2025-05-20', '2025-05-30', 'alessia_sagnelli'),
('Psicologia sociale', '2025-05-25', '2025-06-05', 'graziella_lopresti'),
('Economia aziendale', '2025-06-01', '2025-06-10', 'griselda_bandello'),
('Sociologia urbana', '2025-06-05', '2025-06-15', 'adelasia_gianvecchio'),
('Antropologia culturale', '2025-06-10', '2025-06-20', 'jolanda_petralli'),
('Storia moderna', '2025-06-15', '2025-06-25', 'lidia_agazzi'),
('Letteratura tedesca', '2025-06-20', '2025-06-30', 'laureano_peruzzi'),
('Fisica applicata', '2025-06-25', '2025-07-05', 'francesco_roero'),
('Chimica fisica', '2025-07-01', '2025-07-10', 'venancio_juvara'),
('Geografia fisica', '2025-07-05', '2025-07-15', 'matilda_pace'),
('Storia dell Europa', '2025-07-10', '2025-07-20', 'nicoletta_fusani'),
('Matematica finanziaria', '2025-07-15', '2025-07-25', 'mercedes_ceci'),
('Fisica teorica', '2025-07-20', '2025-07-30', 'federico_zanzi'),
('Letteratura americana', '2025-07-25', '2025-08-05', 'lauretta_fagiani'),
('Geografia culturale', '2025-08-01', '2025-08-10', 'gaetano_finetti'),
('Chimica industriale', '2025-08-05', '2025-08-15', 'nedda_moschino'),
('Biologia evolutiva', '2025-08-10', '2025-08-20', 'giovanni_zaccagnini'),
('Storia dell Africa', '2025-08-15', '2025-08-25', 'edoardo_amato'),
('Letteratura giapponese', '2025-08-20', '2025-08-30', 'calogero_ritacca'),
('Filosofia orientale', '2025-08-25', '2025-09-05', 'tonino_nitti'),
('Psicologia clinica', '2025-09-01', '2025-09-10', 'franco_faranda'),
('Economia politica', '2025-09-05', '2025-09-15', 'flora_ceci'),
('Sociologia rurale', '2025-09-10', '2025-09-20', 'tonino_stradivari'),
('Antropologia fisica', '2025-09-15', '2025-09-25', 'giulietta_lombardi'),
('Storia dell Oceania', '2025-09-20', '2025-09-30', 'carolina_tomasini'),
('Letteratura africana', '2025-09-25', '2025-10-05', 'licia_greggio'),
('Fisica nucleare', '2025-10-01', '2025-10-10', 'tiziano_antonacci'),
('Chimica ambientale', '2025-10-05', '2025-10-15', 'dina_argenti'),
('Geografia economica', '2025-10-10', '2025-10-20', 'durante_palombi'),
('Storia dell America', '2025-10-15', '2025-10-25', 'uberto_gravina'),
('Matematica discreta', '2025-10-20', '2025-10-30', 'rembrandt_bergoglio'),
('Fisica dei materiali', '2025-10-25', '2025-11-05', 'franco_garozzo'),
('Letteratura cinese', '2025-11-01', '2025-11-10', 'goffredo_angeli'),
('Geografia culturale', '2025-11-05', '2025-11-15', 'girolamo_ferretti'),
('Chimica biologica', '2025-11-10', '2025-11-20', 'nicolò_manzoni'),
('Biologia marina', '2025-11-15', '2025-11-25', 'orlando_zetticci'),
('Storia dell Asia', '2025-11-20', '2025-11-30', 'ludovico_rapisardi'),
('Letteratura africana', '2025-11-25', '2025-12-05', 'gemma_bellò'),
('Filosofia orientale', '2025-12-01', '2025-12-10', 'stefania_montanelli'),
('Psicologia dello sviluppo', '2025-12-05', '2025-12-15', 'raimondo_micheletti'),
('Economia internazionale', '2025-12-10', '2025-12-20', 'sandra_ioppi'),
('Sociologia della famiglia', '2025-12-15', '2025-12-25', 'federica_gadda'),
('Antropologia linguistica', '2025-12-20', '2025-12-30', 'raffaellino_trillini'),
('Storia dell antico Egitto', '2025-01-01', '2025-01-10', 'giulia_galilei'),
('Matematica applicata', '2025-01-05', '2025-01-15', 'costantino_traversa'),
('Fisica sperimentale', '2025-01-10', '2025-01-20', 'dolores_condoleo'),
('Letteratura medievale', '2025-01-15', '2025-01-25', 'enzio_dallara'),
('Geografia fisica', '2025-01-20', '2025-01-30', 'ippazio_sansoni'),
('Chimica organica avanzata', '2025-01-25', '2025-02-05', 'livio_lattuada'),
('Biologia molecolare', '2025-02-01', '2025-02-10', 'ivo_donati'),
('Storia della filosofia', '2025-02-05', '2025-02-15', 'pierina_antonello'),
('Astronomia e cosmologia', '2025-02-10', '2025-02-20', 'raffaello_spallanzani'),
('Informatica teorica', '2025-02-15', '2025-02-25', 'ramona_satta'),
('Filosofia politica', '2025-02-20', '2025-03-01', 'tiziano_marazzi'),
('Psicologia dello sviluppo', '2025-02-25', '2025-03-05', 'rosa_brambilla'),
('Economia internazionale', '2025-03-01', '2025-03-10', 'zaira_morpurgo'),
('Sociologia contemporanea', '2025-03-05', '2025-03-15', 'ornella_niscoromni'),
('Antropologia culturale', '2025-03-10', '2025-03-20', 'olga_inzaghi'),
('Storia dell arte moderna', '2025-03-15', '2025-03-25', 'francesca_sgarbi'),
('Letteratura americana', '2025-03-20', '2025-03-30', 'ludovica_federico'),
('Fisica quantistica avanzata', '2025-03-25', '2025-04-05', 'luchino_zanichelli'),
('Chimica analitica', '2025-03-30', '2025-04-10', 'camillo_pausini'),
('Geologia strutturale', '2025-04-01', '2025-04-11', 'santino_spadafora'),
('Storia della musica', '2025-04-05', '2025-04-15', 'alfio_visintini'),
('Matematica discreta', '2025-04-10', '2025-04-20', 'mario_zola'),
('Fisica dei materiali', '2025-04-15', '2025-04-25', 'antonina_palumbo'),
('Letteratura francese', '2025-04-20', '2025-04-30', 'elladio_morandini'),
('Geografia economica', '2025-04-25', '2025-05-05', 'carlo_barozzi'),
('Chimica fisica', '2025-05-01', '2025-05-10', 'raimondo_balotelli'),
('Biologia evolutiva', '2025-05-05', '2025-05-15', 'maurizio_gaito'),
('Storia dell Asia', '2025-05-10', '2025-05-20', 'costanzo_borghese'),
('Letteratura spagnola', '2025-05-15', '2025-05-25', 'francesca_nosiglia'),
('Filosofia moderna', '2025-05-20', '2025-05-30', 'viridiana_pagnotto'),
('Psicologia sociale', '2025-05-25', '2025-06-05', 'ida_jilani'),
('Economia aziendale', '2025-06-01', '2025-06-10', 'angelo_scalera'),
('Sociologia urbana', '2025-06-05', '2025-06-15', 'patrizio_pertile'),
('Antropologia fisica', '2025-06-10', '2025-06-20', 'dante_respighi'),
('Storia moderna', '2025-06-15', '2025-06-25', 'sergius_ravaglioli'),
('Letteratura tedesca', '2025-06-20', '2025-06-30', 'ubaldo_biagiotti'),
('Fisica applicata', '2025-06-25', '2025-07-05', 'alphons_morandi'),
('Chimica industriale', '2025-07-01', '2025-07-10', 'luchino_iadanza'),
('Geografia politica', '2025-07-05', '2025-07-15', 'federigo_cesarotti'),
('Storia dell Europa', '2025-07-10', '2025-07-20', 'lando_galilei'),
('Matematica finanziaria', '2025-07-15', '2025-07-25', 'rocco_baggio'),
('Fisica teorica', '2025-07-20', '2025-07-30', 'severino_scarpa'),
('Letteratura russa', '2025-07-25', '2025-08-05', 'iolanda_casellati'),
('Geografia culturale', '2025-08-01', '2025-08-10', 'sante_baracca'),
('Chimica ambientale', '2025-08-05', '2025-08-15', 'mattia_mazzacurati'),
('Biologia marina', '2025-08-10', '2025-08-20', 'tonia_gucci'),
('Storia dell Oceania', '2025-08-15', '2025-08-25', 'flavio_cilea'),
('Letteratura africana', '2025-08-20', '2025-08-30', 'nino_versace'),
('Filosofia orientale', '2025-08-25', '2025-09-05', 'barbara_babbo'),
('Psicologia clinica', '2025-09-01', '2025-09-10', 'ignazio_stefanelli'),
('Economia politica', '2025-09-05', '2025-09-15', 'tonia_ferrata'),
('Sociologia rurale', '2025-09-10', '2025-09-20', 'lucia_boaga'),
('Antropologia linguistica', '2025-09-15', '2025-09-25', 'rodolfo_filippini'),
('Storia dell Africa', '2025-09-20', '2025-09-30', 'loretta_mercadante'),
('Letteratura giapponese', '2025-09-25', '2025-10-05', 'cecilia_tomei'),
('Fisica nucleare', '2025-10-01', '2025-10-10', 'calogero_scarlatti'),
('Chimica biologica', '2025-10-05', '2025-10-15', 'irma_novaro'),
('Geografia fisica', '2025-10-10', '2025-10-20', 'lauretta_sauli'),
('Storia dell America', '2025-10-15', '2025-10-25', 'gelsomina_doria'),
('Matematica avanzata', '2025-10-20', '2025-10-30', 'salvatore_stoppani'),
('Fisica moderna', '2025-10-25', '2025-11-05', 'gaspare_rossini'),
('Letteratura italiana', '2025-11-01', '2025-11-10', 'gino_trupiano'),
('Geografia mondiale', '2025-11-05', '2025-11-15', 'luisa_fieramosca'),
('Chimica organica', '2025-11-10', '2025-11-20', 'amalia_cagnin'),
('Biologia cellulare', '2025-11-15', '2025-11-25', 'paloma_borsellino'),
('Storia contemporanea', '2025-11-20', '2025-11-30', 'baccio_torlonia'),
('Astronomia', '2025-11-25', '2025-12-05', 'gaspare_montalti'),
('Informatica di base', '2025-12-01', '2025-12-10', 'bartolomeo_florio'),
('Filosofia antica', '2025-12-05', '2025-12-15', 'liana_casaleggio'),
('Psicologia', '2025-12-10', '2025-12-20', 'eleanora_salgari'),
('Economia', '2025-12-15', '2025-12-25', 'adriana_scalera'),
('Sociologia', '2025-12-20', '2025-12-30', 'nedda_camanni'),
('Antropologia', '2025-12-25', '2026-01-05', 'liliana_costalonga'),
('Storia medievale', '2026-01-01', '2026-01-10', 'vincenzo_gentili'),
('Letteratura inglese', '2026-01-05', '2026-01-15', 'lauretta_capuana'),
('Fisica quantistica', '2026-01-10', '2026-01-20', 'flora_bernardini'),
('Chimica inorganica', '2026-01-15', '2026-01-25', 'margherita_fantini'),
('Geologia', '2026-01-20', '2026-01-30', 'vincentio_sgalambro'),
('Storia romana', '2026-01-25', '2026-02-05', 'gian_odescalchi'),
('Matematica di base', '2026-02-01', '2026-02-10', 'antonina_capone'),
('Fisica classica', '2026-02-05', '2026-02-15', 'rosario_beccheria'),
('Letteratura francese', '2026-02-10', '2026-02-20', 'raffaellino_ajello'),
('Geografia italiana', '2026-02-15', '2026-02-25', 'fulvio_onisto'),
('Chimica analitica', '2026-02-20', '2026-03-01', 'santino_coppola'),
('Biologia molecolare', '2026-02-25', '2026-03-05', 'elisa_milanesi'),
('Storia greca', '2026-03-01', '2026-03-10', 'chiara_santoro'),
('Letteratura spagnola', '2026-03-05', '2026-03-15', 'graziano_giradello'),
('Filosofia moderna', '2026-03-10', '2026-03-20', 'amanda_flaiano'),
('Psicologia sociale', '2026-03-15', '2026-03-25', 'maria_casagrande'),
('Economia aziendale', '2026-03-20', '2026-03-30', 'marissa_procacci'),
('Sociologia urbana', '2026-03-25', '2026-04-05', 'ippazio_maccanelli'),
('Antropologia culturale', '2026-04-01', '2026-04-10', 'oreste_giannotti'),
('Storia moderna', '2026-04-05', '2026-04-15', 'pierina_ligorio'),
('Letteratura tedesca', '2026-04-10', '2026-04-20', 'morena_baggio'),
('Fisica applicata', '2026-04-15', '2026-04-25', 'guido_costalonga'),
('Chimica fisica', '2026-04-20', '2026-04-30', 'tina_vecoli'),
('Geografia fisica', '2026-04-25', '2026-05-05', 'cassandra_marino'),
('Storia dell Europa', '2026-05-01', '2026-05-10', 'ansaldo_rismondo'),
('Matematica finanziaria', '2026-05-05', '2026-05-15', 'antonietta_sibilia'),
('Fisica teorica', '2026-05-10', '2026-05-20', 'melina_bianchi'),
('Letteratura russa', '2026-05-15', '2026-05-25', 'giustino_nolcini'),
('Geografia politica', '2026-05-20', '2026-05-30', 'virginia_montalcini'),
('Chimica industriale', '2026-05-25', '2026-06-05', 'riccardo_marsili'),
('Biologia evolutiva', '2026-06-01', '2026-06-10', 'venancio_vidoni'),
('Storia dell Asia', '2026-06-05', '2026-06-15', 'zaira_mazzacurati'),
('Letteratura americana', '2026-06-10', '2026-06-20', 'nicolò_ceravolo'),
('Filosofia contemporanea', '2026-06-15', '2026-06-25', 'fausto_carnera'),
('Psicologia clinica', '2026-06-20', '2026-06-30', 'adriano_malatesta'),
('Economia politica', '2026-06-25', '2026-07-05', 'silvestro_luria'),
('Sociologia rurale', '2026-07-01', '2026-07-10', 'rosario_ajello'),
('Antropologia fisica', '2026-07-05', '2026-07-15', 'alderano_corcos'),
('Storia dell Africa', '2026-07-10', '2026-07-20', 'gianna_necci'),
('Letteratura giapponese', '2026-07-15', '2026-07-25', 'rodolfo_ramazzotti'),
('Fisica nucleare', '2026-07-20', '2026-07-30', 'claudio_cilibrasi'),
('Storia dell antico Giappone', '2025-01-01', '2025-01-10', 'giulia_galilei'),
('Matematica avanzata II', '2025-01-05', '2025-01-15', 'costantino_traversa'),
('Fisica delle onde', '2025-01-10', '2025-01-20', 'dolores_condoleo'),
('Letteratura medievale II', '2025-01-15', '2025-01-25', 'enzio_dallara'),
('Geografia fisica avanzata', '2025-01-20', '2025-01-30', 'ippazio_sansoni'),
('Chimica organica II', '2025-01-25', '2025-02-05', 'livio_lattuada'),
('Biologia marina avanzata', '2025-02-01', '2025-02-10', 'ivo_donati'),
('Storia della filosofia moderna', '2025-02-05', '2025-02-15', 'pierina_antonello'),
('Astronomia e astrofisica', '2025-02-10', '2025-02-20', 'raffaello_spallanzani'),
('Informatica teorica II', '2025-02-15', '2025-02-25', 'ramona_satta'),
('Filosofia politica avanzata', '2025-02-20', '2025-03-01', 'tiziano_marazzi'),
('Psicologia dello sviluppo II', '2025-02-25', '2025-03-05', 'rosa_brambilla'),
('Economia internazionale II', '2025-03-01', '2025-03-10', 'zaira_morpurgo'),
('Sociologia contemporanea II', '2025-03-05', '2025-03-15', 'ornella_niscoromni'),
('Antropologia culturale avanzata', '2025-03-10', '2025-03-20', 'olga_inzaghi'),
('Storia dell arte moderna II', '2025-03-15', '2025-03-25', 'francesca_sgarbi'),
('Letteratura americana II', '2025-03-20', '2025-03-30', 'ludovica_federico'),
('Fisica quantistica avanzata II', '2025-03-25', '2025-04-05', 'luchino_zanichelli'),
('Chimica analitica II', '2025-03-30', '2025-04-10', 'camillo_pausini'),
('Geologia strutturale avanzata', '2025-04-01', '2025-04-11', 'santino_spadafora'),
('Storia della musica II', '2025-04-05', '2025-04-15', 'alfio_visintini'),
('Matematica discreta II', '2025-04-10', '2025-04-20', 'mario_zola'),
('Fisica dei materiali avanzata', '2025-04-15', '2025-04-25', 'antonina_palumbo'),
('Letteratura francese II', '2025-04-20', '2025-04-30', 'elladio_morandini'),
('Geografia economica avanzata', '2025-04-25', '2025-05-05', 'carlo_barozzi'),
('Chimica fisica avanzata', '2025-05-01', '2025-05-10', 'raimondo_balotelli'),
('Biologia evolutiva avanzata', '2025-05-05', '2025-05-15', 'maurizio_gaito'),
('Storia dell Asia II', '2025-05-10', '2025-05-20', 'costanzo_borghese'),
('Letteratura spagnola II', '2025-05-15', '2025-05-25', 'francesca_nosiglia'),
('Filosofia moderna II', '2025-05-20', '2025-05-30', 'viridiana_pagnotto'),
('Psicologia sociale avanzata', '2025-05-25', '2025-06-05', 'ida_jilani'),
('Economia aziendale II', '2025-06-01', '2025-06-10', 'angelo_scalera'),
('Sociologia urbana avanzata', '2025-06-05', '2025-06-15', 'patrizio_pertile'),
('Antropologia fisica avanzata', '2025-06-10', '2025-06-20', 'dante_respighi'),
('Storia moderna II', '2025-06-15', '2025-06-25', 'sergius_ravaglioli'),
('Letteratura tedesca II', '2025-06-20', '2025-06-30', 'ubaldo_biagiotti'),
('Fisica applicata II', '2025-06-25', '2025-07-05', 'alphons_morandi'),
('Chimica industriale avanzata', '2025-07-01', '2025-07-10', 'luchino_iadanza'),
('Geografia politica avanzata', '2025-07-05', '2025-07-15', 'federigo_cesarotti'),
('Storia dell Europa II', '2025-07-10', '2025-07-20', 'lando_galilei'),
('Matematica finanziaria avanzata', '2025-07-15', '2025-07-25', 'rocco_baggio'),
('Fisica teorica avanzata', '2025-07-20', '2025-07-30', 'severino_scarpa'),
('Letteratura russa II', '2025-07-25', '2025-08-05', 'iolanda_casellati'),
('Geografia culturale avanzata', '2025-08-01', '2025-08-10', 'sante_baracca'),
('Chimica ambientale avanzata', '2025-08-05', '2025-08-15', 'mattia_mazzacurati'),
('Biologia marina avanzata II', '2025-08-10', '2025-08-20', 'tonia_gucci'),
('Storia dell Oceania II', '2025-08-15', '2025-08-25', 'flavio_cilea'),
('Letteratura africana avanzata', '2025-08-20', '2025-08-30', 'nino_versace'),
('Filosofia orientale avanzata', '2025-08-25', '2025-09-05', 'barbara_babbo'),
('Psicologia clinica avanzata', '2025-09-01', '2025-09-10', 'ignazio_stefanelli'),
('Economia politica avanzata', '2025-09-05', '2025-09-15', 'tonia_ferrata'),
('Sociologia rurale avanzata', '2025-09-10', '2025-09-20', 'lucia_boaga'),
('Antropologia linguistica avanzata', '2025-09-15', '2025-09-25', 'rodolfo_filippini'),
('Storia dell Africa II', '2025-09-20', '2025-09-30', 'loretta_mercadante'),
('Letteratura giapponese avanzata', '2025-09-25', '2025-10-05', 'cecilia_tomei'),
('Fisica nucleare avanzata', '2025-10-01', '2025-10-10', 'calogero_scarlatti'),
('Chimica biologica avanzata', '2025-10-05', '2025-10-15', 'irma_novaro'),
('Geografia fisica avanzata II', '2025-10-10', '2025-10-20', 'lauretta_sauli'),
('Storia dell America II', '2025-10-15', '2025-10-25', 'gelsomina_doria'),
('Matematica avanzata III', '2025-10-20', '2025-10-30', 'salvatore_stoppani'),
('Fisica moderna avanzata', '2025-10-25', '2025-11-05', 'gaspare_rossini'),
('Letteratura italiana avanzata', '2025-11-01', '2025-11-10', 'gino_trupiano'),
('Geografia mondiale avanzata', '2025-11-05', '2025-11-15', 'luisa_fieramosca'),
('Chimica organica avanzata II', '2025-11-10', '2025-11-20', 'amalia_cagnin'),
('Biologia cellulare avanzata', '2025-11-15', '2025-11-25', 'paloma_borsellino'),
('Storia contemporanea avanzata', '2025-11-20', '2025-11-30', 'baccio_torlonia'),
('Astronomia avanzata', '2025-11-25', '2025-12-05', 'gaspare_montalti'),
('Informatica di base avanzata', '2025-12-01', '2025-12-10', 'bartolomeo_florio'),
('Filosofia antica avanzata', '2025-12-05', '2025-12-15', 'liana_casaleggio'),
('Psicologia avanzata', '2025-12-10', '2025-12-20', 'eleanora_salgari'),
('Economia avanzata', '2025-12-15', '2025-12-25', 'adriana_scalera'),
('Sociologia avanzata', '2025-12-20', '2025-12-30', 'nedda_camanni'),
('Antropologia avanzata', '2025-12-25', '2026-01-05', 'liliana_costalonga'),
('Storia medievale avanzata', '2026-01-01', '2026-01-10', 'vincenzo_gentili'),
('Letteratura inglese avanzata', '2026-01-05', '2026-01-15', 'lauretta_capuana'),
('Fisica quantistica avanzata III', '2026-01-10', '2026-01-20', 'flora_bernardini'),
('Chimica inorganica avanzata', '2026-01-15', '2026-01-25', 'margherita_fantini'),
('Geologia avanzata', '2026-01-20', '2026-01-30', 'vincentio_sgalambro'),
('Storia romana avanzata', '2026-01-25', '2026-02-05', 'gian_odescalchi'),
('Matematica di base avanzata', '2026-02-01', '2026-02-10', 'antonina_capone'),
('Fisica classica avanzata', '2026-02-05', '2026-02-15', 'rosario_beccheria'),
('Letteratura francese avanzata', '2026-02-10', '2026-02-20', 'raffaellino_ajello'),
('Geografia italiana avanzata', '2026-02-15', '2026-02-25', 'fulvio_onisto'),
('Chimica analitica avanzata', '2026-02-20', '2026-03-01', 'santino_coppola'),
('Biologia molecolare avanzata', '2026-02-25', '2026-03-05', 'elisa_milanesi'),
('Storia greca avanzata', '2026-03-01', '2026-03-10', 'chiara_santoro'),
('Letteratura spagnola avanzata', '2026-03-05', '2026-03-15', 'graziano_giradello'),
('Filosofia moderna avanzata', '2026-03-10', '2026-03-20', 'amanda_flaiano'),
('Psicologia sociale avanzata II', '2026-03-15', '2026-03-25', 'maria_casagrande'),
('Economia aziendale avanzata', '2026-03-20', '2026-03-30', 'marissa_procacci'),
('Sociologia urbana avanzata II', '2026-03-25', '2026-04-05', 'ippazio_maccanelli'),
('Antropologia culturale avanzata II', '2026-04-01', '2026-04-10', 'oreste_giannotti'),
('Storia moderna avanzata II', '2026-04-05', '2026-04-15', 'pierina_ligorio'),
('Letteratura tedesca avanzata II', '2026-04-10', '2026-04-20', 'morena_baggio'),
('Fisica applicata avanzata II', '2026-04-15', '2026-04-25', 'guido_costalonga'),
('Chimica fisica avanzata II', '2026-04-20', '2026-04-30', 'tina_vecoli'),
('Geografia fisica avanzata III', '2026-04-25', '2026-05-05', 'cassandra_marino'),
('Storia dell Europa avanzata II', '2026-05-01', '2026-05-10', 'ansaldo_rismondo'),
('Matematica finanziaria avanzata II', '2026-05-05', '2026-05-15', 'antonietta_sibilia'),
('Fisica teorica avanzata II', '2026-05-10', '2026-05-20', 'melina_bianchi'),
('Letteratura russa avanzata II', '2026-05-15', '2026-05-25', 'giustino_nolcini'),
('Geografia politica avanzata II', '2026-05-20', '2026-05-30', 'virginia_montalcini'),
('Chimica industriale avanzata II', '2026-05-25', '2026-06-05', 'riccardo_marsili'),
('Biologia evolutiva avanzata II', '2026-06-01', '2026-06-10', 'venancio_vidoni'),
('Storia dell Asia avanzata II', '2026-06-05', '2026-06-15', 'zaira_mazzacurati'),
('Letteratura americana avanzata II', '2026-06-10', '2026-06-20', 'nicolò_ceravolo'),
('Filosofia contemporanea avanzata II', '2026-06-15', '2026-06-25', 'fausto_carnera'),
('Psicologia clinica avanzata II', '2026-06-20', '2026-06-30', 'adriano_malatesta'),
('Economia politica avanzata II', '2026-06-25', '2026-07-05', 'silvestro_luria'),
('Sociologia rurale avanzata II', '2026-07-01', '2026-07-10', 'rosario_ajello'),
('Antropologia fisica avanzata II', '2026-07-05', '2026-07-15', 'alderano_corcos'),
('Storia dell Africa avanzata II', '2026-07-10', '2026-07-20', 'gianna_necci'),
('Letteratura giapponese avanzata II', '2026-07-15', '2026-07-25', 'rodolfo_ramazzotti'),
('Fisica nucleare avanzata II', '2026-07-20', '2026-07-30', 'claudio_cilibrasi'),
('Storia dell antico Giappone', '2025-01-01', '2025-01-10', 'giulia_galilei'),
('Matematica per ingegneri', '2025-01-05', '2025-01-15', 'costantino_traversa'),
('Fisica delle onde sonore', '2025-01-10', '2025-01-20', 'dolores_condoleo'),
('Letteratura medievale europea', '2025-01-15', '2025-01-25', 'enzio_dallara'),
('Geografia delle Alpi', '2025-01-20', '2025-01-30', 'ippazio_sansoni'),
('Chimica dei polimeri', '2025-01-25', '2025-02-05', 'livio_lattuada'),
('Biologia delle piante', '2025-02-01', '2025-02-10', 'ivo_donati'),
('Storia della filosofia greca', '2025-02-05', '2025-02-15', 'pierina_antonello'),
('Astronomia e galassie', '2025-02-10', '2025-02-20', 'raffaello_spallanzani'),
('Informatica e algoritmi', '2025-02-15', '2025-02-25', 'ramona_satta'),
('Filosofia politica moderna', '2025-02-20', '2025-03-01', 'tiziano_marazzi'),
('Psicologia infantile', '2025-02-25', '2025-03-05', 'rosa_brambilla'),
('Economia e finanza', '2025-03-01', '2025-03-10', 'zaira_morpurgo'),
('Sociologia delle città', '2025-03-05', '2025-03-15', 'ornella_niscoromni'),
('Antropologia delle religioni', '2025-03-10', '2025-03-20', 'olga_inzaghi'),
('Storia dell arte rinascimentale', '2025-03-15', '2025-03-25', 'francesca_sgarbi'),
('Letteratura americana contemporanea', '2025-03-20', '2025-03-30', 'ludovica_federico'),
('Fisica quantistica applicata', '2025-03-25', '2025-04-05', 'luchino_zanichelli'),
('Chimica analitica avanzata', '2025-03-30', '2025-04-10', 'camillo_pausini'),
('Geologia dei vulcani', '2025-04-01', '2025-04-11', 'santino_spadafora'),
('Storia della musica barocca', '2025-04-05', '2025-04-15', 'alfio_visintini'),
('Matematica per economisti', '2025-04-10', '2025-04-20', 'mario_zola'),
('Fisica dei materiali avanzata', '2025-04-15', '2025-04-25', 'antonina_palumbo'),
('Letteratura francese moderna', '2025-04-20', '2025-04-30', 'elladio_morandini'),
('Geografia economica globale', '2025-04-25', '2025-05-05', 'carlo_barozzi'),
('Chimica fisica dei gas', '2025-05-01', '2025-05-10', 'raimondo_balotelli'),
('Biologia evolutiva delle specie', '2025-05-05', '2025-05-15', 'maurizio_gaito'),
('Storia dell Asia orientale', '2025-05-10', '2025-05-20', 'costanzo_borghese'),
('Letteratura spagnola contemporanea', '2025-05-15', '2025-05-25', 'francesca_nosiglia'),
('Filosofia moderna e scienza', '2025-05-20', '2025-05-30', 'viridiana_pagnotto'),
('Psicologia sociale avanzata', '2025-05-25', '2025-06-05', 'ida_jilani'),
('Economia aziendale internazionale', '2025-06-01', '2025-06-10', 'angelo_scalera'),
('Sociologia urbana e rurale', '2025-06-05', '2025-06-15', 'patrizio_pertile'),
('Antropologia fisica e culturale', '2025-06-10', '2025-06-20', 'dante_respighi'),
('Storia moderna europea', '2025-06-15', '2025-06-25', 'sergius_ravaglioli'),
('Letteratura tedesca classica', '2025-06-20', '2025-06-30', 'ubaldo_biagiotti'),
('Fisica applicata alla medicina', '2025-06-25', '2025-07-05', 'alphons_morandi'),
('Chimica industriale avanzata', '2025-07-01', '2025-07-10', 'luchino_iadanza'),
('Geografia politica globale', '2025-07-05', '2025-07-15', 'federigo_cesarotti'),
('Storia dell Europa medievale', '2025-07-10', '2025-07-20', 'lando_galilei'),
('Matematica finanziaria avanzata', '2025-07-15', '2025-07-25', 'rocco_baggio'),
('Fisica teorica delle particelle', '2025-07-20', '2025-07-30', 'severino_scarpa'),
('Letteratura russa moderna', '2025-07-25', '2025-08-05', 'iolanda_casellati'),
('Geografia culturale delle città', '2025-08-01', '2025-08-10', 'sante_baracca'),
('Chimica ambientale e sostenibilità', '2025-08-05', '2025-08-15', 'mattia_mazzacurati'),
('Biologia marina e oceani', '2025-08-10', '2025-08-20', 'tonia_gucci'),
('Storia dell Oceania moderna', '2025-08-15', '2025-08-25', 'flavio_cilea'),
('Letteratura africana contemporanea', '2025-08-20', '2025-08-30', 'nino_versace'),
('Filosofia orientale e religioni', '2025-08-25', '2025-09-05', 'barbara_babbo'),
('Psicologia clinica avanzata', '2025-09-01', '2025-09-10', 'ignazio_stefanelli'),
('Economia politica globale', '2025-09-05', '2025-09-15', 'tonia_ferrata'),
('Sociologia rurale e agricoltura', '2025-09-10', '2025-09-20', 'lucia_boaga'),
('Antropologia linguistica avanzata', '2025-09-15', '2025-09-25', 'rodolfo_filippini'),
('Storia dell Africa coloniale', '2025-09-20', '2025-09-30', 'loretta_mercadante'),
('Letteratura giapponese moderna', '2025-09-25', '2025-10-05', 'cecilia_tomei'),
('Fisica nucleare e reattori', '2025-10-01', '2025-10-10', 'calogero_scarlatti'),
('Chimica biologica avanzata', '2025-10-05', '2025-10-15', 'irma_novaro'),
('Geografia fisica delle montagne', '2025-10-10', '2025-10-20', 'lauretta_sauli'),
('Storia dell America Latina', '2025-10-15', '2025-10-25', 'gelsomina_doria'),
('Matematica avanzata per fisici', '2025-10-20', '2025-10-30', 'salvatore_stoppani'),
('Fisica moderna e relatività', '2025-10-25', '2025-11-05', 'gaspare_rossini'),
('Letteratura italiana contemporanea', '2025-11-01', '2025-11-10', 'gino_trupiano'),
('Geografia mondiale e clima', '2025-11-05', '2025-11-15', 'luisa_fieramosca'),
('Chimica organica e farmaci', '2025-11-10', '2025-11-20', 'amalia_cagnin'),
('Biologia cellulare e genetica', '2025-11-15', '2025-11-25', 'paloma_borsellino'),
('Storia contemporanea globale', '2025-11-20', '2025-11-30', 'baccio_torlonia'),
('Astronomia e pianeti extrasolari', '2025-11-25', '2025-12-05', 'gaspare_montalti'),
('Informatica di base e programmazione', '2025-12-01', '2025-12-10', 'bartolomeo_florio'),
('Filosofia antica e mitologia', '2025-12-05', '2025-12-15', 'liana_casaleggio'),
('Psicologia e neuroscienze', '2025-12-10', '2025-12-20', 'eleanora_salgari'),
('Economia e commercio internazionale', '2025-12-15', '2025-12-25', 'adriana_scalera'),
('Sociologia e cambiamenti sociali', '2025-12-20', '2025-12-30', 'nedda_camanni'),
('Antropologia e culture indigene', '2025-12-25', '2026-01-05', 'liliana_costalonga'),
('Storia medievale e crociate', '2026-01-01', '2026-01-10', 'vincenzo_gentili'),
('Letteratura inglese vittoriana', '2026-01-05', '2026-01-15', 'lauretta_capuana'),
('Fisica quantistica e cosmologia', '2026-01-10', '2026-01-20', 'flora_bernardini'),
('Chimica inorganica e metalli', '2026-01-15', '2026-01-25', 'margherita_fantini'),
('Geologia e terremoti', '2026-01-20', '2026-01-30', 'vincentio_sgalambro'),
('Storia romana e imperatori', '2026-01-25', '2026-02-05', 'gian_odescalchi'),
('Matematica di base per studenti', '2026-02-01', '2026-02-10', 'antonina_capone'),
('Fisica classica e meccanica', '2026-02-05', '2026-02-15', 'rosario_beccheria'),
('Letteratura francese romantica', '2026-02-10', '2026-02-20', 'raffaellino_ajello'),
('Geografia italiana e regioni', '2026-02-15', '2026-02-25', 'fulvio_onisto'),
('Chimica analitica e laboratorio', '2026-02-20', '2026-03-01', 'santino_coppola'),
('Biologia molecolare e DNA', '2026-02-25', '2026-03-05', 'elisa_milanesi'),
('Storia greca e mitologia', '2026-03-01', '2026-03-10', 'chiara_santoro'),
('Letteratura spagnola classica', '2026-03-05', '2026-03-15', 'graziano_giradello'),
('Filosofia moderna e politica', '2026-03-10', '2026-03-20', 'amanda_flaiano'),
('Psicologia sociale e gruppi', '2026-03-15', '2026-03-25', 'maria_casagrande'),
('Economia aziendale e marketing', '2026-03-20', '2026-03-30', 'marissa_procacci'),
('Sociologia urbana e migrazioni', '2026-03-25', '2026-04-05', 'ippazio_maccanelli'),
('Antropologia culturale e tradizioni', '2026-04-01', '2026-04-10', 'oreste_giannotti'),
('Storia moderna e rivoluzioni', '2026-04-05', '2026-04-15', 'pierina_ligorio'),
('Letteratura tedesca contemporanea', '2026-04-10', '2026-04-20', 'morena_baggio'),
('Fisica applicata e ingegneria', '2026-04-15', '2026-04-25', 'guido_costalonga'),
('Chimica fisica e termodinamica', '2026-04-20', '2026-04-30', 'tina_vecoli'),
('Geografia fisica e oceani', '2026-04-25', '2026-05-05', 'cassandra_marino'),
('Storia dellEuropa moderna', '2026-05-01', '2026-05-10', 'ansaldo_rismondo'),
('Matematica finanziaria e investimenti', '2026-05-05', '2026-05-15', 'antonietta_sibilia'),
('Fisica teorica e astrofisica', '2026-05-10', '2026-05-20', 'melina_bianchi'),
('Letteratura russa e Dostoevskij', '2026-05-15', '2026-05-25', 'giustino_nolcini'),
('Geografia politica e confini', '2026-05-20', '2026-05-30', 'virginia_montalcini'),
('Chimica industriale e materiali', '2026-05-25', '2026-06-05', 'riccardo_marsili'),
('Biologia evolutiva e adattamenti', '2026-06-01', '2026-06-10', 'venancio_vidoni'),
('Storia dellAsia centrale', '2026-06-05', '2026-06-15', 'zaira_mazzacurati'),
('Letteratura americana e poesia', '2026-06-10', '2026-06-20', 'nicolò_ceravolo'),
('Filosofia contemporanea e etica', '2026-06-15', '2026-06-25', 'fausto_carnera'),
('Psicologia clinica e terapia', '2026-06-20', '2026-06-30', 'adriano_malatesta'),
('Economia politica e globalizzazione', '2026-06-25', '2026-07-05', 'silvestro_luria'),
('Sociologia rurale e sviluppo', '2026-07-01', '2026-07-10', 'rosario_ajello'),
('Antropologia fisica e evoluzione', '2026-07-05', '2026-07-15', 'alderano_corcos'),
('Storia dellAfrica moderna', '2026-07-10', '2026-07-20', 'gianna_necci');
('Programmazione Python', '2025-01-03', '2025-01-13', 'beatrice_barberini'),
('Machine Learning Basics', '2025-01-08', '2025-01-18', 'rocco_fagiani'),
('Data Science Fundamentals', '2025-01-12', '2025-01-22', 'eva_angiolello'),
('Web Development', '2025-01-18', '2025-01-28', 'antonia_venditti'),
('Database Management', '2025-01-22', '2025-02-01', 'patrizio_bruno'),
('Cybersecurity Essentials', '2025-01-28', '2025-02-07', 'gianluca_tommaseo'),
('AI Ethics', '2025-02-03', '2025-02-13', 'carla_tonisto'),
('Cloud Computing', '2025-02-08', '2025-02-18', 'nicoletta_carriera'),
('Big Data Analytics', '2025-02-13', '2025-02-23', 'ubaldo_paltrinieri'),
('Internet of Things', '2025-02-18', '2025-02-28', 'goffredo_magnani'),
('Blockchain Technologies', '2025-02-23', '2025-03-05', 'rita_druso'),
('UI/UX Design', '2025-02-28', '2025-03-10', 'dina_leoncavallo'),
('Mobile App Development', '2025-03-05', '2025-03-15', 'gian_bacosi'),
('Game Design', '2025-03-10', '2025-03-20', 'rosa_peranda'),
('Digital Marketing', '2025-03-15', '2025-03-25', 'lucia_leone'),
('SEO Optimization', '2025-03-20', '2025-03-30', 'marina_bernini'),
('E-commerce Strategies', '2025-03-25', '2025-04-04', 'diana_barracco');

-- Popolamento tabella Domanda per ogni Quiz
-- Quiz 1: Storia dellarte
INSERT INTO Domanda (quiz, numero, testo) VALUES
(1, 1, 'Chi ha dipinto la Cappella Sistina?'),
(1, 2, 'Qual è il periodo storico del Rinascimento?'),
(1, 3, 'Chi è l autore della Gioconda?'),
(1, 4, 'Qual è il significato del termine "barocco"?'),
(1, 5, 'Chi ha scolpito il David?');

-- Quiz 2: Matematica avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(2, 1, 'Cosa si intende per derivata di una funzione?'),
(2, 2, 'Definisci il concetto di integrale definito.'),
(2, 3, 'Qual è un applicazione comune dell algebra lineare?'),
(2, 4, 'Spiega il concetto di limite in analisi matematica.'),
(2, 5, 'Enuncia il Teorema Fondamentale del Calcolo.');

-- Quiz 3: Fisica moderna
INSERT INTO Domanda (quiz, numero, testo) VALUES
(3, 1, 'Cosa afferma la teoria della relatività speciale?'),
(3, 2, 'Chi ha formulato la teoria della relatività generale?'),
(3, 3, 'Cos è la meccanica quantistica?'),
(3, 4, 'Spiega il concetto di dualismo onda-particella.'),
(3, 5, 'Qual è il significato dell equazione E=mc²?');

-- Quiz 4: Letteratura italiana
INSERT INTO Domanda (quiz, numero, testo) VALUES
(4, 1, 'Chi è l autore de "I Promessi Sposi"?'),
(4, 2, 'Quali sono le principali correnti letterarie del Novecento italiano?'),
(4, 3, 'Cita un opera importante di Dante Alighieri oltre alla Divina Commedia.'),
(4, 4, 'Quali sono le caratteristiche del Verismo?'),
(4, 5, 'Chi ha scritto "Il Gattopardo"?');

-- Quiz 5: Geografia mondiale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(5, 1, 'Qual è il continente più vasto del mondo?'),
(5, 2, 'Cita tre grandi fiumi del mondo.'),
(5, 3, 'Cos è la Fossa delle Marianne?'),
(5, 4, 'Quali sono i principali tipi di clima sulla Terra?'),
(5, 5, 'Nomina la catena montuosa più alta del mondo.');

-- Quiz 6: Chimica organica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(6, 1, 'Cosa studia la chimica organica?'),
(6, 2, 'Qual è la formula generale degli alcani?'),
(6, 3, 'Cosa sono gli isomeri?'),
(6, 4, 'Descrivi un gruppo funzionale comune in chimica organica.'),
(6, 5, 'Qual è l importanza del carbonio nella chimica organica?');

-- Quiz 7: Biologia cellulare
INSERT INTO Domanda (quiz, numero, testo) VALUES
(7, 1, 'Qual è la funzione principale del nucleo cellulare?'),
(7, 2, 'Cosa sono i mitocondri e quale ruolo svolgono?'),
(7, 3, 'Descrivi la struttura della membrana plasmatica.'),
(7, 4, 'Qual è la differenza tra cellula eucariote e procariote?'),
(7, 5, 'Cosa si intende per mitosi?');

-- Quiz 8: Storia contemporanea
INSERT INTO Domanda (quiz, numero, testo) VALUES
(8, 1, 'Quale evento è comunemente considerato l inizio della storia contemporanea?'),
(8, 2, 'Cosa si intende per "Guerra Fredda"?'),
(8, 3, 'Quali sono state le principali cause della Prima Guerra Mondiale?'),
(8, 4, 'Descrivi brevemente il processo di decolonizzazione.'),
(8, 5, 'Chi erano i principali leader durante la Seconda Guerra Mondiale?');

-- Quiz 9: Astronomia
INSERT INTO Domanda (quiz, numero, testo) VALUES
(9, 1, 'Cos è una galassia?'),
(9, 2, 'Qual è il pianeta più grande del nostro sistema solare?'),
(9, 3, 'Descrivi il ciclo vitale di una stella.'),
(9, 4, 'Cosa sono i buchi neri?'),
(9, 5, 'Qual è la differenza tra un asteroide e una cometa?');

-- Quiz 10: Informatica di base
INSERT INTO Domanda (quiz, numero, testo) VALUES
(10, 1, 'Cos è un sistema operativo?'),
(10, 2, 'Qual è la differenza tra hardware e software?'),
(10, 3, 'Cosa si intende per CPU?'),
(10, 4, 'Descrivi la funzione della memoria RAM.'),
(10, 5, 'Cos è Internet?');

-- Quiz 11: Filosofia antica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(11, 1, 'Chi è considerato il padre della filosofia occidentale?'),
(11, 2, 'Quali sono i principali dialoghi di Platone?'),
(11, 3, 'Descrivi il concetto di " архе" (archè) per i presocratici.'),
(11, 4, 'Qual è il metodo socratico?'),
(11, 5, 'Cita un opera importante di Aristotele.');

-- Quiz 12: Psicologia
INSERT INTO Domanda (quiz, numero, testo) VALUES
(12, 1, 'Cosa studia la psicologia?'),
(12, 2, 'Chi è considerato il fondatore della psicoanalisi?'),
(12, 3, 'Quali sono le principali branche della psicologia?'),
(12, 4, 'Descrivi brevemente il comportamentismo.'),
(12, 5, 'Cos è l inconscio secondo Freud?');

-- Quiz 13: Economia
INSERT INTO Domanda (quiz, numero, testo) VALUES
(13, 1, 'Cosa si intende per PIL (Prodotto Interno Lordo)?'),
(13, 2, 'Qual è la differenza tra microeconomia e macroeconomia?'),
(13, 3, 'Descrivi il concetto di domanda e offerta.'),
(13, 4, 'Cos è l inflazione?'),
(13, 5, 'Cita un famoso economista e una sua teoria.');

-- Quiz 14: Sociologia
INSERT INTO Domanda (quiz, numero, testo) VALUES
(14, 1, 'Cosa studia la sociologia?'),
(14, 2, 'Chi sono considerati i padri fondatori della sociologia?'),
(14, 3, 'Definisci il concetto di "struttura sociale".'),
(14, 4, 'Cos è la socializzazione?'),
(14, 5, 'Qual è la differenza tra un gruppo primario e un gruppo secondario?');

-- Quiz 15: Antropologia
INSERT INTO Domanda (quiz, numero, testo) VALUES
(15, 1, 'Cosa studia l antropologia?'),
(15, 2, 'Quali sono le principali branche dell antropologia?'),
(15, 3, 'Definisci il concetto di "cultura" in antropologia.'),
(15, 4, 'Cos è l etnocentrismo?'),
(15, 5, 'Cita un famoso antropologo e un suo contributo.');

-- Quiz 16: Storia medievale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(16, 1, 'Quale evento segna convenzionalmente l inizio del Medioevo?'),
(16, 2, 'Cosa si intende per feudalesimo?'),
(16, 3, 'Qual è stata l importanza delle Crociate?'),
(16, 4, 'Descrivi il ruolo della Chiesa Cattolica nel Medioevo.'),
(16, 5, 'Chi fu Carlo Magno?');

-- Quiz 17: Letteratura inglese
INSERT INTO Domanda (quiz, numero, testo) VALUES
(17, 1, 'Chi ha scritto "Amleto"?'),
(17, 2, 'Quali sono le caratteristiche principali del periodo Elisabettiano in letteratura?'),
(17, 3, 'Cita un opera importante di Jane Austen.'),
(17, 4, 'Cos è il Romanticismo inglese?'),
(17, 5, 'Chi è l autore di "1984"?');

-- Quiz 18: Fisica quantistica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(18, 1, 'Cosa studia la fisica quantistica?'),
(18, 2, 'Chi è Max Planck e quale fu il suo contributo?'),
(18, 3, 'Spiega il principio di indeterminazione di Heisenberg.'),
(18, 4, 'Cos è un fotone?'),
(18, 5, 'Descrivi l esperimento della doppia fenditura.');

-- Quiz 19: Chimica inorganica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(19, 1, 'Qual è la differenza tra chimica organica e inorganica?'),
(19, 2, 'Cosa sono i metalli alcalini?'),
(19, 3, 'Descrivi un legame ionico.'),
(19, 4, 'Cos è la tavola periodica degli elementi?'),
(19, 5, 'Cita un composto inorganico comune e la sua formula.');

-- Quiz 20: Geologia
INSERT INTO Domanda (quiz, numero, testo) VALUES
(20, 1, 'Cosa studia la geologia?'),
(20, 2, 'Quali sono i tre principali tipi di rocce?'),
(20, 3, 'Descrivi la teoria della tettonica a placche.'),
(20, 4, 'Cos è un vulcano?'),
(20, 5, 'Come si formano i terremoti?');

-- Quiz 21: Storia romana
INSERT INTO Domanda (quiz, numero, testo) VALUES
(21, 1, 'Quando è stata fondata Roma secondo la tradizione?'),
(21, 2, 'Chi fu il primo imperatore romano?'),
(21, 3, 'Cosa furono le Guerre Puniche?'),
(21, 4, 'Descrivi brevemente la caduta dell Impero Romano d Occidente.'),
(21, 5, 'Qual era la funzione del Senato romano?');

-- Quiz 22: Matematica di base
INSERT INTO Domanda (quiz, numero, testo) VALUES
(22, 1, 'Cosa sono i numeri naturali?'),
(22, 2, 'Come si esegue una addizione con i numeri decimali?'),
(22, 3, 'Qual è la differenza tra un quadrato e un rettangolo?'),
(22, 4, 'Spiega il concetto di frazione.'),
(22, 5, 'Cos è il perimetro di una figura geometrica?');

-- Quiz 23: Fisica classica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(23, 1, 'Quali sono le tre leggi di Newton del moto?'),
(23, 2, 'Definisci il concetto di energia cinetica.'),
(23, 3, 'Cos è la forza di gravità?'),
(23, 4, 'Spiega la differenza tra massa e peso.'),
(23, 5, 'Cosa afferma il principio di conservazione dell energia?');

-- Quiz 24: Letteratura francese
INSERT INTO Domanda (quiz, numero, testo) VALUES
(24, 1, 'Chi ha scritto "I Miserabili"?'),
(24, 2, 'Quali sono le caratteristiche dell Illuminismo francese in letteratura?'),
(24, 3, 'Cita un opera importante di Albert Camus.'),
(24, 4, 'Cos è il Realismo francese?'),
(24, 5, 'Chi è l autore de "Il Piccolo Principe"?');

-- Quiz 25: Geografia italiana
INSERT INTO Domanda (quiz, numero, testo) VALUES
(25, 1, 'Qual è la capitale d Italia?'),
(25, 2, 'Cita tre importanti fiumi italiani.'),
(25, 3, 'Quali sono le principali catene montuose in Italia?'),
(25, 4, 'Nomina le cinque regioni a statuto speciale in Italia.'),
(25, 5, 'Quali mari bagnano l Italia?');

-- Quiz 26: Chimica analitica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(26, 1, 'Cosa si intende per analisi qualitativa in chimica?'),
(26, 2, 'Qual è lo scopo dell analisi quantitativa?'),
(26, 3, 'Descrivi una tecnica comune di titolazione.'),
(26, 4, 'Cos è uno spettrofotometro e come funziona?'),
(26, 5, 'Qual è l importanza della stechiometria nell analisi chimica?');

-- Quiz 27: Biologia molecolare
INSERT INTO Domanda (quiz, numero, testo) VALUES
(27, 1, 'Cos è il DNA e qual è la sua funzione principale?'),
(27, 2, 'Descrivi il processo di trascrizione del DNA.'),
(27, 3, 'Cosa sono gli amminoacidi?'),
(27, 4, 'Qual è il ruolo dell RNA messaggero (mRNA)?'),
(27, 5, 'Spiega brevemente il concetto di codice genetico.');

-- Quiz 28: Storia greca
INSERT INTO Domanda (quiz, numero, testo) VALUES
(28, 1, 'Quali furono le principali città-stato dell antica Grecia?'),
(28, 2, 'Chi fu Alessandro Magno?'),
(28, 3, 'Cosa furono le Guerre Persiane?'),
(28, 4, 'Descrivi la democrazia ateniese.'),
(28, 5, 'Chi erano i filosofi più importanti dell antica Grecia?');

-- Quiz 29: Letteratura spagnola
INSERT INTO Domanda (quiz, numero, testo) VALUES
(29, 1, 'Chi ha scritto "Don Chisciotte della Mancia"?'),
(29, 2, 'Quali sono le caratteristiche del Siglo de Oro spagnolo?'),
(29, 3, 'Cita un opera importante di Federico García Lorca.'),
(29, 4, 'Cos è il modernismo nella letteratura spagnola?'),
(29, 5, 'Chi è un autore contemporaneo importante della letteratura spagnola?');

-- Quiz 30: Filosofia moderna
INSERT INTO Domanda (quiz, numero, testo) VALUES
(30, 1, 'Chi è considerato il padre dell empirismo moderno?'),
(30, 2, 'Qual è l opera principale di Immanuel Kant?'),
(30, 3, 'Descrivi il concetto di "cogito ergo sum" di Cartesio.'),
(30, 4, 'Quali sono le principali idee dell esistenzialismo?'),
(30, 5, 'Cita un filosofo del XX secolo e un suo contributo.');

-- Quiz 31: Psicologia sociale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(31, 1, 'Cosa studia la psicologia sociale?'),
(31, 2, 'Descrivi l esperimento di Milgram sull obbedienza.'),
(31, 3, 'Cos è il conformismo?'),
(31, 4, 'Spiega il concetto di attribuzione causale.'),
(31, 5, 'Cosa si intende per dissonanza cognitiva?');

-- Quiz 32: Economia aziendale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(32, 1, 'Cos è un bilancio d esercizio?'),
(32, 2, 'Qual è la differenza tra costi fissi e costi variabili?'),
(32, 3, 'Descrivi il concetto di break-even point (punto di pareggio).'),
(32, 4, 'Cosa si intende per marketing mix (le 4 P)?'),
(32, 5, 'Qual è il ruolo del management in un azienda?');

-- Quiz 33: Sociologia urbana
INSERT INTO Domanda (quiz, numero, testo) VALUES
(33, 1, 'Cosa studia la sociologia urbana?'),
(33, 2, 'Quali sono le principali problematiche delle grandi metropoli?'),
(33, 3, 'Descrivi il concetto di gentrificazione.'),
(33, 4, 'Cos è la segregazione urbana?'),
(33, 5, 'Cita un teorico importante della sociologia urbana.');

-- Quiz 34: Antropologia culturale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(34, 1, 'Cosa si intende per "cultura materiale" in antropologia?'),
(34, 2, 'Descrivi il concetto di relativismo culturale.'),
(34, 3, 'Cos è un rito di passaggio?'),
(34, 4, 'Qual è la differenza tra mito e leggenda?'),
(34, 5, 'Cita un esempio di diversità culturale nel mondo.');

-- Quiz 35: Storia moderna
INSERT INTO Domanda (quiz, numero, testo) VALUES
(35, 1, 'Quale evento segna convenzionalmente l inizio della storia moderna?'),
(35, 2, 'Cosa fu la Riforma Protestante?'),
(35, 3, 'Descrivi l importanza della Rivoluzione Francese.'),
(35, 4, 'Chi fu Napoleone Bonaparte?'),
(35, 5, 'Cosa si intende per Illuminismo?');

-- Quiz 36: Letteratura tedesca
INSERT INTO Domanda (quiz, numero, testo) VALUES
(36, 1, 'Chi ha scritto "Faust"?'),
(36, 2, 'Quali sono le caratteristiche del movimento Sturm und Drang?'),
(36, 3, 'Cita un opera importante di Franz Kafka.'),
(36, 4, 'Cos è l Espressionismo nella letteratura tedesca?'),
(36, 5, 'Chi è un autore contemporaneo importante della letteratura tedesca?');

-- Quiz 37: Fisica applicata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(37, 1, 'Cita un esempio di applicazione della fisica nella medicina.'),
(37, 2, 'Come funzionano i pannelli solari fotovoltaici?'),
(37, 3, 'Quali principi fisici sono alla base della Risonanza Magnetica Nucleare (RMN)?'),
(37, 4, 'Descrivi il funzionamento di un motore a combustione interna dal punto di vista fisico.'),
(37, 5, 'Cos è la fluidodinamica e dove trova applicazione?');

-- Quiz 38: Chimica fisica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(38, 1, 'Cosa studia la chimica fisica?'),
(38, 2, 'Quali sono le leggi della termodinamica?'),
(38, 3, 'Descrivi il concetto di equilibrio chimico.'),
(38, 4, 'Cos è la cinetica chimica?'),
(38, 5, 'Spiega la differenza tra un processo esotermico ed endotermico.');

-- Quiz 39: Geografia fisica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(39, 1, 'Cosa studia la geografia fisica?'),
(39, 2, 'Quali sono i principali agenti geomorfologici?'),
(39, 3, 'Descrivi il ciclo dell acqua.'),
(39, 4, 'Cos è l atmosfera terrestre e come è stratificata?'),
(39, 5, 'Qual è la differenza tra tempo meteorologico e clima?');

-- Quiz 40: Storia dellEuropa
INSERT INTO Domanda (quiz, numero, testo) VALUES
(40, 1, 'Cosa si intende per Unione Europea?'),
(40, 2, 'Quali sono state le principali fasi dell integrazione europea?'),
(40, 3, 'Descrivi un conflitto importante nella storia europea del XX secolo, oltre le guerre mondiali.'),
(40, 4, 'Qual è stato l impatto della caduta del Muro di Berlino sull Europa?'),
(40, 5, 'Cita una figura chiave nella storia dell Europa unita.');

-- Quiz 41: Matematica finanziaria
INSERT INTO Domanda (quiz, numero, testo) VALUES
(41, 1, 'Cosa si intende per interesse composto?'),
(41, 2, 'Qual è la differenza tra un azione e un obbligazione?'),
(41, 3, 'Descrivi il concetto di VAN (Valore Attuale Netto).'),
(41, 4, 'Cos è un tasso di sconto?'),
(41, 5, 'Cita un applicazione della matematica finanziaria nella vita quotidiana.');

-- Quiz 42: Fisica teorica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(42, 1, 'Cosa studia la fisica teorica?'),
(42, 2, 'Qual è l obiettivo della "Teoria del Tutto"?'),
(42, 3, 'Descrivi il concetto di stringa nella teoria delle stringhe.'),
(42, 4, 'Cosa si intende per materia oscura ed energia oscura?'),
(42, 5, 'Cita un famoso fisico teorico contemporaneo.');

-- Quiz 43: Letteratura russa
INSERT INTO Domanda (quiz, numero, testo) VALUES
(43, 1, 'Chi ha scritto "Guerra e Pace"?'),
(43, 2, 'Quali sono le caratteristiche del Realismo russo?'),
(43, 3, 'Cita un opera importante di Fëdor Dostoevskij.'),
(43, 4, 'Cos è il Simbolismo nella letteratura russa?'),
(43, 5, 'Chi è un autore contemporaneo importante della letteratura russa?');

-- Quiz 44: Geografia politica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(44, 1, 'Cosa studia la geografia politica?'),
(44, 2, 'Definisci il concetto di "Stato" in geografia politica.'),
(44, 3, 'Qual è la differenza tra confine e frontiera?'),
(44, 4, 'Descrivi un esempio di conflitto geopolitico attuale.'),
(44, 5, 'Cosa si intende per "globalizzazione" dal punto di vista geopolitico?');

-- Quiz 45: Chimica industriale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(45, 1, 'Cosa si intende per processo chimico industriale?'),
(45, 2, 'Descrivi un importante processo della chimica industriale (es. processo Haber-Bosch).'),
(45, 3, 'Quali sono le principali problematiche ambientali legate all industria chimica?'),
(45, 4, 'Cos è un catalizzatore e quale ruolo svolge nei processi industriali?'),
(45, 5, 'Cita un prodotto di largo consumo ottenuto tramite processi chimici industriali.');

-- Quiz 46: Biologia evolutiva
INSERT INTO Domanda (quiz, numero, testo) VALUES
(46, 1, 'Cosa studia la biologia evolutiva?'),
(46, 2, 'Chi ha formulato la teoria dell evoluzione per selezione naturale?'),
(46, 3, 'Descrivi il concetto di "speciazione".'),
(46, 4, 'Cos è la deriva genetica?'),
(46, 5, 'Cita un esempio di adattamento evolutivo.');

-- Quiz 47: Storia dellAsia
INSERT INTO Domanda (quiz, numero, testo) VALUES
(47, 1, 'Cita una civiltà importante nella storia dell Asia.'),
(47, 2, 'Qual è stata l importanza della Via della Seta?'),
(47, 3, 'Descrivi brevemente l Impero Moghul.'),
(47, 4, 'Quali sono state le conseguenze del colonialismo europeo in Asia?'),
(47, 5, 'Chi fu Gengis Khan?');

-- Quiz 48: Letteratura americana
INSERT INTO Domanda (quiz, numero, testo) VALUES
(48, 1, 'Chi ha scritto "Moby Dick"?'),
(48, 2, 'Quali sono le caratteristiche del Trascendentalismo americano?'),
(48, 3, 'Cita un opera importante di Ernest Hemingway.'),
(48, 4, 'Cos è la "Lost Generation"?'),
(48, 5, 'Chi è un autore contemporaneo importante della letteratura americana?');

-- Quiz 49: Filosofia contemporanea
INSERT INTO Domanda (quiz, numero, testo) VALUES
(49, 1, 'Quali sono le principali correnti della filosofia contemporanea?'),
(49, 2, 'Descrivi brevemente il pensiero di Friedrich Nietzsche.'),
(49, 3, 'Cos è la fenomenologia?'),
(49, 4, 'Spiega il concetto di "decostruzione" in filosofia.'),
(49, 5, 'Cita un filosofo contemporaneo e una sua idea centrale.');

-- Quiz 50: Psicologia clinica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(50, 1, 'Cosa studia la psicologia clinica?'),
(50, 2, 'Qual è la differenza tra uno psicologo e uno psichiatra?'),
(50, 3, 'Descrivi un approccio terapeutico comune (es. terapia cognitivo-comportamentale).'),
(50, 4, 'Cos è il DSM (Manuale Diagnostico e Statistico dei Disturbi Mentali)?'),
(50, 5, 'Quali sono i principali disturbi d ansia?');

-- Quiz 51: Economia politica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(51, 1, 'Cosa si intende per "politica fiscale"?'),
(51, 2, 'Qual è il ruolo della banca centrale in un economia?'),
(51, 3, 'Descrivi il concetto di "disoccupazione" e le sue tipologie.'),
(51, 4, 'Cos è il debito pubblico?'),
(51, 5, 'Cita una teoria economica rilevante per la politica economica.');

-- Quiz 52: Sociologia rurale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(52, 1, 'Cosa studia la sociologia rurale?'),
(52, 2, 'Quali sono le principali trasformazioni sociali nelle aree rurali contemporanee?'),
(52, 3, 'Descrivi il concetto di "comunità rurale".'),
(52, 4, 'Qual è l impatto della globalizzazione sull agricoltura e le zone rurali?'),
(52, 5, 'Cita una sfida specifica per lo sviluppo delle aree rurali.');

-- Quiz 53: Antropologia fisica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(53, 1, 'Cosa studia l antropologia fisica (o biologica)?'),
(53, 2, 'Descrivi il processo dell evoluzione umana (ominazione).'),
(53, 3, 'Cos è la primatologia e quale rilevanza ha per l antropologia fisica?'),
(53, 4, 'Cosa si intende per "variabilità umana" dal punto di vista biologico?'),
(53, 5, 'Cita un importante fossile ominide e la sua importanza.');

-- Quiz 54: Storia dell Africa
INSERT INTO Domanda (quiz, numero, testo) VALUES
(54, 1, 'Cita un impero o regno importante nella storia dell Africa pre-coloniale.'),
(54, 2, 'Qual è stato l impatto della tratta atlantica degli schiavi sull Africa?'),
(54, 3, 'Descrivi il processo di colonizzazione europea dell Africa nel XIX secolo.'),
(54, 4, 'Cos è stato l apartheid in Sudafrica?'),
(54, 5, 'Cita una figura chiave nella lotta per l indipendenza di un paese africano.');

-- Quiz 55: Letteratura giapponese
INSERT INTO Domanda (quiz, numero, testo) VALUES
(55, 1, 'Chi ha scritto "Storia di Genji" (Genji Monogatari)?'),
(55, 2, 'Quali sono le forme poetiche tradizionali giapponesi (es. haiku, tanka)?'),
(55, 3, 'Cita un opera importante di Yukio Mishima o Haruki Murakami.'),
(55, 4, 'Descrivi le caratteristiche principali del teatro Nō o Kabuki.'),
(55, 5, 'Qual è l influenza del Buddhismo Zen sulla letteratura giapponese?');

-- Quiz 56: Fisica nucleare
INSERT INTO Domanda (quiz, numero, testo) VALUES
(56, 1, 'Cosa studia la fisica nucleare?'),
(56, 2, 'Descrivi la struttura di un atomo, con particolare riferimento al nucleo.'),
(56, 3, 'Cos è la radioattività e quali tipi di decadimento esistono?'),
(56, 4, 'Spiega la differenza tra fissione e fusione nucleare.'),
(56, 5, 'Quali sono le applicazioni della fisica nucleare in medicina o industria?');

-- Quiz 57: Chimica ambientale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(57, 1, 'Cosa studia la chimica ambientale?'),
(57, 2, 'Descrivi l effetto serra e i suoi principali gas responsabili.'),
(57, 3, 'Cos è l inquinamento atmosferico e quali sono le sue fonti principali?'),
(57, 4, 'Spiega il concetto di "buco dell ozono".'),
(57, 5, 'Quali sono le principali sfide per la gestione sostenibile delle risorse idriche?');

-- Quiz 58: Geografia economica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(58, 1, 'Cosa studia la geografia economica?'),
(58, 2, 'Descrivi i principali settori dell economia (primario, secondario, terziario).'),
(58, 3, 'Cos è la globalizzazione economica e quali sono i suoi effetti?'),
(58, 4, 'Spiega il concetto di "sviluppo sostenibile" in un contesto economico-geografico.'),
(58, 5, 'Cita un esempio di cluster industriale o distretto economico.');

-- Quiz 59: Storia dell America
INSERT INTO Domanda (quiz, numero, testo) VALUES
(59, 1, 'Chi fu Cristoforo Colombo e quale fu il suo impatto?'),
(59, 2, 'Descrivi una civiltà precolombiana importante (es. Maya, Aztechi, Inca).'),
(59, 3, 'Quali furono le principali cause della Guerra d Indipendenza Americana?'),
(59, 4, 'Cos è stata la "Corsa all Ovest" negli Stati Uniti?'),
(59, 5, 'Cita un evento significativo nella storia dell America Latina nel XX secolo.');

-- Quiz 60: Matematica discreta
INSERT INTO Domanda (quiz, numero, testo) VALUES
(60, 1, 'Cosa si intende per "grafo" in matematica discreta?'),
(60, 2, 'Descrivi il principio di induzione matematica.'),
(60, 3, 'Cos è la combinatoria e a cosa serve?'),
(60, 4, 'Spiega la differenza tra una permutazione e una combinazione.'),
(60, 5, 'Cita un applicazione della matematica discreta nell informatica.');

-- Quiz 61: Fisica dei materiali
INSERT INTO Domanda (quiz, numero, testo) VALUES
(61, 1, 'Cosa studia la fisica dei materiali?'),
(61, 2, 'Quali sono le principali classi di materiali (es. metalli, ceramici, polimeri, compositi)?'),
(61, 3, 'Descrivi una proprietà meccanica importante dei materiali (es. durezza, tenacità).'),
(61, 4, 'Cos è la struttura cristallina di un materiale?'),
(61, 5, 'Cita un applicazione innovativa di un nuovo materiale.');

-- Quiz 62: Letteratura cinese
INSERT INTO Domanda (quiz, numero, testo) VALUES
(62, 1, 'Chi è considerato uno dei "Quattro Grandi Romanzi Classici" cinesi?'),
(62, 2, 'Quali sono le principali influenze filosofiche (Confucianesimo, Taoismo) sulla letteratura cinese?'),
(62, 3, 'Cita un opera importante di Lu Xun o Mo Yan.'),
(62, 4, 'Descrivi le caratteristiche della poesia Tang.'),
(62, 5, 'Qual è il ruolo della Rivoluzione Culturale nella letteratura cinese moderna?');

-- Quiz 63: Geografia culturale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(63, 1, 'Cosa studia la geografia culturale?'),
(63, 2, 'Definisci il concetto di "paesaggio culturale".'),
(63, 3, 'Come si diffondono le culture nello spazio geografico?'),
(63, 4, 'Spiega il concetto di "identità culturale" e il suo legame con il luogo.'),
(63, 5, 'Cita un esempio di come la cultura modella l ambiente costruito.');

-- Quiz 64: Chimica biologica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(64, 1, 'Cosa studia la chimica biologica (o biochimica)?'),
(64, 2, 'Quali sono le principali classi di macromolecole biologiche (carboidrati, lipidi, proteine, acidi nucleici)?'),
(64, 3, 'Descrivi il ruolo degli enzimi nelle reazioni biologiche.'),
(64, 4, 'Cos è il metabolismo?'),
(64, 5, 'Spiega brevemente il processo della fotosintesi o della respirazione cellulare.');

-- Quiz 65: Biologia marina
INSERT INTO Domanda (quiz, numero, testo) VALUES
(65, 1, 'Cosa studia la biologia marina?'),
(65, 2, 'Quali sono i principali ecosistemi marini (es. barriere coralline, abissi)?'),
(65, 3, 'Descrivi un adattamento specifico di un organismo marino al suo ambiente.'),
(65, 4, 'Quali sono le principali minacce per gli oceani e la vita marina?'),
(65, 5, 'Cita un esempio di catena alimentare marina.');

-- Quiz 66: Storia dell Oceania
INSERT INTO Domanda (quiz, numero, testo) VALUES
(66, 1, 'Quali sono le principali nazioni insulari dell Oceania?'),
(66, 2, 'Chi furono i primi colonizzatori europei dell Australia e della Nuova Zelanda?'),
(66, 3, 'Descrivi la cultura aborigena australiana o maori neozelandese.'),
(66, 4, 'Qual è l impatto dei cambiamenti climatici sulle isole del Pacifico?'),
(66, 5, 'Cita un evento storico significativo per una nazione dell Oceania.');

-- Quiz 67: Letteratura africana
INSERT INTO Domanda (quiz, numero, testo) VALUES
(67, 1, 'Chi ha scritto "Il buio oltre la siepe" (Things Fall Apart) di Chinua Achebe?'),
(67, 2, 'Quali sono i temi comuni nella letteratura africana post-coloniale?'),
(67, 3, 'Cita un opera importante di Wole Soyinka o Nadine Gordimer.'),
(67, 4, 'Descrivi l importanza della tradizione orale nella letteratura africana.'),
(67, 5, 'Qual è il ruolo della lingua (coloniale vs indigena) nella letteratura africana?');

-- Quiz 68: Filosofia orientale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(68, 1, 'Quali sono le principali scuole di pensiero della filosofia orientale (es. Induismo, Buddhismo, Confucianesimo, Taoismo)?'),
(68, 2, 'Descrivi il concetto di "Karma" e "Nirvana".'),
(68, 3, 'Qual è il testo sacro fondamentale dell Induismo o del Buddhismo?'),
(68, 4, 'Spiega il concetto di "Yin e Yang" nel Taoismo.'),
(68, 5, 'Cita un filosofo o maestro spirituale importante della tradizione orientale.');

-- Quiz 69: Psicologia dello sviluppo
INSERT INTO Domanda (quiz, numero, testo) VALUES
(69, 1, 'Cosa studia la psicologia dello sviluppo?'),
(69, 2, 'Quali sono le principali fasi dello sviluppo infantile secondo Piaget?'),
(69, 3, 'Descrivi la teoria dell attaccamento di Bowlby.'),
(69, 4, 'Cos è l adolescenza e quali sono le sue principali sfide evolutive?'),
(69, 5, 'Quali fattori influenzano lo sviluppo cognitivo e sociale nell arco della vita?');

-- Quiz 70: Economia internazionale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(70, 1, 'Cosa si intende per "bilancia dei pagamenti" di un paese?'),
(70, 2, 'Qual è il ruolo del Fondo Monetario Internazionale (FMI) o della Banca Mondiale?'),
(70, 3, 'Descrivi il concetto di "tasso di cambio" tra valute.'),
(70, 4, 'Cos è il commercio internazionale e quali sono i suoi vantaggi e svantaggi?'),
(70, 5, 'Cita un accordo commerciale internazionale importante (es. WTO, NAFTA, USMCA).');

-- Quiz 71: Sociologia della famiglia
INSERT INTO Domanda (quiz, numero, testo) VALUES
(71, 1, 'Cosa studia la sociologia della famiglia?'),
(71, 2, 'Quali sono le principali trasformazioni della struttura familiare nelle società contemporanee?'),
(71, 3, 'Descrivi il concetto di "ruolo di genere" all interno della famiglia.'),
(71, 4, 'Quali sono le diverse forme di famiglia esistenti oggi (es. nucleare, estesa, monogenitoriale)?'),
(71, 5, 'Cita una problematica sociale rilevante che riguarda la famiglia oggi.');

-- Quiz 72: Antropologia linguistica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(72, 1, 'Cosa studia l antropologia linguistica?'),
(72, 2, 'Descrivi l ipotesi di Sapir-Whorf (relativismo linguistico).'),
(72, 3, 'Cos è la sociolinguistica?'),
(72, 4, 'Come avviene il processo di acquisizione del linguaggio nei bambini?'),
(72, 5, 'Qual è l importanza della lingua per la conservazione dell identità culturale?');

-- Quiz 73: Storia dell antica Grecia
INSERT INTO Domanda (quiz, numero, testo) VALUES
(73, 1, 'Chi erano i principali dei dell Olimpo greco?'),
(73, 2, 'Descrivi l importanza dei giochi olimpici nell antica Grecia.'),
(73, 3, 'Cos è stata la Guerra del Peloponneso?'),
(73, 4, 'Parla dell architettura dei templi greci.'),
(73, 5, 'Qual è l eredità culturale dell antica Grecia nel mondo occidentale?');

-- Quiz 74: Matematica per principianti
INSERT INTO Domanda (quiz, numero, testo) VALUES
(74, 1, 'Cosa sono le quattro operazioni aritmetiche fondamentali?'),
(74, 2, 'Come si calcola l area di un triangolo?'),
(74, 3, 'Definisci un numero primo.'),
(74, 4, 'Cosa rappresenta una percentuale?'),
(74, 5, 'Come si risolve una semplice equazione di primo grado?');

-- Quiz 75: Fisica delle particelle
INSERT INTO Domanda (quiz, numero, testo) VALUES
(75, 1, 'Cosa sono i quark e i leptoni?'),
(75, 2, 'Descrivi il Modello Standard della fisica delle particelle.'),
(75, 3, 'Cos è un acceleratore di particelle e come funziona (es. LHC)?'),
(75, 4, 'Qual è il ruolo del bosone di Higgs?'),
(75, 5, 'Cosa si intende per antimateria?');

-- Quiz 76: Letteratura russa
INSERT INTO Domanda (quiz, numero, testo) VALUES
(76, 1, 'Chi è l autore de "Il Maestro e Margherita"?'),
(76, 2, 'Quali sono i temi principali nelle opere di Anton Čechov?'),
(76, 3, 'Descrivi il periodo della "letteratura del disgelo" in Unione Sovietica.'),
(76, 4, 'Qual è l importanza di Aleksandr Puškin per la letteratura russa?'),
(76, 5, 'Cita un poeta russo del XX secolo.');

-- Quiz 77: Geografia dell Italia
INSERT INTO Domanda (quiz, numero, testo) VALUES
(77, 1, 'Quali sono le isole maggiori d Italia?'),
(77, 2, 'Descrivi il clima tipico della regione mediterranea italiana.'),
(77, 3, 'Nomina tre città d arte italiane famose nel mondo.'),
(77, 4, 'Quali sono i principali laghi italiani?'),
(77, 5, 'Descrivi una caratteristica geografica distintiva di una regione italiana a tua scelta.');

-- Quiz 78: Chimica dei materiali
INSERT INTO Domanda (quiz, numero, testo) VALUES
(78, 1, 'Cosa si intende per polimero e monomero?'),
(78, 2, 'Descrivi le proprietà e gli usi di un metallo comune (es. alluminio, rame).'),
(78, 3, 'Cos è un materiale ceramico avanzato?'),
(78, 4, 'Spiega il concetto di "nanomateriale" e le sue potenziali applicazioni.'),
(78, 5, 'Come influisce la struttura atomica sulle proprietà macroscopiche di un materiale?');

-- Quiz 79: Biologia marina
INSERT INTO Domanda (quiz, numero, testo) VALUES
(79, 1, 'Cosa sono le correnti oceaniche e quale ruolo svolgono?'),
(79, 2, 'Descrivi la vita nelle profondità abissali.'),
(79, 3, 'Qual è l importanza del plancton negli ecosistemi marini?'),
(79, 4, 'Cosa si intende per "acidificazione degli oceani"?'),
(79, 5, 'Parla di una specie marina a rischio di estinzione e delle cause.');

-- Quiz 80: Storia del Rinascimento
INSERT INTO Domanda (quiz, numero, testo) VALUES
(80, 1, 'Quali sono le città italiane che furono culle del Rinascimento?'),
(80, 2, 'Chi erano i Medici e quale ruolo ebbero nel Rinascimento fiorentino?'),
(80, 3, 'Descrivi l importanza dell invenzione della stampa a caratteri mobili.'),
(80, 4, 'Quali furono le principali scoperte geografiche del periodo rinascimentale?'),
(80, 5, 'Cita un artista o scienziato rinascimentale non italiano e il suo contributo.');

-- Quiz 81: Astronomia moderna
INSERT INTO Domanda (quiz, numero, testo) VALUES
(81, 1, 'Cosa sono i pianeti extrasolari e come vengono scoperti?'),
(81, 2, 'Descrivi il concetto di "onde gravitazionali" e la loro recente rilevazione.'),
(81, 3, 'Quali sono le missioni spaziali più importanti per l esplorazione del sistema solare?'),
(81, 4, 'Cos è il telescopio spaziale James Webb e quali sono i suoi obiettivi?'),
(81, 5, 'Quali sono le attuali teorie sull origine dell universo (Big Bang)?');

-- Quiz 82: Informatica avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(82, 1, 'Cosa si intende per intelligenza artificiale (AI) e machine learning?'),
(82, 2, 'Descrivi il concetto di "cloud computing" e i suoi modelli (IaaS, PaaS, SaaS).'),
(82, 3, 'Cos è la cybersecurity e quali sono le minacce più comuni?'),
(82, 4, 'Spiega cosa sono i Big Data e le tecnologie per la loro analisi.'),
(82, 5, 'Cos è la blockchain e quali sono le sue applicazioni oltre le criptovalute?');

-- Quiz 83: Filosofia contemporanea
INSERT INTO Domanda (quiz, numero, testo) VALUES
(83, 1, 'Chi sono i principali esponenti della Scuola di Francoforte?'),
(83, 2, 'Descrivi il pensiero di Michel Foucault sul potere e la conoscenza.'),
(83, 3, 'Cos è il post-strutturalismo?'),
(83, 4, 'Spiega il concetto di "etica applicata" e cita un suo campo (es. bioetica).'),
(83, 5, 'Quali sono le principali questioni discusse nella filosofia della mente contemporanea?');

-- Quiz 84: Psicologia cognitiva
INSERT INTO Domanda (quiz, numero, testo) VALUES
(84, 1, 'Cosa studia la psicologia cognitiva?'),
(84, 2, 'Descrivi i principali modelli della memoria (es. memoria a breve termine, memoria a lungo termine).'),
(84, 3, 'Cos è l attenzione e quali sono i suoi meccanismi?'),
(84, 4, 'Spiega il processo di problem solving e le strategie cognitive utilizzate.'),
(84, 5, 'Cosa si intende per "bias cognitivo" e cita un esempio.');

-- Quiz 85: Economia globale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(85, 1, 'Quali sono le principali istituzioni economiche globali (es. FMI, Banca Mondiale, WTO)?'),
(85, 2, 'Descrivi l impatto della globalizzazione sui paesi in via di sviluppo.'),
(85, 3, 'Cosa sono le catene globali del valore (global value chains)?'),
(85, 4, 'Quali sono le principali sfide economiche globali attuali (es. disuguaglianza, cambiamenti climatici)?'),
(85, 5, 'Spiega il concetto di "multinazionale" e il suo ruolo nell economia globale.');

-- Quiz 86: Sociologia delle migrazioni
INSERT INTO Domanda (quiz, numero, testo) VALUES
(86, 1, 'Cosa studia la sociologia delle migrazioni?'),
(86, 2, 'Quali sono i principali fattori "push" e "pull" che determinano le migrazioni?'),
(86, 3, 'Descrivi il concetto di "integrazione" dei migranti nelle società di accoglienza.'),
(86, 4, 'Cos è la diaspora e quali sono le sue caratteristiche?'),
(86, 5, 'Quali sono le principali politiche migratorie adottate dagli stati?');

-- Quiz 87: Antropologia sociale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(87, 1, 'Qual è l oggetto di studio dell antropologia sociale?'),
(87, 2, 'Descrivi il metodo dell osservazione partecipante in antropologia.'),
(87, 3, 'Cosa si intende per "sistemi di parentela" e la loro importanza nelle diverse culture?'),
(87, 4, 'Spiega il concetto di "stratificazione sociale" dal punto di vista antropologico.'),
(87, 5, 'Cita un classico studio di antropologia sociale e il suo contributo.');

-- Quiz 88: Storia dell Impero Romano
INSERT INTO Domanda (quiz, numero, testo) VALUES
(88, 1, 'Quali furono le principali conquiste territoriali durante l espansione romana?'),
(88, 2, 'Descrivi l organizzazione politica dell Impero Romano durante il Principato.'),
(88, 3, 'Cosa si intende per "Pax Romana"?'),
(88, 4, 'Quali furono le cause interne ed esterne che portarono alla crisi del III secolo?'),
(88, 5, 'Parla dell importanza del diritto romano e della sua eredità.');

-- Quiz 89: Letteratura francese
INSERT INTO Domanda (quiz, numero, testo) VALUES
(89, 1, 'Chi ha scritto "Madame Bovary"?'),
(89, 2, 'Quali sono le caratteristiche del Simbolismo nella poesia francese?'),
(89, 3, 'Cita un opera importante di Jean-Paul Sartre o Simone de Beauvoir.'),
(89, 4, 'Cos è il "Nouveau Roman"?'),
(89, 5, 'Descrivi l influenza della Rivoluzione Francese sulla letteratura del periodo.');

-- Quiz 90: Fisica quantistica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(90, 1, 'Cos è l entanglement quantistico?'),
(90, 2, 'Spiega il concetto di "quanto" di energia.'),
(90, 3, 'Qual è il ruolo dell equazione di Schrödinger nella meccanica quantistica?'),
(90, 4, 'Descrivi un applicazione tecnologica basata sulla fisica quantistica (es. laser, transistor).'),
(90, 5, 'Cosa si intende per "collasso della funzione d onda"?');

-- Quiz 91: Chimica organica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(91, 1, 'Cosa sono gli idrocarburi aromatici? Dai un esempio.'),
(91, 2, 'Descrivi una reazione di addizione tipica degli alcheni.'),
(91, 3, 'Cosa sono i polimeri e come si formano?'),
(91, 4, 'Qual è la differenza tra un alcol primario, secondario e terziario?'),
(91, 5, 'Spiega l importanza della stereoisomeria in chimica organica.');

-- Quiz 92: Geologia applicata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(92, 1, 'Cosa si intende per geologia applicata e quali sono i suoi campi di studio?'),
(92, 2, 'Come si conducono le indagini geognostiche per la costruzione di grandi opere?'),
(92, 3, 'Descrivi i principali rischi geologici (frane, terremoti, eruzioni vulcaniche).'),
(92, 4, 'Qual è il ruolo del geologo nella ricerca e gestione delle risorse idriche sotterranee?'),
(92, 5, 'Cosa si intende per "bonifica dei siti contaminati" dal punto di vista geologico?');

-- Quiz 93: Storia medievale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(93, 1, 'Cosa furono le invasioni barbariche e quale impatto ebbero sull Impero Romano?'),
(93, 2, 'Descrivi l organizzazione della società feudale.'),
(93, 3, 'Quale fu il ruolo dei monasteri nella conservazione della cultura durante il Medioevo?'),
(93, 4, 'Cosa si intende per "rinascita dell anno Mille"?'),
(93, 5, 'Parla della Peste Nera e delle sue conseguenze socio-economiche.');

-- Quiz 94: Matematica discreta
INSERT INTO Domanda (quiz, numero, testo) VALUES
(94, 1, 'Cos è la logica proposizionale e a cosa serve?'),
(94, 2, 'Definisci il concetto di "algoritmo" e le sue proprietà.'),
(94, 3, 'Cosa sono le relazioni di ricorrenza e come si risolvono?'),
(94, 4, 'Spiega la teoria degli insiemi e le operazioni fondamentali (unione, intersezione, complemento).'),
(94, 5, 'Cita un problema classico risolvibile con la teoria dei grafi.');

-- Quiz 95: Fisica classica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(95, 1, 'Definisci il concetto di lavoro e potenza in fisica.'),
(95, 2, 'Cosa afferma la legge di gravitazione universale di Newton?'),
(95, 3, 'Spiega il principio di Archimede relativo ai fluidi.'),
(95, 4, 'Descrivi il moto armonico semplice.'),
(95, 5, 'Qual è la differenza tra grandezze scalari e vettoriali? Fornisci esempi.');

-- Quiz 96: Letteratura italiana
INSERT INTO Domanda (quiz, numero, testo) VALUES
(96, 1, 'Chi ha scritto "Il Decameron"?'),
(96, 2, 'Quali sono le caratteristiche principali del Romanticismo italiano?'),
(96, 3, 'Cita un opera importante di Luigi Pirandello.'),
(96, 4, 'Cos è il Neorealismo nella letteratura e nel cinema italiano?'),
(96, 5, 'Descrivi l importanza di Giacomo Leopardi nella poesia italiana.');

-- Quiz 97: Geografia politica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(97, 1, 'Cosa si intende per "nazione" e "nazionalismo"?'),
(97, 2, 'Descrivi le diverse forme di governo statale (es. repubblica, monarchia).'),
(97, 3, 'Quali sono le principali organizzazioni internazionali politiche (es. ONU)?'),
(97, 4, 'Spiega il concetto di "sovranità" statale.'),
(97, 5, 'Cita un esempio di disputa territoriale tra stati.');

-- Quiz 98: Chimica analitica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(98, 1, 'Cosa si intende per "errore sistematico" e "errore casuale" in un analisi?'),
(98, 2, 'Descrivi una tecnica cromatografica (es. gascromatografia, HPLC).'),
(98, 3, 'Qual è il principio di funzionamento di un elettrodo a pH?'),
(98, 4, 'Spiega l importanza della calibrazione degli strumenti in chimica analitica.'),
(98, 5, 'Cosa si intende per "limite di rivelabilità" di un metodo analitico?');

-- Quiz 99: Biologia molecolare
INSERT INTO Domanda (quiz, numero, testo) VALUES
(99, 1, 'Cos è la replicazione del DNA e perché è semiconservativa?'),
(99, 2, 'Descrivi il processo di traduzione dell mRNA in proteine.'),
(99, 3, 'Cosa sono le mutazioni genetiche e quali possono essere le loro conseguenze?'),
(99, 4, 'Spiega la tecnica della PCR (Reazione a Catena della Polimerasi).'),
(99, 5, 'Cosa si intende per "ingegneria genetica" e quali sono le sue applicazioni?');

-- Quiz 100: Storia dell Asia
INSERT INTO Domanda (quiz, numero, testo) VALUES
(100, 1, 'Descrivi l importanza della dinastia Han in Cina.'),
(100, 2, 'Cos è stato l Impero Ottomano e quale fu la sua estensione massima?'),
(100, 3, 'Parla della figura di Mahatma Gandhi e del movimento per l indipendenza indiana.'),
(100, 4, 'Quali furono le cause e le conseguenze della Guerra di Corea o del Vietnam?'),
(100, 5, 'Cita una tradizione culturale o religiosa originaria dell Asia e la sua diffusione.');

-- Quiz 101: Letteratura spagnola
INSERT INTO Domanda (quiz, numero, testo) VALUES
(101, 1, 'Chi sono i poeti della Generazione del  27?'),
(101, 2, 'Descrivi le caratteristiche del romanzo picaresco spagnolo.'),
(101, 3, 'Cita un opera importante di Gabriel García Márquez (sebbene colombiano, influente in ambito ispanico).'),
(101, 4, 'Cos è il "Boom" della letteratura ispanoamericana e quali autori ne fecero parte?'),
(101, 5, 'Parla di un tema ricorrente nella letteratura spagnola contemporanea.');

-- Quiz 102: Filosofia antica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(102, 1, 'Quali sono le principali scuole filosofiche ellenistiche (Stoicismo, Epicureismo, Scetticismo)?'),
(102, 2, 'Descrivi la teoria delle idee di Platone.'),
(102, 3, 'Cos è la logica aristotelica e il sillogismo?'),
(102, 4, 'Spiega il concetto di "Atarassia" per gli epicurei o "Apatheia" per gli stoici.'),
(102, 5, 'Chi erano i Sofisti e quale fu il loro rapporto con Socrate?');

-- Quiz 103: Psicologia sociale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(103, 1, 'Cosa si intende per "pregiudizio" e "stereotipo"?'),
(103, 2, 'Descrivi l esperimento carcerario di Stanford di Zimbardo.'),
(103, 3, 'Come si formano le prime impressioni sugli altri?'),
(103, 4, 'Spiega il concetto di "influenza sociale" e le sue forme (es. conformismo, obbedienza).'),
(103, 5, 'Cosa sono le "norme sociali" e quale ruolo svolgono?');

-- Quiz 104: Economia aziendale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(104, 1, 'Quali sono le principali forme giuridiche d impresa (es. S.p.A., S.r.l.)?'),
(104, 2, 'Descrivi il concetto di "catena del valore" di Porter.'),
(104, 3, 'Cos è l analisi SWOT (Strengths, Weaknesses, Opportunities, Threats)?'),
(104, 4, 'Spiega l importanza della gestione delle risorse umane in un azienda.'),
(104, 5, 'Cosa si intende per "responsabilità sociale d impresa" (CSR)?');

-- Quiz 105: Sociologia urbana
INSERT INTO Domanda (quiz, numero, testo) VALUES
(105, 1, 'Quali sono le teorie classiche della sociologia urbana (es. Scuola di Chicago)?'),
(105, 2, 'Descrivi il fenomeno dell urbanizzazione a livello globale.'),
(105, 3, 'Cosa si intende per "spazio pubblico" e quale ruolo svolge nella vita urbana?'),
(105, 4, 'Spiega il concetto di "diritto alla città".'),
(105, 5, 'Quali sono le sfide future per le città sostenibili?');

-- Quiz 106: Antropologia culturale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(106, 1, 'Qual è la differenza tra "cultura" e "società" in antropologia?'),
(106, 2, 'Descrivi il concetto di "etnografia" come metodo di ricerca.'),
(106, 3, 'Cosa si intende per "sistemi di scambio" (es. dono, mercato) nelle diverse culture?'),
(106, 4, 'Spiega come l antropologia studia i sistemi religiosi e di credenze.'),
(106, 5, 'Cita un esempio di come la globalizzazione influisce sulle culture locali.');

-- Quiz 107: Storia moderna
INSERT INTO Domanda (quiz, numero, testo) VALUES
(107, 1, 'Cosa fu l assolutismo monarchico e chi ne fu un esempio?'),
(107, 2, 'Descrivi le cause e le conseguenze della Rivoluzione Inglese del XVII secolo.'),
(107, 3, 'Quale fu l importanza dell espansione coloniale europea durante l età moderna?'),
(107, 4, 'Spiega il concetto di "Antico Regime" (Ancien Régime).'),
(107, 5, 'Cita una figura scientifica o filosofica chiave dell Illuminismo.');

-- Quiz 108: Letteratura tedesca
INSERT INTO Domanda (quiz, numero, testo) VALUES
(108, 1, 'Chi ha scritto "La metamorfosi"?'),
(108, 2, 'Quali sono le caratteristiche del Romanticismo tedesco?'),
(108, 3, 'Cita un opera importante di Bertolt Brecht.'),
(108, 4, 'Descrivi il movimento letterario del "Biedermeier".'),
(108, 5, 'Parla di un tema importante nella letteratura tedesca del dopoguerra (Vergangenheitsbewältigung).');

-- Quiz 109: Fisica applicata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(109, 1, 'Come funzionano le fibre ottiche e quali sono le loro applicazioni?'),
(109, 2, 'Spiega i principi fisici alla base del funzionamento dei GPS.'),
(109, 3, 'Quali sono le applicazioni della fisica dei plasmi?'),
(109, 4, 'Descrivi come la fisica contribuisce allo sviluppo di energie rinnovabili.'),
(109, 5, 'Cosa si intende per "acustica architettonica"?');

-- Quiz 110: Chimica fisica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(110, 1, 'Cos è l elettrochimica e quali sono le sue applicazioni (es. batterie, corrosione)?'),
(110, 2, 'Descrivi la legge di Arrhenius per la dipendenza della velocità di reazione dalla temperatura.'),
(110, 3, 'Cosa sono le soluzioni colloidali e quali proprietà le caratterizzano?'),
(110, 4, 'Spiega il concetto di "potenziale chimico".'),
(110, 5, 'Qual è la differenza tra un sistema aperto, chiuso e isolato in termodinamica?');

-- Quiz 111: Geografia fisica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(111, 1, 'Cosa sono i biomi terrestri e cita alcuni esempi?'),
(111, 2, 'Descrivi il processo di formazione dei suoli (pedogenesi).'),
(111, 3, 'Quali sono i principali tipi di deserti e le loro caratteristiche?'),
(111, 4, 'Spiega il fenomeno delle maree e le sue cause.'),
(111, 5, 'Cosa si intende per "rischio idrogeologico"?');

-- Quiz 112: Storia dell Europa
INSERT INTO Domanda (quiz, numero, testo) VALUES
(112, 1, 'Cosa fu il Congresso di Vienna e quali furono i suoi obiettivi?'),
(112, 2, 'Descrivi il processo di unificazione italiana o tedesca nel XIX secolo.'),
(112, 3, 'Quali furono le cause e le conseguenze della Rivoluzione Russa del 1917?'),
(112, 4, 'Spiega il concetto di "Stato sociale" (Welfare State) in Europa.'),
(112, 5, 'Cita un trattato fondamentale per la costruzione dell Unione Europea.');

-- Quiz 113: Matematica finanziaria
INSERT INTO Domanda (quiz, numero, testo) VALUES
(113, 1, 'Cosa si intende per "ammortamento" di un prestito?'),
(113, 2, 'Descrivi il concetto di "rischio" e "rendimento" in finanza.'),
(113, 3, 'Cos è un derivato finanziario (es. opzione, future)?'),
(113, 4, 'Spiega come si calcola il valore di un annualità (rendita).'),
(113, 5, 'Cosa si intende per "diversificazione di portafoglio"?');

-- Quiz 114: Fisica teorica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(114, 1, 'Qual è la relazione tra la meccanica quantistica e la relatività generale?'),
(114, 2, 'Descrivi il concetto di "simmetria" in fisica teorica.'),
(114, 3, 'Cosa sono le "dimensioni extra" ipotizzate da alcune teorie?'),
(114, 4, 'Spiega il paradosso dell informazione dei buchi neri.'),
(114, 5, 'Quali sono le frontiere attuali della ricerca in fisica teorica?');

-- Quiz 115: Letteratura americana
INSERT INTO Domanda (quiz, numero, testo) VALUES
(115, 1, 'Chi ha scritto "Il grande Gatsby"?'),
(115, 2, 'Quali sono le caratteristiche della letteratura del Sud degli Stati Uniti?'),
(115, 3, 'Cita un opera importante di Toni Morrison o Philip Roth.'),
(115, 4, 'Descrivi il movimento della "Beat Generation".'),
(115, 5, 'Parla di un tema ricorrente nella letteratura americana contemporanea, come l identità o la razza.');

-- Quiz 116: Geografia culturale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(116, 1, 'Cosa si intende per "diffusione culturale" e quali sono i suoi meccanismi?'),
(116, 2, 'Descrivi il concetto di "luogo" (place) in geografia culturale.'),
(116, 3, 'Come la lingua e la religione modellano i paesaggi culturali?'),
(116, 4, 'Spiega l impatto del turismo sulla cultura locale.'),
(116, 5, 'Cita un esempio di conflitto culturale legato al territorio.');

-- Quiz 117: Chimica industriale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(117, 1, 'Descrivi il processo di raffinazione del petrolio e i suoi prodotti.'),
(117, 2, 'Quali sono le principali materie prime utilizzate nell industria chimica?'),
(117, 3, 'Cosa si intende per "chimica verde" e i suoi principi?'),
(117, 4, 'Spiega l importanza dei reattori chimici nella produzione industriale.'),
(117, 5, 'Cita un esempio di polimero di sintesi e le sue applicazioni industriali.');

-- Quiz 118: Biologia evolutiva
INSERT INTO Domanda (quiz, numero, testo) VALUES
(118, 1, 'Cosa si intende per "selezione sessuale"?'),
(118, 2, 'Descrivi il concetto di "albero filogenetico" e come viene costruito.'),
(118, 3, 'Cos è l evoluzione convergente e divergente? Fornisci esempi.'),
(118, 4, 'Spiega il ruolo delle mutazioni come fonte di variabilità genetica.'),
(118, 5, 'Cosa sono le "prove" dell evoluzione (es. fossili, anatomia comparata, embriologia)?');

-- Quiz 119: Storia dell Africa
INSERT INTO Domanda (quiz, numero, testo) VALUES
(119, 1, 'Descrivi l importanza del Regno del Mali o dell Impero Songhai.'),
(119, 2, 'Quali furono le conseguenze a lungo termine della "corsa all Africa" delle potenze europee?'),
(119, 3, 'Parla di un leader della lotta anti-coloniale in Africa (es. Nkrumah, Lumumba, Kenyatta).'),
(119, 4, 'Cosa si intende per "neocolonialismo" in Africa?'),
(119, 5, 'Quali sono le sfide socio-economiche principali dell Africa contemporanea?');

-- Quiz 120: Letteratura giapponese
INSERT INTO Domanda (quiz, numero, testo) VALUES
(120, 1, 'Chi sono alcuni autori giapponesi contemporanei di fama internazionale?'),
(120, 2, 'Descrivi le caratteristiche del genere "manga" e la sua influenza culturale.'),
(120, 3, 'Cita un opera importante di Yasunari Kawabata, primo Nobel giapponese per la letteratura.'),
(120, 4, 'Qual è l importanza della natura nella letteratura e nell estetica giapponese?'),
(120, 5, 'Parla di un tema ricorrente nella letteratura giapponese moderna o contemporanea.');

-- Quiz 121: Filosofia orientale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(121, 1, 'Spiega il concetto di "Dharma" nelle filosofie indiane.'),
(121, 2, 'Descrivi le Quattro Nobili Verità del Buddhismo.'),
(121, 3, 'Qual è il ruolo dei " Cinque Precetti" nel Buddhismo?'),
(121, 4, 'Spiega il concetto di "Wu Wei" (non-azione) nel Taoismo.'),
(121, 5, 'Confronta brevemente un aspetto del Confucianesimo e del Taoismo.');

-- Quiz 122: Psicologia clinica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(122, 1, 'Quali sono i principali disturbi dell umore (es. depressione, disturbo bipolare)?'),
(122, 2, 'Descrivi un approccio psicoterapeutico diverso dalla terapia cognitivo-comportamentale (es. psicoanalisi, terapia sistemica).'),
(122, 3, 'Cos è lo stress e quali sono le strategie di coping?'),
(122, 4, 'Spiega l importanza della relazione terapeutica nel processo di cura.'),
(122, 5, 'Cosa si intende per "diagnosi differenziale" in psicologia clinica?');

-- Quiz 123: Economia politica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(123, 1, 'Qual è la differenza tra politica monetaria espansiva e restrittiva?'),
(123, 2, 'Descrivi il concetto di "fallimento del mercato" e le sue cause.'),
(123, 3, 'Cosa sono i beni pubblici e perché rappresentano una sfida per il mercato?'),
(123, 4, 'Spiega il ruolo dello Stato nell economia secondo diverse scuole di pensiero (es. Keynesiana, Neoliberista).'),
(123, 5, 'Cosa si intende per "sviluppo economico" e come si misura?');

-- Quiz 124: Sociologia rurale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(124, 1, 'Quali sono le differenze tra comunità rurali e urbane in termini di struttura sociale e relazioni?'),
(124, 2, 'Descrivi l impatto delle politiche agricole (es. PAC in Europa) sulle aree rurali.'),
(124, 3, 'Cosa si intende per "turismo rurale" o "agriturismo" e quali sono i suoi effetti?'),
(124, 4, 'Spiega il fenomeno dello spopolamento delle aree rurali e le sue cause.'),
(124, 5, 'Quali sono le nuove funzioni delle aree rurali nelle società post-industriali?');

-- Quiz 125: Antropologia fisica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(125, 1, 'Quali sono le principali tappe dell evoluzione del genere Homo?'),
(125, 2, 'Descrivi le caratteristiche distintive dell Homo Sapiens rispetto agli altri ominidi.'),
(125, 3, 'Cos è la genetica delle popolazioni e come contribuisce allo studio dell evoluzione umana?'),
(125, 4, 'Spiega il concetto di "razza" dal punto di vista biologico e la sua critica antropologica.'),
(125, 5, 'Come l ambiente ha influenzato l adattamento biologico delle popolazioni umane?');

-- Quiz 126: Storia dell Oceania
INSERT INTO Domanda (quiz, numero, testo) VALUES
(126, 1, 'Descrivi le grandi migrazioni polinesiane attraverso il Pacifico.'),
(126, 2, 'Quale fu l impatto dell arrivo del Capitano Cook e di altri esploratori europei sull Oceania?'),
(126, 3, 'Parla della storia coloniale di una specifica isola o arcipelago del Pacifico.'),
(126, 4, 'Cosa si intende per "movimenti per l indipendenza" nei paesi dell Oceania nel XX secolo?'),
(126, 5, 'Quali sono le sfide contemporanee (es. ambientali, economiche) per gli stati insulari dell Oceania?');

-- Quiz 127: Letteratura africana
INSERT INTO Domanda (quiz, numero, testo) VALUES
(127, 1, 'Chi sono alcune scrittrici africane contemporanee importanti?'),
(127, 2, 'Descrivi il concetto di "Négritude" e i suoi principali esponenti.'),
(127, 3, 'Cita un opera importante di Ngugi wa Thiong o o Ama Ata Aidoo.'),
(127, 4, 'Qual è il ruolo del mito e della leggenda nella narrativa africana moderna?'),
(127, 5, 'Come la letteratura africana affronta i temi dell identità, del colonialismo e della post-colonialità?');

-- Quiz 128: Fisica nucleare
INSERT INTO Domanda (quiz, numero, testo) VALUES
(128, 1, 'Cosa sono gli isotopi e come si differenziano?'),
(128, 2, 'Descrivi il funzionamento di un reattore nucleare a fissione per la produzione di energia.'),
(128, 3, 'Quali sono i problemi legati alla gestione delle scorie radioattive?'),
(128, 4, 'Spiega il concetto di "tempo di dimezzamento" di un isotopo radioattivo.'),
(128, 5, 'Cosa si intende per "forza nucleare forte" e "forza nucleare debole"?');

-- Quiz 129: Chimica ambientale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(129, 1, 'Quali sono i principali inquinanti dell acqua e le loro fonti?'),
(129, 2, 'Descrivi il ciclo biogeochimico di un elemento importante (es. carbonio, azoto, fosforo).'),
(129, 3, 'Cosa si intende per "eutrofizzazione" dei corpi idrici?'),
(129, 4, 'Spiega i principi della "chimica verde" per la sostenibilità ambientale.'),
(129, 5, 'Come si possono trattare i rifiuti solidi urbani in modo sostenibile?');

-- Quiz 130: Geografia economica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(130, 1, 'Cosa si intende per "delocalizzazione" produttiva e quali sono le sue cause ed effetti?'),
(130, 2, 'Descrivi il ruolo delle infrastrutture (trasporti, comunicazioni) nello sviluppo economico regionale.'),
(130, 3, 'Quali sono i principali modelli di localizzazione delle attività economiche (es. Weber, Christaller)?'),
(130, 4, 'Spiega il concetto di "divisione internazionale del lavoro".'),
(130, 5, 'Come la geografia economica analizza le disuguaglianze regionali e globali?');

-- Quiz 131: Storia dell America
INSERT INTO Domanda (quiz, numero, testo) VALUES
(131, 1, 'Quali furono le principali potenze coloniali nelle Americhe e dove si stabilirono?'),
(131, 2, 'Descrivi la Guerra Civile Americana e le sue cause principali.'),
(131, 3, 'Cosa fu la "Dottrina Monroe" e quale impatto ebbe sulla politica estera USA?'),
(131, 4, 'Parla di un movimento rivoluzionario o di indipendenza in America Latina nel XIX o XX secolo.'),
(131, 5, 'Qual è stato l impatto dell immigrazione sulla formazione delle società americane?');

-- Quiz 132: Matematica discreta
INSERT INTO Domanda (quiz, numero, testo) VALUES
(132, 1, 'Cosa sono gli automi a stati finiti e dove vengono utilizzati?'),
(132, 2, 'Descrivi l algebra di Boole e le sue applicazioni nei circuiti logici.'),
(132, 3, 'Cos è la teoria della computabilità e il concetto di macchina di Turing?'),
(132, 4, 'Spiega il problema del commesso viaggiatore (TSP) e la sua complessità.'),
(132, 5, 'Cita un algoritmo importante basato sulla teoria dei grafi (es. Dijkstra, Kruskal).');

-- Quiz 133: Fisica dei materiali
INSERT INTO Domanda (quiz, numero, testo) VALUES
(133, 1, 'Cosa sono i semiconduttori e quale ruolo svolgono nell elettronica?'),
(133, 2, 'Descrivi le proprietà e le applicazioni dei materiali compositi.'),
(133, 3, 'Cos è la superconduttività e quali sono le sue potenziali applicazioni?'),
(133, 4, 'Spiega come le imperfezioni cristalline (difetti) influenzano le proprietà dei materiali.'),
(133, 5, 'Cosa si intende per "fatica" dei materiali e come si previene?');

-- Quiz 134: Letteratura cinese
INSERT INTO Domanda (quiz, numero, testo) VALUES
(134, 1, 'Chi è Lao She e qual è una sua opera famosa?'),
(134, 2, 'Descrivi l influenza della calligrafia sull estetica letteraria cinese.'),
(134, 3, 'Cita un esempio di letteratura cinese contemporanea che riflette sui cambiamenti sociali.'),
(134, 4, 'Quali sono i generi letterari popolari nella Cina antica (es. "fu", "ci")?'),
(134, 5, 'Come la letteratura cinese si è aperta al mondo e ha influenzato altre culture?');

-- Quiz 135: Geografia culturale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(135, 1, 'Cosa si intende per "paesaggio simbolico"? Fornisci un esempio.'),
(135, 2, 'Come la geografia culturale studia i fenomeni di migrazione e diaspora?'),
(135, 3, 'Qual è il ruolo della memoria collettiva nella costruzione dell identità di un luogo?'),
(135, 4, 'Spiega come la globalizzazione può portare sia all omogeneizzazione che alla diversificazione culturale.'),
(135, 5, 'Cita un esempio di come l arte e la letteratura possono rappresentare e interpretare i luoghi.');

-- Quiz 136: Chimica biologica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(136, 1, 'Descrivi la struttura e la funzione delle proteine.'),
(136, 2, 'Cosa sono i lipidi e quali ruoli svolgono negli organismi viventi (es. membrane, riserva energetica)?'),
(136, 3, 'Spiega il meccanismo d azione di un enzima (sito attivo, specificità).'),
(136, 4, 'Descrivi il ciclo di Krebs (o ciclo dell acido citrico) e la sua importanza metabolica.'),
(136, 5, 'Qual è la differenza tra DNA e RNA in termini di struttura e funzione?');

-- Quiz 137: Biologia marina
INSERT INTO Domanda (quiz, numero, testo) VALUES
(137, 1, 'Cosa sono le barriere coralline e perché sono importanti per la biodiversità?'),
(137, 2, 'Descrivi un esempio di simbiosi in ambiente marino.'),
(137, 3, 'Quali sono gli effetti dell inquinamento da plastica sugli ecosistemi marini?'),
(137, 4, 'Spiega il fenomeno della bioluminescenza in alcuni organismi marini.'),
(137, 5, 'Come i cambiamenti climatici influenzano le popolazioni di pesci e altri organismi marini?');

-- Quiz 138: Storia dell Asia
INSERT INTO Domanda (quiz, numero, testo) VALUES
(138, 1, 'Descrivi l ascesa del Giappone come potenza industriale e militare tra XIX e XX secolo.'),
(138, 2, 'Qual è stata l importanza della Rivoluzione Culturale in Cina?'),
(138, 3, 'Parla del conflitto indo-pakistano e delle sue origini.'),
(138, 4, 'Cosa si intende per "Tigri Asiatiche" e quale è stato il loro sviluppo economico?'),
(138, 5, 'Quali sono le principali sfide geopolitiche contemporanee in Asia?');

-- Quiz 139: Letteratura africana
INSERT INTO Domanda (quiz, numero, testo) VALUES
(139, 1, 'Chi sono i principali esponenti della letteratura maghrebina di lingua francese?'),
(139, 2, 'Descrivi l uso del "pidgin" o del creolo in alcune opere letterarie africane.'),
(139, 3, 'Cita un romanzo o una raccolta di poesie di un autore/autrice africano/a che ha vinto il Premio Nobel.'),
(139, 4, 'Come la letteratura africana esplora i temi della tradizione orale e della modernità?'),
(139, 5, 'Qual è il ruolo della donna nella letteratura africana contemporanea?');

-- Quiz 140: Filosofia orientale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(140, 1, 'Spiega il concetto di "Dharma" nelle filosofie indiane.'),
(140, 2, 'Descrivi le Quattro Nobili Verità del Buddhismo.'),
(140, 3, 'Qual è il ruolo dei " Cinque Precetti" nel Buddhismo?'),
(140, 4, 'Spiega il concetto di "Wu Wei" (non-azione) nel Taoismo.'),
(140, 5, 'Cita una pratica meditativa orientale e i suoi scopi.');

-- Quiz 141: Psicologia dello sviluppo
INSERT INTO Domanda (quiz, numero, testo) VALUES
(141, 1, 'Quali sono le principali teorie sull acquisizione del linguaggio?'),
(141, 2, 'Descrivi la teoria dello sviluppo psico-sociale di Erik Erikson.'),
(141, 3, 'Cosa si intende per "teoria della mente" e quando si sviluppa?'),
(141, 4, 'Spiega l importanza del gioco nello sviluppo infantile.'),
(141, 5, 'Quali sono i principali cambiamenti cognitivi e sociali durante l invecchiamento?');

-- Quiz 142: Economia internazionale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(142, 1, 'Cosa sono le tariffe doganali e le barriere non tariffarie al commercio?'),
(142, 2, 'Descrivi il concetto di "vantaggio comparato" di David Ricardo.'),
(142, 3, 'Quali sono gli effetti della liberalizzazione del commercio internazionale?'),
(142, 4, 'Spiega il ruolo delle aree di libero scambio (es. UE, NAFTA/USMCA).'),
(142, 5, 'Cosa si intende per "crisi finanziaria globale" e quali possono esserne le cause?');

-- Quiz 143: Sociologia della famiglia
INSERT INTO Domanda (quiz, numero, testo) VALUES
(143, 1, 'Come sono cambiati i ruoli genitoriali nelle società occidentali contemporanee?'),
(143, 2, 'Descrivi le principali teorie sociologiche sulla famiglia (es. funzionalismo, conflittualismo).'),
(143, 3, 'Qual è l impatto del divorzio e delle famiglie ricostituite sui membri della famiglia?'),
(143, 4, 'Spiega come le politiche sociali (es. congedi parentali, assegni familiari) influenzano la vita familiare.'),
(143, 5, 'Cosa si intende per "violenza domestica" e quali sono le sue implicazioni sociali?');

-- Quiz 144: Antropologia linguistica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(144, 1, 'Come l antropologia linguistica studia il rapporto tra lingua e potere?'),
(144, 2, 'Descrivi il fenomeno del "code-switching" (alternanza di codice).'),
(144, 3, 'Cosa si intende per "lingua in pericolo" e quali sono gli sforzi per la sua rivitalizzazione?'),
(144, 4, 'Spiega come la lingua riflette e costruisce l identità di genere.'),
(144, 5, 'Qual è il ruolo della scrittura e dell oralità nelle diverse culture?');

-- Quiz 145: Storia dell antico Egitto
INSERT INTO Domanda (quiz, numero, testo) VALUES
(145, 1, 'Qual era il ruolo del Nilo nella civiltà egizia?'),
(145, 2, 'Descrivi il processo di mummificazione e le credenze sull aldilà.'),
(145, 3, 'Chi erano i faraoni più famosi e per cosa sono ricordati (es. Tutankhamon, Ramses II)?'),
(145, 4, 'Cosa sono i geroglifici e come sono stati decifrati?'),
(145, 5, 'Qual era la struttura sociale dell antico Egitto?');

-- Quiz 146: Matematica applicata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(146, 1, 'Cosa si intende per "modello matematico" e come si costruisce?'),
(146, 2, 'Descrivi un applicazione dell analisi numerica nella risoluzione di problemi reali.'),
(146, 3, 'Cos è la ricerca operativa e quali tipi di problemi affronta?'),
(146, 4, 'Spiega l importanza della statistica e della probabilità nelle scienze applicate.'),
(146, 5, 'Cita un esempio di come la matematica viene applicata in ingegneria, economia o biologia.');

-- Quiz 147: Fisica sperimentale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(147, 1, 'Qual è l importanza della misurazione e dell analisi degli errori in fisica sperimentale?'),
(147, 2, 'Descrivi un esperimento classico della storia della fisica (es. esperimento di Michelson-Morley, esperimento di Rutherford).'),
(147, 3, 'Come si progetta un esperimento per verificare un ipotesi scientifica?'),
(147, 4, 'Quali sono gli strumenti di misura più comuni in un laboratorio di fisica?'),
(147, 5, 'Spiega l importanza della riproducibilità degli esperimenti scientifici.');

-- Quiz 148: Letteratura medievale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(148, 1, 'Cos è la "Chanson de Geste" e cita un esempio famoso.'),
(148, 2, 'Descrivi le caratteristiche dell amor cortese nella lirica trobadorica.'),
(148, 3, 'Chi ha scritto "La Divina Commedia" e qual è la sua struttura?'),
(148, 4, 'Parla dei "Canterbury Tales" di Geoffrey Chaucer.'),
(148, 5, 'Quali erano i generi letterari più diffusi nel Medioevo oltre all epica e alla lirica?');

-- Quiz 149: Geografia fisica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(149, 1, 'Cosa sono i ghiacciai e come modellano il paesaggio?'),
(149, 2, 'Descrivi i processi di erosione, trasporto e deposizione fluviale.'),
(149, 3, 'Quali sono i principali fattori che influenzano il clima di una regione?'),
(149, 4, 'Spiega il concetto di "bacino idrografico".'),
(149, 5, 'Cosa sono le carte topografiche e come si interpretano le curve di livello?');

-- Quiz 150: Chimica organica avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(150, 1, 'Descrivi un meccanismo di reazione organica complesso (es. reazione di Diels-Alder, reazione di Wittig).'),
(150, 2, 'Cosa si intende per "sintesi retrosintetica" (retrosintesi)?'),
(150, 3, 'Quali sono le principali tecniche spettroscopiche (NMR, IR, MS) utilizzate per la caratterizzazione dei composti organici?'),
(150, 4, 'Spiega il concetto di "catalisi asimmetrica" e la sua importanza.'),
(150, 5, 'Cosa sono i composti organometallici e quali sono le loro applicazioni in sintesi?');

-- Quiz 151: Biologia molecolare
INSERT INTO Domanda (quiz, numero, testo) VALUES
(151, 1, 'Cosa si intende per "epigenetica" e quali sono i suoi meccanismi?'),
(151, 2, 'Descrivi il ruolo dei microRNA (miRNA) nella regolazione genica.'),
(151, 3, 'Cos è la tecnologia CRISPR-Cas9 e quali sono le sue applicazioni e implicazioni etiche?'),
(151, 4, 'Spiega come le proteine vengono smistate e indirizzate ai corretti compartimenti cellulari.'),
(151, 5, 'Cosa si intende per "trasduzione del segnale" all interno della cellula?');

-- Quiz 152: Storia della filosofia
INSERT INTO Domanda (quiz, numero, testo) VALUES
(152, 1, 'Quali sono le principali differenze tra il razionalismo e l empirismo nel XVII-XVIII secolo?'),
(152, 2, 'Descrivi l idealismo tedesco e i suoi principali esponenti (Kant, Hegel, Fichte, Schelling).'),
(152, 3, 'Cos è il positivismo e quale fu la sua influenza nel XIX secolo?'),
(152, 4, 'Spiega il contributo di Cartesio alla filosofia moderna.'),
(152, 5, 'Qual è stata l evoluzione del concetto di "conoscenza" nella storia della filosofia?');

-- Quiz 153: Astronomia e cosmologia
INSERT INTO Domanda (quiz, numero, testo) VALUES
(153, 1, 'Descrivi il modello del Big Bang per l origine e l evoluzione dell universo.'),
(153, 2, 'Cosa sono la materia oscura e l energia oscura e quali evidenze ne suggeriscono l esistenza?'),
(153, 3, 'Come si misura la distanza delle galassie?'),
(153, 4, 'Spiega il concetto di "radiazione cosmica di fondo".'),
(153, 5, 'Quali sono le attuali teorie sul destino finale dell universo?');

-- Quiz 154: Informatica teorica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(154, 1, 'Cosa si intende per "complessità computazionale" di un algoritmo (es. P, NP, NP-completo)?'),
(154, 2, 'Descrivi la gerarchia di Chomsky per le grammatiche formali e i linguaggi.'),
(154, 3, 'Cos è la teoria degli automi e a cosa serve?'),
(154, 4, 'Spiega il concetto di "macchina di Turing" e la sua importanza teorica.'),
(154, 5, 'Cosa si intende per "problema della fermata" (halting problem)?');

-- Quiz 155: Filosofia politica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(155, 1, 'Descrivi la teoria del contratto sociale secondo Hobbes, Locke o Rousseau.'),
(155, 2, 'Quali sono le principali concezioni della giustizia (es. utilitarismo, liberalismo, comunitarismo)?'),
(155, 3, 'Cos è la democrazia e quali sono le sue diverse forme e criticità?'),
(155, 4, 'Spiega il concetto di "diritti umani" e la loro evoluzione storica.'),
(155, 5, 'Qual è il rapporto tra libertà individuale e autorità statale secondo diverse prospettive filosofiche?');

-- Quiz 156: Psicologia dello sviluppo
INSERT INTO Domanda (quiz, numero, testo) VALUES
(156, 1, 'Quali sono le principali teorie sull acquisizione del linguaggio?'),
(156, 2, 'Descrivi lo sviluppo morale secondo la teoria di Kohlberg.'),
(156, 3, 'Cosa si intende per "periodo critico" o "sensibile" nello sviluppo?'),
(156, 4, 'Come influiscono i fattori genetici e ambientali sullo sviluppo individuale (nature vs nurture)?'),
(156, 5, 'Quali sono le caratteristiche dello sviluppo cognitivo nell età adulta e anziana?');

-- Quiz 157: Economia internazionale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(157, 1, 'Cosa sono gli investimenti diretti esteri (IDE) e quale ruolo svolgono?'),
(157, 2, 'Descrivi i diversi regimi di tasso di cambio (fisso, flessibile, controllato).'),
(157, 3, 'Quali sono gli effetti della globalizzazione finanziaria?'),
(157, 4, 'Spiega il concetto di "dumping" e le relative politiche anti-dumping.'),
(157, 5, 'Come le organizzazioni economiche regionali (es. UE, Mercosur) influenzano il commercio globale?');

-- Quiz 158: Sociologia contemporanea
INSERT INTO Domanda (quiz, numero, testo) VALUES
(158, 1, 'Quali sono le principali teorie sociologiche sulla globalizzazione?'),
(158, 2, 'Descrivi il concetto di "società del rischio" di Ulrich Beck.'),
(158, 3, 'Cosa si intende per "postmodernità" in sociologia?'),
(158, 4, 'Spiega l impatto delle nuove tecnologie dell informazione e della comunicazione (ICT) sulla società.'),
(158, 5, 'Quali sono le principali sfide sociali del XXI secolo (es. disuguaglianze, migrazioni, cambiamenti climatici) analizzate dalla sociologia?');

-- Quiz 159: Antropologia culturale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(159, 1, 'Cosa si intende per "sincretismo culturale"? Fornisci un esempio.'),
(159, 2, 'Descrivi come l antropologia studia i sistemi politici e di potere nelle società non statali.'),
(159, 3, 'Qual è il ruolo dell antropologia medica nello studio della salute e della malattia in contesti culturali diversi?'),
(159, 4, 'Spiega il concetto di "identità etnica" e i processi di etnogenesi.'),
(159, 5, 'Come l antropologia visuale utilizza immagini e media per la ricerca e la rappresentazione culturale?');

-- Quiz 160: Storia dell arte moderna
INSERT INTO Domanda (quiz, numero, testo) VALUES
(160, 1, 'Quali sono le caratteristiche principali dell Impressionismo e cita un artista rappresentativo.'),
(160, 2, 'Descrivi il movimento Cubista e il ruolo di Picasso e Braque.'),
(160, 3, 'Cos è il Surrealismo e quali sono i suoi temi e tecniche?'),
(160, 4, 'Spiega l importanza del Bauhaus per l arte, il design e l architettura moderna.'),
(160, 5, 'Cosa si intende per "arte astratta" e quali sono state le sue diverse correnti?');

-- Quiz 161: Letteratura americana
INSERT INTO Domanda (quiz, numero, testo) VALUES
(161, 1, 'Chi ha scritto "Foglie d erba" e quale è la sua importanza?'),
(161, 2, 'Descrivi il movimento del "Rinascimento di Harlem" e i suoi temi.'),
(161, 3, 'Cita un opera importante di F. Scott Fitzgerald o John Steinbeck.'),
(161, 4, 'Quali sono le caratteristiche della letteratura postmoderna americana?'),
(161, 5, 'Parla del ruolo della "frontiera" nell immaginario e nella letteratura americana.');

-- Quiz 162: Fisica quantistica avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(162, 1, 'Cos è la Teoria Quantistica dei Campi (QFT)?'),
(162, 2, 'Descrivi il concetto di "rinormalizzazione" in QFT.'),
(162, 3, 'Quali sono le interazioni fondamentali descritte dal Modello Standard e i loro mediatori?'),
(162, 4, 'Spiega il fenomeno dell "entanglement" quantistico e le sue implicazioni (es. paradosso EPR).'),
(162, 5, 'Cosa si intende per "informatica quantistica" e quali sono i suoi principi base (qubit, sovrapposizione)?');

-- Quiz 163: Chimica analitica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(163, 1, 'Descrivi i principi della spettrometria di massa e le sue applicazioni.'),
(163, 2, 'Quali sono le tecniche di preparazione del campione più comuni in chimica analitica?'),
(163, 3, 'Cosa si intende per "validazione di un metodo analitico"?'),
(163, 4, 'Spiega l uso degli standard interni ed esterni nella calibrazione.'),
(163, 5, 'Cita un applicazione della chimica analitica in campo ambientale, alimentare o forense.');

-- Quiz 164: Geologia strutturale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(164, 1, 'Cosa studia la geologia strutturale?'),
(164, 2, 'Descrivi i diversi tipi di faglie (diretta, inversa, trascorrente) e come si formano.'),
(164, 3, 'Cosa sono le pieghe e quali sono i loro elementi caratteristici (cerniera, fianchi, piano assiale)?'),
(164, 4, 'Spiega il concetto di "stress" e "strain" (deformazione) nelle rocce.'),
(164, 5, 'Come si utilizzano le proiezioni stereografiche in geologia strutturale?');

-- Quiz 165: Storia della musica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(165, 1, 'Quali sono le caratteristiche principali della musica barocca e cita un compositore rappresentativo.'),
(165, 2, 'Descrivi il periodo classico in musica e il ruolo di Haydn, Mozart e Beethoven.'),
(165, 3, 'Cos è il Romanticismo musicale e quali nuove forme ed espressioni ha introdotto?'),
(165, 4, 'Spiega l importanza delle avanguardie musicali del XX secolo (es. dodecafonia, musica elettronica).'),
(165, 5, 'Cita un genere musicale popolare del XX o XXI secolo e descrivi le sue origini e caratteristiche.');

-- Quiz 166: Matematica discreta
INSERT INTO Domanda (quiz, numero, testo) VALUES
(166, 1, 'Cos è la teoria dei numeri e quali sono i suoi campi di applicazione (es. crittografia)?'),
(166, 2, 'Descrivi l algoritmo di Euclide per il calcolo del massimo comun divisore.'),
(166, 3, 'Cosa sono le congruenze lineari e come si risolvono?'),
(166, 4, 'Spiega il Teorema Cinese del Resto.'),
(166, 5, 'Cita un applicazione della matematica discreta nella sicurezza informatica.');

-- Quiz 167: Fisica dei materiali
INSERT INTO Domanda (quiz, numero, testo) VALUES
(167, 1, 'Descrivi le proprietà e le applicazioni dei biomateriali.'),
(167, 2, 'Cosa sono i materiali intelligenti (smart materials) e fornisci un esempio?'),
(167, 3, 'Come si studiano le proprietà dei materiali a livello nanoscopico (es. microscopia a forza atomica)?'),
(167, 4, 'Spiega il processo di "sinterizzazione" per la produzione di materiali ceramici o metallici.'),
(167, 5, 'Qual è l impatto ambientale della produzione e dello smaltimento dei materiali?');

-- Quiz 168: Letteratura francese
INSERT INTO Domanda (quiz, numero, testo) VALUES
(168, 1, 'Chi ha scritto "Alla ricerca del tempo perduto" e qual è la sua importanza?'),
(168, 2, 'Descrivi il movimento del Naturalismo francese e il ruolo di Émile Zola.'),
(168, 3, 'Cita un opera importante di Victor Hugo oltre a "I Miserabili".'),
(168, 4, 'Quali sono le caratteristiche del teatro dell assurdo francese (es. Beckett, Ionesco)?'),
(168, 5, 'Parla di una scrittrice francese contemporanea e dei temi da lei trattati.');

-- Quiz 169: Geografia economica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(169, 1, 'Cosa si intende per "economia informale" e quale è la sua diffusione nel mondo?'),
(169, 2, 'Descrivi il ruolo delle risorse naturali nello sviluppo economico di una regione.'),
(169, 3, 'Come la geografia economica analizza i sistemi di trasporto e logistica?'),
(169, 4, 'Spiega il concetto di "distretto industriale" o "cluster tecnologico".'),
(169, 5, 'Quali sono le implicazioni geografiche della transizione verso un economia verde?');

-- Quiz 170: Chimica fisica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(170, 1, 'Cos è la spettroscopia e quali informazioni fornisce sulla materia?'),
(170, 2, 'Descrivi il concetto di "entropia" e la sua relazione con la spontaneità dei processi.'),
(170, 3, 'Cosa sono i diagrammi di fase e come si interpretano?'),
(170, 4, 'Spiega la teoria cinetica dei gas e le sue assunzioni.'),
(170, 5, 'Qual è l importanza delle interazioni intermolecolari nello stato della materia?');

-- Quiz 171: Biologia evolutiva
INSERT INTO Domanda (quiz, numero, testo) VALUES
(171, 1, 'Cosa si intende per "coevoluzione" e fornisci un esempio?'),
(171, 2, 'Descrivi il concetto di "fitness" evolutiva.'),
(171, 3, 'Come la biologia molecolare contribuisce allo studio dell evoluzione (es. orologi molecolari)?'),
(171, 4, 'Spiega l ipotesi dell origine della vita sulla Terra (abiogenesi).'),
(171, 5, 'Qual è l impatto dell uomo sull evoluzione di altre specie (es. resistenza agli antibiotici)?');

-- Quiz 172: Storia dell Asia
INSERT INTO Domanda (quiz, numero, testo) VALUES
(172, 1, 'Descrivi la civiltà della Valle dell Indo e le sue caratteristiche.'),
(172, 2, 'Qual è stata l importanza dell Impero Khmer e di Angkor Wat?'),
(172, 3, 'Parla della spartizione dell India nel 1947 e delle sue conseguenze.'),
(172, 4, 'Cosa si intende per "Miracolo economico giapponese" nel dopoguerra?'),
(172, 5, 'Quali sono le principali tensioni geopolitiche nel Mar Cinese Meridionale?');

-- Quiz 173: Letteratura spagnola
INSERT INTO Domanda (quiz, numero, testo) VALUES
(173, 1, 'Chi sono i principali poeti della Generazione del  98?'),
(173, 2, 'Descrivi le caratteristiche del teatro barocco spagnolo (es. Lope de Vega, Calderón de la Barca).'),
(173, 3, 'Cita un opera importante di Miguel de Unamuno o Camilo José Cela.'),
(173, 4, 'Qual è stato l impatto della Guerra Civile Spagnola sulla letteratura?'),
(173, 5, 'Parla di una scrittrice spagnola contemporanea e dei temi da lei trattati.');

-- Quiz 174: Filosofia moderna
INSERT INTO Domanda (quiz, numero, testo) VALUES
(174, 1, 'Spiega la distinzione kantiana tra giudizi analitici e sintetici, a priori e a posteriori.'),
(174, 2, 'Descrivi il pensiero politico di John Locke e la sua influenza.'),
(174, 3, 'Cos è l utilitarismo di Jeremy Bentham e John Stuart Mill?'),
(174, 4, 'Spiega il concetto di "sostanza" in Spinoza o Leibniz.'),
(174, 5, 'Qual è il contributo di David Hume alla teoria della conoscenza e alla critica della causalità?');

-- Quiz 175: Psicologia sociale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(175, 1, 'Cosa si intende per "comportamento pro-sociale" e "altruismo"?'),
(175, 2, 'Descrivi la teoria dell identità sociale di Tajfel e Turner.'),
(175, 3, 'Come si sviluppano e si modificano gli atteggiamenti?'),
(175, 4, 'Spiega il fenomeno della "diffusione di responsabilità" (effetto spettatore).'),
(175, 5, 'Qual è l impatto dei social media sulle relazioni interpersonali e sulla percezione di sé?');

-- Quiz 176: Economia aziendale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(176, 1, 'Cosa si intende per "strategia competitiva" (es. leadership di costo, differenziazione)?'),
(176, 2, 'Descrivi il processo di pianificazione strategica in un azienda.'),
(176, 3, 'Cos è la finanza aziendale e quali sono le sue principali decisioni (investimento, finanziamento, dividendi)?'),
(176, 4, 'Spiega l importanza dell innovazione per la competitività aziendale.'),
(176, 5, 'Cosa si intende per "corporate governance" e quali sono i suoi meccanismi?');

-- Quiz 177: Sociologia urbana
INSERT INTO Domanda (quiz, numero, testo) VALUES
(177, 1, 'Quali sono le principali teorie sulla crescita e lo sviluppo delle città?'),
(177, 2, 'Descrivi il concetto di "smart city" e le sue implicazioni.'),
(177, 3, 'Cosa si intende per "povertà urbana" e quali sono le sue manifestazioni?'),
(177, 4, 'Spiega il ruolo della pianificazione urbana nella gestione dei problemi cittadini.'),
(177, 5, 'Come la sociologia urbana analizza i movimenti sociali e le proteste nelle città?');

-- Quiz 178: Antropologia fisica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(178, 1, 'Cosa si intende per "plasticità fenotipica" nell uomo?'),
(178, 2, 'Descrivi i metodi utilizzati in antropologia forense per l identificazione dei resti umani.'),
(178, 3, 'Come l antropologia fisica studia la crescita e lo sviluppo umano (auxologia)?'),
(178, 4, 'Spiega l importanza dello studio dei primati non umani per comprendere l evoluzione umana.'),
(178, 5, 'Quali sono le implicazioni etiche della ricerca in antropologia genetica?');

-- Quiz 179: Storia moderna
INSERT INTO Domanda (quiz, numero, testo) VALUES
(179, 1, 'Cosa fu la Guerra dei Trent anni e quali furono le sue conseguenze per l Europa?'),
(179, 2, 'Descrivi l ascesa della Prussia come potenza europea.'),
(179, 3, 'Quale fu l impatto della Rivoluzione Industriale sulla società e sull economia?'),
(179, 4, 'Spiega il concetto di "dispotismo illuminato".'),
(179, 5, 'Cita un importante esplorazione geografica dell età moderna e il suo significato.');

-- Quiz 180: Letteratura tedesca
INSERT INTO Domanda (quiz, numero, testo) VALUES
(180, 1, 'Chi ha scritto "Il tamburo di latta" e quale è il suo contesto storico?'),
(180, 2, 'Descrivi il movimento "Nuova Oggettività" (Neue Sachlichkeit) nella letteratura tedesca.'),
(180, 3, 'Cita un opera importante di Hermann Hesse o Thomas Mann.'),
(180, 4, 'Qual è il ruolo della memoria e della storia nella letteratura tedesca contemporanea?'),
(180, 5, 'Parla di una scrittrice tedesca del XX o XXI secolo e dei temi da lei trattati.');

-- Quiz 181: Fisica applicata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(181, 1, 'Come funziona un laser e quali sono le sue diverse applicazioni?'),
(181, 2, 'Spiega i principi fisici alla base delle tecnologie di imaging medicale (es. TAC, PET).'),
(181, 3, 'Quali sono le applicazioni della fisica nello sport (biomeccanica, materiali)?'),
(181, 4, 'Descrivi come la fisica contribuisce alla conservazione dei beni culturali.'),
(181, 5, 'Cosa si intende per "optoelettronica" e quali dispositivi ne fanno parte?');

-- Quiz 182: Chimica industriale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(182, 1, 'Descrivi un processo industriale per la produzione di un metallo importante (es. alluminio, acciaio).'),
(182, 2, 'Quali sono le sfide e le innovazioni nel campo dei fertilizzanti chimici?'),
(182, 3, 'Cosa si intende per "ingegneria chimica" e quali sono i suoi principi fondamentali?'),
(182, 4, 'Spiega l importanza del controllo di processo nell industria chimica.'),
(182, 5, 'Come l industria chimica sta affrontando le questioni della sostenibilità e dell economia circolare?');

-- Quiz 183: Geografia politica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(183, 1, 'Cosa si intende per "geopolitica" e quali sono i suoi principali approcci teorici?'),
(183, 2, 'Descrivi il concetto di "Stato fallito" (failed state).'),
(183, 3, 'Come la geografia politica analizza i conflitti per le risorse naturali?'),
(183, 4, 'Spiega l importanza delle organizzazioni regionali (es. ASEAN, Unione Africana) nella politica globale.'),
(183, 5, 'Qual è il ruolo dei confini marittimi e delle zone economiche esclusive (ZEE) nelle relazioni internazionali?');

-- Quiz 184: Storia dell Europa
INSERT INTO Domanda (quiz, numero, testo) VALUES
(184, 1, 'Cosa fu il periodo della "Belle Époque" e quali tensioni preannunciava?'),
(184, 2, 'Descrivi l ascesa dei totalitarismi (fascismo, nazismo, stalinismo) in Europa nel XX secolo.'),
(184, 3, 'Quale fu l impatto della Seconda Guerra Mondiale sulla mappa politica e sociale dell Europa?'),
(184, 4, 'Spiega il processo di decolonizzazione da parte delle potenze europee dopo il 1945.'),
(184, 5, 'Quali sono le sfide attuali per l integrazione europea (es. Brexit, crisi migratoria)?');

-- Quiz 185: Matematica finanziaria
INSERT INTO Domanda (quiz, numero, testo) VALUES
(185, 1, 'Cosa sono le opzioni finanziarie (call, put) e come si utilizzano?'),
(185, 2, 'Descrivi il modello di Black-Scholes per la valutazione delle opzioni.'),
(185, 3, 'Cos è la gestione del rischio finanziario (risk management)?'),
(185, 4, 'Spiega il concetto di "struttura a termine dei tassi di interesse" (yield curve).'),
(185, 5, 'Cita un applicazione della matematica finanziaria nell ambito assicurativo.');

-- Quiz 186: Fisica teorica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(186, 1, 'Cosa si intende per "gravità quantistica" e quali sono i principali approcci (es. teoria delle stringhe, gravità quantistica a loop)?'),
(186, 2, 'Descrivi il concetto di "supersimmetria" (SUSY).'),
(186, 3, 'Qual è il ruolo della costante cosmologica nel modello standard della cosmologia?'),
(186, 4, 'Spiega il principio olografico.'),
(186, 5, 'Quali sono le implicazioni cosmologiche dell inflazione primordiale?');

-- Quiz 187: Letteratura russa
INSERT INTO Domanda (quiz, numero, testo) VALUES
(187, 1, 'Chi ha scritto "Anna Karenina" e quali temi affronta?'),
(187, 2, 'Descrivi l importanza del "Secolo d Oro" della poesia russa (Puškin, Lermontov).'),
(187, 3, 'Cita un opera importante di Michail Bulgakov o Boris Pasternak.'),
(187, 4, 'Qual è stato il ruolo del "samizdat" nella diffusione della letteratura dissidente in Unione Sovietica?'),
(187, 5, 'Parla di una scrittrice russa contemporanea e dei temi da lei trattati.');

-- Quiz 188: Geografia culturale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(188, 1, 'Cosa si intende per "geografia delle religioni"?'),
(188, 2, 'Descrivi come la geografia culturale studia l alimentazione e le tradizioni culinarie.'),
(188, 3, 'Qual è l impatto della musica e delle arti performative sulla creazione di identità culturali locali?'),
(188, 4, 'Spiega il concetto di "patrimonio culturale" e la sua conservazione.'),
(188, 5, 'Come la geografia culturale analizza i fenomeni legati al turismo e al suo impatto sulle comunità locali?');

-- Quiz 189: Chimica ambientale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(189, 1, 'Cosa sono gli inquinanti organici persistenti (POP) e quali sono i loro effetti?'),
(189, 2, 'Descrivi le principali tecniche di monitoraggio dell inquinamento atmosferico o idrico.'),
(189, 3, 'Qual è il ruolo della chimica nella gestione dei rifiuti e nel riciclo dei materiali?'),
(189, 4, 'Spiega l impatto dei pesticidi e dei fertilizzanti sull ambiente.'),
(189, 5, 'Cosa si intende per "biorisanamento" (bioremediation) e come funziona?');

-- Quiz 190: Biologia marina
INSERT INTO Domanda (quiz, numero, testo) VALUES
(190, 1, 'Cosa sono le mangrovie e le praterie di fanerogame marine e perché sono ecosistemi importanti?'),
(190, 2, 'Descrivi le migrazioni di alcune specie marine (es. balene, tartarughe).'),
(190, 3, 'Quali sono gli effetti della pesca eccessiva (overfishing) sugli stock ittici e sugli ecosistemi?'),
(190, 4, 'Spiega il fenomeno dello "sbiancamento dei coralli" (coral bleaching).'),
(190, 5, 'Come la biologia marina contribuisce alla scoperta di nuove molecole bioattive?');

-- Quiz 191: Storia dell Oceania
INSERT INTO Domanda (quiz, numero, testo) VALUES
(191, 1, 'Descrivi la società e la cultura dei popoli indigeni della Papua Nuova Guinea.'),
(191, 2, 'Quale fu il ruolo dell Oceania durante la Seconda Guerra Mondiale?'),
(191, 3, 'Parla delle conseguenze dei test nucleari condotti dalle potenze coloniali nel Pacifico.'),
(191, 4, 'Cosa si intende per "Rinascimento Culturale del Pacifico"?'),
(191, 5, 'Quali sono le relazioni tra Australia/Nuova Zelanda e gli stati insulari del Pacifico oggi?');

-- Quiz 192: Letteratura africana
INSERT INTO Domanda (quiz, numero, testo) VALUES
(192, 1, 'Chi sono i principali esponenti della letteratura lusofona africana (es. Angola, Mozambico)?'),
(192, 2, 'Descrivi l importanza del teatro nella tradizione e nella contemporaneità africana.'),
(192, 3, 'Cita un opera di un autore/autrice africano/a che tratta il tema dell apartheid o della decolonizzazione.'),
(192, 4, 'Come la letteratura africana per l infanzia contribuisce alla trasmissione culturale?'),
(192, 5, 'Qual è il ruolo delle case editrici indipendenti africane nella promozione della letteratura locale?');

-- Quiz 193: Filosofia orientale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(193, 1, 'Spiega il concetto di "Ahimsa" (non-violenza) nelle tradizioni indiane.'),
(193, 2, 'Descrivi i "Cinque Pilastri" dell Islam e la loro importanza (se considerata filosofia in senso lato).'),
(193, 3, 'Qual è il significato del "Mandala" nel Buddhismo tibetano?'),
(193, 4, 'Confronta il concetto di "vuoto" (Sunyata) nel Buddhismo con un concetto analogo o opposto nella filosofia occidentale.'),
(193, 5, 'Cita una figura femminile importante nella storia della filosofia o spiritualità orientale.');

-- Quiz 194: Psicologia clinica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(194, 1, 'Quali sono i principali disturbi di personalità e come vengono diagnosticati?'),
(194, 2, 'Descrivi l approccio della "mindfulness" e le sue applicazioni in psicologia clinica.'),
(194, 3, 'Cos è il trauma psicologico e quali sono i suoi effetti a lungo termine?'),
(194, 4, 'Spiega l importanza della prevenzione e della promozione della salute mentale.'),
(194, 5, 'Quali sono le sfide etiche nella pratica della psicologia clinica?');

-- Quiz 195: Economia politica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(195, 1, 'Cosa si intende per "teoria dei giochi" e come si applica in economia politica?'),
(195, 2, 'Descrivi il concetto di "disuguaglianza economica" e come si misura (es. coefficiente di Gini).'),
(195, 3, 'Quali sono gli argomenti a favore e contro il libero mercato?'),
(195, 4, 'Spiega l impatto delle politiche ambientali sull economia.'),
(195, 5, 'Cosa si intende per "economia comportamentale" e quali sono le sue implicazioni per le politiche pubbliche?');

-- Quiz 196: Sociologia rurale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(196, 1, 'Come la sociologia rurale analizza i conflitti per l uso del suolo (es. agricoltura vs urbanizzazione)?'),
(196, 2, 'Descrivi il ruolo delle cooperative agricole e delle associazioni rurali.'),
(196, 3, 'Qual è l impatto dei cambiamenti climatici sulle comunità rurali e sull agricoltura?'),
(196, 4, 'Spiega il concetto di "multifunzionalità" dell agricoltura.'),
(196, 5, 'Come le nuove tecnologie (es. agricoltura di precisione) stanno trasformando il lavoro e la vita nelle aree rurali?');

-- Quiz 197: Antropologia linguistica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(197, 1, 'Come l antropologia linguistica studia la variazione linguistica e i dialetti?'),
(197, 2, 'Descrivi il concetto di "pragmatica" e la sua importanza nello studio del linguaggio in contesto.'),
(197, 3, 'Cosa si intende per "etnografia della comunicazione"?'),
(197, 4, 'Spiega come la lingua può essere utilizzata per costruire e negoziare il potere sociale.'),
(197, 5, 'Qual è il ruolo della lingua nella trasmissione intergenerazionale della cultura?');

-- Quiz 198: Storia dell Africa
INSERT INTO Domanda (quiz, numero, testo) VALUES
(198, 1, 'Descrivi l importanza del commercio transahariano nell Africa medievale.'),
(198, 2, 'Quale fu l impatto della Conferenza di Berlino (1884-85) sulla spartizione dell Africa?'),
(198, 3, 'Parla di un movimento di resistenza armata contro il colonialismo in Africa.'),
(198, 4, 'Cosa si intende per "Panafricanismo" e chi ne furono i principali teorici?'),
(198, 5, 'Quali sono le sfide per la democrazia e la governance in molti stati africani contemporanei?');

-- Quiz 199: Letteratura giapponese
INSERT INTO Domanda (quiz, numero, testo) VALUES
(199, 1, 'Chi è Kenzaburō Ōe e quali temi affronta nelle sue opere?'),
(199, 2, 'Descrivi l influenza della tradizione teatrale (Nō, Kabuki, Bunraku) sulla letteratura giapponese.'),
(199, 3, 'Cita un opera rappresentativa del genere "I-novel" (Watakushi shōsetsu).'),
(199, 4, 'Qual è il ruolo del silenzio e dell allusione nell estetica letteraria giapponese?'),
(199, 5, 'Come la letteratura giapponese contemporanea riflette sulle questioni dell identità e della globalizzazione?');

-- Quiz 200: Fisica nucleare
INSERT INTO Domanda (quiz, numero, testo) VALUES
(200, 1, 'Cosa sono i raggi cosmici e come interagiscono con l atmosfera terrestre?'),
(200, 2, 'Descrivi i diversi tipi di rivelatori di particelle utilizzati in fisica nucleare.'),
(200, 3, 'Quali sono le applicazioni della datazione radiometrica (es. Carbonio-14)?'),
(200, 4, 'Spiega il concetto di "sezione d urto" nelle reazioni nucleari.'),
(200, 5, 'Cosa si intende per "plasma di quark e gluoni" e come si può creare?');

-- Quiz 201: Chimica biologica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(201, 1, 'Descrivi la struttura e la funzione dei carboidrati complessi (polisaccaridi) come amido e cellulosa.'),
(201, 2, 'Cosa sono le vitamine e i coenzimi e quale ruolo svolgono nel metabolismo?'),
(201, 3, 'Spiega i meccanismi di regolazione dell attività enzimatica.'),
(201, 4, 'Descrivi una via metabolica importante oltre al ciclo di Krebs (es. glicolisi, gluconeogenesi, via dei pentoso fosfati).'),
(201, 5, 'Qual è il ruolo degli acidi nucleici (DNA, RNA) nella sintesi proteica e nella trasmissione dell informazione genetica?');

-- Quiz 202: Geografia fisica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(202, 1, 'Cosa sono i sistemi carsici e come si formano (doline, grotte)?'),
(202, 2, 'Descrivi i processi di meteorizzazione fisica e chimica delle rocce.'),
(202, 3, 'Quali sono i principali tipi di nubi e come si classificano?'),
(202, 4, 'Spiega il fenomeno El Niño-Southern Oscillation (ENSO) e i suoi impatti climatici.'),
(202, 5, 'Cosa si intende per "bilancio energetico terrestre"?');

-- Quiz 203: Storia dell America
INSERT INTO Domanda (quiz, numero, testo) VALUES
(203, 1, 'Descrivi l impatto dell arrivo degli europei sulle popolazioni native americane.'),
(203, 2, 'Quali furono le cause e le conseguenze della Rivoluzione Messicana?'),
(203, 3, 'Parla della "Grande Depressione" negli Stati Uniti e del New Deal.'),
(203, 4, 'Cosa fu il movimento per i diritti civili negli Stati Uniti negli anni  50 e  60?'),
(203, 5, 'Quali sono le principali dinamiche politiche ed economiche dell America Latina nel XXI secolo?');

-- Quiz 204: Matematica avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(204, 1, 'Cosa sono le equazioni differenziali ordinarie e come si classificano?'),
(204, 2, 'Descrivi il concetto di spazio vettoriale e le sue proprietà.'),
(204, 3, 'Cos è la trasformata di Fourier e quali sono le sue applicazioni?'),
(204, 4, 'Spiega il teorema di Green, Stokes o della divergenza.'),
(204, 5, 'Cita un area della matematica pura considerata avanzata (es. topologia algebrica, geometria differenziale).');

-- Quiz 205: Fisica moderna
INSERT INTO Domanda (quiz, numero, testo) VALUES
(205, 1, 'Cosa si intende per "corpo nero" e quale fu il problema della sua radiazione?'),
(205, 2, 'Descrivi l effetto fotoelettrico e la sua spiegazione da parte di Einstein.'),
(205, 3, 'Qual è il modello atomico di Bohr e quali sono i suoi postulati?'),
(205, 4, 'Spiega il concetto di "spin" delle particelle.'),
(205, 5, 'Cosa sono i laser e come funzionano basandosi sui principi della fisica moderna?');

-- Quiz 206: Letteratura italiana
INSERT INTO Domanda (quiz, numero, testo) VALUES
(206, 1, 'Chi ha scritto "Orlando Furioso" e a quale genere appartiene?'),
(206, 2, 'Descrivi l importanza dell Illuminismo italiano e autori come Cesare Beccaria o Pietro Verri.'),
(206, 3, 'Cita un opera importante di Italo Svevo o Eugenio Montale.'),
(206, 4, 'Quali sono le caratteristiche della poesia ermetica italiana?'),
(206, 5, 'Parla di uno scrittore o scrittrice italiano/a contemporaneo/a e dei temi trattati.');

-- Quiz 207: Geografia mondiale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(207, 1, 'Quali sono i principali deserti del mondo e dove si trovano?'),
(207, 2, 'Descrivi le principali fasce climatiche della Terra e le loro caratteristiche.'),
(207, 3, 'Cosa sono le placche tettoniche e come la loro interazione modella la superficie terrestre?'),
(207, 4, 'Spiega il concetto di "globalizzazione" e i suoi impatti geografici.'),
(207, 5, 'Cita un problema ambientale di scala globale e le sue possibili soluzioni geografiche.');

-- Quiz 208: Chimica organica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(208, 1, 'Cosa sono gli eteri e come si nominano? Dai un esempio.'),
(208, 2, 'Descrivi una reazione di sostituzione nucleofila (SN1 o SN2).'),
(208, 3, 'Cosa sono gli amminoacidi e come si legano per formare le proteine?'),
(208, 4, 'Qual è la differenza tra un grasso saturo e un grasso insaturo dal punto di vista chimico?'),
(208, 5, 'Spiega l importanza dei gruppi protettivi in sintesi organica.');

-- Quiz 209: Biologia cellulare
INSERT INTO Domanda (quiz, numero, testo) VALUES
(209, 1, 'Qual è la funzione del reticolo endoplasmatico (liscio e rugoso)?'),
(209, 2, 'Descrivi l apparato di Golgi e il suo ruolo nella modificazione e smistamento delle proteine.'),
(209, 3, 'Cosa sono i lisosomi e i perossisomi?'),
(209, 4, 'Spiega il citoscheletro e i suoi componenti (microtubuli, microfilamenti, filamenti intermedi).'),
(209, 5, 'Come avviene la comunicazione tra cellule (es. giunzioni cellulari, segnali chimici)?');

-- Quiz 210: Storia contemporanea
INSERT INTO Domanda (quiz, numero, testo) VALUES
(210, 1, 'Quali furono le principali cause e conseguenze della Prima Guerra Mondiale?'),
(210, 2, 'Descrivi l ascesa del fascismo in Italia e del nazismo in Germania.'),
(210, 3, 'Cosa si intende per "Guerra Fredda" e quali furono i suoi principali teatri di scontro indiretto?'),
(210, 4, 'Spiega il processo di decolonizzazione nel secondo dopoguerra.'),
(210, 5, 'Quali sono state le principali trasformazioni globali dopo la caduta del Muro di Berlino (1989)?');

-- Quiz 211: Astronomia
INSERT INTO Domanda (quiz, numero, testo) VALUES
(211, 1, 'Come si formano le stelle e i sistemi planetari?'),
(211, 2, 'Descrivi i diversi tipi di galassie (spirali, ellittiche, irregolari).'),
(211, 3, 'Cosa sono le supernove e quale è la loro importanza per l evoluzione dell universo?'),
(211, 4, 'Spiega come si utilizzano i telescopi (ottici, radiotelescopi) per osservare l universo.'),
(211, 5, 'Quali sono le missioni spaziali attuali o future più promettenti per la scoperta astronomica?');

-- Quiz 212: Informatica di base
INSERT INTO Domanda (quiz, numero, testo) VALUES
(212, 1, 'Cosa sono le periferiche di input e output di un computer? Fornisci esempi.'),
(212, 2, 'Descrivi i principali tipi di memoria di un computer (RAM, ROM, Hard Disk, SSD).'),
(212, 3, 'Cos è una rete di computer e quali sono i suoi componenti principali (es. router, switch)?'),
(212, 4, 'Spiega la differenza tra software di sistema e software applicativo.'),
(212, 5, 'Cosa si intende per "sicurezza informatica" e quali sono le buone pratiche per proteggersi?');

-- Quiz 213: Filosofia antica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(213, 1, 'Chi erano i Presocratici e quali furono i loro principali interessi filosofici?'),
(213, 2, 'Descrivi il metodo dialettico di Socrate e la sua concezione della virtù.'),
(213, 3, 'Qual è la teoria della conoscenza di Platone (anamnesi, dottrina delle idee)?'),
(213, 4, 'Spiega la dottrina delle quattro cause di Aristotele.'),
(213, 5, 'Confronta brevemente lo Stoicismo e l Epicureismo riguardo al concetto di felicità.');

-- Quiz 214: Psicologia
INSERT INTO Domanda (quiz, numero, testo) VALUES
(214, 1, 'Quali sono le principali scuole di pensiero in psicologia (es. comportamentismo, psicoanalisi, cognitivismo, umanistica)?'),
(214, 2, 'Descrivi i metodi di ricerca utilizzati in psicologia (es. esperimento, osservazione, questionario).'),
(214, 3, 'Cosa si intende per "apprendimento" e quali sono le sue principali teorie (es. condizionamento classico e operante)?'),
(214, 4, 'Spiega il concetto di "personalità" e le principali teorie che la descrivono.'),
(214, 5, 'Qual è il rapporto tra mente e cervello secondo la psicologia contemporanea?');

-- Quiz 215: Economia
INSERT INTO Domanda (quiz, numero, testo) VALUES
(215, 1, 'Cosa si intende per "scarsità" e "scelta" in economia?'),
(215, 2, 'Descrivi i principali fattori della produzione (terra, lavoro, capitale, imprenditorialità).'),
(215, 3, 'Cos è il mercato e come funziona il meccanismo dei prezzi?'),
(215, 4, 'Spiega la differenza tra efficienza ed equità in economia.'),
(215, 5, 'Cita un problema economico contemporaneo e le possibili soluzioni proposte dagli economisti.');

-- Quiz 216: Sociologia
INSERT INTO Domanda (quiz, numero, testo) VALUES
(216, 1, 'Cosa si intende per "cultura" e "norme sociali" in sociologia?'),
(216, 2, 'Descrivi il concetto di "devianza" e le principali teorie sociologiche che la spiegano.'),
(216, 3, 'Cos è la "stratificazione sociale" e quali sono i suoi principali sistemi (es. classi, caste)?'),
(216, 4, 'Spiega il ruolo delle istituzioni sociali (es. famiglia, scuola, stato) nella società.'),
(216, 5, 'Quali sono i principali metodi di ricerca utilizzati in sociologia (quantitativi e qualitativi)?');

-- Quiz 217: Antropologia
INSERT INTO Domanda (quiz, numero, testo) VALUES
(217, 1, 'Qual è l approccio olistico dell antropologia?'),
(217, 2, 'Descrivi il concetto di "etnocentrismo" e "relativismo culturale".'),
(217, 3, 'Cosa si intende per "osservazione partecipante" come metodo di ricerca antropologica?'),
(217, 4, 'Spiega come l antropologia studia i sistemi di parentela e di organizzazione sociale.'),
(217, 5, 'Qual è il contributo dell antropologia alla comprensione della diversità umana?');

-- Quiz 218: Storia medievale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(218, 1, 'Cosa fu l Impero Bizantino e quale fu la sua importanza storica?'),
(218, 2, 'Descrivi l espansione islamica e il suo impatto sul mondo medievale.'),
(218, 3, 'Quale fu il ruolo delle città e delle corporazioni nel Basso Medioevo?'),
(218, 4, 'Spiega la crisi del XIV secolo (peste, guerre, carestie).'),
(218, 5, 'Cita un importante opera architettonica o artistica del periodo medievale e descrivine le caratteristiche.');

-- Quiz 219: Letteratura inglese
INSERT INTO Domanda (quiz, numero, testo) VALUES
(219, 1, 'Chi ha scritto "Orgoglio e Pregiudizio" e a quale periodo letterario appartiene?'),
(219, 2, 'Descrivi le caratteristiche del periodo Vittoriano nella letteratura inglese.'),
(219, 3, 'Cita un opera importante di Charles Dickens o delle sorelle Brontë.'),
(219, 4, 'Cos è il Modernismo nella letteratura inglese e chi ne furono i principali esponenti?'),
(219, 5, 'Parla di un poeta romantico inglese e di una sua opera significativa.');

-- Quiz 220: Fisica quantistica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(220, 1, 'Cosa si intende per "quantizzazione" dell energia e del momento angolare?'),
(220, 2, 'Descrivi l esperimento di Stern-Gerlach e la sua importanza per la scoperta dello spin.'),
(220, 3, 'Qual è l interpretazione di Copenaghen della meccanica quantistica?'),
(220, 4, 'Spiega il concetto di "funzione d onda" e il suo significato probabilistico.'),
(220, 5, 'Cita un paradosso o un aspetto controintuitivo della fisica quantistica.');

-- Quiz 221: Chimica inorganica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(221, 1, 'Cosa sono i composti di coordinazione e quale è la loro struttura?'),
(221, 2, 'Descrivi le proprietà e gli usi dei gas nobili.'),
(221, 3, 'Cos è un acido e una base secondo le definizioni di Arrhenius, Brønsted-Lowry e Lewis?'),
(221, 4, 'Spiega il concetto di "elettronegatività" e la sua influenza sulla polarità dei legami.'),
(221, 5, 'Cita un processo industriale importante che coinvolge composti inorganici (es. produzione di acido solforico).');

-- Quiz 222: Geologia
INSERT INTO Domanda (quiz, numero, testo) VALUES
(222, 1, 'Cosa si intende per "scala dei tempi geologici" e come è suddivisa?'),
(222, 2, 'Descrivi il ciclo litogenetico (ciclo delle rocce).'),
(222, 3, 'Come si formano le catene montuose (orogenesi)?'),
(222, 4, 'Spiega l importanza dei fossili per la datazione delle rocce e la ricostruzione della storia della vita.'),
(222, 5, 'Quali sono le principali risorse minerarie ed energetiche di origine geologica?');

-- Quiz 223: Storia romana
INSERT INTO Domanda (quiz, numero, testo) VALUES
(223, 1, 'Quali furono le principali istituzioni della Repubblica Romana?'),
(223, 2, 'Descrivi le guerre civili che portarono alla fine della Repubblica e all inizio dell Impero.'),
(223, 3, 'Chi fu Giulio Cesare e quale fu il suo ruolo nella storia di Roma?'),
(223, 4, 'Parla della vita quotidiana, della cultura e della religione nell antica Roma.'),
(223, 5, 'Quali furono le principali opere di ingegneria e architettura realizzate dai Romani (es. acquedotti, strade, anfiteatri)?');

-- Quiz 224: Matematica di base
INSERT INTO Domanda (quiz, numero, testo) VALUES
(224, 1, 'Cosa sono i numeri interi relativi e come si opera con essi?'),
(224, 2, 'Descrivi come si calcola l area e il volume di figure geometriche semplici (cubo, parallelepipedo, cilindro).'),
(224, 3, 'Cos è il sistema metrico decimale e quali sono le principali unità di misura?'),
(224, 4, 'Spiega il concetto di "proporzione" e come si risolvono i problemi del tre semplice.'),
(224, 5, 'Cosa si intende per "media aritmetica" e come si calcola?');

-- Quiz 225: Fisica classica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(225, 1, 'Cosa si intende per "momento di una forza" e "momento angolare"?'),
(225, 2, 'Descrivi le leggi di Keplero sul moto dei pianeti.'),
(225, 3, 'Cos è l elasticità e la legge di Hooke?'),
(225, 4, 'Spiega i principi della termodinamica classica (primo e secondo principio).'),
(225, 5, 'Qual è la differenza tra calore e temperatura?');

-- Quiz 226: Letteratura francese
INSERT INTO Domanda (quiz, numero, testo) VALUES
(226, 1, 'Chi ha scritto "Candido o l ottimismo" e quali temi affronta?'),
(226, 2, 'Descrivi l importanza del teatro di Molière.'),
(226, 3, 'Cita un opera importante di Stendhal o Balzac.'),
(226, 4, 'Quali sono le caratteristiche della poesia parnassiana francese?'),
(226, 5, 'Parla di uno scrittore o scrittrice francese del periodo dell esistenzialismo e della sua opera.');

-- Quiz 227: Geografia italiana
INSERT INTO Domanda (quiz, numero, testo) VALUES
(227, 1, 'Quali sono le principali aree vulcaniche attive in Italia?'),
(227, 2, 'Descrivi il paesaggio e l economia di una regione italiana a tua scelta.'),
(227, 3, 'Cosa si intende per "Appennini" e quale è la loro importanza per la geografia fisica italiana?'),
(227, 4, 'Spiega la distribuzione della popolazione in Italia e le aree a maggiore e minore densità.'),
(227, 5, 'Quali sono i principali problemi ambientali che affliggono il territorio italiano?');

-- Quiz 228: Chimica analitica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(228, 1, 'Cosa sono le titolazioni potenziometriche e come funzionano?'),
(228, 2, 'Descrivi i principi dell elettroforesi e le sue applicazioni analitiche.'),
(228, 3, 'Cos è l analisi elementare e quali tecniche si utilizzano?'),
(228, 4, 'Spiega l importanza dell assicurazione qualità (QA) e del controllo qualità (QC) in un laboratorio analitico.'),
(228, 5, 'Cita un esempio di analisi chimica utilizzata nel controllo di qualità dei prodotti alimentari o farmaceutici.');

-- Quiz 229: Biologia molecolare
INSERT INTO Domanda (quiz, numero, testo) VALUES
(229, 1, 'Cosa si intende per "dogma centrale della biologia molecolare" e le sue eventuali eccezioni?'),
(229, 2, 'Descrivi i meccanismi di riparazione del DNA.'),
(229, 3, 'Cos è l apoptosi (morte cellulare programmata) e quale è il suo ruolo?'),
(229, 4, 'Spiega come la biologia molecolare contribuisce allo studio e alla diagnosi delle malattie genetiche.'),
(229, 5, 'Cosa sono i prioni e come causano malattie?');

-- Quiz 230: Storia greca
INSERT INTO Domanda (quiz, numero, testo) VALUES
(230, 1, 'Quali furono le civiltà minoica e micenea e quale fu la loro influenza sulla Grecia classica?'),
(230, 2, 'Descrivi l organizzazione sociale e politica di Sparta.'),
(230, 3, 'Chi fu Pericle e quale fu il suo ruolo nell Atene del V secolo a.C.?'),
(230, 4, 'Parla della filosofia, della scienza e dell arte nella Grecia classica.'),
(230, 5, 'Cosa si intende per "ellenismo" e quale fu la sua diffusione dopo Alessandro Magno?');

-- Quiz 231: Letteratura spagnola
INSERT INTO Domanda (quiz, numero, testo) VALUES
(231, 1, 'Chi ha scritto "Cent anni di solitudine" e quale è il suo stile letterario (realismo magico)?'),
(231, 2, 'Descrivi l importanza della poesia di Antonio Machado.'),
(231, 3, 'Cita un opera importante di un autore/autrice ispanoamericano/a contemporaneo/a.'),
(231, 4, 'Quali sono le caratteristiche del romanzo modernista in lingua spagnola?'),
(231, 5, 'Parla del ruolo della memoria storica nella letteratura spagnola e ispanoamericana recente.');

-- Quiz 232: Filosofia moderna
INSERT INTO Domanda (quiz, numero, testo) VALUES
(232, 1, 'Qual è il ruolo della "volontà generale" nel pensiero di Jean-Jacques Rousseau?'),
(232, 2, 'Descrivi la filosofia della storia di G.W.F. Hegel.'),
(232, 3, 'Cos è il trascendentalismo americano e chi ne furono i principali esponenti?'),
(232, 4, 'Spiega la critica di Arthur Schopenhauer all ottimismo e la sua concezione della volontà.'),
(232, 5, 'Qual è il contributo di Søren Kierkegaard all esistenzialismo?');

-- Quiz 233: Psicologia sociale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(233, 1, 'Cosa si intende per "aggressività" e quali sono le sue principali teorie esplicative?'),
(233, 2, 'Descrivi il fenomeno del "groupthink" (pensiero di gruppo).'),
(233, 3, 'Come la psicologia sociale studia le relazioni intergruppi e i conflitti?'),
(233, 4, 'Spiega l importanza della comunicazione non verbale nelle interazioni sociali.'),
(233, 5, 'Qual è l impatto della cultura sui processi psicologici sociali?');

-- Quiz 234: Economia aziendale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(234, 1, 'Cosa si intende per "analisi di bilancio" e quali sono i suoi principali indici?'),
(234, 2, 'Descrivi il processo di budgeting e controllo di gestione in un azienda.'),
(234, 3, 'Cos è il marketing strategico e operativo?'),
(234, 4, 'Spiega l importanza della logistica e della gestione della supply chain.'),
(234, 5, 'Cosa si intende per "internazionalizzazione" delle imprese e quali sono le sue strategie?');

-- Quiz 235: Sociologia urbana
INSERT INTO Domanda (quiz, numero, testo) VALUES
(235, 1, 'Come la sociologia urbana analizza i fenomeni di disuguaglianza spaziale e segregazione?'),
(235, 2, 'Descrivi il concetto di "rigenerazione urbana" e i suoi impatti sociali.'),
(235, 3, 'Qual è il ruolo degli spazi verdi e delle aree pubbliche per la qualità della vita in città?'),
(235, 4, 'Spiega come la globalizzazione influisce sulla struttura e sulle funzioni delle città.'),
(235, 5, 'Cosa si intende per "cittadinanza urbana" e partecipazione civica?');

-- Quiz 236: Antropologia culturale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(236, 1, 'Come l antropologia culturale studia i rituali e le cerimonie?'),
(236, 2, 'Descrivi il concetto di "performance culturale".'),
(236, 3, 'Qual è il contributo dell antropologia allo studio dei sistemi economici non capitalistici?'),
(236, 4, 'Spiega come l antropologia analizza i concetti di genere e sessualità in diverse culture.'),
(236, 5, 'Cosa si intende per "antropologia applicata" e quali sono i suoi campi di intervento?');

-- Quiz 237: Storia moderna
INSERT INTO Domanda (quiz, numero, testo) VALUES
(237, 1, 'Cosa fu la Gloriosa Rivoluzione in Inghilterra e quali furono le sue conseguenze?'),
(237, 2, 'Descrivi l epoca delle grandi scoperte geografiche e l inizio del colonialismo.'),
(237, 3, 'Quale fu l impatto della Riforma e della Controriforma sulla società europea?'),
(237, 4, 'Spiega l ascesa e il declino della Spagna come potenza egemone.'),
(237, 5, 'Cita un importante innovazione scientifica o tecnologica dell età moderna e il suo impatto.');

-- Quiz 238: Letteratura tedesca
INSERT INTO Domanda (quiz, numero, testo) VALUES
(238, 1, 'Chi ha scritto "Morte a Venezia" e quali temi affronta?'),
(238, 2, 'Descrivi l importanza del "Gruppo 47" per la letteratura tedesca del dopoguerra.'),
(238, 3, 'Cita un opera importante di Heinrich Böll o Günter Grass.'),
(238, 4, 'Quali sono le caratteristiche della letteratura della DDR (Germania Est)?'),
(238, 5, 'Parla del ruolo della satira e dell ironia nella letteratura tedesca.');

-- Quiz 239: Fisica applicata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(239, 1, 'Come funziona la tecnologia LED (Light Emitting Diode) e quali sono i suoi vantaggi?'),
(239, 2, 'Spiega i principi fisici alla base delle celle a combustibile.'),
(239, 3, 'Quali sono le applicazioni della fisica dei fluidi in ingegneria (es. aerodinamica, idraulica)?'),
(239, 4, 'Descrivi come la fisica contribuisce allo sviluppo di nuovi sensori.'),
(239, 5, 'Cosa si intende per "fisica medica" e quali sono i suoi principali campi di applicazione?');

-- Quiz 240: Chimica fisica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(240, 1, 'Cos è la catalisi eterogenea e omogenea? Fornisci esempi.'),
(240, 2, 'Descrivi le leggi di Raoult e Henry per le soluzioni ideali e diluite.'),
(240, 3, 'Cosa sono i tensioattivi e come funzionano?'),
(240, 4, 'Spiega il concetto di "energia libera di Gibbs" e la sua relazione con l equilibrio chimico.'),
(240, 5, 'Qual è la differenza tra un processo reversibile e irreversibile in termodinamica?');

-- Quiz 241: Geografia fisica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(241, 1, 'Cosa sono le correnti marine e quale ruolo svolgono nella regolazione del clima globale?'),
(241, 2, 'Descrivi i principali tipi di coste (alte, basse, a fiordi, a delta) e la loro evoluzione.'),
(241, 3, 'Quali sono i fattori che determinano la fertilità di un suolo?'),
(241, 4, 'Spiega il fenomeno dei monsoni e le aree geografiche interessate.'),
(241, 5, 'Cosa si intende per "risorse naturali rinnovabili" e "non rinnovabili" dal punto di vista geografico?');

-- Quiz 242: Storia dell Europa
INSERT INTO Domanda (quiz, numero, testo) VALUES
(242, 1, 'Cosa fu il "concerto europeo" nel XIX secolo?'),
(242, 2, 'Descrivi le cause e le conseguenze della guerra franco-prussiana (1870-71).'),
(242, 3, 'Quale fu l impatto della crisi economica del 1929 sull Europa?'),
(242, 4, 'Spiega il Piano Marshall e la ricostruzione europea dopo la Seconda Guerra Mondiale.'),
(242, 5, 'Quali sono stati i principali allargamenti dell Unione Europea e le loro implicazioni?');

-- Quiz 243: Matematica finanziaria
INSERT INTO Domanda (quiz, numero, testo) VALUES
(243, 1, 'Cosa sono i tassi di interesse nominali e reali?'),
(243, 2, 'Descrivi come si valuta un obbligazione (bond).'),
(243, 3, 'Cos è il "valore a rischio" (Value at Risk - VaR)?'),
(243, 4, 'Spiega i diversi tipi di rendite finanziarie (certe, aleatorie, anticipate, posticipate).'),
(243, 5, 'Cita un applicazione della matematica finanziaria nella gestione dei fondi pensione.');

-- Quiz 244: Fisica teorica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(244, 1, 'Cosa si intende per "rottura spontanea di simmetria" in fisica delle particelle?'),
(244, 2, 'Descrivi il meccanismo di Higgs e la sua importanza per la massa delle particelle.'),
(244, 3, 'Quali sono le principali sfide e i problemi aperti del Modello Standard?'),
(244, 4, 'Spiega il concetto di "vuoto quantistico" e le sue proprietà.'),
(244, 5, 'Cosa sono le "teorie di grande unificazione" (GUT)?');

-- Quiz 245: Letteratura russa
INSERT INTO Domanda (quiz, numero, testo) VALUES
(245, 1, 'Chi ha scritto "Padri e figli" e quale conflitto generazionale rappresenta?'),
(245, 2, 'Descrivi l importanza della figura del "uomo superfluo" nella letteratura russa del XIX secolo.'),
(245, 3, 'Cita un opera importante di Aleksandr Solženicyn o Iosif Brodskij.'),
(245, 4, 'Quali sono le caratteristiche del Realismo Socialista imposto in Unione Sovietica?'),
(245, 5, 'Parla dell influenza della spiritualità e della religione ortodossa sulla letteratura russa.');

-- Quiz 246: Geografia politica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(246, 1, 'Cosa si intende per "geografia elettorale" e come analizza il comportamento di voto?'),
(246, 2, 'Descrivi il concetto di "terrorismo" dal punto di vista geopolitico.'),
(246, 3, 'Come la geografia politica studia le questioni legate alle minoranze etniche e nazionali?'),
(246, 4, 'Spiega l importanza delle vie di comunicazione strategiche (es. canali, stretti) nella geopolitica.'),
(246, 5, 'Qual è il ruolo delle organizzazioni non governative (ONG) nella politica internazionale?');

-- Quiz 247: Chimica industriale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(247, 1, 'Descrivi il processo Solvay per la produzione di carbonato di sodio.'),
(247, 2, 'Quali sono i principali tipi di catalizzatori utilizzati nell industria chimica e come funzionano?'),
(247, 3, 'Cosa si intende per "sicurezza degli impianti chimici" e quali sono le normative principali?'),
(247, 4, 'Spiega l importanza dell ottimizzazione dei processi per ridurre i costi e l impatto ambientale.'),
(247, 5, 'Come l industria chimica contribuisce alla produzione di farmaci e prodotti per la salute?');

-- Quiz 248: Biologia evolutiva
INSERT INTO Domanda (quiz, numero, testo) VALUES
(248, 1, 'Cosa si intende per "radiazione adattativa" e fornisci un esempio?'),
(248, 2, 'Descrivi il concetto di "equilibri punteggiati" (punctuated equilibrium).'),
(248, 3, 'Come si studia l evoluzione del comportamento (etologia evoluzionistica)?'),
(248, 4, 'Spiega l importanza della "deriva genetica" nelle piccole popolazioni.'),
(248, 5, 'Qual è il ruolo dell estinzione di massa nell evoluzione della vita sulla Terra?');

-- Quiz 249: Storia dell Asia
INSERT INTO Domanda (quiz, numero, testo) VALUES
(249, 1, 'Descrivi l ascesa e la caduta dell Impero Persiano Achemenide.'),
(249, 2, 'Qual è stata l importanza del periodo Heian in Giappone per la cultura e la letteratura?'),
(249, 3, 'Parla della Guerra Russo-Giapponese (1904-05) e delle sue conseguenze.'),
(249, 4, 'Cosa si intende per "Primavera Araba" e quali sono stati i suoi esiti?'),
(249, 5, 'Quali sono le principali dinamiche di cooperazione e conflitto nell Asia contemporanea (es. ASEAN, tensioni India-Cina)?');

-- Quiz 250: Letteratura americana
INSERT INTO Domanda (quiz, numero, testo) VALUES
(250, 1, 'Chi ha scritto "Il giovane Holden" e quale è il suo impatto culturale?'),
(250, 2, 'Descrivi l importanza della letteratura afroamericana e cita alcuni autori chiave.'),
(250, 3, 'Cita un opera importante di un autore/autrice della letteratura chicana o nativa americana.'),
(250, 4, 'Quali sono le caratteristiche della "short story" americana e chi ne sono stati maestri?'),
(250, 5, 'Parla del ruolo del "sogno americano" come tema ricorrente nella letteratura USA.');

-- Quiz 251: Filosofia contemporanea
INSERT INTO Domanda (quiz, numero, testo) VALUES
(251, 1, 'Quali sono le principali tesi dell esistenzialismo ateo di Jean-Paul Sartre?'),
(251, 2, 'Descrivi il pensiero di Hannah Arendt sulla banalità del male e sulla condizione umana.'),
(251, 3, 'Cos è il femminismo filosofico e quali sono le sue principali correnti?'),
(251, 4, 'Spiega il concetto di "biopolitica" in Michel Foucault.'),
(251, 5, 'Quali sono le principali questioni etiche sollevate dalle nuove tecnologie (es. intelligenza artificiale, ingegneria genetica)?');

-- Quiz 252: Psicologia clinica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(252, 1, 'Quali sono i principali disturbi psicotici (es. schizofrenia) e come vengono trattati?'),
(252, 2, 'Descrivi l approccio della terapia familiare sistemica.'),
(252, 3, 'Cos è il disturbo da stress post-traumatico (PTSD) e quali sono i suoi sintomi?'),
(252, 4, 'Spiega l importanza della diagnosi multimodale in psicologia clinica.'),
(252, 5, 'Quali sono le sfide nel trattamento dei disturbi alimentari?');

-- Quiz 253: Economia politica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(253, 1, 'Cosa si intende per "ciclo economico" e quali sono le sue fasi?'),
(253, 2, 'Descrivi il ruolo dello Stato nel fornire beni pubblici e correggere le esternalità.'),
(253, 3, 'Quali sono gli effetti della tassazione sull efficienza economica e sull equità?'),
(253, 4, 'Spiega il concetto di "capitale umano" e la sua importanza per la crescita economica.'),
(253, 5, 'Cosa si intende per "economia dello sviluppo" e quali sono le sue principali sfide?');

-- Quiz 254: Sociologia rurale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(254, 1, 'Come la sociologia rurale studia le trasformazioni del lavoro agricolo e dell impresa familiare?'),
(254, 2, 'Descrivi il concetto di "identità rurale" e come si manifesta.'),
(254, 3, 'Qual è l impatto delle politiche di sviluppo rurale (es. programmi UE LEADER) sulle comunità locali?'),
(254, 4, 'Spiega il ruolo dei movimenti sociali rurali (es. per la sovranità alimentare, contro il land grabbing).'),
(254, 5, 'Come la sociologia rurale analizza le relazioni tra aree rurali e urbane (continuum rurale-urbano)?');

-- Quiz 255: Antropologia fisica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(255, 1, 'Cosa si intende per "adattamento bioculturale"? Fornisci un esempio.'),
(255, 2, 'Descrivi i metodi utilizzati per studiare la dieta e la salute delle popolazioni antiche.'),
(255, 3, 'Come l antropologia fisica contribuisce alla comprensione delle malattie umane in una prospettiva evolutiva?'),
(255, 4, 'Spiega l importanza dello studio della variabilità genetica umana per ricostruire le migrazioni passate.'),
(255, 5, 'Quali sono le sfide etiche nella raccolta e nell analisi di dati biologici umani in contesti interculturali?');

-- Quiz 256: Storia dell antico Giappone
INSERT INTO Domanda (quiz, numero, testo) VALUES
(256, 1, 'Quali sono i periodi principali della storia antica giapponese (Jomon, Yayoi, Kofun, Asuka, Nara, Heian)?'),
(256, 2, 'Descrivi l influenza della cultura cinese e coreana sul Giappone antico.'),
(256, 3, 'Cos è stato il sistema Ritsuryō?'),
(256, 4, 'Parla dell introduzione del Buddhismo in Giappone e del suo sincretismo con lo Shintoismo.'),
(256, 5, 'Qual era il ruolo dell imperatore e dei clan aristocratici nel Giappone antico?');

-- Quiz 257: Matematica avanzata II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(257, 1, 'Cosa sono le equazioni differenziali alle derivate parziali (PDE) e cita un esempio (es. equazione del calore, delle onde).'),
(257, 2, 'Descrivi il concetto di spazio di Hilbert.'),
(257, 3, 'Cos è l analisi funzionale e quali sono i suoi principali oggetti di studio?'),
(257, 4, 'Spiega il concetto di "misura" e "integrale di Lebesgue".'),
(257, 5, 'Cita un teorema importante dell analisi complessa (es. teorema dei residui).');

-- Quiz 258: Fisica delle onde
INSERT INTO Domanda (quiz, numero, testo) VALUES
(258, 1, 'Qual è l equazione generale delle onde e come si ricava?'),
(258, 2, 'Descrivi i fenomeni di interferenza e diffrazione delle onde.'),
(258, 3, 'Cosa sono le onde stazionarie e come si formano?'),
(258, 4, 'Spiega l effetto Doppler per le onde sonore e luminose.'),
(258, 5, 'Qual è la differenza tra onde trasversali e longitudinali? Fornisci esempi.');

-- Quiz 259: Letteratura medievale II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(259, 1, 'Descrivi il ciclo arturiano e la sua evoluzione nella letteratura medievale.'),
(259, 2, 'Quali sono le caratteristiche del teatro medievale (misteri, moralità, farse)?'),
(259, 3, 'Parla della poesia goliardica e dei Carmina Burana.'),
(259, 4, 'Cosa si intende per "allegoria" nella letteratura medievale e fornisci un esempio.'),
(259, 5, 'Qual è stata l influenza della Bibbia e dei Padri della Chiesa sulla letteratura medievale?');

-- Quiz 260: Geografia fisica avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(260, 1, 'Descrivi i modelli di circolazione atmosferica generale (celle di Hadley, Ferrel, Polare).'),
(260, 2, 'Cosa si intende per "geomorfologia climatica" e come i diversi climi influenzano il modellamento del paesaggio?'),
(260, 3, 'Spiega i meccanismi di trasporto solido nei fiumi (sospensione, saltazione, rotolamento).'),
(260, 4, 'Quali sono le tecniche di telerilevamento e GIS utilizzate nello studio della geografia fisica?'),
(260, 5, 'Cosa si intende per "paleoclimatologia" e quali sono i suoi metodi di indagine?');

-- Quiz 261: Chimica organica II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(261, 1, 'Cosa sono le reazioni pericicliche (es. cicloaddizioni, reazioni elettrocicliche, trasposizioni sigmatropiche)?'),
(261, 2, 'Descrivi l uso dei reagenti organolitio o dei reattivi di Grignard in sintesi avanzata.'),
(261, 3, 'Spiega la chimica dei carbocationi, carbanioni e radicali liberi come intermedi di reazione.'),
(261, 4, 'Cosa si intende per "chimica supramolecolare" e quali sono le sue applicazioni?'),
(261, 5, 'Parla della sintesi totale di una molecola naturale complessa e delle sue sfide.');

-- Quiz 262: Biologia marina avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(262, 1, 'Descrivi la fisiologia degli organismi marini adattati ad ambienti estremi (es. sorgenti idrotermali, zone polari).'),
(262, 2, 'Cosa si intende per "oceanografia biologica" e quali sono i suoi metodi di studio?'),
(262, 3, 'Spiega i cicli biogeochimici negli oceani (carbonio, azoto, fosforo, silice).'),
(262, 4, 'Quali sono gli impatti dei cambiamenti climatici (acidificazione, riscaldamento) sulla fisiologia e distribuzione degli organismi marini?'),
(262, 5, 'Cosa si intende per "ecologia del benthos" e "ecologia del plancton"?');

-- Quiz 263: Storia della filosofia moderna
INSERT INTO Domanda (quiz, numero, testo) VALUES
(263, 1, 'Confronta il razionalismo di Cartesio, Spinoza e Leibniz.'),
(263, 2, 'Descrivi l empirismo di Locke, Berkeley e Hume e le loro differenze.'),
(263, 3, 'Qual è il progetto critico di Immanuel Kant e come tenta di superare la disputa tra razionalismo ed empirismo?'),
(263, 4, 'Spiega l influenza del pensiero scientifico del XVII secolo (es. Newton, Galileo) sulla filosofia moderna.'),
(263, 5, 'Quali sono le principali teorie politiche elaborate durante l Illuminismo?');

-- Quiz 264: Astronomia e astrofisica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(264, 1, 'Descrivi l evoluzione stellare per stelle di piccola, media e grande massa.'),
(264, 2, 'Cosa sono le stelle di neutroni, i pulsar e i buchi neri stellari?'),
(264, 3, 'Spiega come si formano e si evolvono le galassie.'),
(264, 4, 'Quali sono i metodi per rilevare la materia oscura e l energia oscura?'),
(264, 5, 'Cosa si intende per "nucleosintesi primordiale" e "nucleosintesi stellare"?');

-- Quiz 265: Informatica teorica II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(265, 1, 'Cosa si intende per "riducibilità" tra problemi computazionali?'),
(265, 2, 'Descrivi la classe di complessità PSPACE.'),
(265, 3, 'Cos è la teoria della complessità parametrizzata?'),
(265, 4, 'Spiega il concetto di "algoritmo randomizzato" e le sue applicazioni.'),
(265, 5, 'Cosa sono le "prove a conoscenza zero" (zero-knowledge proofs)?');

-- Quiz 266: Filosofia politica avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(266, 1, 'Confronta le teorie della giustizia di John Rawls e Robert Nozick.'),
(266, 2, 'Descrivi le principali critiche comunitariste al liberalismo.'),
(266, 3, 'Cos è il multiculturalismo e quali sfide pone alla teoria politica contemporanea?'),
(266, 4, 'Spiega il concetto di "democrazia deliberativa".'),
(266, 5, 'Quali sono le principali questioni etiche e politiche sollevate dalla globalizzazione?');

-- Quiz 267: Psicologia dello sviluppo II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(267, 1, 'Descrivi lo sviluppo atipico e i principali disturbi del neurosviluppo (es. autismo, ADHD).'),
(267, 2, 'Come la ricerca cross-culturale contribuisce alla comprensione dello sviluppo umano?'),
(267, 3, 'Qual è il ruolo dei pari e del gruppo dei coetanei nello sviluppo sociale ed emotivo?'),
(267, 4, 'Spiega l impatto delle tecnologie digitali sullo sviluppo cognitivo e sociale di bambini e adolescenti.'),
(267, 5, 'Cosa si intende per "resilienza" e quali fattori la promuovono nello sviluppo?');

-- Quiz 268: Economia internazionale II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(268, 1, 'Descrivi i modelli di commercio internazionale basati sulla concorrenza imperfetta e sulle economie di scala.'),
(268, 2, 'Cosa si intende per "crisi valutarie" e quali sono i loro meccanismi (es. modelli di prima, seconda e terza generazione)?'),
(268, 3, 'Spiega il "trilemma della politica monetaria internazionale" (o trinità impossibile).'),
(268, 4, 'Qual è il ruolo delle istituzioni internazionali (FMI, Banca Mondiale, WTO) nella governance economica globale?'),
(268, 5, 'Come si analizzano gli effetti delle politiche commerciali (tariffe, quote, sussidi) sul benessere economico?');

-- Quiz 269: Sociologia contemporanea II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(269, 1, 'Descrivi le teorie sociologiche sul consumo e sulla società dei consumi.'),
(269, 2, 'Cosa si intende per "individualizzazione" nella società contemporanea secondo autori come Beck o Giddens?'),
(269, 3, 'Spiega il concetto di "capitalismo cognitivo" o "società della conoscenza".'),
(269, 4, 'Quali sono le principali prospettive sociologiche sui movimenti sociali globali?'),
(269, 5, 'Come la sociologia analizza le trasformazioni del lavoro e dell occupazione nell era digitale?');

-- Quiz 270: Antropologia culturale avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(270, 1, 'Descrivi le principali correnti teoriche dell antropologia del XX secolo (es. strutturalismo, funzionalismo, materialismo culturale, interpretativismo).'),
(270, 2, 'Cosa si intende per "antropologia postmoderna" e la sua critica alla rappresentazione etnografica?'),
(270, 3, 'Spiega il concetto di "agency" (agentività) in antropologia.'),
(270, 4, 'Qual è il contributo dell antropologia allo studio della globalizzazione e dei flussi culturali transnazionali?'),
(270, 5, 'Come l antropologia si confronta con le questioni etiche della ricerca in contesti interculturali complessi?');

-- Quiz 271: Storia dell arte moderna II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(271, 1, 'Descrivi l Espressionismo Astratto americano e i suoi principali esponenti (es. Pollock, Rothko).'),
(271, 2, 'Cos è la Pop Art e quale critica muove alla società dei consumi?'),
(271, 3, 'Spiega i principi dell Arte Concettuale e della Minimal Art.'),
(271, 4, 'Qual è stato il ruolo delle donne artiste nell arte moderna e contemporanea e quali sfide hanno affrontato?'),
(271, 5, 'Cosa si intende per "arte postmoderna" e quali sono le sue caratteristiche distintive rispetto al modernismo?');

-- Quiz 272: Letteratura americana II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(272, 1, 'Descrivi l influenza del Puritanesimo sulla prima letteratura americana.'),
(272, 2, 'Quali sono le caratteristiche della letteratura gotica americana (es. Poe, Hawthorne)?'),
(272, 3, 'Parla del ruolo della natura e del selvaggio (wilderness) nella letteratura americana del XIX secolo.'),
(272, 4, 'Cosa si intende per "Grande Romanzo Americano" (Great American Novel) e quali opere ne sono considerate esempi?'),
(272, 5, 'Come la letteratura americana contemporanea affronta temi come la multietnicità, il genere e l identità sessuale?');

-- Quiz 273: Fisica quantistica avanzata II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(273, 1, 'Cosa si intende per "decoerenza quantistica" e perché è un problema per il calcolo quantistico?'),
(273, 2, 'Descrivi un algoritmo quantistico importante (es. algoritmo di Shor, algoritmo di Grover).'),
(273, 3, 'Quali sono le diverse interpretazioni della meccanica quantistica oltre a quella di Copenaghen (es. mondi multipli, variabili nascoste)?'),
(273, 4, 'Spiega il concetto di "teletrasporto quantistico".'),
(273, 5, 'Cosa sono i computer quantistici e quali sono le principali sfide tecnologiche per la loro realizzazione?');

-- Quiz 274: Chimica analitica II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(274, 1, 'Descrivi le tecniche di analisi di superficie (es. XPS, Auger, SIMS).'),
(274, 2, 'Cosa si intende per "chemiometria" e come si applica all analisi dei dati chimici?'),
(274, 3, 'Spiega i principi della risonanza magnetica nucleare (NMR) multidimensionale.'),
(274, 4, 'Quali sono le sfide e le innovazioni nell analisi di tracce e ultratracce?'),
(274, 5, 'Cosa sono i biosensori e come funzionano? Fornisci un esempio.');

-- Quiz 275: Geologia strutturale avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(275, 1, 'Descrivi i meccanismi di deformazione delle rocce (fragile, duttile) e i fattori che li influenzano.'),
(275, 2, 'Cosa si intende per "analisi cinematica" e "analisi dinamica" delle strutture geologiche?'),
(275, 3, 'Spiega la tettonica delle placche e come i diversi margini (divergenti, convergenti, trasformi) generano strutture geologiche caratteristiche.'),
(275, 4, 'Quali sono le tecniche di datazione delle deformazioni geologiche?'),
(275, 5, 'Cosa si intende per "reologia della litosfera" e come influenza la deformazione su larga scala?');

-- Quiz 276: Storia della musica II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(276, 1, 'Descrivi lo sviluppo della polifonia nella musica medievale e rinascimentale (Ars Antiqua, Ars Nova).'),
(276, 2, 'Qual è stata l importanza della Camerata de  Bardi e la nascita dell opera lirica?'),
(276, 3, 'Spiega le trasformazioni del linguaggio musicale nel passaggio dal Romanticismo al Modernismo (es. crisi della tonalità).'),
(276, 4, 'Cosa si intende per "musica aleatoria" e "minimalismo" nella musica contemporanea?'),
(276, 5, 'Qual è stato l impatto delle tecnologie di registrazione e riproduzione sulla fruizione e creazione musicale?');

-- Quiz 277: Matematica discreta II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(277, 1, 'Cos è la teoria di Ramsey e cita un suo risultato classico?'),
(277, 2, 'Descrivi i metodi probabilistici in combinatoria.'),
(277, 3, 'Cosa sono i "disegni combinatori" (combinatorial designs) e le loro applicazioni?'),
(277, 4, 'Spiega la teoria dei grafi spettrale.'),
(277, 5, 'Cita un problema aperto o una congettura importante in matematica discreta.');

-- Quiz 278: Fisica dei materiali avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(278, 1, 'Descrivi le proprietà e le applicazioni dei metamateriali.'),
(278, 2, 'Cosa sono i cristalli fotonici e come possono manipolare la luce?'),
(278, 3, 'Spiega i principi della spintronica e le sue potenziali applicazioni.'),
(278, 4, 'Quali sono le sfide nella progettazione e sintesi di materiali per l immagazzinamento dell energia (es. batterie, supercondensatori)?'),
(278, 5, 'Cosa si intende per "auto-assemblaggio molecolare" (self-assembly) nella scienza dei materiali?');

-- Quiz 279: Letteratura francese II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(279, 1, 'Descrivi l importanza del "Nouveau Roman" e autori come Alain Robbe-Grillet o Nathalie Sarraute.'),
(279, 2, 'Quali sono le caratteristiche della letteratura francofona postcoloniale (es. Caraibi, Africa)?'),
(279, 3, 'Parla del ruolo dell Oulipo (Ouvroir de Littérature Potentielle) e di autori come Georges Perec.'),
(279, 4, 'Cosa si intende per "autofiction" nella letteratura francese contemporanea?'),
(279, 5, 'Come la letteratura francese ha affrontato i temi della memoria storica, in particolare della Seconda Guerra Mondiale e della Shoah?');

-- Quiz 280: Geografia economica avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(280, 1, 'Descrivi le teorie della crescita regionale e dello sviluppo locale.'),
(280, 2, 'Cosa si intende per "geografia finanziaria" e come analizza i flussi di capitale?'),
(280, 3, 'Spiega il concetto di "innovazione territoriale" e il ruolo dei sistemi regionali di innovazione.'),
(280, 4, 'Qual è l impatto della Quarta Rivoluzione Industriale (Industria 4.0) sulla geografia economica?'),
(280, 5, 'Come la geografia economica critica analizza le disuguaglianze e le relazioni di potere nello spazio economico?');

-- Quiz 281: Chimica fisica avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(281, 1, 'Descrivi i principi della meccanica statistica e la sua applicazione alla termodinamica.'),
(281, 2, 'Cosa sono le "dinamiche molecolari" (molecular dynamics) e come si utilizzano per simulare sistemi chimici?'),
(281, 3, 'Spiega la teoria dello stato di transizione per la cinetica delle reazioni chimiche.'),
(281, 4, 'Quali sono le tecniche avanzate di spettroscopia per lo studio di molecole e reazioni (es. spettroscopia risolta nel tempo)?'),
(281, 5, 'Cosa si intende per "fotochimica" e quali sono i suoi processi fondamentali?');

-- Quiz 282: Biologia evolutiva avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(282, 1, 'Descrivi i meccanismi molecolari dell evoluzione (es. evoluzione dei geni e dei genomi).'),
(282, 2, 'Cosa si intende per "filogenomica" e come si utilizza per ricostruire le relazioni evolutive?'),
(282, 3, 'Spiega il concetto di "paesaggio adattativo" (adaptive landscape) e la sua utilità.'),
(282, 4, 'Qual è il ruolo della plasticità fenotipica nell evoluzione?'),
(282, 5, 'Cosa si intende per "evo-devo" (biologia evoluzionistica dello sviluppo) e quali sono i suoi principali risultati?');

-- Quiz 283: Storia dell Asia II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(283, 1, 'Descrivi l ascesa e il consolidamento dell Impero Moghul in India.'),
(283, 2, 'Qual è stata l importanza della dinastia Ming o Qing in Cina?'),
(283, 3, 'Parla del periodo Meiji in Giappone e della sua modernizzazione.'),
(283, 4, 'Cosa si intende per "Guerre dell Oppio" e quale fu il loro impatto sulla Cina?'),
(283, 5, 'Quali sono state le principali dinamiche della Guerra Fredda in Asia (es. Corea, Vietnam, Afghanistan)?');

-- Quiz 284: Letteratura spagnola II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(284, 1, 'Descrivi l importanza della "Celestina" come opera di transizione tra Medioevo e Rinascimento.'),
(284, 2, 'Quali sono le caratteristiche della poesia mistica spagnola (es. San Juan de la Cruz, Santa Teresa d Ávila)?'),
(284, 3, 'Parla del " tremendismo" nella narrativa spagnola del dopoguerra.'),
(284, 4, 'Cosa si intende per "letteratura testimoniale" in America Latina?'),
(284, 5, 'Come la letteratura spagnola e ispanoamericana contemporanea dialoga con la tradizione e l innovazione globale?');

-- Quiz 285: Filosofia moderna II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(285, 1, 'Qual è la critica di Nietzsche alla morale tradizionale e il concetto di "volontà di potenza"?'),
(285, 2, 'Descrivi il materialismo storico di Karl Marx e la sua analisi del capitalismo.'),
(285, 3, 'Cos è il pragmatismo americano (Peirce, James, Dewey)?'),
(285, 4, 'Spiega l influenza di Schopenhauer e Kierkegaard sulla filosofia successiva.'),
(285, 5, 'Qual è stato il dibattito tra positivismo e idealismo nella filosofia del XIX secolo?');

-- Quiz 286: Psicologia sociale avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(286, 1, 'Descrivi i modelli duali di persuasione (es. ELM - Elaboration Likelihood Model).'),
(286, 2, 'Cosa si intende per "cognizione sociale implicita" e come si misura (es. IAT - Implicit Association Test)?'),
(286, 3, 'Spiega le teorie sull aggressività intergruppi e sulla riduzione del conflitto.'),
(286, 4, 'Qual è il contributo della psicologia sociale evoluzionistica alla comprensione del comportamento sociale?'),
(286, 5, 'Come la psicologia sociale cross-culturale analizza le differenze e le somiglianze nei processi sociali tra culture diverse?');

-- Quiz 287: Economia aziendale II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(287, 1, 'Descrivi le teorie dell agenzia e i problemi di corporate governance.'),
(287, 2, 'Cosa si intende per "gestione della conoscenza" (knowledge management) e "capitale intellettuale"?'),
(287, 3, 'Spiega i modelli di valutazione delle aziende (es. DCF - Discounted Cash Flow, multipli).'),
(287, 4, 'Qual è il ruolo dell etica e della responsabilità sociale d impresa (CSR) nelle strategie aziendali?'),
(287, 5, 'Come le aziende gestiscono l innovazione e il cambiamento tecnologico (es. open innovation, disruptive innovation)?');

-- Quiz 288: Sociologia urbana avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(288, 1, 'Descrivi le teorie sulla "global city" (Saskia Sassen) e sulle reti urbane globali.'),
(288, 2, 'Cosa si intende per "governance urbana" e quali sono i suoi attori e processi?'),
(288, 3, 'Spiega il concetto di "sostenibilità urbana" e le sue dimensioni (ambientale, sociale, economica).'),
(288, 4, 'Qual è l impatto delle migrazioni internazionali sulla trasformazione delle città contemporanee?'),
(288, 5, 'Come la sociologia urbana analizza i movimenti per il "diritto alla città" e la giustizia spaziale?');

-- Quiz 289: Antropologia fisica avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(289, 1, 'Descrivi i metodi di ricostruzione paleoambientale e la loro importanza per lo studio dell evoluzione umana.'),
(289, 2, 'Cosa si intende per "paleopatologia" e cosa ci rivela sulla salute delle popolazioni antiche?'),
(289, 3, 'Spiega l evoluzione del bipedismo e le sue implicazioni anatomiche e comportamentali.'),
(289, 4, 'Qual è il contributo dell antropologia molecolare allo studio della diversità e delle migrazioni umane?'),
(289, 5, 'Come l antropologia fisica si confronta con le questioni etiche legate all uso di resti umani e campioni biologici?');

-- Quiz 290: Storia moderna II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(290, 1, 'Descrivi l evoluzione dello stato moderno e il concetto di sovranità nel periodo 1500-1800.'),
(290, 2, 'Quale fu l impatto della "rivoluzione militare" sulla guerra e sulla società in età moderna?'),
(290, 3, 'Parla delle diverse interpretazioni storiografiche della Rivoluzione Francese.'),
(290, 4, 'Cosa si intende per "crisi del XVII secolo" e quali furono le sue manifestazioni in Europa?'),
(290, 5, 'Come la storia moderna ha analizzato i rapporti tra Europa e il resto del mondo durante l espansione coloniale?');

-- Quiz 291: Letteratura tedesca II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(291, 1, 'Descrivi l importanza del teatro di Heiner Müller e la sua rielaborazione della storia tedesca.'),
(291, 2, 'Quali sono le caratteristiche della "Letteratura della Riunificazione" (Wenderoman)?'),
(291, 3, 'Parla del ruolo della memoria della Shoah nella letteratura tedesca contemporanea.'),
(291, 4, 'Cosa si intende per "Popliteratur" tedesca degli anni  90?'),
(291, 5, 'Come la letteratura tedesca di autori con background migratorio arricchisce il panorama letterario attuale?');

-- Quiz 292: Fisica applicata II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(292, 1, 'Descrivi i principi e le applicazioni della nanotecnologia in fisica.'),
(292, 2, 'Cosa sono i materiali superconduttori ad alta temperatura e quali sono le loro prospettive applicative?'),
(292, 3, 'Spiega come la fisica contribuisce allo sviluppo di sistemi di intelligenza artificiale e machine learning.'),
(292, 4, 'Quali sono le sfide e le innovazioni nel campo dell accumulo di energia (es. batterie avanzate)?'),
(292, 5, 'Cosa si intende per "fotonica" e quali sono le sue applicazioni nelle comunicazioni e nel calcolo?');

-- Quiz 293: Chimica industriale avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(293, 1, 'Descrivi i principi dell ingegneria dei reattori chimici per processi su larga scala.'),
(293, 2, 'Cosa si intende per "intensificazione dei processi" (process intensification) in chimica industriale?'),
(293, 3, 'Spiega l importanza della modellazione e simulazione dei processi chimici industriali.'),
(293, 4, 'Quali sono le strategie per la valorizzazione dei sottoprodotti e la minimizzazione dei rifiuti nell industria chimica (economia circolare)?'),
(293, 5, 'Come la chimica industriale sta integrando i principi della "chimica verde" e della sostenibilità?');

-- Quiz 294: Geografia politica avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(294, 1, 'Descrivi le teorie critiche della geopolitica (es. post-strutturalista, femminista).'),
(294, 2, 'Cosa si intende per "geopolitica delle risorse" (energia, acqua, cibo)?'),
(294, 3, 'Spiega il concetto di "cyber-geopolitica" e le sue implicazioni.'),
(294, 4, 'Qual è il ruolo delle città globali (global cities) nella geopolitica contemporanea?'),
(294, 5, 'Come la geografia politica analizza i processi di costruzione dello Stato (state-building) e i conflitti identitari?');

-- Quiz 295: Storia dell Europa II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(295, 1, 'Descrivi le diverse interpretazioni storiografiche delle origini della Prima Guerra Mondiale.'),
(295, 2, 'Quale fu l impatto della Grande Depressione sulle società e le politiche europee?'),
(295, 3, 'Parla della Shoah e del suo significato per la storia europea e la memoria collettiva.'),
(295, 4, 'Cosa si intende per "guerra fredda culturale" e come si manifestò in Europa?'),
(295, 5, 'Come la storia europea contemporanea analizza i processi di globalizzazione e le loro conseguenze sul continente?');

-- Quiz 296: Matematica finanziaria avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(296, 1, 'Descrivi i modelli di pricing dei derivati esotici.'),
(296, 2, 'Cosa si intende per "calcolo stocastico" (es. moto Browniano, integrale di Itô) e la sua applicazione in finanza?'),
(296, 3, 'Spiega i modelli per la stima della volatilità (es. GARCH).'),
(296, 4, 'Quali sono le tecniche di gestione del rischio di credito e di mercato?'),
(296, 5, 'Cosa si intende per "finanza comportamentale" e come si discosta dalla teoria finanziaria classica?');

-- Quiz 297: Fisica teorica avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(297, 1, 'Descrivi la corrispondenza AdS/CFT e le sue implicazioni.'),
(297, 2, 'Cosa si intende per "teoria M" e il suo ruolo nella teoria delle stringhe?'),
(297, 3, 'Spiega il concetto di "inflazione eterna" e il multiverso.'),
(297, 4, 'Quali sono le sfide nella quantizzazione della gravità?'),
(297, 5, 'Cosa sono i "monopoli magnetici" e perché la loro esistenza è ipotizzata da alcune teorie?');

-- Quiz 298: Letteratura russa II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(298, 1, 'Descrivi l importanza del movimento formalista russo per la critica letteraria.'),
(298, 2, 'Quali sono le caratteristiche della prosa di Andrej Platonov o Michail Zoščenko?'),
(298, 3, 'Parla del ruolo della censura e della letteratura clandestina (samizdat, tamizdat) in epoca sovietica.'),
(298, 4, 'Cosa si intende per "postmodernismo russo" e chi ne sono gli esponenti?'),
(298, 5, 'Come la letteratura russa contemporanea affronta i temi dell identità nazionale e della memoria storica?');

-- Quiz 299: Geografia culturale avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(299, 1, 'Descrivi le teorie post-strutturaliste e post-coloniali in geografia culturale.'),
(299, 2, 'Cosa si intende per "geografia delle emozioni" e "geografia affettiva"?'),
(299, 3, 'Spiega il concetto di "non-luoghi" (Marc Augé) e la sua rilevanza.'),
(299, 4, 'Qual è il contributo della geografia culturale femminista e queer allo studio dello spazio?'),
(299, 5, 'Come la geografia culturale analizza la produzione e il consumo di cultura popolare (musica, cinema, media)?');

-- Quiz 300: Chimica ambientale avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(300, 1, 'Descrivi i modelli di trasporto e destino degli inquinanti negli ecosistemi.'),
(300, 2, 'Cosa si intende per "valutazione del rischio ambientale" (Environmental Risk Assessment)?'),
(300, 3, 'Spiega le tecniche avanzate di biorisanamento e fitorisanamento dei siti contaminati.'),
(300, 4, 'Qual è il ruolo della chimica analitica avanzata nel monitoraggio ambientale e nella speciazione chimica?'),
(300, 5, 'Come la chimica ambientale contribuisce allo sviluppo di tecnologie per l energia pulita e la mitigazione dei cambiamenti climatici?');

-- Quiz 301: Biologia marina avanzata II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(301, 1, 'Descrivi la genomica e la trascrittomica applicate agli organismi marini.'),
(301, 2, 'Cosa si intende per "connettività ecologica" negli ecosistemi marini e come si studia?'),
(301, 3, 'Spiega l impatto del rumore sottomarino di origine antropica sulla fauna marina.'),
(301, 4, 'Quali sono le strategie di conservazione e gestione sostenibile delle risorse marine (es. aree marine protette, quote di pesca)?'),
(301, 5, 'Cosa si intende per "bioprospezione marina" e la ricerca di nuove molecole da organismi marini?');

-- Quiz 302: Storia dell Oceania II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(302, 1, 'Descrivi i sistemi di navigazione tradizionali utilizzati dai popoli del Pacifico.'),
(302, 2, 'Quale fu l impatto delle missioni cristiane sulle culture indigene dell Oceania?'),
(302, 3, 'Parla della storia politica e sociale dell Australia o della Nuova Zelanda nel XX secolo, con attenzione ai rapporti con le popolazioni indigene.'),
(302, 4, 'Cosa si intende per "Blackbirding" e la tratta dei lavoratori melanesiani?'),
(302, 5, 'Quali sono le sfide contemporanee per la sovranità e l autodeterminazione dei popoli indigeni dell Oceania?');

-- Quiz 303: Letteratura africana avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(303, 1, 'Descrivi le teorie postcoloniali e la loro applicazione alla letteratura africana.'),
(303, 2, 'Qual è il ruolo della diaspora africana nella produzione letteraria globale?'),
(303, 3, 'Parla dell importanza della critica letteraria femminista africana.'),
(303, 4, 'Cosa si intende per "afrofuturismo" in letteratura e nelle arti?'),
(303, 5, 'Come la letteratura africana contemporanea esplora le questioni di genere, sessualità e identità queer?');

-- Quiz 304: Filosofia orientale avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(304, 1, 'Confronta le scuole Madhyamaka e Yogacara del Buddhismo Mahayana.'),
(304, 2, 'Descrivi le principali scuole dell Induismo (es. Vedanta, Samkhya, Yoga) e le loro dottrine filosofiche.'),
(304, 3, 'Qual è il contributo della filosofia islamica medievale (es. Avicenna, Averroè) al pensiero occidentale?'),
(304, 4, 'Spiega il concetto di "non-dualità" (Advaita) nel Vedanta.'),
(304, 5, 'Come le filosofie orientali contemporanee dialogano con le sfide della modernità e della globalizzazione?');

-- Quiz 305: Psicologia clinica avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(305, 1, 'Descrivi i modelli neurobiologici dei principali disturbi mentali.'),
(305, 2, 'Cosa si intende per "psicoterapia basata sull evidenza" (Evidence-Based Psychotherapy)?'),
(305, 3, 'Spiega l approccio della "Acceptance and Commitment Therapy" (ACT) o della "Dialectical Behavior Therapy" (DBT).'),
(305, 4, 'Qual è il ruolo della psicofarmacologia nel trattamento integrato dei disturbi mentali?'),
(305, 5, 'Come la psicologia clinica si occupa delle problematiche legate al trauma complesso e ai disturbi dissociativi?');

-- Quiz 306: Economia politica avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(306, 1, 'Descrivi le teorie della scelta pubblica (public choice) e la loro critica allo Stato interventista.'),
(306, 2, 'Cosa si intende per "economia istituzionale" e il ruolo delle istituzioni nello sviluppo economico?'),
(306, 3, 'Spiega i modelli di crescita endogena e il ruolo dell innovazione e del capitale umano.'),
(306, 4, 'Quali sono le principali teorie sulla disuguaglianza economica e le sue cause (es. Piketty)?'),
(306, 5, 'Come l economia politica analizza le crisi finanziarie e le politiche di regolamentazione?');

-- Quiz 307: Sociologia rurale avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(307, 1, 'Descrivi le teorie sulla "nuova ruralità" e le trasformazioni socio-economiche delle aree rurali.'),
(307, 2, 'Cosa si intende per "governance rurale" e il ruolo degli attori locali e sovralocali?'),
(307, 3, 'Spiega il concetto di "catene alimentari alternative" (es. filiera corta, mercati contadini, agricoltura biologica).'),
(307, 4, 'Qual è l impatto della financiarizzazione dell agricoltura e del land grabbing sulle comunità rurali globali?'),
(307, 5, 'Come la sociologia rurale analizza le questioni di genere e le disuguaglianze nelle aree rurali?');

-- Quiz 308: Antropologia linguistica avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(308, 1, 'Descrivi le teorie sulla relazione tra linguaggio, pensiero e cultura (es. neo-whorfismo).'),
(308, 2, 'Cosa si intende per "ideologie linguistiche" e come influenzano le pratiche comunicative?'),
(308, 3, 'Spiega il concetto di "performance linguistica" e la sua analisi.'),
(308, 4, 'Qual è il contributo dell antropologia linguistica allo studio del multilinguismo e del contatto linguistico?'),
(308, 5, 'Come l antropologia linguistica analizza l uso del linguaggio nei media digitali e nelle interazioni online?');

-- Quiz 309: Storia dell Africa II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(309, 1, 'Descrivi l impatto della Guerra Fredda sulla politica e sui conflitti in Africa.'),
(309, 2, 'Quali sono state le diverse traiettorie di sviluppo economico post-coloniale in Africa?'),
(309, 3, 'Parla del genocidio in Ruanda e delle sue conseguenze regionali.'),
(309, 4, 'Cosa si intende per "Rinascimento Africano" e quali sono le sue ambizioni?'),
(309, 5, 'Qual è il ruolo della Cina e di altre potenze emergenti nelle dinamiche economiche e politiche contemporanee dell Africa?');

-- Quiz 310: Letteratura giapponese avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(310, 1, 'Descrivi l importanza del "monogatari" come genere letterario nel Giappone classico.'),
(310, 2, 'Quali sono le caratteristiche della letteratura del periodo Edo (es. "ukiyo-zōshi", teatro Kabuki e Bunraku)?'),
(310, 3, 'Parla dell influenza della letteratura occidentale sulla modernizzazione della letteratura giapponese (periodo Meiji).'),
(310, 4, 'Cosa si intende per "letteratura atomica" (Genbaku bungaku) e i suoi autori principali?'),
(310, 5, 'Come la letteratura giapponese contemporanea esplora i temi della tecnologia, dell alienazione e della memoria?');

-- Quiz 311: Fisica nucleare avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(311, 1, 'Descrivi i modelli del nucleo atomico (es. modello a goccia liquida, modello a shell).'),
(311, 2, 'Cosa si intende per "reazioni nucleari indotte da particelle pesanti"?'),
(311, 3, 'Spiega la fisica dei reattori a fusione nucleare (es. tokamak, stellarator) e le sue sfide.'),
(311, 4, 'Quali sono le applicazioni della fisica nucleare in astrofisica (es. nucleosintesi stellare, supernove)?'),
(311, 5, 'Cosa si intende per "materia nucleare esotica" (es. ipernuclei, stelle di neutroni)?');

-- Quiz 312: Chimica biologica avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(312, 1, 'Descrivi i meccanismi di ripiegamento (folding) delle proteine e le malattie associate al misfolding.'),
(312, 2, 'Cosa si intende per "vie di trasduzione del segnale" e i loro componenti (recettori, secondi messaggeri, protein chinasi)?'),
(312, 3, 'Spiega il ruolo della bioenergetica e del metabolismo dell ATP nella cellula.'),
(312, 4, 'Quali sono le tecniche avanzate per lo studio delle interazioni proteina-proteina e proteina-DNA?'),
(312, 5, 'Cosa si intende per "biologia sintetica" e le sue applicazioni nella progettazione di sistemi biologici?');

-- Quiz 313: Geografia fisica avanzata II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(313, 1, 'Descrivi i processi di modellamento glaciale e periglaciale del paesaggio.'),
(313, 2, 'Cosa si intende per "idrologia dei bacini imbriferi" e i modelli di deflusso?'),
(313, 3, 'Spiega la classificazione dei climi di Köppen e i suoi criteri.'),
(313, 4, 'Quali sono gli impatti dei cambiamenti climatici sui sistemi criosferici (ghiacciai, permafrost)?'),
(313, 5, 'Cosa si intende per "geomorfologia fluviale" e lo studio dell evoluzione dei corsi d acqua?');

-- Quiz 314: Storia dell America II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(314, 1, 'Descrivi le diverse forme di resistenza delle popolazioni native americane alla colonizzazione.'),
(314, 2, 'Quale fu l impatto dell immigrazione europea, asiatica e latinoamericana sulla società statunitense nel XIX e XX secolo?'),
(314, 3, 'Parla delle dittature militari in America Latina durante la Guerra Fredda e del ruolo degli USA.'),
(314, 4, 'Cosa si intende per "New Left" e i movimenti di protesta degli anni  60 negli Stati Uniti?'),
(314, 5, 'Quali sono le principali sfide contemporanee per le relazioni interamericane (es. narcotraffico, migrazioni, commercio)?');

-- Quiz 315: Matematica avanzata III
INSERT INTO Domanda (quiz, numero, testo) VALUES
(315, 1, 'Cos è la geometria algebrica e quali sono i suoi oggetti di studio (varietà algebriche)?'),
(315, 2, 'Descrivi la teoria delle categorie e i suoi fondamenti.'),
(315, 3, 'Cos è la topologia differenziale e quali sono i suoi principali strumenti (es. forme differenziali, coomologia di de Rham)?'),
(315, 4, 'Spiega un risultato o una congettura importante della teoria dei numeri (es. Ultimo Teorema di Fermat, Ipotesi di Riemann).'),
(315, 5, 'Cita un area di ricerca attiva nella matematica pura contemporanea.');

-- Quiz 316: Fisica moderna avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(316, 1, 'Descrivi la formulazione relativistica della meccanica quantistica (equazione di Dirac).'),
(316, 2, 'Cosa si intende per "elettrodinamica quantistica" (QED) e i suoi successi?'),
(316, 3, 'Spiega il concetto di "simmetria di gauge" e il suo ruolo nelle teorie delle interazioni fondamentali.'),
(316, 4, 'Quali sono le evidenze sperimentali della relatività generale (es. precessione del perielio di Mercurio, deflessione della luce)?'),
(316, 5, 'Cosa sono le onde gravitazionali e come sono state rilevate?');

-- Quiz 317: Letteratura italiana avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(317, 1, 'Descrivi l importanza della Scuola Siciliana per la nascita della lirica italiana.'),
(317, 2, 'Quali sono le caratteristiche del Dolce Stil Novo e i suoi principali esponenti?'),
(317, 3, 'Parla dell Umanesimo e del Rinascimento nella letteratura italiana (es. Petrarca, Boccaccio, Ariosto, Tasso).'),
(317, 4, 'Cosa si intende per "Scapigliatura" o "Verismo" nella letteratura italiana del XIX secolo?'),
(317, 5, 'Come la letteratura italiana contemporanea (dal secondo dopoguerra ad oggi) riflette sui cambiamenti sociali e culturali del paese?');

-- Quiz 318: Geografia mondiale avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(318, 1, 'Descrivi i principali hotspot di biodiversità nel mondo e le minacce che affrontano.'),
(318, 2, 'Cosa si intende per "Antropocene" e quali sono le sue implicazioni geografiche?'),
(318, 3, 'Spiega le dinamiche demografiche globali (crescita, invecchiamento, migrazioni) e i loro impatti regionali.'),
(318, 4, 'Quali sono le principali sfide per la sicurezza alimentare globale e il ruolo della geografia?'),
(318, 5, 'Come la geografia analizza i conflitti per le risorse idriche a scala globale e regionale?');

-- Quiz 319: Chimica organica avanzata II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(319, 1, 'Descrivi la chimica dei composti eterociclici e la loro importanza (es. farmaci, materiali).'),
(319, 2, 'Cosa si intende per "catalisi organica" (organocatalysis)?'),
(319, 3, 'Spiega i principi della fotochimica organica e le sue applicazioni sintetiche.'),
(319, 4, 'Quali sono le strategie per la sintesi di polimeri con architetture controllate?'),
(319, 5, 'Cosa si intende per "chimica combinatoriale" e il suo utilizzo nella scoperta di farmaci?');

-- Quiz 320: Biologia cellulare avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(320, 1, 'Descrivi i meccanismi di controllo del ciclo cellulare e il ruolo delle cicline e delle chinasi ciclina-dipendenti (CDK).'),
(320, 2, 'Cosa si intende per "autofagia" e quale è la sua importanza per la cellula?'),
(320, 3, 'Spiega i meccanismi molecolari dell adesione cellula-cellula e cellula-matrice.'),
(320, 4, 'Qual è il ruolo delle cellule staminali nella rigenerazione dei tessuti e le loro potenziali applicazioni terapeutiche?'),
(320, 5, 'Cosa si intende per "senescenza cellulare" e il suo legame con l invecchiamento e le malattie?');

-- Quiz 321: Storia contemporanea avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(321, 1, 'Descrivi le diverse interpretazioni storiografiche del fascismo e del nazismo.'),
(321, 2, 'Quale fu l impatto dei movimenti del  68 a livello globale?'),
(321, 3, 'Parla della fine della Guerra Fredda e dell emergere di un nuovo ordine (o disordine) mondiale.'),
(321, 4, 'Cosa si intende per "global history" e quali sono i suoi approcci metodologici?'),
(321, 5, 'Come la storia contemporanea analizza l ascesa della Cina come potenza globale e le sue implicazioni?');

-- Quiz 322: Astronomia avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(322, 1, 'Descrivi i metodi per la rilevazione e caratterizzazione dei pianeti extrasolari (es. transiti, velocità radiali, imaging diretto).'),
(322, 2, 'Cosa si intende per "astrobiologia" e la ricerca di vita extraterrestre?'),
(322, 3, 'Spiega la formazione e l evoluzione dei dischi protoplanetari.'),
(322, 4, 'Quali sono le future grandi missioni spaziali per l astronomia e l astrofisica (es. telescopi di nuova generazione)?'),
(322, 5, 'Cosa sono i "Fast Radio Bursts" (FRB) e quali sono le ipotesi sulla loro origine?');

-- Quiz 323: Informatica di base avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(323, 1, 'Descrivi i principi di funzionamento di un database relazionale e il linguaggio SQL.'),
(323, 2, 'Cosa si intende per "programmazione orientata agli oggetti" (OOP) e i suoi concetti fondamentali (classi, oggetti, ereditarietà, polimorfismo)?'),
(323, 3, 'Spiega i fondamenti delle reti di computer (protocolli TCP/IP, architettura client-server).'),
(323, 4, 'Quali sono i principi base della crittografia e della sicurezza delle informazioni?'),
(323, 5, 'Cosa si intende per "algoritmi" e "strutture dati" fondamentali (es. liste, alberi, grafi)?');

-- Quiz 324: Filosofia antica avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(324, 1, 'Analizza la concezione platonica dell anima e la sua immortalità.'),
(324, 2, 'Descrivi la metafisica di Aristotele (sostanza, atto e potenza, le quattro cause).'),
(324, 3, 'Confronta l etica stoica con quella epicurea riguardo al piacere e al dovere.'),
(324, 4, 'Spiega l importanza del Neoplatonismo (es. Plotino) e la sua influenza sulla filosofia successiva.'),
(324, 5, 'Qual è il dibattito sulla natura della conoscenza e della verità nella filosofia greca classica?');

-- Quiz 325: Psicologia avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(325, 1, 'Descrivi i principali approcci neuroscientifici allo studio della cognizione e del comportamento (es. fMRI, EEG).'),
(325, 2, 'Cosa si intende per "psicologia evoluzionistica" e come spiega il comportamento umano?'),
(325, 3, 'Spiega i modelli avanzati di apprendimento e memoria (es. consolidamento, plasticità sinaptica).'),
(325, 4, 'Quali sono le principali teorie sulla coscienza e sul problema mente-corpo?'),
(325, 5, 'Come la psicologia cross-culturale e la psicologia indigena sfidano le generalizzazioni basate su campioni occidentali?');

-- Quiz 326: Economia avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(326, 1, 'Descrivi i modelli di equilibrio economico generale (EEG) e le loro assunzioni.'),
(326, 2, 'Cosa si intende per "teoria dei giochi" e le sue applicazioni in economia (es. oligopolio, aste)?'),
(326, 3, 'Spiega l economia dell informazione e i problemi di asimmetria informativa (selezione avversa, azzardo morale).'),
(326, 4, 'Quali sono i fondamenti microeconomici della macroeconomia (es. modelli DSGE)?'),
(326, 5, 'Cosa si intende per "econometria" e quali sono le sue principali tecniche per l analisi dei dati economici?');

-- Quiz 327: Sociologia avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(327, 1, 'Descrivi le teorie sociologiche sulla modernità liquida (Bauman) o sulla società in rete (Castells).'),
(327, 2, 'Cosa si intende per "teoria critica" (Scuola di Francoforte) e la sua evoluzione contemporanea?'),
(327, 3, 'Spiega il concetto di "campo" e "habitus" in Pierre Bourdieu.'),
(327, 4, 'Qual è il contributo della sociologia femminista e postcoloniale alla teoria sociologica?'),
(327, 5, 'Come la sociologia analizza i processi di globalizzazione culturale, economica e politica?');

-- Quiz 328: Antropologia avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(328, 1, 'Descrivi l antropologia simbolica e interpretativa (es. Geertz, Turner).'),
(328, 2, 'Cosa si intende per "antropologia del corpo" e "antropologia delle emozioni"?'),
(328, 3, 'Spiega il contributo dell antropologia allo studio del potere, della violenza e dei conflitti.'),
(328, 4, 'Qual è il ruolo dell antropologia pubblica e dell engagement civico per gli antropologi contemporanei?'),
(328, 5, 'Come l antropologia digitale studia le interazioni umane mediate dalle tecnologie digitali?');

-- Quiz 329: Storia medievale avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(329, 1, 'Analizza il rapporto tra Papato e Impero nel Medioevo (lotta per le investiture, guelfi e ghibellini).'),
(329, 2, 'Descrivi lo sviluppo delle università medievali e il metodo della Scolastica.'),
(329, 3, 'Quale fu l impatto delle eresie medievali (es. Catari, Valdesi) e della risposta della Chiesa (Inquisizione)?'),
(329, 4, 'Spiega la formazione delle monarchie nazionali in Francia, Inghilterra e Spagna.'),
(329, 5, 'Cosa si intende per "storia di genere" applicata al periodo medievale?');

-- Quiz 330: Letteratura inglese avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(330, 1, 'Descrivi l importanza di Geoffrey Chaucer e dei "Canterbury Tales" per la lingua e la letteratura inglese.'),
(330, 2, 'Quali sono le caratteristiche del teatro elisabettiano e giacomiano, oltre a Shakespeare (es. Marlowe, Jonson)?'),
(330, 3, 'Parla della poesia metafisica inglese del XVII secolo (es. Donne, Herbert).'),
(330, 4, 'Cosa si intende per "critica letteraria postcoloniale" applicata alla letteratura inglese?'),
(330, 5, 'Come la letteratura inglese contemporanea riflette sulle questioni dell identità britannica, della globalizzazione e del multiculturalismo?');

-- Quiz 331: Fisica quantistica avanzata III
INSERT INTO Domanda (quiz, numero, testo) VALUES
(331, 1, 'Cosa sono i "sistemi quantistici a molti corpi" e quali sono le sfide nel loro studio?'),
(331, 2, 'Descrivi il fenomeno della "condensazione di Bose-Einstein" e le sue proprietà.'),
(331, 3, 'Cos è l "effetto Hall quantistico" (intero e frazionario)?'),
(331, 4, 'Spiega i principi della "crittografia quantistica".'),
(331, 5, 'Quali sono le prospettive per lo sviluppo di "sensori quantistici" ad alta precisione?');

-- Quiz 332: Chimica inorganica avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(332, 1, 'Descrivi la chimica dei lantanidi e degli attinidi.'),
(332, 2, 'Cosa si intende per "chimica bioinorganica" e il ruolo dei metalli nei sistemi biologici?'),
(332, 3, 'Spiega i meccanismi delle reazioni dei complessi metallici (sostituzione, redox).'),
(332, 4, 'Quali sono le applicazioni dei composti di coordinazione in catalisi e scienza dei materiali?'),
(332, 5, 'Cosa si intende per "chimica dello stato solido inorganica" e la sintesi di nuovi materiali?');

-- Quiz 333: Geologia avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(333, 1, 'Descrivi i processi di formazione dei giacimenti minerari.'),
(333, 2, 'Cosa si intende per "geochimica isotopica" e le sue applicazioni nella datazione e tracciamento dei processi geologici?'),
(333, 3, 'Spiega la sismologia e l utilizzo delle onde sismiche per studiare l interno della Terra.'),
(333, 4, 'Qual è il ruolo della geologia nella valutazione e mitigazione dei rischi naturali (terremoti, vulcani, frane)?'),
(333, 5, 'Cosa si intende per "geologia planetaria" e lo studio di altri corpi celesti?');

-- Quiz 334: Storia romana avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(334, 1, 'Analizza le trasformazioni economiche e sociali della tarda Repubblica Romana.'),
(334, 2, 'Descrivi l organizzazione dell esercito romano e la sua evoluzione.'),
(334, 3, 'Quale fu il ruolo delle province nell Impero Romano e i rapporti con il potere centrale?'),
(334, 4, 'Spiega la diffusione del Cristianesimo nell Impero Romano e le sue conseguenze.'),
(334, 5, 'Cosa si intende per "crisi del III secolo" e come portò alla Tetrarchia e al Dominato?');

-- Quiz 335: Matematica di base avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(335, 1, 'Descrivi i fondamenti della teoria degli insiemi (assiomi di Zermelo-Fraenkel).'),
(335, 2, 'Cosa sono i numeri complessi e le loro rappresentazioni (algebrica, trigonometrica, esponenziale)?'),
(335, 3, 'Spiega i principi fondamentali dell algebra lineare (spazi vettoriali, trasformazioni lineari, autovalori e autovettori).'),
(335, 4, 'Quali sono i concetti base del calcolo infinitesimale (limiti, derivate, integrali) e le loro interrelazioni (teorema fondamentale)?'),
(335, 5, 'Cosa si intende per "strutture algebriche" fondamentali (gruppi, anelli, campi)?');

-- Quiz 336: Fisica classica avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(336, 1, 'Descrivi la formulazione lagrangiana e hamiltoniana della meccanica classica.'),
(336, 2, 'Cosa sono le "piccole oscillazioni" e il formalismo dei modi normali?'),
(336, 3, 'Spiega la teoria classica dei campi (es. campo elettromagnetico secondo Maxwell).'),
(336, 4, 'Qual è il ruolo dei principi variazionali (es. principio di minima azione) in fisica classica?'),
(336, 5, 'Cosa si intende per "meccanica statistica" e la sua connessione con la termodinamica?');

-- Quiz 337: Letteratura francese avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(337, 1, 'Analizza l importanza di Montaigne e dei suoi "Essais" per il pensiero e la letteratura europea.'),
(337, 2, 'Descrivi il teatro classico francese del XVII secolo (Corneille, Racine, Molière) e le sue regole.'),
(337, 3, 'Quale fu l impatto dell Illuminismo sulla letteratura francese (Voltaire, Rousseau, Diderot)?'),
(337, 4, 'Spiega le caratteristiche del Romanticismo francese (Hugo, Lamartine, Musset) rispetto ad altri romanticismi europei.'),
(337, 5, 'Cosa si intende per "critica letteraria strutturalista" e "post-strutturalista" francese (es. Barthes, Foucault, Derrida)?');

-- Quiz 338: Geografia italiana avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(338, 1, 'Analizza le dinamiche demografiche recenti in Italia (invecchiamento, flussi migratori interni ed esterni).'),
(338, 2, 'Descrivi i principali sistemi produttivi locali (distretti industriali, cluster) in Italia e la loro evoluzione.'),
(338, 3, 'Qual è l impatto del turismo sull economia e sul paesaggio italiano, con focus su aree specifiche?'),
(338, 4, 'Spiega le disuguaglianze territoriali in Italia (questione meridionale, aree interne) e le politiche di coesione.'),
(338, 5, 'Cosa si intende per "pianificazione territoriale e urbanistica" in Italia e quali sono le sfide attuali (es. consumo di suolo, rischio idrogeologico)?');

-- Quiz 339: Chimica analitica avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(339, 1, 'Descrivi le tecniche di spettrometria di massa accoppiata (es. LC-MS, GC-MS) e le loro applicazioni.'),
(339, 2, 'Cosa si intende per "analisi multivariata dei dati" (es. PCA, PLS) in chimica analitica?'),
(339, 3, 'Spiega i principi e le applicazioni dei sensori chimici e biosensori avanzati.'),
(339, 4, 'Quali sono le sfide nell analisi di campioni complessi (es. matrici biologiche, ambientali)?'),
(339, 5, 'Cosa si intende per "metabolomica" e "lipidomica" e quali tecniche analitiche utilizzano?');

-- Quiz 340: Biologia molecolare avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(340, 1, 'Descrivi i meccanismi di regolazione dell espressione genica negli eucarioti (trascrizionale, post-trascrizionale, traduzionale).'),
(340, 2, 'Cosa si intende per "genomica funzionale" e "proteomica"?'),
(340, 3, 'Spiega il ruolo degli RNA non codificanti (es. lncRNA, circRNA) nella cellula.'),
(340, 4, 'Quali sono le basi molecolari del cancro e le nuove strategie terapeutiche (es. immunoterapia, terapie mirate)?'),
(340, 5, 'Cosa si intende per "editing genomico" (es. CRISPR-Cas9) e le sue implicazioni etiche e scientifiche?');

-- Quiz 341: Storia greca avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(341, 1, 'Analizza le origini e lo sviluppo della polis greca.'),
(341, 2, 'Descrivi le riforme di Solone e Clistene e la nascita della democrazia ateniese.'),
(341, 3, 'Quale fu l impatto delle Guerre Persiane sulla Grecia e sull egemonia ateniese?'),
(341, 4, 'Spiega le cause, lo svolgimento e le conseguenze della Guerra del Peloponneso.'),
(341, 5, 'Cosa si intende per "crisi della polis" nel IV secolo a.C. e l ascesa della Macedonia?');

-- Quiz 342: Letteratura spagnola avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(342, 1, 'Analizza l importanza del "Cantar de Mio Cid" come poema epico castigliano.'),
(342, 2, 'Descrivi il "Siglo de Oro" spagnolo e i suoi principali generi e autori (es. Cervantes, Lope de Vega, Calderón, Quevedo, Góngora).'),
(342, 3, 'Quale fu l impatto del Romanticismo e del Realismo sulla letteratura spagnola del XIX secolo?'),
(342, 4, 'Spiega il ruolo della Generazione del  98 e del  27 nel rinnovamento della letteratura spagnola.'),
(342, 5, 'Cosa si intende per "Boom latinoamericano" e la sua influenza sulla letteratura in lingua spagnola?');

-- Quiz 343: Filosofia moderna avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(343, 1, 'Analizza la "Critica della ragion pura" di Kant e la sua rivoluzione copernicana in filosofia.'),
(343, 2, 'Descrivi il sistema filosofico di Hegel (fenomenologia, logica, filosofia della natura e dello spirito).'),
(343, 3, 'Qual è la critica di Marx alla filosofia hegeliana e il suo concetto di alienazione?'),
(343, 4, 'Spiega la filosofia della "volontà di vivere" di Schopenhauer e la sua etica della compassione.'),
(343, 5, 'Cosa si intende per "nichilismo" in Nietzsche e la sua proposta del "superuomo"?');

-- Quiz 344: Psicologia sociale avanzata II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(344, 1, 'Descrivi le teorie sull influenza minoritaria e l innovazione sociale (es. Moscovici).'),
(344, 2, 'Cosa si intende per "rappresentazioni sociali" e come si formano e si trasformano?'),
(344, 3, 'Spiega i processi di categorizzazione sociale, stereotipizzazione e pregiudizio in una prospettiva cognitiva e motivazionale.'),
(344, 4, 'Qual è il contributo della psicologia sociale discorsiva e costruzionista?'),
(344, 5, 'Come la psicologia sociale applicata affronta problemi concreti in ambiti come la salute, l ambiente, la giustizia?');

-- Quiz 345: Economia aziendale avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(345, 1, 'Analizza i modelli di business innovativi nell era digitale (es. piattaforme, freemium).'),
(345, 2, 'Descrivi le strategie di crescita delle imprese (interna, esterna, fusioni e acquisizioni).'),
(345, 3, 'Cosa si intende per "valutazione d azienda" e quali sono i principali metodi?'),
(345, 4, 'Spiega l importanza del "brand management" e della costruzione del valore di marca.'),
(345, 5, 'Come le aziende implementano strategie di sostenibilità e responsabilità sociale d impresa (CSR) avanzate?');

-- Quiz 346: Sociologia urbana avanzata II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(346, 1, 'Analizza le teorie sulla "scuola di Los Angeles" e la sua critica alla Scuola di Chicago.'),
(346, 2, 'Descrivi il concetto di "spazio conteso" (contested space) e i conflitti urbani.'),
(346, 3, 'Cosa si intende per "gentrificazione" e quali sono i suoi effetti sociali, economici e culturali?'),
(346, 4, 'Spiega il ruolo delle politiche abitative nella forma e nelle disuguaglianze urbane.'),
(346, 5, 'Come la sociologia urbana studia i fenomeni di informalità (es. insediamenti, economia) nelle città del Sud globale?');

-- Quiz 347: Antropologia culturale avanzata II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(347, 1, 'Analizza il dibattito sull universalismo vs relativismo culturale in antropologia.'),
(347, 2, 'Descrivi l antropologia della globalizzazione e lo studio dei flussi transnazionali (persone, merci, idee).'),
(347, 3, 'Cosa si intende per "antropologia dei media" e "antropologia digitale"?'),
(347, 4, 'Spiega il contributo dell antropologia allo studio dei diritti umani e della giustizia sociale.'),
(347, 5, 'Quali sono le sfide metodologiche ed etiche della ricerca etnografica nel XXI secolo?');

-- Quiz 348: Storia moderna avanzata II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(348, 1, 'Analizza le cause e le conseguenze della "crisi generale del XVII secolo" in Europa.'),
(348, 2, 'Descrivi lo sviluppo del pensiero scientifico e la "Rivoluzione Scientifica" (Copernico, Keplero, Galileo, Newton).'),
(348, 3, 'Quale fu l impatto dell Illuminismo sulla politica, la società e la cultura europea?'),
(348, 4, 'Spiega le origini e lo sviluppo del sistema degli stati europei e della diplomazia moderna.'),
(348, 5, 'Cosa si intende per "storia atlantica" e come ridefinisce la storia moderna?');

-- Quiz 349: Letteratura tedesca avanzata II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(349, 1, 'Analizza l importanza di Goethe e Schiller e il periodo del Classicismo di Weimar.'),
(349, 2, 'Descrivi il Romanticismo tedesco (fratelli Schlegel, Novalis, Hoffmann) e le sue specificità.'),
(349, 3, 'Quale fu l impatto del Realismo e del Naturalismo sulla letteratura tedesca del XIX secolo?'),
(349, 4, 'Spiega le avanguardie letterarie tedesche del primo Novecento (Espressionismo, Dadaismo).'),
(349, 5, 'Cosa si intende per "letteratura dell esilio" durante il periodo nazista e chi ne furono i principali esponenti?');

-- Quiz 350: Fisica applicata avanzata II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(350, 1, 'Analizza i principi della microscopia elettronica (TEM, SEM) e a forza atomica (AFM).'),
(350, 2, 'Descrivi le applicazioni della fisica dei plasmi (es. fusione, trattamenti superficiali, illuminazione).'),
(350, 3, 'Cosa si intende per "metamateriali" e le loro proprietà ottiche, acustiche o meccaniche insolite?'),
(350, 4, 'Spiega lo sviluppo e le applicazioni dei laser a femtosecondi.'),
(350, 5, 'Quali sono le frontiere della ricerca in biofisica e fisica medica?');

-- Quiz 351: Chimica fisica avanzata II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(351, 1, 'Analizza i fondamenti della chimica quantistica e l equazione di Schrödinger per sistemi molecolari.'),
(351, 2, 'Descrivi le teorie avanzate sulla cinetica chimica (es. teoria RRKM, dinamica delle reazioni).'),
(351, 3, 'Cosa si intende per "elettrochimica delle interfacce" e fenomeni come la doppio strato elettrico?'),
(351, 4, 'Spiega la chimica delle superfici e la catalisi eterogenea a livello molecolare.'),
(351, 5, 'Quali sono le applicazioni della spettroscopia avanzata (es. NMR multidimensionale, spettroscopia risolta nel tempo) allo studio di sistemi complessi?');

-- Quiz 352: Geografia fisica avanzata III
INSERT INTO Domanda (quiz, numero, testo) VALUES
(352, 1, 'Analizza i modelli di circolazione oceanica globale (correnti superficiali e profonde, conveyor belt).'),
(352, 2, 'Descrivi la dinamica delle placche tettoniche e i processi associati ai margini (sismicità, vulcanismo, orogenesi).'),
(352, 3, 'Cosa si intende per "paleoclimatologia" e quali sono i proxies utilizzati per ricostruire i climi del passato?'),
(352, 4, 'Spiega i cicli biogeochimici globali (carbonio, azoto, fosforo) e l impatto antropico su di essi.'),
(352, 5, 'Come si utilizzano i modelli numerici in geografia fisica per simulare processi atmosferici, oceanici o geomorfologici?');

-- Quiz 353: Storia dell Europa avanzata II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(353, 1, 'Analizza le interpretazioni storiografiche della Guerra Fredda e delle sue conclusioni.'),
(353, 2, 'Descrivi l evoluzione dello Stato sociale europeo nel secondo dopoguerra e le sue crisi recenti.'),
(353, 3, 'Qual è stato l impatto dei movimenti del 1989 e della dissoluzione del blocco sovietico sull Europa?'),
(353, 4, 'Spiega il processo di integrazione europea dai Trattati di Roma ad oggi, includendo sfide e successi.'),
(353, 5, 'Cosa si intende per "memoria storica" in Europa e come vengono affrontati i passati traumatici (es. Shoah, colonialismo, totalitarismi)?');

-- Quiz 354: Matematica finanziaria avanzata II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(354, 1, 'Analizza i modelli per la struttura a termine dei tassi d interesse (es. Vasicek, Cox-Ingersoll-Ross).'),
(354, 2, 'Descrivi le tecniche di valutazione dei derivati su tassi d interesse (es. cap, floor, swap).'),
(354, 3, 'Cosa si intende per "misura di martingala equivalente" nel pricing dei derivati?'),
(354, 4, 'Spiega i metodi numerici (es. Monte Carlo, alberi binomiali) per la valutazione di opzioni complesse.'),
(354, 5, 'Quali sono le applicazioni della matematica finanziaria nella gestione del rischio assicurativo (Solvency II)?');

-- Quiz 355: Fisica teorica avanzata II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(355, 1, 'Analizza le diverse formulazioni della Teoria Quantistica dei Campi (canonica, path integral).'),
(355, 2, 'Descrivi la teoria delle perturbazioni e i diagrammi di Feynman in QED o QCD.'),
(355, 3, 'Cosa si intende per "anomalie quantistiche" e le loro conseguenze?'),
(355, 4, 'Spiega la termodinamica dei buchi neri e la radiazione di Hawking.'),
(355, 5, 'Quali sono le principali teorie candidate per la "nuova fisica" oltre il Modello Standard (es. SUSY, dimensioni extra, technicolor)?');

-- Quiz 356: Letteratura russa avanzata II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(356, 1, 'Analizza l importanza di Gogol e del grottesco nella letteratura russa.'),
(356, 2, 'Descrivi il dibattito tra Slavofili e Occidentalisti nel XIX secolo e il suo riflesso in letteratura.'),
(356, 3, 'Quale fu l impatto del Simbolismo e delle avanguardie (Futurismo, Acmeismo) sulla poesia russa del primo Novecento?'),
(356, 4, 'Spiega il concetto di "dialogismo" in Michail Bachtin e la sua applicazione all analisi letteraria.'),
(356, 5, 'Cosa si intende per "letteratura del GULag" e chi ne furono i principali testimoni e narratori?');

-- Quiz 357: Geografia politica avanzata II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(357, 1, 'Analizza le teorie classiche della geopolitica (es. Mackinder, Spykman, Mahan) e la loro rilevanza attuale.'),
(357, 2, 'Descrivi il concetto di "territorialità" e le sue diverse manifestazioni politiche e sociali.'),
(357, 3, 'Cosa si intende per "geopolitica critica" e come decostruisce i discorsi geopolitici dominanti?'),
(357, 4, 'Spiega il ruolo dei confini (borders) nella regolazione dei flussi (persone, merci, capitali) e nella costruzione delle identità.'),
(357, 5, 'Come la geografia politica analizza i conflitti etnici, le guerre civili e i processi di state failure?');

-- Quiz 358: Chimica industriale avanzata II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(358, 1, 'Analizza i processi di separazione avanzati utilizzati nell industria chimica (es. membrane, adsorbimento, cromatografia preparativa).'),
(358, 2, 'Descrivi la progettazione e l ottimizzazione dei reattori chimici multifase.'),
(358, 3, 'Cosa si intende per sicurezza intrinseca dei processi chimici?'),
(358, 4, 'Spiega l applicazione della catalisi enzimatica e della biocatalisi nei processi industriali.'),
(358, 5, 'Quali sono le sfide e le opportunità per l industria chimica nell ambito dell economia circolare e della bioeconomia?');

-- Quiz 359: Biologia evolutiva avanzata II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(359, 1, 'Analizza i modelli matematici e computazionali utilizzati nello studio della dinamica evolutiva delle popolazioni.'),
(359, 2, 'Descrivi l evoluzione dei sistemi di riproduzione sessuale e asessuale.'),
(359, 3, 'Cosa si intende per "conflitto genetico" (es. conflitto intragenomico, conflitto genitori-figli)?'),
(359, 4, 'Spiega l evoluzione della socialità e della cooperazione negli animali (selezione di parentela, altruismo reciproco).'),
(359, 5, 'Qual è il contributo della biologia evolutiva alla comprensione delle malattie umane (medicina evoluzionistica)?');

-- Quiz 360: Storia dell Asia avanzata II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(360, 1, 'Analizza l impatto del colonialismo europeo sulle strutture politiche, economiche e sociali dell Asia.'),
(360, 2, 'Descrivi i movimenti nazionalisti e le lotte per l indipendenza in Asia nel XX secolo.'),
(360, 3, 'Quale fu il ruolo dell Asia nella Guerra Fredda e la formazione di alleanze regionali?'),
(360, 4, 'Spiega i diversi modelli di sviluppo economico adottati dai paesi asiatici nel secondo dopoguerra.'),
(360, 5, 'Cosa si intende per "storia transnazionale" applicata all Asia e lo studio delle connessioni regionali e globali?');

-- Quiz 361: Letteratura americana avanzata II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(361, 1, 'Analizza l importanza del Trascendentalismo (Emerson, Thoreau) e la sua influenza sulla cultura americana.'),
(361, 2, 'Descrivi il Realismo e il Naturalismo nella letteratura americana del tardo XIX secolo (es. Twain, James, Crane, Dreiser).'),
(361, 3, 'Quale fu l impatto del Modernismo sulla poesia e sulla narrativa americana (es. Pound, Eliot, Faulkner, Hemingway, Fitzgerald)?'),
(361, 4, 'Spiega lo sviluppo della letteratura afroamericana dal Rinascimento di Harlem ai giorni nostri.'),
(361, 5, 'Cosa si intende per "letteratura postmoderna" americana e quali sono i suoi autori e temi principali (es. Pynchon, DeLillo, Morrison)?');

-- Quiz 362: Filosofia contemporanea avanzata II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(362, 1, 'Analizza la svolta linguistica (linguistic turn) nella filosofia del XX secolo e le sue diverse correnti (es. filosofia analitica, ermeneutica).'),
(362, 2, 'Descrivi la fenomenologia di Husserl e le sue successive evoluzioni (Heidegger, Merleau-Ponty, Levinas).'),
(362, 3, 'Qual è il contributo della Scuola di Francoforte (Adorno, Horkheimer, Habermas) alla critica della società contemporanea?'),
(362, 4, 'Spiega il post-strutturalismo francese (Foucault, Derrida, Deleuze) e la sua decostruzione dei concetti tradizionali.'),
(362, 5, 'Cosa si intende per "etica applicata" e quali sono i dibattiti principali in bioetica, etica ambientale o etica degli affari?');

-- Quiz 363: Psicologia clinica avanzata II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(363, 1, 'Analizza i modelli eziopatogenetici complessi dei disturbi mentali (es. modello biopsicosociale, modello diatesi-stress).'),
(363, 2, 'Descrivi gli approcci terapeutici di terza generazione (es. ACT, DBT, Schema Therapy).'),
(363, 3, 'Cosa si intende per "valutazione neuropsicologica" e il suo ruolo nella diagnosi differenziale?'),
(363, 4, 'Spiega l importanza della ricerca sull efficacia dei trattamenti psicoterapeutici (outcome research, process research).'),
(363, 5, 'Quali sono le sfide cliniche ed etiche nel lavoro con popolazioni specifiche (es. bambini, anziani, migranti, pazienti con comorbilità)?');

-- Quiz 364: Economia politica avanzata II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(364, 1, 'Analizza le diverse teorie della crescita economica (es. Solow, crescita endogena, istituzionale).'),
(364, 2, 'Descrivi i modelli di economia politica che integrano fattori politici e istituzionali nell analisi economica.'),
(364, 3, 'Cosa si intende per "economia sperimentale" e "economia comportamentale" e le loro implicazioni per la teoria e la politica?'),
(364, 4, 'Spiega le cause e le conseguenze delle crisi finanziarie globali e le risposte di politica economica.'),
(364, 5, 'Quali sono le principali sfide per l economia politica contemporanea (es. disuguaglianza, sostenibilità ambientale, globalizzazione)?');

-- Quiz 365: Sociologia rurale avanzata II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(365, 1, 'Analizza le teorie sulla globalizzazione dell agricoltura e del sistema alimentare (food regimes, catene globali del valore).'),
(365, 2, 'Descrivi i processi di differenziazione sociale e la formazione di nuove classi nelle aree rurali.'),
(365, 3, 'Cosa si intende per "sviluppo rurale sostenibile" e quali sono le sue dimensioni e indicatori?'),
(365, 4, 'Spiega il ruolo della governance multi-livello (locale, regionale, nazionale, europea) nelle politiche rurali.'),
(365, 5, 'Come la sociologia rurale studia i movimenti sociali legati all ambiente, al cibo e alla terra (es. sovranità alimentare, agroecologia)?');

-- Quiz 366: Antropologia fisica avanzata II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(366, 1, 'Analizza l evoluzione del cervello e delle capacità cognitive nel genere Homo.'),
(366, 2, 'Descrivi l importanza dell approccio bioculturale nello studio della salute e della malattia umana.'),
(366, 3, 'Cosa ci dice la genetica delle popolazioni antiche (paleogenomica) sulle migrazioni e le mescolanze umane?'),
(366, 4, 'Spiega l adattamento umano a diversi ambienti (climi estremi, alta quota, diete specifiche) da una prospettiva evolutiva.'),
(366, 5, 'Quali sono le implicazioni dell antropologia fisica per la comprensione della diversità umana contemporanea e la critica al concetto di razza?');

-- Quiz 367: Storia dell Africa avanzata II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(367, 1, 'Analizza le diverse forme di Stato e di organizzazione politica nell Africa pre-coloniale.'),
(367, 2, 'Descrivi l impatto economico, sociale e politico della tratta atlantica degli schiavi sulle società africane.'),
(367, 3, 'Quali furono le diverse strategie di resistenza africana al colonialismo europeo?'),
(367, 4, 'Spiega le sfide della costruzione dello Stato-nazione nell Africa post-coloniale (confini artificiali, conflitti etnici, neocolonialismo).'),
(367, 5, 'Cosa si intende per "storia orale" e quale è la sua importanza per la ricostruzione della storia africana?');

-- Quiz 368: Letteratura giapponese avanzata II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(368, 1, 'Analizza l estetica del "mono no aware" (pathos delle cose) nella letteratura classica giapponese.'),
(368, 2, 'Descrivi lo sviluppo del romanzo moderno giapponese e l influenza di autori come Natsume Sōseki o Mori Ōgai.'),
(368, 3, 'Quale fu il ruolo della letteratura durante il periodo militarista e la Seconda Guerra Mondiale?'),
(368, 4, 'Spiega le caratteristiche della letteratura giapponese del dopoguerra e autori come Mishima, Kawabata, Tanizaki.'),
(368, 5, 'Cosa si intende per "letteratura femminile" (joryū bungaku) in Giappone e quali sono le sue autrici e temi principali?');

-- Quiz 369: Fisica nucleare avanzata II
INSERT INTO Domanda (quiz, numero, testo) VALUES
(369, 1, 'Analizza la fisica delle interazioni deboli e la violazione della parità.'),
(369, 2, 'Descrivi la cromodinamica quantistica (QCD) e le proprietà dei quark e dei gluoni (confinamento, libertà asintotica).'),
(369, 3, 'Cosa si intende per "fisica degli ioni pesanti relativistici" e lo studio del plasma di quark e gluoni?'),
(369, 4, 'Spiega la fisica dei neutrini (oscillazioni, massa) e le sue implicazioni.'),
(369, 5, 'Quali sono le frontiere della ricerca in fisica nucleare e delle particelle (es. ricerca di materia oscura, fisica oltre il Modello Standard)?');

-- Quiz 370: Storia dell antico Giappone
INSERT INTO Domanda (quiz, numero, testo) VALUES
(370, 1, 'Quali reperti archeologici caratterizzano il periodo Jōmon?'),
(370, 2, 'Come l introduzione dell agricoltura del riso ha trasformato la società nel periodo Yayoi?'),
(370, 3, 'Cosa rappresentano i tumuli Kofun e quale struttura sociale riflettono?'),
(370, 4, 'Descrivi le riforme Taika e l adozione del modello statale cinese nel periodo Asuka.'),
(370, 5, 'Qual è l importanza della capitale Nara e del tempio Tōdai-ji nel periodo Nara?');

-- Quiz 371: Matematica per ingegneri
INSERT INTO Domanda (quiz, numero, testo) VALUES
(371, 1, 'Come si risolvono sistemi di equazioni lineari utilizzando metodi matriciali (es. Gauss-Jordan)?'),
(371, 2, 'Quali sono le principali applicazioni del calcolo differenziale e integrale in ingegneria?'),
(371, 3, 'Cosa sono le equazioni differenziali ordinarie e come si applicano a problemi ingegneristici (es. circuiti, meccanica)?'),
(371, 4, 'Descrivi l uso delle trasformate di Laplace o di Fourier nella soluzione di problemi ingegneristici.'),
(371, 5, 'Quali sono i fondamenti del calcolo vettoriale (gradiente, divergenza, rotore) e le loro applicazioni (es. fluidodinamica, elettromagnetismo)?');

-- Quiz 372: Fisica delle onde sonore
INSERT INTO Domanda (quiz, numero, testo) VALUES
(372, 1, 'Come si propagano le onde sonore nei diversi mezzi (solidi, liquidi, gas)?'),
(372, 2, 'Cosa sono l intensità e il livello sonoro (decibel)?'),
(372, 3, 'Descrivi il fenomeno della risonanza acustica e le onde stazionarie in tubi e corde.'),
(372, 4, 'Spiega l effetto Doppler per le onde sonore e le sue applicazioni.'),
(372, 5, 'Cosa sono gli ultrasuoni e gli infrasuoni e quali sono i loro utilizzi?');

-- Quiz 373: Letteratura medievale europea
INSERT INTO Domanda (quiz, numero, testo) VALUES
(373, 1, 'Quali sono le principali differenze tra l epica germanica (es. Beowulf, Nibelunghi) e l epica romanza (es. Chanson de Roland)?'),
(373, 2, 'Descrivi lo sviluppo della lirica trobadorica provenzale e il concetto di amor cortese.'),
(373, 3, 'Qual è l importanza del ciclo arturiano (Chrétien de Troyes, Malory) nella letteratura europea?'),
(373, 4, 'Parla della "Divina Commedia" di Dante come summa del sapere medievale.'),
(373, 5, 'Cita un esempio di letteratura allegorica o didattica medievale (es. Roman de la Rose).');

-- Quiz 374: Geografia delle Alpi
INSERT INTO Domanda (quiz, numero, testo) VALUES
(374, 1, 'Come si sono formate le Alpi dal punto di vista geologico (orogenesi alpina)?'),
(374, 2, 'Descrivi le principali forme di modellamento glaciale presenti nelle Alpi (valli a U, circhi, morene).'),
(374, 3, 'Quali sono le caratteristiche climatiche delle diverse fasce altitudinali alpine?'),
(374, 4, 'Parla della distribuzione della popolazione e delle attività economiche tradizionali (agricoltura, allevamento) e moderne (turismo) nelle Alpi.'),
(374, 5, 'Quali sono le principali sfide ambientali per l ecosistema alpino (cambiamenti climatici, turismo di massa, gestione delle risorse)?');

-- Quiz 375: Chimica dei polimeri
INSERT INTO Domanda (quiz, numero, testo) VALUES
(375, 1, 'Qual è la differenza tra polimeri naturali e sintetici? Fornisci esempi.'),
(375, 2, 'Descrivi i principali meccanismi di polimerizzazione (addizione radicalica, ionica, condensazione).'),
(375, 3, 'Cosa si intende per "peso molecolare medio" di un polimero e come si determina?'),
(375, 4, 'Spiega la differenza tra polimeri termoplastici e termoindurenti.'),
(375, 5, 'Cita alcune importanti applicazioni dei polimeri nella vita quotidiana (es. plastiche, fibre tessili, adesivi).');

-- Quiz 376: Biologia delle piante
INSERT INTO Domanda (quiz, numero, testo) VALUES
(376, 1, 'Descrivi la struttura e la funzione della cellula vegetale (parete cellulare, vacuolo, cloroplasti).'),
(376, 2, 'Quali sono i principali tessuti vegetali (meristematici, parenchimatici, tegumentali, conduttori, meccanici)?'),
(376, 3, 'Spiega il processo della fotosintesi clorofilliana.'),
(376, 4, 'Come avviene il trasporto dell acqua e dei nutrienti nelle piante (xilema e floema)?'),
(376, 5, 'Descrivi i meccanismi di riproduzione delle piante (sessuata e asessuata, impollinazione, fecondazione).');

-- Quiz 377: Storia della filosofia greca
INSERT INTO Domanda (quiz, numero, testo) VALUES
(377, 1, 'Quali furono le principali scuole presocratiche (ionica, pitagorica, eleatica, atomista) e le loro domande fondamentali?'),
(377, 2, 'Descrivi il metodo e il pensiero di Socrate (ironia, maieutica, intellettualismo etico).'),
(377, 3, 'Qual è la teoria delle Idee di Platone e la sua concezione dello Stato ideale?'),
(377, 4, 'Spiega la logica, la metafisica e l etica di Aristotele.'),
(377, 5, 'Confronta le filosofie ellenistiche (stoicismo, epicureismo, scetticismo) riguardo alla ricerca della felicità.');

-- Quiz 378: Astronomia e galassie
INSERT INTO Domanda (quiz, numero, testo) VALUES
(378, 1, 'Descrivi la struttura della nostra galassia, la Via Lattea (disco, bulge, alone).'),
(378, 2, 'Come vengono classificate le galassie (sequenza di Hubble)?'),
(378, 3, 'Cosa sono gli ammassi di galassie e i superammassi?'),
(378, 4, 'Spiega come si misura la distanza delle galassie (es. Cefeidi, Supernovae Ia, legge di Hubble).'),
(378, 5, 'Qual è il ruolo della materia oscura nell evoluzione e nella dinamica delle galassie?');

-- Quiz 379: Informatica e algoritmi
INSERT INTO Domanda (quiz, numero, testo) VALUES
(379, 1, 'Cosa si intende per "complessità computazionale" di un algoritmo (O-grande)?'),
(379, 2, 'Descrivi un algoritmo di ordinamento comune (es. Bubble Sort, Merge Sort, Quick Sort).'),
(379, 3, 'Cosa sono le strutture dati fondamentali come liste, pile, code, alberi e grafi?'),
(379, 4, 'Spiega un algoritmo di ricerca comune (es. ricerca lineare, ricerca binaria).'),
(379, 5, 'Cita un esempio di algoritmo greedy o di programmazione dinamica.');

-- Quiz 380: Filosofia politica moderna
INSERT INTO Domanda (quiz, numero, testo) VALUES
(380, 1, 'Descrivi il pensiero politico di Machiavelli ne "Il Principe".'),
(380, 2, 'Confronta le teorie del contratto sociale di Hobbes, Locke e Rousseau.'),
(380, 3, 'Qual è la concezione dello Stato e della libertà in Montesquieu (separazione dei poteri)?'),
(380, 4, 'Spiega la critica di Hume al giusnaturalismo e al contratto sociale.'),
(380, 5, 'Qual è il contributo di Kant alla filosofia politica (stato di diritto, pace perpetua)?');

-- Quiz 381: Psicologia infantile
INSERT INTO Domanda (quiz, numero, testo) VALUES
(381, 1, 'Quali sono le principali tappe dello sviluppo cognitivo secondo Piaget?'),
(381, 2, 'Descrivi la teoria dell attaccamento di Bowlby e i diversi stili di attaccamento.'),
(381, 3, 'Come si sviluppa il linguaggio nei primi anni di vita?'),
(381, 4, 'Spiega l importanza del gioco per lo sviluppo emotivo, sociale e cognitivo del bambino.'),
(381, 5, 'Quali sono i principali fattori che influenzano lo sviluppo della personalità nell infanzia?');

-- Quiz 382: Economia e finanza
INSERT INTO Domanda (quiz, numero, testo) VALUES
(382, 1, 'Qual è la differenza tra mercato monetario e mercato dei capitali?'),
(382, 2, 'Descrivi i principali strumenti finanziari (azioni, obbligazioni, derivati).'),
(382, 3, 'Cosa si intende per "rischio" e "rendimento" in finanza e come sono correlati?'),
(382, 4, 'Spiega il ruolo degli intermediari finanziari (banche, assicurazioni, fondi di investimento).'),
(382, 5, 'Cita un indicatore macroeconomico importante (es. PIL, inflazione, disoccupazione) e spiega il suo significato.');

-- Quiz 383: Sociologia delle città
INSERT INTO Domanda (quiz, numero, testo) VALUES
(383, 1, 'Quali sono le principali teorie della Scuola di Chicago sulla città e l ecologia urbana?'),
(383, 2, 'Descrivi il concetto di "gentrificazione" e i suoi impatti sociali.'),
(383, 3, 'Cosa si intende per "segregazione residenziale" e quali sono le sue cause e conseguenze?'),
(383, 4, 'Spiega il ruolo dello spazio pubblico nella vita sociale e politica urbana.'),
(383, 5, 'Come la globalizzazione sta trasformando le città e creando reti urbane globali?');

-- Quiz 384: Antropologia delle religioni
INSERT INTO Domanda (quiz, numero, testo) VALUES
(384, 1, 'Quali sono le principali teorie antropologiche sulla religione (es. Tylor, Durkheim, Malinowski, Geertz)?'),
(384, 2, 'Descrivi la differenza tra magia, religione e scienza secondo l antropologia classica.'),
(384, 3, 'Cosa sono i miti e i rituali e quale funzione svolgono nelle società?'),
(384, 4, 'Spiega il concetto di "sincretismo religioso" e fornisci un esempio.'),
(384, 5, 'Come l antropologia studia i nuovi movimenti religiosi e la secolarizzazione?');

-- Quiz 385: Storia dell arte rinascimentale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(385, 1, 'Quali sono le caratteristiche distintive del primo Rinascimento fiorentino (Brunelleschi, Donatello, Masaccio)?'),
(385, 2, 'Descrivi l importanza della prospettiva lineare nella pittura rinascimentale.'),
(385, 3, 'Parla dei grandi maestri del Rinascimento maturo (Leonardo, Michelangelo, Raffaello) e delle loro opere principali.'),
(385, 4, 'Quale fu il ruolo del mecenatismo (es. Medici, Papi) nello sviluppo dell arte rinascimentale?'),
(385, 5, 'Confronta il Rinascimento italiano con il Rinascimento nordico (es. Van Eyck, Dürer).');

-- Quiz 386: Letteratura americana contemporanea
INSERT INTO Domanda (quiz, numero, testo) VALUES
(386, 1, 'Quali sono i temi principali trattati dalla letteratura americana postmoderna?'),
(386, 2, 'Descrivi l importanza della letteratura multiculturale negli Stati Uniti (es. autori afroamericani, ispanici, asiatico-americani, nativi americani).'),
(386, 3, 'Cita un opera significativa di un autore/autrice americano/a contemporaneo/a (dagli anni  60 ad oggi).'),
(386, 4, 'Spiega il concetto di "minimalismo" nella narrativa americana contemporanea.'),
(386, 5, 'Come la letteratura americana contemporanea riflette sulle questioni di identità, memoria e trauma?');

-- Quiz 387: Fisica quantistica applicata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(387, 1, 'Come funzionano i laser basandosi sui principi quantistici dell emissione stimolata?'),
(387, 2, 'Descrivi il principio di funzionamento dei transistor e la loro importanza per l elettronica moderna.'),
(387, 3, 'Quali sono le applicazioni della fisica quantistica nell imaging medicale (es. RMN)?'),
(387, 4, 'Spiega come funzionano gli orologi atomici e la loro precisione.'),
(387, 5, 'Cosa si intende per "crittografia quantistica" e quali sono le sue potenzialità?');

-- Quiz 388: Chimica analitica avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(388, 1, 'Descrivi le tecniche di spettrometria atomica (AAS, ICP-AES, ICP-MS) e le loro applicazioni.'),
(388, 2, 'Cosa si intende per "tecniche separative avanzate" (es. HPLC bidimensionale, elettroforesi capillare)?'),
(388, 3, 'Spiega i principi e le applicazioni della spettrometria di massa tandem (MS/MS).'),
(388, 4, 'Qual è il ruolo della chemiometria nell analisi di dati complessi e nella calibrazione multivariata?'),
(388, 5, 'Cita un applicazione della chimica analitica avanzata nel campo della diagnostica medica, del controllo ambientale o della scienza forense.');

-- Quiz 389: Geologia dei vulcani
INSERT INTO Domanda (quiz, numero, testo) VALUES
(389, 1, 'Quali sono i diversi tipi di vulcani (es. a scudo, stratovulcani) e come si formano?'),
(389, 2, 'Descrivi i diversi tipi di eruzioni vulcaniche (effusive, esplosive) e i loro prodotti (lave, piroclasti).'),
(389, 3, 'Cosa sono i magmi e come la loro composizione influenza il tipo di eruzione?'),
(389, 4, 'Spiega come viene monitorata l attività vulcanica per prevedere le eruzioni.'),
(389, 5, 'Quali sono i principali rischi associati al vulcanismo (colate laviche, nubi ardenti, lahar, gas vulcanici)?');

-- Quiz 390: Storia della musica barocca
INSERT INTO Domanda (quiz, numero, testo) VALUES
(390, 1, 'Quali sono le caratteristiche stilistiche principali della musica barocca (basso continuo, stile concertante, teoria degli affetti)?'),
(390, 2, 'Descrivi lo sviluppo dell opera lirica nel periodo barocco (Monteverdi, Händel).'),
(390, 3, 'Parla dell importanza della musica strumentale barocca e delle sue forme (concerto grosso, sonata, suite).'),
(390, 4, 'Chi sono stati i principali compositori del barocco tedesco (Bach, Händel, Telemann)?'),
(390, 5, 'Qual è stata l eredità della musica barocca sui periodi successivi?');

-- Quiz 391: Matematica per economisti
INSERT INTO Domanda (quiz, numero, testo) VALUES
(391, 1, 'Come si utilizzano le derivate per problemi di ottimizzazione in economia (es. massimizzazione del profitto, minimizzazione dei costi)?'),
(391, 2, 'Descrivi l uso dell algebra lineare (matrici e vettori) nei modelli economici (es. input-output).'),
(391, 3, 'Cosa sono le equazioni differenziali e come si applicano ai modelli di crescita economica?'),
(391, 4, 'Spiega l importanza della statistica e della probabilità per l analisi econometrica.'),
(391, 5, 'Cita un teorema matematico fondamentale per la teoria economica (es. teorema del punto fisso di Brouwer).');

-- Quiz 392: Fisica dei materiali avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(392, 1, 'Descrivi le proprietà e le applicazioni dei nanomateriali (es. nanotubi di carbonio, grafene, quantum dots).'),
(392, 2, 'Cosa sono i materiali compositi a matrice metallica, ceramica o polimerica?'),
(392, 3, 'Spiega il concetto di "materiali intelligenti" (smart materials) che rispondono a stimoli esterni.'),
(392, 4, 'Quali sono le tecniche avanzate per la caratterizzazione dei materiali (es. diffrazione X, microscopia elettronica)?'),
(392, 5, 'Cita una sfida attuale nella ricerca sui materiali avanzati (es. materiali per l energia, biomateriali, materiali sostenibili).');

-- Quiz 393: Letteratura francese moderna
INSERT INTO Domanda (quiz, numero, testo) VALUES
(393, 1, 'Quali sono le caratteristiche principali del Realismo e del Naturalismo francese (Balzac, Flaubert, Zola)?'),
(393, 2, 'Descrivi l importanza del Simbolismo nella poesia francese (Baudelaire, Verlaine, Rimbaud, Mallarmé).'),
(393, 3, 'Parla del romanzo moderno francese del primo Novecento (Proust, Gide, Céline).'),
(393, 4, 'Qual è stato l impatto dell Esistenzialismo (Sartre, Camus, de Beauvoir) sulla letteratura francese del dopoguerra?'),
(393, 5, 'Cosa si intende per "Nouveau Roman" e chi ne furono i principali esponenti?');

-- Quiz 394: Geografia economica globale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(394, 1, 'Come si sono evolute le teorie sul commercio internazionale (da Ricardo ai modelli di concorrenza imperfetta)?'),
(394, 2, 'Descrivi il ruolo delle imprese multinazionali e degli investimenti diretti esteri (IDE) nell economia globale.'),
(394, 3, 'Cosa sono le catene globali del valore (global value chains) e come strutturano la produzione mondiale?'),
(394, 4, 'Spiega le cause e le conseguenze delle disuguaglianze economiche a livello globale (Nord/Sud, paesi emergenti).'),
(394, 5, 'Qual è l impatto della globalizzazione finanziaria e delle crisi economiche sull economia mondiale?');

-- Quiz 395: Chimica fisica dei gas
INSERT INTO Domanda (quiz, numero, testo) VALUES
(395, 1, 'Enuncia le leggi dei gas ideali (Boyle, Charles, Gay-Lussac, Avogadro) e l equazione di stato dei gas perfetti.'),
(395, 2, 'Descrivi la teoria cinetica dei gas e come spiega le proprietà macroscopiche (pressione, temperatura).'),
(395, 3, 'Cosa sono i gas reali e come l equazione di van der Waals corregge l idealità?'),
(395, 4, 'Spiega il concetto di "pressione parziale" e la legge di Dalton per le miscele gassose.'),
(395, 5, 'Qual è la relazione tra l energia cinetica media delle molecole di un gas e la sua temperatura assoluta?');

-- Quiz 396: Biologia evolutiva delle specie
INSERT INTO Domanda (quiz, numero, testo) VALUES
(396, 1, 'Definisci il concetto di "specie biologica" e discuti i suoi limiti.'),
(396, 2, 'Descrivi i meccanismi di isolamento riproduttivo (pre-zigotici e post-zigotici).'),
(396, 3, 'Cosa si intende per speciazione allopatrica, parapatrica e simpatrica? Fornisci esempi.'),
(396, 4, 'Spiega il ruolo della selezione naturale, della deriva genetica e del flusso genico nel processo di speciazione.'),
(396, 5, 'Come si utilizzano i dati molecolari (DNA) per studiare la storia evolutiva e la delimitazione delle specie?');

-- Quiz 397: Storia dell Asia orientale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(397, 1, 'Descrivi l unificazione della Cina sotto la dinastia Qin e le sue riforme.'),
(397, 2, 'Qual è stata l importanza delle dinastie Tang e Song per la cultura e la tecnologia cinese?'),
(397, 3, 'Parla dello shogunato Tokugawa in Giappone e della politica del "sakoku" (paese chiuso).'),
(397, 4, 'Come l imperialismo occidentale ha influenzato la Cina e il Giappone nel XIX secolo?'),
(397, 5, 'Quali sono state le principali dinamiche politiche ed economiche in Corea nel XX secolo?');

-- Quiz 398: Letteratura spagnola contemporanea
INSERT INTO Domanda (quiz, numero, testo) VALUES
(398, 1, 'Quali sono stati i principali movimenti e autori della letteratura spagnola dopo la morte di Franco (Transición)?'),
(398, 2, 'Descrivi l importanza del romanzo storico nella narrativa spagnola contemporanea.'),
(398, 3, 'Parla di un autore/autrice spagnolo/a contemporaneo/a di rilievo internazionale (es. Marías, Muñoz Molina, Cercas).'),
(398, 4, 'Come la letteratura spagnola contemporanea affronta i temi della memoria della Guerra Civile e della dittatura?'),
(398, 5, 'Quali sono le tendenze attuali nella poesia e nel teatro spagnolo contemporaneo?');

-- Quiz 399: Filosofia moderna e scienza
INSERT INTO Domanda (quiz, numero, testo) VALUES
(399, 1, 'Quale fu l impatto della rivoluzione copernicana e della nuova astronomia sul pensiero filosofico?'),
(399, 2, 'Descrivi il meccanicismo di Cartesio e la sua visione del mondo fisico.'),
(399, 3, 'Come Newton ha influenzato la filosofia dell Illuminismo (es. Locke, Kant)?'),
(399, 4, 'Spiega il dibattito tra razionalismo ed empirismo riguardo al metodo scientifico.'),
(399, 5, 'Qual è la critica di Kant alla metafisica tradizionale e la sua concezione dei limiti della conoscenza scientifica?');

-- Quiz 400: Psicologia sociale avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(400, 1, 'Descrivi i modelli di cognizione sociale (es. modello del continuum, modelli duali).'),
(400, 2, 'Cosa si intende per "identità sociale" e "categorizzazione del sé"?'),
(400, 3, 'Spiega le teorie avanzate sul pregiudizio e sulla discriminazione intergruppi (es. teoria della dominanza sociale, teoria della giustificazione del sistema).'),
(400, 4, 'Qual è il ruolo delle emozioni nei processi sociali (es. influenza sociale, relazioni intergruppi)?'),
(400, 5, 'Come la psicologia sociale applicata interviene per promuovere il cambiamento sociale e ridurre i conflitti?');

-- Quiz 401: Economia aziendale internazionale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(401, 1, 'Quali sono le principali motivazioni per l internazionalizzazione delle imprese?'),
(401, 2, 'Descrivi le diverse modalità di entrata nei mercati esteri (esportazione, IDE, joint venture, licenze).'),
(401, 3, 'Cosa si intende per "gestione cross-culturale" e quali sfide comporta?'),
(401, 4, 'Spiega le strategie di marketing internazionale (standardizzazione vs adattamento).'),
(401, 5, 'Qual è il ruolo delle imprese multinazionali nell economia globale e quali sono le critiche mosse nei loro confronti?');

-- Quiz 402: Sociologia urbana e rurale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(402, 1, 'Confronta le principali differenze tra le strutture sociali e le relazioni nelle aree urbane e rurali.'),
(402, 2, 'Descrivi il concetto di "continuum rurale-urbano" e i processi di interazione tra città e campagna.'),
(402, 3, 'Cosa si intende per "gentrificazione rurale" e "contro-urbanizzazione"?'),
(402, 4, 'Spiega come le politiche territoriali influenzano lo sviluppo sia urbano che rurale.'),
(402, 5, 'Quali sono le sfide comuni e specifiche per la sostenibilità nelle aree urbane e rurali?');

-- Quiz 403: Antropologia fisica e culturale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(403, 1, 'Come l approccio bioculturale integra le prospettive dell antropologia fisica e culturale?'),
(403, 2, 'Descrivi un esempio di come fattori culturali influenzano la biologia umana (es. dieta, pratiche mediche).'),
(403, 3, 'Cosa si intende per "embodiment" e come il corpo è socialmente e culturalmente costruito?'),
(403, 4, 'Spiega come l antropologia fisica e culturale studiano congiuntamente la crescita, lo sviluppo e la salute umana.'),
(403, 5, 'Qual è il contributo di un approccio integrato allo studio della diversità umana e alla critica delle categorie razziali?');

-- Quiz 404: Storia moderna europea
INSERT INTO Domanda (quiz, numero, testo) VALUES
(404, 1, 'Descrivi le cause e le conseguenze della Riforma Protestante e della Controriforma cattolica.'),
(404, 2, 'Quali furono le caratteristiche dello Stato assoluto in Francia sotto Luigi XIV?'),
(404, 3, 'Parla della Rivoluzione Scientifica e del suo impatto sulla visione del mondo.'),
(404, 4, 'Cosa si intende per Illuminismo e quali furono i suoi principali esponenti e idee?'),
(404, 5, 'Spiega le cause e le fasi principali della Rivoluzione Francese.');

-- Quiz 405: Letteratura tedesca classica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(405, 1, 'Quali sono le caratteristiche principali del periodo del Classicismo di Weimar?'),
(405, 2, 'Descrivi l importanza di Johann Wolfgang von Goethe e cita alcune sue opere fondamentali (es. Faust, I dolori del giovane Werther).'),
(405, 3, 'Parla del contributo di Friedrich Schiller al teatro e alla poesia classica tedesca.'),
(405, 4, 'Qual è il concetto di "Bildung" (formazione) e come si riflette nella letteratura classica tedesca?'),
(405, 5, 'Confronta il Classicismo di Weimar con il precedente movimento dello Sturm und Drang.');

-- Quiz 406: Fisica applicata alla medicina
INSERT INTO Domanda (quiz, numero, testo) VALUES
(406, 1, 'Come funzionano i raggi X e la Tomografia Assiale Computerizzata (TAC)?'),
(406, 2, 'Descrivi i principi della Risonanza Magnetica Nucleare (RMN) per l imaging medico.'),
(406, 3, 'Quali sono le applicazioni degli ultrasuoni in diagnostica (ecografia)?'),
(406, 4, 'Spiega l uso delle radiazioni ionizzanti in terapia (radioterapia).'),
(406, 5, 'Cosa si intende per "medicina nucleare" e quali tecniche utilizza (es. PET, SPECT)?');

-- Quiz 407: Chimica industriale avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(407, 1, 'Descrivi un processo industriale per la produzione di un polimero di largo consumo (es. polietilene, PVC, PET).'),
(407, 2, 'Cosa si intende per "catalisi omogenea" ed "eterogenea" e quali sono i vantaggi/svantaggi nei processi industriali?'),
(407, 3, 'Spiega l importanza dell ingegneria dei reattori chimici per l ottimizzazione dei processi.'),
(407, 4, 'Quali sono le sfide legate alla sicurezza e all impatto ambientale dell industria chimica?'),
(407, 5, 'Come si applicano i principi della "chimica verde" per rendere più sostenibili i processi industriali?');

-- Quiz 408: Geografia politica globale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(408, 1, 'Quali sono le principali teorie sulle relazioni internazionali (es. realismo, liberalismo, costruttivismo) dal punto di vista geografico?'),
(408, 2, 'Descrivi il concetto di "potenza" (hard power, soft power) e la sua distribuzione nello spazio globale.'),
(408, 3, 'Cosa si intende per "geopolitica delle risorse" (energia, acqua, terre rare) e i conflitti associati?'),
(408, 4, 'Spiega il ruolo delle organizzazioni internazionali (ONU, NATO, UE) e regionali nel governo globale.'),
(408, 5, 'Come la globalizzazione e le nuove tecnologie stanno ridisegnando la mappa politica globale?');

-- Quiz 409: Storia dell Europa medievale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(409, 1, 'Descrivi la formazione dei regni romano-barbarici dopo la caduta dell Impero Romano d Occidente.'),
(409, 2, 'Quale fu l importanza dell Impero Carolingio e della figura di Carlo Magno?'),
(409, 3, 'Spiega il sistema feudale e i rapporti vassallatico-beneficiari.'),
(409, 4, 'Parla del ruolo della Chiesa nel Medioevo (potere spirituale e temporale, monachesimo, Crociate).'),
(409, 5, 'Cosa si intende per "rinascita dell anno Mille" e lo sviluppo delle città e dei commerci?');

-- Quiz 410: Matematica finanziaria avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(410, 1, 'Descrivi il modello di Black-Scholes per la valutazione delle opzioni europee.'),
(410, 2, 'Cosa sono i processi stocastici (es. moto Browniano) e come si applicano in finanza?'),
(410, 3, 'Spiega i modelli per la struttura a termine dei tassi d interesse (es. Vasicek, CIR, HJM).'),
(410, 4, 'Quali sono le tecniche per la gestione del rischio di mercato (es. VaR, Expected Shortfall)?'),
(410, 5, 'Cita un applicazione avanzata della matematica finanziaria (es. pricing di derivati esotici, gestione di portafoglio quantitativa).');

-- Quiz 411: Fisica teorica delle particelle
INSERT INTO Domanda (quiz, numero, testo) VALUES
(411, 1, 'Descrivi il Modello Standard delle particelle elementari e le sue componenti (quark, leptoni, bosoni di gauge, Higgs).'),
(411, 2, 'Cosa si intende per "simmetrie di gauge" e il loro ruolo nelle interazioni fondamentali?'),
(411, 3, 'Spiega il meccanismo di Higgs e come conferisce massa alle particelle.'),
(411, 4, 'Quali sono le evidenze sperimentali a supporto del Modello Standard?'),
(411, 5, 'Quali sono i limiti del Modello Standard e le direzioni della ricerca teorica oltre esso (es. SUSY, GUT, teoria delle stringhe)?');

-- Quiz 412: Letteratura russa moderna
INSERT INTO Domanda (quiz, numero, testo) VALUES
(412, 1, 'Quali sono le caratteristiche del Realismo russo del XIX secolo (es. Turgenev, Dostoevskij, Tolstoj)?'),
(412, 2, 'Descrivi l importanza del Simbolismo e delle avanguardie nella poesia russa del primo Novecento (es. Blok, Majakovskij, Achmatova).'),
(412, 3, 'Parla del romanzo russo del XX secolo, tra Realismo Socialista e dissenso (es. Šolochov, Pasternak, Solženicyn, Bulgakov).'),
(412, 4, 'Qual è stato l impatto della Rivoluzione d Ottobre sulla letteratura russa?'),
(412, 5, 'Cita un autore/autrice e un opera significativa della letteratura russa contemporanea (post-sovietica).');

-- Quiz 413: Geografia culturale delle città
INSERT INTO Domanda (quiz, numero, testo) VALUES
(413, 1, 'Come si manifesta la diversità culturale negli spazi urbani (quartieri etnici, paesaggi religiosi)?'),
(413, 2, 'Descrivi il concetto di "immagine della città" (Kevin Lynch) e la sua importanza per l esperienza urbana.'),
(413, 3, 'Cosa si intende per "paesaggio sonoro" (soundscape) urbano?'),
(413, 4, 'Spiega il ruolo dell arte pubblica e dei festival culturali nella vita delle città.'),
(413, 5, 'Come la geografia culturale analizza i processi di mercificazione della cultura e del patrimonio nelle città turistiche?');

-- Quiz 414: Chimica ambientale e sostenibilità
INSERT INTO Domanda (quiz, numero, testo) VALUES
(414, 1, 'Quali sono i principali inquinanti atmosferici (es. PM, NOx, SOx, O3) e i loro effetti sulla salute e sull ambiente?'),
(414, 2, 'Descrivi il ciclo del carbonio e l impatto delle attività umane (effetto serra, cambiamenti climatici).'),
(414, 3, 'Cosa si intende per "chimica verde" e quali sono i suoi 12 principi?'),
(414, 4, 'Spiega le strategie per la gestione sostenibile delle risorse idriche e il trattamento delle acque reflue.'),
(414, 5, 'Qual è il ruolo della chimica nello sviluppo di energie rinnovabili e materiali sostenibili?');

-- Quiz 415: Biologia marina e oceani
INSERT INTO Domanda (quiz, numero, testo) VALUES
(415, 1, 'Descrivi i principali ecosistemi oceanici (es. pelagico, bentonico, barriere coralline, abissi, mangrovie).'),
(415, 2, 'Qual è l importanza delle correnti oceaniche per la distribuzione del calore e dei nutrienti?'),
(415, 3, 'Parla della biodiversità marina e delle principali minacce (pesca eccessiva, inquinamento, cambiamenti climatici, acidificazione).'),
(415, 4, 'Cita alcuni adattamenti specifici degli organismi marini alla pressione, alla salinità o alla mancanza di luce.'),
(415, 5, 'Come si studiano gli oceani e la vita marina (es. campionamenti, tecnologie remote, ROV)?');

-- Quiz 416: Storia dell Oceania moderna
INSERT INTO Domanda (quiz, numero, testo) VALUES
(416, 1, 'Descrivi la colonizzazione europea dell Australia e della Nuova Zelanda e i suoi effetti sulle popolazioni indigene.'),
(416, 2, 'Quale fu il ruolo dell Oceania nella Prima e nella Seconda Guerra Mondiale?'),
(416, 3, 'Parla dei movimenti per l indipendenza e la decolonizzazione nelle isole del Pacifico nel XX secolo.'),
(416, 4, 'Cosa si intende per "questione nucleare" nel Pacifico e i test condotti dalle potenze straniere?'),
(416, 5, 'Quali sono le principali sfide politiche, economiche e ambientali per gli Stati dell Oceania oggi (es. cambiamenti climatici, gestione risorse)?');

-- Quiz 417: Letteratura africana contemporanea
INSERT INTO Domanda (quiz, numero, testo) VALUES
(417, 1, 'Quali sono i temi ricorrenti nella letteratura africana post-coloniale (identità, memoria, neocolonialismo, globalizzazione)?'),
(417, 2, 'Descrivi l importanza della diaspora africana nella produzione letteraria contemporanea.'),
(417, 3, 'Parla del ruolo delle scrittrici africane nel panorama letterario attuale.'),
(417, 4, 'Cita un autore/autrice e un opera significativa della letteratura africana contemporanea (dagli anni  80 ad oggi).'),
(417, 5, 'Come la letteratura africana contemporanea dialoga con le tradizioni orali e le nuove forme espressive?');

-- Quiz 418: Filosofia orientale e religioni
INSERT INTO Domanda (quiz, numero, testo) VALUES
(418, 1, 'Confronta i concetti fondamentali dell Induismo (Dharma, Karma, Samsara, Moksha) e del Buddhismo (Quattro Nobili Verità, Ottuplice Sentiero, Nirvana).'),
(418, 2, 'Descrivi i principi del Confucianesimo (ren, li, yi, xiao) e del Taoismo (Tao, Wu Wei, Yin/Yang).'),
(418, 3, 'Qual è il ruolo dei testi sacri (Veda, Upanishad, Sutra, Corano, Tao Te Ching) nelle diverse tradizioni?'),
(418, 4, 'Spiega il concetto di "non-violenza" (Ahimsa) e la sua importanza in diverse religioni orientali.'),
(418, 5, 'Come le religioni orientali influenzano la vita sociale, politica ed etica nelle società contemporanee?');

-- Quiz 419: Psicologia clinica avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(419, 1, 'Descrivi i principali approcci alla valutazione psicodiagnostica (test, colloquio, osservazione).'),
(419, 2, 'Cosa si intende per "comorbilità" nei disturbi mentali e come influenza il trattamento?'),
(419, 3, 'Spiega l importanza della relazione terapeutica e dei fattori aspecifici nel successo della psicoterapia.'),
(419, 4, 'Quali sono le basi neurobiologiche dei disturbi d ansia o dell umore?'),
(419, 5, 'Discuti le implicazioni etiche della diagnosi psichiatrica e della pratica psicoterapeutica.');

-- Quiz 420: Economia politica globale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(420, 1, 'Quali sono le principali istituzioni della governance economica globale (FMI, Banca Mondiale, WTO, G7/G20)?'),
(420, 2, 'Descrivi le teorie sull egemonia e sui cicli di potere nell economia politica internazionale.'),
(420, 3, 'Cosa si intende per "globalizzazione neoliberista" e quali sono le sue critiche?'),
(420, 4, 'Spiega l impatto dell ascesa delle potenze emergenti (es. BRICS) sugli equilibri economici globali.'),
(420, 5, 'Quali sono le sfide per una governance economica globale più equa e sostenibile?');

-- Quiz 421: Sociologia rurale e agricoltura
INSERT INTO Domanda (quiz, numero, testo) VALUES
(421, 1, 'Come si sono trasformate le strutture agrarie e le forme di proprietà terriera nel tempo?'),
(421, 2, 'Descrivi l impatto della modernizzazione agricola (Rivoluzione Verde) sulle società rurali.'),
(421, 3, 'Cosa si intende per "sistema agroalimentare" e quali sono i suoi attori principali?'),
(421, 4, 'Spiega il concetto di "sovranità alimentare" e i movimenti sociali associati.'),
(421, 5, 'Qual è il ruolo dell agricoltura familiare e dell agroecologia per lo sviluppo rurale sostenibile?');

-- Quiz 422: Antropologia linguistica avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(422, 1, 'Come l antropologia linguistica studia la relazione tra linguaggio e identità (etnica, di genere, sociale)?'),
(422, 2, 'Descrivi il concetto di "ideologie linguistiche" e come influenzano la percezione e l uso delle lingue.'),
(422, 3, 'Cosa si intende per "etnografia della comunicazione" e l analisi delle pratiche comunicative in contesto?'),
(422, 4, 'Spiega il ruolo del linguaggio nella costruzione del potere e della disuguaglianza sociale.'),
(422, 5, 'Quali sono le sfide legate alla documentazione e rivitalizzazione delle lingue indigene e minoritarie?');

-- Quiz 423: Storia dell Africa coloniale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(423, 1, 'Quali furono le principali motivazioni economiche, politiche e ideologiche del colonialismo europeo in Africa?'),
(423, 2, 'Descrivi la Conferenza di Berlino (1884-85) e la "corsa all Africa".'),
(423, 3, 'Confronta i diversi modelli di amministrazione coloniale (es. britannico indiretto, francese diretto).'),
(423, 4, 'Quale fu l impatto economico del colonialismo (sfruttamento risorse, economie di piantagione, infrastrutture)?'),
(423, 5, 'Parla delle forme di resistenza africana al dominio coloniale.');

-- Quiz 424: Letteratura giapponese moderna
INSERT INTO Domanda (quiz, numero, testo) VALUES
(424, 1, 'Quale fu l impatto dell apertura del Giappone (periodo Meiji) sulla letteratura e l introduzione di generi occidentali?'),
(424, 2, 'Descrivi l importanza di autori come Natsume Sōseki, Mori Ōgai o Akutagawa Ryūnosuke.'),
(424, 3, 'Parla del dibattito tra letteratura "pura" (jun bungaku) e popolare (taishū bungaku) nel XX secolo.'),
(424, 4, 'Cosa si intende per "I-novel" (watakushi shōsetsu) e quali sono le sue caratteristiche?'),
(424, 5, 'Quale fu il ruolo della letteratura durante il periodo militarista e come affrontò la sconfitta nel dopoguerra?');

-- Quiz 425: Fisica nucleare e reattori
INSERT INTO Domanda (quiz, numero, testo) VALUES
(425, 1, 'Descrivi il processo di fissione nucleare indotta da neutroni nell Uranio-235.'),
(425, 2, 'Quali sono i componenti principali di un reattore nucleare a fissione (nocciolo, moderatore, barre di controllo, refrigerante)?'),
(425, 3, 'Spiega il concetto di "criticità" e come viene controllata la reazione a catena in un reattore.'),
(425, 4, 'Quali sono i diversi tipi di reattori a fissione (es. PWR, BWR, CANDU) e le loro caratteristiche?'),
(425, 5, 'Discuti le problematiche relative alla sicurezza nucleare e alla gestione delle scorie radioattive.');

-- Quiz 426: Chimica biologica avanzata
INSERT INTO Domanda (quiz, numero, testo) VALUES
(426, 1, 'Descrivi la struttura tridimensionale delle proteine (primaria, secondaria, terziaria, quaternaria) e le forze che la stabilizzano.'),
(426, 2, 'Cosa sono gli enzimi allosterici e come viene regolata la loro attività?'),
(426, 3, 'Spiega le principali vie metaboliche (glicolisi, ciclo di Krebs, fosforilazione ossidativa) e la loro interconnessione.'),
(426, 4, 'Qual è il ruolo dei lipidi nelle membrane biologiche e nella segnalazione cellulare?'),
(426, 5, 'Descrivi la struttura e la funzione degli acidi nucleici (DNA, RNA) e il dogma centrale della biologia molecolare.');

-- Quiz 427: Geografia fisica delle montagne
INSERT INTO Domanda (quiz, numero, testo) VALUES
(427, 1, 'Come si formano le montagne (orogenesi per collisione continentale, subduzione, vulcanismo)?'),
(427, 2, 'Descrivi i processi geomorfologici dominanti in ambiente montano (glaciale, periglaciale, fluviale, processi di versante).'),
(427, 3, 'Quali sono le caratteristiche dei climi di montagna e la zonazione altitudinale della vegetazione?'),
(427, 4, 'Spiega l importanza delle montagne come "serbatoi d acqua" e la gestione delle risorse idriche montane.'),
(427, 5, 'Quali sono i principali rischi naturali in ambiente montano (frane, valanghe, inondazioni glaciali)?');

-- Quiz 428: Storia dell America Latina
INSERT INTO Domanda (quiz, numero, testo) VALUES
(428, 1, 'Descrivi le principali civiltà precolombiane (Maya, Aztechi, Inca) e la loro organizzazione sociale e politica.'),
(428, 2, 'Quale fu l impatto della conquista e della colonizzazione spagnola e portoghese sull America Latina?'),
(428, 3, 'Parla dei movimenti per l indipendenza all inizio del XIX secolo e delle figure chiave (Bolívar, San Martín).'),
(428, 4, 'Cosa si intende per "caudillismo" e instabilità politica nell America Latina del XIX secolo?'),
(428, 5, 'Quali sono state le principali dinamiche politiche ed economiche (populismo, dittature, democratizzazione, neoliberismo) nel XX secolo?');

-- Quiz 429: Matematica avanzata per fisici
INSERT INTO Domanda (quiz, numero, testo) VALUES
(429, 1, 'Descrivi l importanza degli spazi vettoriali e dell algebra lineare nella meccanica quantistica (spazi di Hilbert, operatori).'),
(429, 2, 'Come si utilizzano le equazioni differenziali alle derivate parziali in fisica (es. equazione di Schrödinger, equazioni di Maxwell, equazione delle onde)?'),
(429, 3, 'Spiega l analisi complessa e il suo utilizzo in fisica (es. teorema dei residui, funzioni analitiche).'),
(429, 4, 'Qual è il ruolo della teoria dei gruppi e delle simmetrie in fisica teorica?'),
(429, 5, 'Cita un area della matematica avanzata (es. geometria differenziale, topologia) e la sua applicazione in una teoria fisica (es. relatività generale, teoria delle stringhe).');

-- Quiz 430: Fisica moderna e relatività
INSERT INTO Domanda (quiz, numero, testo) VALUES
(430, 1, 'Enuncia i postulati della Relatività Ristretta di Einstein.'),
(430, 2, 'Descrivi i concetti di dilatazione dei tempi e contrazione delle lunghezze.'),
(430, 3, 'Qual è il significato dell equivalenza massa-energia (E=mc²)?'),
(430, 4, 'Spiega il principio di equivalenza alla base della Relatività Generale.'),
(430, 5, 'Cita un evidenza sperimentale a supporto della Relatività Generale (es. deflessione della luce, precessione perielio Mercurio, onde gravitazionali).');

-- Quiz 431: Letteratura italiana contemporanea
INSERT INTO Domanda (quiz, numero, testo) VALUES
(431, 1, 'Quali sono state le principali correnti letterarie del secondo dopoguerra in Italia (Neorealismo, Neoavanguardia)?'),
(431, 2, 'Descrivi l importanza di autori come Calvino, Pasolini, Morante, Gadda nel panorama letterario contemporaneo.'),
(431, 3, 'Parla del romanzo italiano dagli anni  80 ad oggi e delle sue tendenze principali.'),
(431, 4, 'Cita un autore/autrice e un opera significativa della letteratura italiana degli ultimi decenni.'),
(431, 5, 'Come la letteratura italiana contemporanea affronta i temi della storia recente, della società e dell identità?');

-- Quiz 432: Geografia mondiale e clima
INSERT INTO Domanda (quiz, numero, testo) VALUES
(432, 1, 'Descrivi il sistema di classificazione dei climi di Köppen.'),
(432, 2, 'Quali sono i principali fattori che influenzano il clima di una regione (latitudine, altitudine, distanza dal mare, correnti)?'),
(432, 3, 'Spiega l effetto serra naturale e quello antropogenico.'),
(432, 4, 'Quali sono le cause e le conseguenze dei cambiamenti climatici a livello globale?'),
(432, 5, 'Cita alcuni fenomeni climatici estremi (es. uragani, siccità, ondate di calore) e la loro distribuzione geografica.');

-- Quiz 433: Chimica organica e farmaci
INSERT INTO Domanda (quiz, numero, testo) VALUES
(433, 1, 'Cosa si intende per "farmaco" e "principio attivo"?'),
(433, 2, 'Descrivi il processo di scoperta e sviluppo di un nuovo farmaco (drug discovery and development).'),
(433, 3, 'Qual è il ruolo della chimica organica nella sintesi e modificazione dei farmaci?'),
(433, 4, 'Spiega il concetto di "relazione struttura-attività" (SAR) dei farmaci.'),
(433, 5, 'Cita una classe importante di farmaci (es. antibiotici, antidolorifici, antitumorali) e descrivi brevemente il loro meccanismo d azione.');

-- Quiz 434: Biologia cellulare e genetica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(434, 1, 'Descrivi la struttura del DNA e come l informazione genetica è codificata.'),
(434, 2, 'Spiega i processi di replicazione del DNA, trascrizione (sintesi di RNA) e traduzione (sintesi proteica).'),
(434, 3, 'Cosa sono le mutazioni genetiche e quali possono essere i loro effetti?'),
(434, 4, 'Descrivi le leggi di Mendel sull ereditarietà dei caratteri.'),
(434, 5, 'Quali sono le principali tecniche di ingegneria genetica (es. DNA ricombinante, PCR, CRISPR)?');

-- Quiz 435: Storia contemporanea globale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(435, 1, 'Quali sono state le cause e le conseguenze delle due guerre mondiale nel ridefinire l ordine globale?'),
(435, 2, 'Descrivi la Guerra Fredda e la divisione del mondo in blocchi contrapposti.'),
(435, 3, 'Parla del processo di decolonizzazione e della nascita di nuovi stati in Asia e Africa.'),
(435, 4, 'Cosa si intende per "globalizzazione" e quali sono i suoi effetti economici, politici e culturali dal tardo XX secolo?'),
(435, 5, 'Quali sono le principali sfide globali contemporanee (cambiamenti climatici, terrorismo, migrazioni, pandemie)?');

-- Quiz 436: Astronomia e pianeti extrasolari
INSERT INTO Domanda (quiz, numero, testo) VALUES
(436, 1, 'Quali sono i principali metodi per scoprire pianeti extrasolari (transiti, velocità radiali, microlensing, imaging diretto)?'),
(436, 2, 'Descrivi la diversità dei pianeti extrasolari scoperti finora (es. super-Terre, gioviani caldi).'),
(436, 3, 'Cosa si intende per "zona abitabile" di una stella?'),
(436, 4, 'Quali sono le tecniche per studiare le atmosfere dei pianeti extrasolari?'),
(436, 5, 'Quali sono le prospettive future nella ricerca di pianeti simili alla Terra e potenzialmente abitabili?');

-- Quiz 437: Informatica di base e programmazione
INSERT INTO Domanda (quiz, numero, testo) VALUES
(437, 1, 'Quali sono i componenti hardware fondamentali di un computer?'),
(437, 2, 'Cosa si intende per sistema operativo e quali sono le sue funzioni principali?'),
(437, 3, 'Descrivi i concetti base della programmazione: variabili, tipi di dati, strutture di controllo (if, loop).'),
(437, 4, 'Spiega cos è un algoritmo e come si progetta una soluzione a un problema semplice.'),
(437, 5, 'Cita un linguaggio di programmazione comune (es. Python, Java, C++) e una sua possibile applicazione.');

-- Quiz 438: Filosofia antica e mitologia
INSERT INTO Domanda (quiz, numero, testo) VALUES
(438, 1, 'Qual è la relazione tra mito e logos nel pensiero greco arcaico?'),
(438, 2, 'Descrivi l importanza dei poemi omerici (Iliade, Odissea) per la cultura e la filosofia greca.'),
(438, 3, 'Parla del ruolo degli dei e del destino nella tragedia greca (Eschilo, Sofocle, Euripide).'),
(438, 4, 'Come Platone utilizza i miti nei suoi dialoghi (es. mito della caverna, mito di Er)?'),
(438, 5, 'Quale critica muovono i filosofi presocratici e Platone alla concezione mitologica tradizionale?');

-- Quiz 439: Psicologia e neuroscienze
INSERT INTO Domanda (quiz, numero, testo) VALUES
(439, 1, 'Descrivi la struttura e la funzione del neurone.'),
(439, 2, 'Come avviene la trasmissione sinaptica (neurotrasmettitori)?'),
(439, 3, 'Quali sono le principali aree del cervello e le loro funzioni (es. lobi cerebrali, sistema limbico)?'),
(439, 4, 'Spiega le basi neurali di processi cognitivi come memoria, attenzione o linguaggio.'),
(439, 5, 'Quali tecniche utilizzano le neuroscienze cognitive per studiare il cervello in vivo (es. fMRI, EEG)?');

-- Quiz 440: Economia e commercio internazionale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(440, 1, 'Quali sono le principali teorie sul commercio internazionale (vantaggio assoluto, vantaggio comparato, Heckscher-Ohlin)?'),
(440, 2, 'Descrivi gli strumenti della politica commerciale (tariffe, quote, sussidi) e i loro effetti.'),
(440, 3, 'Cosa si intende per "bilancia dei pagamenti" e le sue componenti (conto corrente, conto capitale)?'),
(440, 4, 'Spiega i diversi regimi di tasso di cambio (fisso, fluttuante) e i loro vantaggi/svantaggi.'),
(440, 5, 'Qual è il ruolo delle organizzazioni internazionali come il WTO (Organizzazione Mondiale del Commercio)?');

-- Quiz 441: Sociologia e cambiamenti sociali
INSERT INTO Domanda (quiz, numero, testo) VALUES
(441, 1, 'Quali sono le principali teorie sul cambiamento sociale (es. evoluzionismo, conflittualismo, funzionalismo)?'),
(441, 2, 'Descrivi il ruolo dei movimenti sociali nel promuovere o resistere al cambiamento.'),
(441, 3, 'Cosa si intende per "modernizzazione" e "postmodernizzazione"?'),
(441, 4, 'Spiega l impatto della globalizzazione sui processi di cambiamento sociale a livello locale e globale.'),
(441, 5, 'Come la tecnologia (in particolare ICT) influenza il cambiamento sociale contemporaneo?');

-- Quiz 442: Antropologia e culture indigene
INSERT INTO Domanda (quiz, numero, testo) VALUES
(442, 1, 'Cosa si intende per "popoli indigeni" e quali sono le sfide che affrontano nel mondo contemporaneo?'),
(442, 2, 'Descrivi l importanza dei sistemi di conoscenza tradizionali indigeni (es. conoscenze ecologiche).'),
(442, 3, 'Qual è il ruolo dell antropologia nel supportare i diritti dei popoli indigeni?'),
(442, 4, 'Spiega le diverse forme di organizzazione sociale e politica presenti nelle culture indigene.'),
(442, 5, 'Come l arte, la musica e le pratiche rituali esprimono l identità e la cosmologia delle culture indigene?');

-- Quiz 443: Storia medievale e crociate
INSERT INTO Domanda (quiz, numero, testo) VALUES
(443, 1, 'Quali furono le cause principali che portarono alla Prima Crociata?'),
(443, 2, 'Descrivi le principali Crociate e i loro esiti.'),
(443, 3, 'Cosa erano gli Stati Crociati in Terrasanta?'),
(443, 4, 'Quale fu il ruolo degli ordini religioso-militari (Templari, Ospitalieri, Teutonici) durante le Crociate?'),
(443, 5, 'Quali furono le conseguenze a lungo termine delle Crociate sui rapporti tra Europa cristiana e mondo islamico?');

-- Quiz 444: Letteratura inglese vittoriana
INSERT INTO Domanda (quiz, numero, testo) VALUES
(444, 1, 'Quali sono le caratteristiche principali del romanzo vittoriano (realismo, critica sociale, morale)?'),
(444, 2, 'Descrivi l importanza di Charles Dickens e della sua rappresentazione della società industriale.'),
(444, 3, 'Parla delle sorelle Brontë (Charlotte, Emily, Anne) e dei loro romanzi.'),
(444, 4, 'Cosa si intende per "poesia vittoriana" e chi ne furono i principali esponenti (Tennyson, Browning)?'),
(444, 5, 'Quale fu il ruolo della donna nella società e nella letteratura vittoriana?');

-- Quiz 445: Fisica quantistica e cosmologia
INSERT INTO Domanda (quiz, numero, testo) VALUES
(445, 1, 'Come la fisica quantistica è necessaria per descrivere l universo primordiale (es. inflazione)?'),
(445, 2, 'Descrivi il problema della "costante cosmologica" e la sua possibile spiegazione quantistica.'),
(445, 3, 'Cosa si intende per "energia del vuoto" e il suo possibile ruolo nell espansione accelerata dell universo?'),
(445, 4, 'Spiega come la teoria quantistica dei campi in spaziotempo curvo descrive i fenomeni vicino ai buchi neri (radiazione di Hawking).'),
(445, 5, 'Quali sono le sfide nel conciliare la meccanica quantistica e la relatività generale in una teoria di "gravità quantistica"?');

-- Quiz 446: Chimica inorganica e metalli
INSERT INTO Domanda (quiz, numero, testo) VALUES
(446, 1, 'Descrivi le proprietà generali dei metalli (conducibilità, duttilità, lucentezza) e la teoria del legame metallico.'),
(446, 2, 'Quali sono i principali gruppi di metalli nella tavola periodica (alcalini, alcalino-terrosi, di transizione)?'),
(446, 3, 'Spiega il processo di corrosione dei metalli e come può essere prevenuto.'),
(446, 4, 'Cosa sono le leghe metalliche e perché vengono utilizzate? Fornisci esempi.'),
(446, 5, 'Cita alcune applicazioni importanti dei metalli e dei loro composti inorganici (es. catalizzatori, pigmenti, materiali strutturali).');

-- Quiz 447: Geologia e terremoti
INSERT INTO Domanda (quiz, numero, testo) VALUES
(447, 1, 'Cosa causa i terremoti (teoria del rimbalzo elastico)?'),
(447, 2, 'Descrivi i diversi tipi di onde sismiche (P, S, superficiali).'),
(447, 3, 'Come si misura la magnitudo (scala Richter, scala Momento) e l intensità (scala Mercalli) di un terremoto?'),
(447, 4, 'Spiega la relazione tra terremoti e tettonica a placche (margini convergenti, divergenti, trasformi).'),
(447, 5, 'Quali sono i principali rischi associati ai terremoti (crolli, liquefazione, tsunami) e le strategie di mitigazione?');

-- Quiz 448: Storia romana e imperatori
INSERT INTO Domanda (quiz, numero, testo) VALUES
(448, 1, 'Chi fu Augusto e come trasformò la Repubblica Romana nell Impero (Principato)?'),
(448, 2, 'Descrivi il periodo della dinastia Giulio-Claudia (Tiberio, Caligola, Claudio, Nerone).'),
(448, 3, 'Parla della dinastia Flavia (Vespasiano, Tito, Domiziano) e della costruzione del Colosseo.'),
(448, 4, 'Cosa si intende per "secolo d oro" dell Impero sotto gli imperatori adottivi (Nerva, Traiano, Adriano, Antonino Pio, Marco Aurelio)?'),
(448, 5, 'Quali furono le cause della crisi del III secolo e il ruolo degli imperatori militari?');

-- Quiz 449: Matematica di base per studenti
INSERT INTO Domanda (quiz, numero, testo) VALUES
(449, 1, 'Come si eseguono le quattro operazioni fondamentali con le frazioni?'),
(449, 2, 'Descrivi come si risolvono le equazioni di primo grado.'),
(449, 3, 'Cosa sono le percentuali e come si calcolano?'),
(449, 4, 'Spiega come si calcola l area e il perimetro delle principali figure piane (quadrato, rettangolo, triangolo, cerchio).'),
(449, 5, 'Introduci il concetto di potenza e le sue proprietà fondamentali.');

-- Quiz 450: Fisica classica e meccanica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(450, 1, 'Enuncia le tre leggi di Newton del moto.'),
(450, 2, 'Definisci i concetti di lavoro, energia (cinetica e potenziale) e potenza.'),
(450, 3, 'Cosa afferma il principio di conservazione dell energia meccanica?'),
(450, 4, 'Descrivi il moto dei proiettili sotto l azione della gravità.'),
(450, 5, 'Spiega il concetto di quantità di moto e il principio di conservazione della quantità di moto.');

-- Quiz 451: Letteratura francese romantica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(451, 1, 'Quali sono i temi principali del Romanticismo francese (sentimento, natura, storia, esotismo, individuo)?'),
(451, 2, 'Descrivi l importanza di Victor Hugo come caposcuola del Romanticismo francese (teatro, poesia, romanzo).'),
(451, 3, 'Parla della poesia romantica francese e di autori come Lamartine, Vigny, Musset.'),
(451, 4, 'Qual è il ruolo del romanzo storico nel Romanticismo francese (es. Hugo, Dumas)?'),
(451, 5, 'Confronta il Romanticismo francese con quello tedesco o inglese.');

-- Quiz 452: Geografia italiana e regioni
INSERT INTO Domanda (quiz, numero, testo) VALUES
(452, 1, 'Descrivi le caratteristiche fisiche (rilievo, idrografia, clima) di una regione italiana a tua scelta.'),
(452, 2, 'Quali sono le principali attività economiche di una regione del Nord, Centro e Sud Italia?'),
(452, 3, 'Parla del patrimonio culturale e turistico di una specifica regione italiana.'),
(452, 4, 'Cosa si intende per "regione a statuto speciale" e quali sono le loro competenze?'),
(452, 5, 'Quali sono le principali sfide (demografiche, economiche, ambientali) che le regioni italiane affrontano oggi?');

-- Quiz 453: Chimica analitica e laboratorio
INSERT INTO Domanda (quiz, numero, testo) VALUES
(453, 1, 'Quali sono le norme di sicurezza fondamentali da seguire in un laboratorio chimico?'),
(453, 2, 'Descrivi la vetreria comune utilizzata in un laboratorio di chimica analitica (es. beute, cilindri, pipette, burette).'),
(453, 3, 'Come si prepara correttamente una soluzione a concentrazione nota?'),
(453, 4, 'Spiega come si esegue una titolazione acido-base utilizzando un indicatore.'),
(453, 5, 'Cosa si intende per "analisi qualitativa" e come si possono identificare alcuni ioni comuni?');

-- Quiz 454: Biologia molecolare e DNA
INSERT INTO Domanda (quiz, numero, testo) VALUES
(454, 1, 'Descrivi la struttura a doppia elica del DNA proposta da Watson e Crick.'),
(454, 2, 'Come avviene la replicazione semiconservativa del DNA?'),
(454, 3, 'Spiega il processo di trascrizione (sintesi di RNA a partire dal DNA).'),
(454, 4, 'Descrivi il codice genetico e il processo di traduzione (sintesi proteica sui ribosomi).'),
(454, 5, 'Cosa sono le mutazioni puntiformi e quali conseguenze possono avere sulla proteina prodotta?');

-- Quiz 455: Storia greca e mitologia
INSERT INTO Domanda (quiz, numero, testo) VALUES
(455, 1, 'Chi erano le principali divinità dell Olimpo e quali erano i loro attributi e domini?'),
(455, 2, 'Racconta un mito greco famoso (es. mito di Edipo, mito di Prometeo, guerra di Troia).'),
(455, 3, 'Qual era il ruolo dei miti nella società e nella religione greca?'),
(455, 4, 'Descrivi l importanza dei santuari panellenici (es. Delfi, Olimpia).'),
(455, 5, 'Come la filosofia greca si è rapportata e distinta dal pensiero mitologico?');

-- Quiz 456: Letteratura spagnola classica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(456, 1, 'Quali sono le caratteristiche principali del Rinascimento spagnolo in letteratura?'),
(456, 2, 'Descrivi l importanza del romanzo picaresco (es. Lazarillo de Tormes).'),
(456, 3, 'Parla di Miguel de Cervantes e del "Don Chisciotte" come capolavoro della letteratura mondiale.'),
(456, 4, 'Quali sono le caratteristiche del teatro barocco spagnolo (Siglo de Oro) e autori come Lope de Vega e Calderón de la Barca?'),
(456, 5, 'Cita un importante poeta del Barocco spagnolo (es. Góngora, Quevedo).');

-- Quiz 457: Filosofia moderna e politica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(457, 1, 'Descrivi la teoria politica di Thomas Hobbes nel "Leviatano".'),
(457, 2, 'Qual è la concezione dello stato di natura e del contratto sociale in John Locke?'),
(457, 3, 'Spiega la teoria della "volontà generale" e della democrazia diretta in Jean-Jacques Rousseau.'),
(457, 4, 'Quale fu il contributo di Montesquieu alla teoria della separazione dei poteri?'),
(457, 5, 'Come Immanuel Kant fonda la sua filosofia politica sui principi della ragione e del diritto?');

-- Quiz 458: Psicologia sociale e gruppi
INSERT INTO Domanda (quiz, numero, testo) VALUES
(458, 1, 'Definisci cos è un gruppo sociale e quali sono le sue caratteristiche.'),
(458, 2, 'Descrivi i fenomeni di influenza sociale all interno dei gruppi (conformismo, obbedienza, influenza minoritaria).'),
(458, 3, 'Cosa si intende per "leadership" e quali sono i diversi stili di leadership?'),
(458, 4, 'Spiega i processi di presa di decisione nei gruppi (es. polarizzazione, groupthink).'),
(458, 5, 'Quali sono le dinamiche delle relazioni intergruppi (stereotipi, pregiudizi, conflitto, cooperazione)?');

-- Quiz 459: Economia aziendale e marketing
INSERT INTO Domanda (quiz, numero, testo) VALUES
(459, 1, 'Definisci cos è il marketing e quali sono i suoi obiettivi principali.'),
(459, 2, 'Descrivi le "4 P" del marketing mix (Prodotto, Prezzo, Punto vendita/Distribuzione, Promozione).'),
(459, 3, 'Cosa si intende per "segmentazione del mercato", "targeting" e "posizionamento"?'),
(459, 4, 'Spiega l importanza delle ricerche di mercato nel processo decisionale di marketing.'),
(459, 5, 'Qual è il ruolo del brand management e della comunicazione di marketing?');

-- Quiz 460: Sociologia urbana e migrazioni
INSERT INTO Domanda (quiz, numero, testo) VALUES
(460, 1, 'Come le migrazioni internazionali contribuiscono alla trasformazione delle città (diversità culturale, segregazione, nuove economie)?'),
(460, 2, 'Descrivi le teorie sull assimilazione e l integrazione dei migranti nelle società urbane.'),
(460, 3, 'Cosa si intende per "reti migratorie" e "comunità transnazionali"?'),
(460, 4, 'Spiega come la città diventa un luogo di incontro e conflitto tra diverse culture e gruppi etnici.'),
(460, 5, 'Quali sono le politiche urbane per la gestione della diversità e la promozione dell inclusione sociale dei migranti?');

-- Quiz 461: Antropologia culturale e tradizioni
INSERT INTO Domanda (quiz, numero, testo) VALUES
(461, 1, 'Definisci il concetto di "tradizione" in antropologia e discuti la sua dinamicità.'),
(461, 2, 'Descrivi come vengono trasmesse le tradizioni culturali (oralità, rituali, educazione).'),
(461, 3, 'Cosa si intende per "folklore" e come viene studiato dall antropologia?'),
(461, 4, 'Spiega come la globalizzazione influisce sulle tradizioni locali (ibridazione, scomparsa, resistenza).'),
(461, 5, 'Fornisci un esempio di una tradizione culturale specifica (es. un rito, una festa, una pratica artigianale) e analizzane il significato.');

-- Quiz 462: Storia moderna e rivoluzioni
INSERT INTO Domanda (quiz, numero, testo) VALUES
(462, 1, 'Descrivi le cause e le conseguenze della Rivoluzione Inglese del XVII secolo.'),
(462, 2, 'Quali furono le idee illuministe che influenzarono la Rivoluzione Americana e Francese?'),
(462, 3, 'Spiega le fasi principali della Rivoluzione Francese (dal 1789 al Consolato).'),
(462, 4, 'Quale fu l impatto della Rivoluzione Industriale sulla società e sulla politica europea?'),
(462, 5, 'Confronta le rivoluzioni del 1848 in diversi paesi europei.');

-- Quiz 463: Letteratura tedesca contemporanea
INSERT INTO Domanda (quiz, numero, testo) VALUES
(463, 1, 'Quali sono stati i principali autori e temi della letteratura tedesca del dopoguerra (Gruppo 47, Böll, Grass)?'),
(463, 2, 'Descrivi la letteratura della DDR e autori come Christa Wolf o Heiner Müller.'),
(463, 3, 'Parla della "letteratura della riunificazione" (Wenderoman) e come ha affrontato la caduta del Muro.'),
(463, 4, 'Cita un autore/autrice e un opera significativa della letteratura tedesca dagli anni  90 ad oggi.'),
(463, 5, 'Come la letteratura tedesca contemporanea si confronta con temi come la memoria storica, l identità, la migrazione e la globalizzazione?');

-- Quiz 464: Fisica applicata e ingegneria
INSERT INTO Domanda (quiz, numero, testo) VALUES
(464, 1, 'Come i principi della termodinamica si applicano ai motori termici e ai sistemi di refrigerazione?'),
(464, 2, 'Descrivi le applicazioni dell elettromagnetismo in ingegneria elettrica (motori, generatori, trasformatori).'),
(464, 3, 'Qual è il ruolo della meccanica dei fluidi in ingegneria civile, meccanica o aerospaziale?'),
(464, 4, 'Spiega come la fisica dei semiconduttori è alla base dell elettronica moderna.'),
(464, 5, 'Cita un esempio di come la fisica moderna (quantistica, relatività) trova applicazione in tecnologie avanzate (es. laser, GPS).');

-- Quiz 465: Chimica fisica e termodinamica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(465, 1, 'Enuncia il Primo e il Secondo Principio della Termodinamica.'),
(465, 2, 'Definisci i concetti di entalpia, entropia ed energia libera di Gibbs.'),
(465, 3, 'Cosa si intende per "equilibrio chimico" e come è descritto dalla costante di equilibrio?'),
(465, 4, 'Spiega il Principio di Le Chatelier.'),
(465, 5, 'Descrivi un ciclo termodinamico importante (es. ciclo di Carnot) e la sua efficienza.');

-- Quiz 466: Geografia fisica e oceani
INSERT INTO Domanda (quiz, numero, testo) VALUES
(466, 1, 'Descrivi la morfologia dei fondali oceanici (piattaforma continentale, scarpata, piana abissale, dorsali, fosse).'),
(466, 2, 'Quali sono le proprietà fisiche e chimiche dell acqua marina (temperatura, salinità, densità)?'),
(466, 3, 'Spiega la circolazione termoalina (nastro trasportatore oceanico) e il suo ruolo climatico.'),
(466, 4, 'Cosa sono le maree e come sono causate dall attrazione gravitazionale di Luna e Sole?'),
(466, 5, 'Quali sono gli impatti dei cambiamenti climatici sugli oceani (innalzamento livello mare, acidificazione, deossigenazione)?');

-- Quiz 467: Storia dellEuropa moderna
INSERT INTO Domanda (quiz, numero, testo) VALUES
(467, 1, 'Descrivi l Europa del XVI secolo: Riforma, Controriforma e guerre di religione.'),
(467, 2, 'Parla dell assolutismo nel XVII secolo, con particolare riferimento alla Francia di Luigi XIV.'),
(467, 3, 'Cosa si intende per Illuminismo e quale fu il suo impatto sulle monarchie europee (dispotismo illuminato)?'),
(467, 4, 'Spiega le cause, le fasi e le conseguenze della Rivoluzione Francese e dell età napoleonica.'),
(467, 5, 'Quali furono le principali trasformazioni economiche e sociali portate dalla Rivoluzione Industriale in Europa?');

-- Quiz 468: Matematica finanziaria e investimenti
INSERT INTO Domanda (quiz, numero, testo) VALUES
(468, 1, 'Come si calcola il valore attuale e il montante di una rendita?'),
(468, 2, 'Descrivi i principali tipi di titoli obbligazionari e come si valuta il loro rendimento.'),
(468, 3, 'Cosa si intende per "diversificazione di portafoglio" secondo la teoria di Markowitz?'),
(468, 4, 'Spiega il Capital Asset Pricing Model (CAPM) per la determinazione del rendimento atteso di un titolo rischioso.'),
(468, 5, 'Quali sono i principali tipi di strumenti derivati (futures, opzioni, swap) e il loro utilizzo nella gestione del rischio?');

-- Quiz 469: Fisica teorica e astrofisica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(469, 1, 'Come la Relatività Generale descrive la gravità come curvatura dello spaziotempo?'),
(469, 2, 'Descrivi l evoluzione stellare dalla nascita alla morte delle stelle (nane bianche, stelle di neutroni, buchi neri).'),
(469, 3, 'Cosa sono le galassie attive (AGN) e i quasar?'),
(469, 4, 'Spiega il modello cosmologico standard (Lambda-CDM) e le evidenze a suo supporto (radiazione cosmica di fondo, abbondanza elementi leggeri, espansione accelerata).'),
(469, 5, 'Quali sono le principali sfide nel conciliare fisica delle particelle e cosmologia (materia oscura, energia oscura, inflazione)?');

-- Quiz 470: Letteratura russa e Dostoevskij
INSERT INTO Domanda (quiz, numero, testo) VALUES
(470, 1, 'Quali sono i temi principali esplorati nei romanzi di Dostoevskij (libertà, colpa, sofferenza, fede, nichilismo)?'),
(470, 2, 'Descrivi l importanza del romanzo "Delitto e castigo".'),
(470, 3, 'Parla de "I fratelli Karamazov" come opera summa del pensiero dostoevskiano.'),
(470, 4, 'Cosa si intende per "polifonia" nei romanzi di Dostoevskij secondo Bachtin?'),
(470, 5, 'Qual è stata l influenza di Dostoevskij sulla letteratura e la filosofia del XX secolo?');

-- Quiz 471: Geografia politica e confini
INSERT INTO Domanda (quiz, numero, testo) VALUES
(471, 1, 'Definisci il concetto di "confine" (border) e "frontiera" (frontier).'),
(471, 2, 'Descrivi i diversi tipi di confini (naturali, artificiali, antecedenti, susseguenti, sovrimposti).'),
(471, 3, 'Quali sono le funzioni dei confini (difensiva, fiscale, identitaria)?'),
(471, 4, 'Spiega come i confini possono essere causa di conflitti territoriali e dispute internazionali.'),
(471, 5, 'Cosa si intende per "deterritorializzazione" e "riterritorializzazione" nell era della globalizzazione?');

-- Quiz 472: Chimica industriale e materiali
INSERT INTO Domanda (quiz, numero, testo) VALUES
(472, 1, 'Descrivi un processo industriale per la produzione di un materiale metallico (es. acciaio, alluminio).'),
(472, 2, 'Come vengono prodotti industrialmente i materiali ceramici (tradizionali e avanzati)?'),
(472, 3, 'Spiega la produzione industriale di polimeri sintetici (es. polietilene, PVC) e le loro applicazioni.'),
(472, 4, 'Cosa sono i materiali compositi e come vengono fabbricati?'),
(472, 5, 'Quali sono le sfide legate al riciclo e alla sostenibilità dei materiali prodotti industrialmente?');

-- Quiz 473: Biologia evolutiva e adattamenti
INSERT INTO Domanda (quiz, numero, testo) VALUES
(473, 1, 'Definisci cos è un adattamento evolutivo e come si origina per selezione naturale.'),
(473, 2, 'Descrivi esempi di adattamenti morfologici, fisiologici e comportamentali.'),
(473, 3, 'Cosa si intende per "coevoluzione" e fornisci un esempio (es. preda-predatore, parassita-ospite, impollinatore-pianta).'),
(473, 4, 'Spiega il concetto di "trade-off" evolutivo (compromesso tra diversi adattamenti).'),
(473, 5, 'Come si può dimostrare che una caratteristica è un adattamento (metodo comparativo, studi sperimentali)?');

-- Quiz 474: Storia dellAsia centrale
INSERT INTO Domanda (quiz, numero, testo) VALUES
(474, 1, 'Quale fu l importanza della Via della Seta per l Asia Centrale nell antichità e nel medioevo?'),
(474, 2, 'Descrivi l Impero Mongolo di Gengis Khan e dei suoi successori e il suo impatto sulla regione.'),
(474, 3, 'Parla dell epoca di Tamerlano e dell Impero Timuride.'),
(474, 4, 'Come l Asia Centrale fu contesa tra l Impero Russo e Britannico nel XIX secolo ("Grande Gioco")?'),
(474, 5, 'Quali sono state le dinamiche politiche ed economiche delle repubbliche centroasiatiche dopo l indipendenza dall Unione Sovietica?');

-- Quiz 475: Letteratura americana e poesia
INSERT INTO Domanda (quiz, numero, testo) VALUES
(475, 1, 'Descrivi l importanza di Walt Whitman e Emily Dickinson per la poesia americana del XIX secolo.'),
(475, 2, 'Quali furono i principali poeti modernisti americani (es. Ezra Pound, T.S. Eliot, William Carlos Williams, Marianne Moore)?'),
(475, 3, 'Parla della poesia della "Beat Generation" (Ginsberg, Kerouac, Ferlinghetti).'),
(475, 4, 'Cosa si intende per "poesia confessionale" americana (es. Lowell, Plath, Sexton)?'),
(475, 5, 'Cita un poeta/poetessa e un opera significativa della poesia americana contemporanea.');

-- Quiz 476: Filosofia contemporanea e etica
INSERT INTO Domanda (quiz, numero, testo) VALUES
(476, 1, 'Quali sono le principali teorie etiche contemporanee (es. neo-utilitarismo, etica deontologica, etica delle virtù, etica della cura)?'),
(476, 2, 'Descrivi il dibattito sulla metaetica (natura dei giudizi morali: cognitivismo vs non-cognitivismo).'),
(476, 3, 'Cosa si intende per "etica applicata" e quali sono i suoi principali campi (bioetica, etica ambientale, etica degli affari)?'),
(476, 4, 'Spiega alcune delle sfide etiche poste dalle nuove tecnologie (intelligenza artificiale, genetica, neuroetica).'),
(476, 5, 'Qual è il ruolo della filosofia morale nel dibattito pubblico su questioni eticamente sensibili?');

-- Quiz 477: Psicologia clinica e terapia
INSERT INTO Domanda (quiz, numero, testo) VALUES
(477, 1, 'Descrivi i principi fondamentali della terapia cognitivo-comportamentale (CBT).'),
(477, 2, 'Quali sono gli approcci psicodinamici alla terapia (psicoanalisi, terapie psicodinamiche brevi)?'),
(477, 3, 'Parla delle terapie umanistiche ed esistenziali (es. approccio centrato sul cliente di Rogers, Gestalt).'),
(477, 4, 'Cosa si intende per terapia familiare sistemica e quali sono i suoi concetti chiave?'),
(477, 5, 'Qual è l importanza della ricerca sull efficacia dei diversi approcci psicoterapeutici?');

-- Quiz 478: Economia politica e globalizzazione
INSERT INTO Domanda (quiz, numero, testo) VALUES
(478, 1, 'Definisci la globalizzazione economica e descrivi le sue principali dimensioni (commercio, finanza, produzione).'),
(478, 2, 'Quali sono gli effetti della globalizzazione sulla crescita economica, sulla disuguaglianza e sulla povertà?'),
(478, 3, 'Descrivi il ruolo delle istituzioni internazionali (FMI, Banca Mondiale, WTO) nel governo della globalizzazione.'),
(478, 4, 'Spiega le critiche mosse alla globalizzazione neoliberista dai movimenti "no global" o "alter global".'),
(478, 5, 'Quali sono le sfide future per la governance della globalizzazione (es. regolamentazione finanziaria, questioni ambientali, migrazioni)?');

-- Quiz 479: Sociologia rurale e sviluppo
INSERT INTO Domanda (quiz, numero, testo) VALUES
(479, 1, 'Quali sono le principali teorie sullo sviluppo rurale (modernizzazione, dipendenza, approcci alternativi)?'),
(479, 2, 'Descrivi il ruolo dell agricoltura nello sviluppo economico dei paesi del Sud globale.'),
(479, 3, 'Cosa si intende per "sviluppo rurale integrato" e "sviluppo locale partecipativo"?'),
(479, 4, 'Spiega l importanza delle infrastrutture, dei servizi e del capitale sociale per lo sviluppo rurale.'),
(479, 5, 'Quali sono le sfide per lo sviluppo rurale sostenibile nel contesto dei cambiamenti climatici e della globalizzazione?');

-- Quiz 480: Antropologia fisica e evoluzione
INSERT INTO Domanda (quiz, numero, testo) VALUES
(480, 1, 'Descrivi le principali tappe dell evoluzione dei primati fino all origine degli ominidi.'),
(480, 2, 'Quali sono le caratteristiche chiave dell evoluzione del genere Homo (bipedismo, encefalizzazione, uso di strumenti, linguaggio)?'),
(480, 3, 'Parla dell Homo neanderthalensis e dei rapporti con l Homo sapiens.'),
(480, 4, 'Come la genetica delle popolazioni ha permesso di ricostruire le migrazioni di Homo sapiens fuori dall Africa?'),
(480, 5, 'Qual è il contributo dell antropologia fisica alla comprensione della variabilità biologica umana attuale in una prospettiva evolutiva?');

-- Quiz 481: Storia dellAfrica moderna
INSERT INTO Domanda (quiz, numero, testo) VALUES
(481, 1, 'Descrivi i processi di decolonizzazione in Africa dopo la Seconda Guerra Mondiale.'),
(481, 2, 'Quali sono state le principali sfide politiche ed economiche affrontate dagli stati africani indipendenti (costruzione nazionale, sviluppo, Guerra Fredda)?'),
(481, 3, 'Parla del regime dell apartheid in Sudafrica e della lotta per la sua abolizione.'),
(481, 4, 'Cosa si intende per "crisi del debito" africano negli anni  80 e i programmi di aggiustamento strutturale?'),
(481, 5, 'Quali sono le principali tendenze politiche, economiche e sociali nell Africa contemporanea (democratizzazione, crescita economica, conflitti, integrazione regionale)?');

-- Quiz 482: Programmazione Python
INSERT INTO Domanda (quiz, numero, testo) VALUES
(482, 1, 'Quali sono i tipi di dati fondamentali in Python?'),
(482, 2, 'Come si definisce e si chiama una funzione in Python?'),
(482, 3, 'Descrivi le principali strutture di controllo del flusso (if-elif-else, for, while).'),
(482, 4, 'Cosa sono le liste, le tuple e i dizionari in Python e come si utilizzano?'),
(482, 5, 'Come si gestiscono le eccezioni in Python (try-except)?');

-- Quiz 483: Machine Learning Basics
INSERT INTO Domanda (quiz, numero, testo) VALUES
(483, 1, 'Qual è la differenza tra apprendimento supervisionato, non supervisionato e per rinforzo?'),
(483, 2, 'Descrivi un algoritmo comune di apprendimento supervisionato (es. regressione lineare, regressione logistica, k-NN, alberi decisionali).'),
(483, 3, 'Cosa si intende per "feature engineering" e perché è importante?'),
(483, 4, 'Spiega i concetti di "training set", "validation set" e "test set".'),
(483, 5, 'Cos è l overfitting e come si può prevenire?');

-- Quiz 484: Data Science Fundamentals
INSERT INTO Domanda (quiz, numero, testo) VALUES
(484, 1, 'Quali sono le fasi principali del processo di data science?'),
(484, 2, 'Descrivi alcune tecniche comuni di pulizia e pre-elaborazione dei dati.'),
(484, 3, 'Cosa si intende per "analisi esplorativa dei dati" (EDA)?'),
(484, 4, 'Spiega l importanza della visualizzazione dei dati.'),
(484, 5, 'Cita alcuni strumenti software comuni utilizzati nella data science (es. Python, R, SQL).');

-- Quiz 485: Web Development
INSERT INTO Domanda (quiz, numero, testo) VALUES
(485, 1, 'Qual è la differenza tra front-end e back-end nello sviluppo web?'),
(485, 2, 'Descrivi i ruoli di HTML, CSS e JavaScript nello sviluppo front-end.'),
(485, 3, 'Cosa sono i framework front-end (es. React, Angular, Vue) e back-end (es. Node.js/Express, Django, Ruby on Rails)?'),
(485, 4, 'Spiega cos è un database e come interagisce con un applicazione web.'),
(485, 5, 'Cosa sono le API (Application Programming Interfaces) e come vengono utilizzate nello sviluppo web?');

-- Quiz 486: Database Management
INSERT INTO Domanda (quiz, numero, testo) VALUES
(486, 1, 'Qual è la differenza tra database relazionali (SQL) e non relazionali (NoSQL)?'),
(486, 2, 'Descrivi i concetti fondamentali dei database relazionali (tabelle, righe, colonne, chiavi primarie/esterne).'),
(486, 3, 'Cosa si intende per "normalizzazione" di un database relazionale?'),
(486, 4, 'Spiega le operazioni CRUD (Create, Read, Update, Delete) in SQL.'),
(486, 5, 'Cita alcuni tipi comuni di database NoSQL (document, key-value, column-family, graph).');

-- Quiz 487: Cybersecurity Essentials
INSERT INTO Domanda (quiz, numero, testo) VALUES
(487, 1, 'Quali sono le minacce informatiche più comuni (malware, phishing, ransomware, attacchi DDoS)?'),
(487, 2, 'Descrivi i principi fondamentali della sicurezza informatica: confidenzialità, integrità, disponibilità (CIA triad).'),
(487, 3, 'Cosa si intende per "autenticazione" e "autorizzazione"?'),
(487, 4, 'Spiega l importanza degli aggiornamenti software e delle password sicure.'),
(487, 5, 'Cita alcune buone pratiche per la navigazione sicura su Internet.');

-- Quiz 488: AI Ethics
INSERT INTO Domanda (quiz, numero, testo) VALUES
(488, 1, 'Quali sono le principali preoccupazioni etiche legate allo sviluppo e all uso dell intelligenza artificiale?'),
(488, 2, 'Cosa si intende per "bias" algoritmico e come può portare a discriminazioni?'),
(488, 3, 'Descrivi le sfide etiche legate alla privacy e alla sorveglianza nell era dell AI.'),
(488, 4, 'Spiega il concetto di "trasparenza" e "spiegabilità" (explainability) degli algoritmi di AI.'),
(488, 5, 'Quali sono le discussioni etiche riguardo all impatto dell AI sul lavoro e sulla società?');

-- Quiz 489: Cloud Computing
INSERT INTO Domanda (quiz, numero, testo) VALUES
(489, 1, 'Definisci cos è il cloud computing e quali sono i suoi vantaggi principali.'),
(489, 2, 'Descrivi i principali modelli di servizio cloud: IaaS, PaaS, SaaS.'),
(489, 3, 'Quali sono i diversi modelli di deployment del cloud: pubblico, privato, ibrido, multi-cloud?'),
(489, 4, 'Spiega alcuni servizi comuni offerti dai provider cloud (es. storage, database, calcolo, machine learning).'),
(489, 5, 'Quali sono le considerazioni sulla sicurezza e sulla privacy nel cloud computing?');

-- Quiz 490: Big Data Analytics
INSERT INTO Domanda (quiz, numero, testo) VALUES
(490, 1, 'Cosa si intende per "Big Data" e quali sono le sue caratteristiche principali (Volume, Velocità, Varietà, Veridicità, Valore)?'),
(490, 2, 'Descrivi l architettura comune di un sistema Big Data (es. Hadoop ecosystem: HDFS, MapReduce, Spark).'),
(490, 3, 'Quali sono le principali tecniche di analisi utilizzate per i Big Data (es. machine learning, data mining, analisi predittiva)?'),
(490, 4, 'Spiega le sfide legate all acquisizione, archiviazione, elaborazione e analisi dei Big Data.'),
(490, 5, 'Cita alcune applicazioni pratiche dell analisi dei Big Data in diversi settori (es. marketing, finanza, sanità).');

-- Quiz 491: Internet of Things
INSERT INTO Domanda (quiz, numero, testo) VALUES
(491, 1, 'Definisci cos è l Internet of Things (IoT).'),
(491, 2, 'Quali sono i componenti principali di un sistema IoT (sensori/attuatori, connettività, piattaforma cloud, applicazione)?'),
(491, 3, 'Descrivi alcuni protocolli di comunicazione comuni utilizzati nell IoT (es. MQTT, CoAP, Bluetooth LE, LoRaWAN).'),
(491, 4, 'Quali sono le principali sfide legate alla sicurezza e alla privacy nell IoT?'),
(491, 5, 'Cita alcune applicazioni dell IoT in diversi ambiti (es. smart home, smart city, industria 4.0, sanità).');

-- Quiz 492: Blockchain Technologies
INSERT INTO Domanda (quiz, numero, testo) VALUES
(492, 1, 'Cos è una blockchain e quali sono le sue caratteristiche principali (decentralizzazione, immutabilità, trasparenza)?'),
(492, 2, 'Descrivi come funziona un blocco e come viene concatenato agli altri nella blockchain.'),
(492, 3, 'Spiega i meccanismi di consenso più comuni (es. Proof-of-Work, Proof-of-Stake).'),
(492, 4, 'Cosa sono gli "smart contract" e quali sono le loro potenziali applicazioni?'),
(492, 5, 'Quali sono le differenze tra blockchain pubbliche, private e permissioned/consortium?');

-- Quiz 493: UI/UX Design
INSERT INTO Domanda (quiz, numero, testo) VALUES
(493, 1, 'Qual è la differenza tra User Interface (UI) Design e User Experience (UX) Design?'),
(493, 2, 'Descrivi le fasi principali del processo di UX design (ricerca, progettazione, prototipazione, test).'),
(493, 3, 'Cosa sono le "personas" e gli "user journey maps" e come vengono utilizzati?'),
(493, 4, 'Spiega l importanza dei principi di usabilità e accessibilità nel design di interfacce.'),
(493, 5, 'Cita alcuni strumenti comuni utilizzati per la prototipazione e il design di UI/UX (es. Figma, Sketch, Adobe XD).');

-- Quiz 494: Mobile App Development
INSERT INTO Domanda (quiz, numero, testo) VALUES
(494, 1, 'Quali sono le principali piattaforme mobili (iOS, Android) e i loro linguaggi di programmazione nativi (Swift/Objective-C, Kotlin/Java)?'),
(494, 2, 'Cosa si intende per sviluppo "cross-platform" e quali framework comuni esistono (es. React Native, Flutter)?'),
(494, 3, 'Descrivi le principali linee guida di design per interfacce mobili (es. Material Design per Android, Human Interface Guidelines per iOS).'),
(494, 4, 'Spiega come gestire il ciclo di vita di un applicazione mobile.'),
(494, 5, 'Quali sono le sfide legate alle prestazioni, al consumo di batteria e alla gestione dei dati offline nelle app mobili?');

-- Quiz 495: Game Design
INSERT INTO Domanda (quiz, numero, testo) VALUES
(495, 1, 'Quali sono gli elementi fondamentali del game design (meccaniche, dinamiche, estetica, narrativa)?'),
(495, 2, 'Descrivi il concetto di "game loop" e la sua importanza.'),
(495, 3, 'Cosa si intende per "bilanciamento" del gioco?'),
(495, 4, 'Spiega l importanza del level design e della curva di difficoltà.'),
(495, 5, 'Cita alcuni generi di videogiochi comuni e le loro caratteristiche distintive.');

-- Quiz 496: Digital Marketing
INSERT INTO Domanda (quiz, numero, testo) VALUES
(496, 1, 'Quali sono i principali canali del digital marketing (SEO, SEM, social media marketing, email marketing, content marketing)?'),
(496, 2, 'Descrivi cos è la SEO (Search Engine Optimization) e perché è importante.'),
(496, 3, 'Cosa si intende per SEM (Search Engine Marketing) e pubblicità pay-per-click (PPC)?'),
(496, 4, 'Spiega l importanza del content marketing nella strategia digitale.'),
(496, 5, 'Quali sono le metriche chiave (KPI) per misurare il successo di una campagna di digital marketing?');

-- Quiz 497: SEO Optimization
INSERT INTO Domanda (quiz, numero, testo) VALUES
(497, 1, 'Qual è la differenza tra SEO on-page e SEO off-page?'),
(497, 2, 'Descrivi l importanza della ricerca delle parole chiave (keyword research).'),
(497, 3, 'Cosa sono i "backlink" e quale ruolo svolgono nella SEO off-page?'),
(497, 4, 'Spiega l importanza dei fattori tecnici della SEO (velocità del sito, ottimizzazione mobile, sitemap).'),
(497, 5, 'Cita alcuni strumenti comuni utilizzati per l analisi e il monitoraggio SEO (es. Google Analytics, Google Search Console, SEMrush).');

-- Quiz 498: E-commerce Strategies
INSERT INTO Domanda (quiz, numero, testo) VALUES
(498, 1, 'Quali sono i principali modelli di business dell e-commerce (B2C, B2B, C2C, D2C)?'),
(498, 2, 'Descrivi l importanza della user experience e del design del sito per un e-commerce.'),
(498, 3, 'Cosa si intende per "conversion rate optimization" (CRO) nell e-commerce?'),
(498, 4, 'Spiega le principali strategie di marketing per acquisire e fidelizzare clienti nell e-commerce.'),
(498, 5, 'Quali sono le sfide legate alla logistica, alle spedizioni e ai pagamenti nell e-commerce?');


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
-- Quiz 1: Storia dellarte
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(1, 1, 1, 'Michelangelo Buonarroti', 'Corretta', 10),
(1, 1, 2, 'Leonardo da Vinci', 'Sbagliata', 0),
(1, 1, 3, 'Raffaello Sanzio', 'Sbagliata', 0),
(1, 1, 4, 'Donatello', 'Sbagliata', 0);
-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(1, 2, 1, 'Approssimativamente dal XIV al XVI secolo', 'Corretta', 10),
(1, 2, 2, 'Dal X al XII secolo (Romanico)', 'Sbagliata', 0),
(1, 2, 3, 'Il XVII secolo (Barocco)', 'Sbagliata', 0),
(1, 2, 4, 'Il XVIII secolo (Neoclassicismo)', 'Sbagliata', 0);
-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(1, 3, 1, 'Leonardo da Vinci', 'Corretta', 10),
(1, 3, 2, 'Michelangelo Buonarroti', 'Sbagliata', 0),
(1, 3, 3, 'Raffaello Sanzio', 'Sbagliata', 0),
(1, 3, 4, 'Caravaggio', 'Sbagliata', 0);
-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(1, 4, 1, 'Uno stile artistico caratterizzato da forme elaborate, dinamismo e forte impatto emotivo', 'Corretta', 10),
(1, 4, 2, 'Uno stile basato sulla semplicità e l''equilibrio delle forme classiche', 'Sbagliata', 0),
(1, 4, 3, 'Un movimento che rifiuta la rappresentazione figurativa', 'Sbagliata', 0),
(1, 4, 4, 'Un termine che indica l''arte gotica', 'Sbagliata', 0);
-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(1, 5, 1, 'Michelangelo Buonarroti', 'Corretta', 10),
(1, 5, 2, 'Donatello', 'Sbagliata', 0), -- Anche Donatello fece un David, ma quello di Michelangelo è il più famoso
(1, 5, 3, 'Bernini', 'Sbagliata', 0),
(1, 5, 4, 'Canova', 'Sbagliata', 0);

-- Quiz 2: Matematica avanzata
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(2, 1, 1, 'Il tasso di variazione istantanea di una funzione', 'Corretta', 10),
(2, 1, 2, 'L''area sotto la curva di una funzione', 'Sbagliata', 0),
(2, 1, 3, 'Il valore massimo di una funzione', 'Sbagliata', 0),
(2, 1, 4, 'La pendenza di una retta secante', 'Sbagliata', 0);
-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(2, 2, 1, 'L''area netta tra il grafico di una funzione e l''asse x in un intervallo', 'Corretta', 10),
(2, 2, 2, 'L''operazione inversa della derivata (primitiva)', 'Sbagliata', 0), -- Questo è l'integrale indefinito
(2, 2, 3, 'La somma infinita di termini infinitesimi', 'Sbagliata', 0), -- Descrizione intuitiva ma imprecisa
(2, 2, 4, 'Il limite di una somma di Riemann', 'Sbagliata', 0); -- Parte della definizione, non la definizione completa
-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(2, 3, 1, 'Risoluzione di sistemi di equazioni lineari', 'Corretta', 10),
(2, 3, 2, 'Calcolo dei limiti di funzioni', 'Sbagliata', 0),
(2, 3, 3, 'Studio delle proprietà dei numeri primi', 'Sbagliata', 0),
(2, 3, 4, 'Calcolo delle probabilità', 'Sbagliata', 0);
-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(2, 4, 1, 'Il valore a cui tende l''output di una funzione quando l''input si avvicina a un certo valore', 'Corretta', 10),
(2, 4, 2, 'Il valore esatto della funzione in un punto', 'Sbagliata', 0),
(2, 4, 3, 'La pendenza della retta tangente al grafico', 'Sbagliata', 0), -- Legato alla derivata
(2, 4, 4, 'Un intervallo di valori sull''asse y', 'Sbagliata', 0);
-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(2, 5, 1, 'Collega l''integrale definito e la derivata (o primitiva)', 'Corretta', 10),
(2, 5, 2, 'Definisce la convergenza delle serie numeriche', 'Sbagliata', 0),
(2, 5, 3, 'Stabilisce le proprietà degli spazi vettoriali', 'Sbagliata', 0),
(2, 5, 4, 'Riguarda le proprietà dei triangoli rettangoli', 'Sbagliata', 0); -- Teorema di Pitagora

-- Quiz 3: Fisica moderna
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(3, 1, 1, 'Le leggi fisiche sono invarianti in sistemi inerziali e la velocità della luce è costante', 'Corretta', 10),
(3, 1, 2, 'La gravità è dovuta alla curvatura dello spaziotempo', 'Sbagliata', 0), -- Relatività Generale
(3, 1, 3, 'L''energia è quantizzata in pacchetti discreti (quanti)', 'Sbagliata', 0), -- Meccanica Quantistica
(3, 1, 4, 'È impossibile conoscere simultaneamente posizione e quantità di moto', 'Sbagliata', 0); -- Principio indeterminazione
-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(3, 2, 1, 'Albert Einstein', 'Corretta', 10),
(3, 2, 2, 'Isaac Newton', 'Sbagliata', 0),
(3, 2, 3, 'Max Planck', 'Sbagliata', 0),
(3, 2, 4, 'Niels Bohr', 'Sbagliata', 0);
-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(3, 3, 1, 'La teoria che descrive il comportamento della materia a livello atomico e subatomico', 'Corretta', 10),
(3, 3, 2, 'La teoria della gravità basata sulla curvatura dello spaziotempo', 'Sbagliata', 0),
(3, 3, 3, 'La teoria che descrive il moto dei corpi a velocità prossime a quella della luce', 'Sbagliata', 0),
(3, 3, 4, 'La teoria unificata delle forze fondamentali', 'Sbagliata', 0); -- Non ancora raggiunta
-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(3, 4, 1, 'Le particelle subatomiche mostrano proprietà sia di onde che di particelle', 'Corretta', 10),
(3, 4, 2, 'L''energia può essere convertita in massa e viceversa', 'Sbagliata', 0),
(3, 4, 3, 'Lo spazio e il tempo sono relativi e interconnessi', 'Sbagliata', 0),
(3, 4, 4, 'Le particelle possono essere in più stati contemporaneamente (sovrapposizione)', 'Sbagliata', 0);
-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(3, 5, 1, 'L''equivalenza tra massa ed energia', 'Corretta', 10),
(3, 5, 2, 'La quantizzazione dell''energia', 'Sbagliata', 0),
(3, 5, 3, 'La legge di gravitazione universale', 'Sbagliata', 0),
(3, 5, 4, 'Il principio di indeterminazione', 'Sbagliata', 0);

-- Quiz 4: Letteratura italiana
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(4, 1, 1, 'Alessandro Manzoni', 'Corretta', 10),
(4, 1, 2, 'Giovanni Verga', 'Sbagliata', 0),
(4, 1, 3, 'Ugo Foscolo', 'Sbagliata', 0),
(4, 1, 4, 'Giacomo Leopardi', 'Sbagliata', 0);
-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(4, 2, 1, 'Decadentismo, Ermetismo, Neorealismo, Neoavanguardia', 'Corretta', 10),
(4, 2, 2, 'Romanticismo, Verismo, Classicismo', 'Sbagliata', 0), -- Alcune sono del XIX sec.
(4, 2, 3, 'Illuminismo, Barocco, Rinascimento', 'Sbagliata', 0), -- Periodi precedenti
(4, 2, 4, 'Dolce Stil Novo, Umanesimo, Petrarchismo', 'Sbagliata', 0); -- Periodi molto precedenti
-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(4, 3, 1, 'Vita Nova', 'Corretta', 10),
(4, 3, 2, 'Decameron', 'Sbagliata', 0), -- Boccaccio
(4, 3, 3, 'Canzoniere', 'Sbagliata', 0), -- Petrarca
(4, 3, 4, 'Orlando Furioso', 'Sbagliata', 0); -- Ariosto
-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(4, 4, 1, 'Rappresentazione oggettiva della realtà, impersonalità, attenzione agli umili', 'Corretta', 10),
(4, 4, 2, 'Esaltazione del sentimento, individualismo, amore per la natura', 'Sbagliata', 0), -- Romanticismo
(4, 4, 3, 'Ricerca della parola pura, linguaggio analogico, oscurità', 'Sbagliata', 0), -- Ermetismo
(4, 4, 4, 'Sperimentalismo linguistico, rottura con la tradizione', 'Sbagliata', 0); -- Neoavanguardia
-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(4, 5, 1, 'Giuseppe Tomasi di Lampedusa', 'Corretta', 10),
(4, 5, 2, 'Italo Calvino', 'Sbagliata', 0),
(4, 5, 3, 'Cesare Pavese', 'Sbagliata', 0),
(4, 5, 4, 'Alberto Moravia', 'Sbagliata', 0);

-- Quiz 5: Geografia mondiale
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(5, 1, 1, 'Asia', 'Corretta', 10),
(5, 1, 2, 'Africa', 'Sbagliata', 0),
(5, 1, 3, 'America (Nord e Sud combinate)', 'Sbagliata', 0),
(5, 1, 4, 'Europa', 'Sbagliata', 0);
-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(5, 2, 1, 'Nilo, Rio delle Amazzoni, Mississippi', 'Corretta', 10),
(5, 2, 2, 'Tevere, Senna, Tamigi', 'Sbagliata', 0), -- Fiumi europei importanti ma non tra i più grandi
(5, 2, 3, 'Gange, Indo, Mekong', 'Sbagliata', 0), -- Fiumi asiatici importanti ma non i 3 più lunghi/vasti
(5, 2, 4, 'Danubio, Volga, Reno', 'Sbagliata', 0); -- Fiumi europei
-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(5, 3, 1, 'La depressione oceanica più profonda della Terra', 'Corretta', 10),
(5, 3, 2, 'Una catena montuosa sottomarina', 'Sbagliata', 0),
(5, 3, 3, 'Un grande altopiano asiatico', 'Sbagliata', 0),
(5, 3, 4, 'Un deserto africano', 'Sbagliata', 0);
-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(5, 4, 1, 'Equatoriale, Tropicale, Temperato, Freddo (Polare)', 'Corretta', 10),
(5, 4, 2, 'Caldo, Tiepido, Fresco, Gelido', 'Sbagliata', 0), -- Descrizioni generiche
(5, 4, 3, 'Arido, Umido, Semiarido', 'Sbagliata', 0), -- Classificazione basata sulle precipitazioni
(5, 4, 4, 'Continentale, Oceanico, Mediterraneo', 'Sbagliata', 0); -- Sottotipi di climi temperati
-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(5, 5, 1, 'Himalaya', 'Corretta', 10),
(5, 5, 2, 'Ande', 'Sbagliata', 0),
(5, 5, 3, 'Alpi', 'Sbagliata', 0),
(5, 5, 4, 'Montagne Rocciose', 'Sbagliata', 0);

-- Quiz 6: Chimica organica
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(6, 1, 1, 'Lo studio dei composti contenenti carbonio', 'Corretta', 10),
(6, 1, 2, 'Lo studio dei metalli e dei loro composti', 'Sbagliata', 0),
(6, 1, 3, 'Lo studio delle reazioni nucleari', 'Sbagliata', 0),
(6, 1, 4, 'Lo studio degli acidi e delle basi', 'Sbagliata', 0); -- Anche se trattati, non è l'oggetto principale
-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(6, 2, 1, 'CnH(2n+2)', 'Corretta', 10),
(6, 2, 2, 'CnH(2n)', 'Sbagliata', 0), -- Alcheni o cicloalcani
(6, 2, 3, 'CnH(2n-2)', 'Sbagliata', 0), -- Alchini o alcadieni
(6, 2, 4, 'CnH(n)', 'Sbagliata', 0);
-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(6, 3, 1, 'Molecole con stessa formula bruta ma diversa struttura o disposizione spaziale', 'Corretta', 10),
(6, 3, 2, 'Atomi dello stesso elemento con diverso numero di neutroni', 'Sbagliata', 0), -- Isotopi
(6, 3, 3, 'Molecole con diverso numero di atomi', 'Sbagliata', 0),
(6, 3, 4, 'Miscele di composti diversi', 'Sbagliata', 0);
-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(6, 4, 1, 'Gruppo ossidrile (-OH)', 'Corretta', 10),
(6, 4, 2, 'Gruppo metile (-CH3)', 'Sbagliata', 0), -- Gruppo alchilico
(6, 4, 3, 'Legame ionico', 'Sbagliata', 0), -- Tipo di legame
(6, 4, 4, 'Anello benzenico', 'Sbagliata', 0); -- Struttura specifica
-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(6, 5, 1, 'La sua capacità di formare quattro legami covalenti stabili e catene lunghe', 'Corretta', 10),
(6, 5, 2, 'La sua elevata elettronegatività', 'Sbagliata', 0),
(6, 5, 3, 'La sua abbondanza nella crosta terrestre', 'Sbagliata', 0), -- È abbondante ma non il motivo principale
(6, 5, 4, 'La sua capacità di formare legami ionici', 'Sbagliata', 0);

-- Quiz 7: Biologia cellulare
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(7, 1, 1, 'Contenere il DNA e controllare le attività cellulari', 'Corretta', 10),
(7, 1, 2, 'Produrre energia (ATP)', 'Sbagliata', 0), -- Mitocondri
(7, 1, 3, 'Sintetizzare proteine', 'Sbagliata', 0), -- Ribosomi
(7, 1, 4, 'Demolire sostanze di scarto', 'Sbagliata', 0); -- Lisosomi
-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(7, 2, 1, 'Organelli responsabili della respirazione cellulare (produzione di ATP)', 'Corretta', 10),
(7, 2, 2, 'Organelli che svolgono la fotosintesi', 'Sbagliata', 0), -- Cloroplasti
(7, 2, 3, 'Sacche membranose contenenti enzimi digestivi', 'Sbagliata', 0), -- Lisosomi
(7, 2, 4, 'Il centro di controllo della cellula contenente il DNA', 'Sbagliata', 0); -- Nucleo
-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(7, 3, 1, 'Doppio strato fosfolipidico con proteine integrate', 'Corretta', 10),
(7, 3, 2, 'Una rigida parete di cellulosa', 'Sbagliata', 0), -- Parete cellulare vegetale
(7, 3, 3, 'Una singola membrana contenente il citoplasma', 'Sbagliata', 0), -- Troppo generico
(7, 3, 4, 'Un involucro nucleare poroso', 'Sbagliata', 0); -- Membrana nucleare
-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(7, 4, 1, 'Le eucariote hanno nucleo e organelli membranosi, le procariote no', 'Corretta', 10),
(7, 4, 2, 'Le procariote sono più grandi delle eucariote', 'Sbagliata', 0),
(7, 4, 3, 'Le eucariote si riproducono solo asessualmente', 'Sbagliata', 0),
(7, 4, 4, 'Le procariote hanno una parete cellulare, le eucariote no', 'Sbagliata', 0); -- Alcune eucariote (piante, funghi) ce l'hanno
-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(7, 5, 1, 'Divisione cellulare che produce cellule figlie identiche (diploidi)', 'Corretta', 10),
(7, 5, 2, 'Divisione cellulare che produce gameti (aploidi)', 'Sbagliata', 0), -- Meiosi
(7, 5, 3, 'Il processo di sintesi delle proteine', 'Sbagliata', 0),
(7, 5, 4, 'La morte cellulare programmata', 'Sbagliata', 0); -- Apoptosi

-- Quiz 8: Storia contemporanea
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(8, 1, 1, 'La Rivoluzione Francese o il Congresso di Vienna', 'Corretta', 10),
(8, 1, 2, 'La caduta dell''Impero Romano d''Occidente', 'Sbagliata', 0), -- Inizio Medioevo
(8, 1, 3, 'La scoperta dell''America', 'Sbagliata', 0), -- Inizio Età Moderna
(8, 1, 4, 'La Prima Guerra Mondiale', 'Sbagliata', 0); -- Considerato da alcuni l'inizio del 'secolo breve'
-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(8, 2, 1, 'Lo stato di tensione tra USA e URSS e i rispettivi alleati (1947-1991)', 'Corretta', 10),
(8, 2, 2, 'Il conflitto armato tra le due superpotenze', 'Sbagliata', 0), -- Non ci fu scontro diretto
(8, 2, 3, 'Il periodo tra le due guerre mondiale', 'Sbagliata', 0),
(8, 2, 4, 'La corsa agli armamenti nucleari', 'Sbagliata', 0); -- Un aspetto, non la definizione completa
-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(8, 3, 1, 'Imperialismo, nazionalismo, militarismo, sistema di alleanze', 'Corretta', 10),
(8, 3, 2, 'L''invasione della Polonia da parte della Germania', 'Sbagliata', 0), -- Causa scatenante WWII
(8, 3, 3, 'La crisi economica del 1929', 'Sbagliata', 0),
(8, 3, 4, 'La Rivoluzione Russa', 'Sbagliata', 0); -- Conseguenza, non causa
-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(8, 4, 1, 'Il processo di indipendenza delle colonie afro-asiatiche dalle potenze europee', 'Corretta', 10),
(8, 4, 2, 'L''espansione coloniale europea nel XIX secolo', 'Sbagliata', 0),
(8, 4, 3, 'La formazione dell''Unione Europea', 'Sbagliata', 0),
(8, 4, 4, 'La spartizione dell''Africa alla Conferenza di Berlino', 'Sbagliata', 0);
-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(8, 5, 1, 'Roosevelt, Churchill, Stalin (Alleati); Hitler, Mussolini (Asse)', 'Corretta', 10),
(8, 5, 2, 'Wilson, Clemenceau, Lloyd George', 'Sbagliata', 0), -- Leader WWI
(8, 5, 3, 'Napoleone, Wellington, Zar Alessandro I', 'Sbagliata', 0), -- Periodo napoleonico
(8, 5, 4, 'Reagan, Thatcher, Gorbaciov', 'Sbagliata', 0); -- Fine Guerra Fredda

-- Quiz 9: Astronomia
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(9, 1, 1, 'Un enorme insieme di stelle, gas, polveri e materia oscura legati dalla gravità', 'Corretta', 10),
(9, 1, 2, 'Un sistema composto da una stella e dai pianeti che le orbitano attorno', 'Sbagliata', 0), -- Sistema planetario
(9, 1, 3, 'Una nube di gas e polveri nello spazio interstellare', 'Sbagliata', 0), -- Nebulosa
(9, 1, 4, 'Un corpo celeste roccioso in orbita attorno a una stella', 'Sbagliata', 0); -- Pianeta o asteroide
-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(9, 2, 1, 'Giove', 'Corretta', 10),
(9, 2, 2, 'Saturno', 'Sbagliata', 0),
(9, 2, 3, 'Terra', 'Sbagliata', 0),
(9, 2, 4, 'Nettuno', 'Sbagliata', 0);
-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(9, 3, 1, 'Nascita da nebulosa, sequenza principale, gigante/supergigante, fase finale (nana bianca/stella neutroni/buco nero)', 'Corretta', 10),
(9, 3, 2, 'Formazione, collisione con asteroidi, raffreddamento', 'Sbagliata', 0), -- Ciclo planetario?
(9, 3, 3, 'Accrescimento, fusione nucleare, esplosione', 'Sbagliata', 0), -- Semplificato e impreciso
(9, 3, 4, 'Rotazione, rivoluzione attorno alla galassia, morte termica', 'Sbagliata', 0);
-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(9, 4, 1, 'Regioni con gravità così forte che nulla, neanche la luce, può sfuggire', 'Corretta', 10),
(9, 4, 2, 'Stelle estremamente dense formate dal collasso di stelle massicce', 'Sbagliata', 0), -- Stelle di neutroni
(9, 4, 3, 'Galassie con un nucleo estremamente luminoso', 'Sbagliata', 0), -- Quasar/AGN
(9, 4, 4, 'Oggetti ipotetici che emettono materia invece di assorbirla', 'Sbagliata', 0); -- Buchi bianchi (ipotetici)
-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(9, 5, 1, 'Gli asteroidi sono rocciosi, le comete sono corpi ghiacciati con chioma/coda', 'Corretta', 10),
(9, 5, 2, 'Gli asteroidi orbitano attorno ai pianeti, le comete attorno al Sole', 'Sbagliata', 0), -- Gli asteroidi orbitano principalmente attorno al Sole
(9, 5, 3, 'Le comete sono più grandi degli asteroidi', 'Sbagliata', 0), -- Non necessariamente
(9, 5, 4, 'Gli asteroidi sono visibili solo al telescopio, le comete a occhio nudo', 'Sbagliata', 0); -- Dipende dalla dimensione e distanza

-- Quiz 10: Informatica di base
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(10, 1, 1, 'Il software che gestisce le risorse hardware e fornisce servizi alle applicazioni', 'Corretta', 10),
(10, 1, 2, 'L''insieme dei componenti fisici di un computer', 'Sbagliata', 0), -- Hardware
(10, 1, 3, 'Un programma per navigare su Internet', 'Sbagliata', 0), -- Browser
(10, 1, 4, 'L''unità centrale di elaborazione (CPU)', 'Sbagliata', 0); -- Componente hardware
-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(10, 2, 1, 'Hardware sono i componenti fisici, software i programmi e i dati', 'Corretta', 10),
(10, 2, 2, 'Hardware è la memoria principale, software la memoria secondaria', 'Sbagliata', 0),
(10, 2, 3, 'Hardware sono le periferiche, software il sistema operativo', 'Sbagliata', 0), -- Incompleto
(10, 2, 4, 'Hardware si può toccare, software no', 'Sbagliata', 0); -- Semplificazione eccessiva
-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(10, 3, 1, 'Central Processing Unit (Unità Centrale di Elaborazione)', 'Corretta', 10),
(10, 3, 2, 'Computer Processing Unit', 'Sbagliata', 0), -- Errore comune
(10, 3, 3, 'La memoria principale del computer (RAM)', 'Sbagliata', 0),
(10, 3, 4, 'Il disco rigido dove si salvano i dati', 'Sbagliata', 0);
-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(10, 4, 1, 'Memoria volatile ad accesso rapido per dati e programmi in esecuzione', 'Corretta', 10),
(10, 4, 2, 'Memoria permanente per l''avvio del sistema (BIOS/UEFI)', 'Sbagliata', 0), -- ROM
(10, 4, 3, 'Memoria di massa per l''archiviazione a lungo termine dei file', 'Sbagliata', 0), -- Hard disk/SSD
(10, 4, 4, 'Memoria cache della CPU', 'Sbagliata', 0);
-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(10, 5, 1, 'Una rete globale di computer interconnessi', 'Corretta', 10),
(10, 5, 2, 'Un programma per cercare informazioni (motore di ricerca)', 'Sbagliata', 0),
(10, 5, 3, 'Il World Wide Web (WWW)', 'Sbagliata', 0), -- Servizio su Internet
(10, 5, 4, 'Un tipo di connessione wireless (Wi-Fi)', 'Sbagliata', 0);

-- Quiz 11: Filosofia antica
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(11, 1, 1, 'Socrate (o Talete)', 'Corretta', 10),
(11, 1, 2, 'Platone', 'Sbagliata', 0),
(11, 1, 3, 'Aristotele', 'Sbagliata', 0),
(11, 1, 4, 'Epicuro', 'Sbagliata', 0);
-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(11, 2, 1, 'Repubblica, Fedone, Simposio', 'Corretta', 10),
(11, 2, 2, 'Etica Nicomachea, Politica', 'Sbagliata', 0), -- Aristotele
(11, 2, 3, 'Lettera sulla Felicità, Massime Capitali', 'Sbagliata', 0), -- Epicuro
(11, 2, 4, 'Meditazioni', 'Sbagliata', 0); -- Marco Aurelio (Stoicismo)
-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(11, 3, 1, 'Il principio originario o sostanza fondamentale di tutte le cose', 'Corretta', 10),
(11, 3, 2, 'La forma ideale e perfetta delle cose sensibili', 'Sbagliata', 0), -- Teoria delle Idee (Platone)
(11, 3, 3, 'La causa finale o scopo di un ente', 'Sbagliata', 0), -- Causa finale (Aristotele)
(11, 3, 4, 'L''anima immortale', 'Sbagliata', 0);
-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(11, 4, 1, 'Dialogo basato su domande per raggiungere la conoscenza (maieutica)', 'Corretta', 10),
(11, 4, 2, 'Metodo deduttivo basato su sillogismi', 'Sbagliata', 0), -- Aristotele
(11, 4, 3, 'Metodo induttivo basato sull''osservazione empirica', 'Sbagliata', 0),
(11, 4, 4, 'Metodo basato sulla retorica e la persuasione', 'Sbagliata', 0); -- Sofisti
-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(11, 5, 1, 'Metafisica', 'Corretta', 10),
(11, 5, 2, 'Repubblica', 'Sbagliata', 0), -- Platone
(11, 5, 3, 'Sulla Natura', 'Sbagliata', 0), -- Titolo comune a molti presocratici
(11, 5, 4, 'Apologia di Socrate', 'Sbagliata', 0); -- Platone

-- Quiz 12: Psicologia
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(12, 1, 1, 'La mente e il comportamento umano', 'Corretta', 10),
(12, 1, 2, 'Le malattie del sistema nervoso', 'Sbagliata', 0), -- Neurologia
(12, 1, 3, 'L''organizzazione sociale e le istituzioni', 'Sbagliata', 0), -- Sociologia
(12, 1, 4, 'L''evoluzione della specie umana', 'Sbagliata', 0); -- Antropologia fisica
-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(12, 2, 1, 'Sigmund Freud', 'Corretta', 10),
(12, 2, 2, 'Carl Jung', 'Sbagliata', 0),
(12, 2, 3, 'B.F. Skinner', 'Sbagliata', 0), -- Comportamentismo
(12, 2, 4, 'Carl Rogers', 'Sbagliata', 0); -- Psicologia umanistica
-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(12, 3, 1, 'Clinica, Sociale, dello Sviluppo, Cognitiva', 'Corretta', 10),
(12, 3, 2, 'Fisiologia, Anatomia, Biochimica', 'Sbagliata', 0), -- Discipline biologiche
(12, 3, 3, 'Pedagogia, Sociologia, Antropologia', 'Sbagliata', 0), -- Discipline correlate ma distinte
(12, 3, 4, 'Psichiatria, Neurologia, Neurochirurgia', 'Sbagliata', 0); -- Discipline mediche
-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(12, 4, 1, 'Approccio che studia il comportamento osservabile come risposta a stimoli ambientali', 'Corretta', 10),
(12, 4, 2, 'Approccio che enfatizza il ruolo dell''inconscio e delle esperienze infantili', 'Sbagliata', 0), -- Psicoanalisi
(12, 4, 3, 'Approccio che studia i processi mentali interni (pensiero, memoria, percezione)', 'Sbagliata', 0), -- Cognitivismo
(12, 4, 4, 'Approccio che si concentra sull''esperienza soggettiva e l''autorealizzazione', 'Sbagliata', 0); -- Psicologia umanistica
-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(12, 5, 1, 'Parte della mente inaccessibile alla coscienza contenente impulsi e ricordi rimossi', 'Corretta', 10),
(12, 5, 2, 'La parte razionale e consapevole della personalità', 'Sbagliata', 0), -- Io (Ego)
(12, 5, 3, 'L''istanza morale che interiorizza norme e divieti', 'Sbagliata', 0), -- Super-Io (Super-Ego)
(12, 5, 4, 'L''insieme delle funzioni cognitive superiori', 'Sbagliata', 0);

-- Quiz 13: Economia
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(13, 1, 1, 'Prodotto Interno Lordo: valore dei beni/servizi finali prodotti in un paese in un anno', 'Corretta', 10),
(13, 1, 2, 'Prodotto Nazionale Lordo: valore prodotto dai cittadini di un paese, ovunque si trovino', 'Sbagliata', 0),
(13, 1, 3, 'Indice dei Prezzi al Consumo: misura dell''inflazione', 'Sbagliata', 0),
(13, 1, 4, 'Tasso di Disoccupazione: percentuale di forza lavoro senza occupazione', 'Sbagliata', 0);
-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(13, 2, 1, 'Micro: singoli agenti; Macro: aggregati economici (PIL, inflazione)', 'Corretta', 10),
(13, 2, 2, 'Micro: breve periodo; Macro: lungo periodo', 'Sbagliata', 0),
(13, 2, 3, 'Micro: mercati nazionali; Macro: mercati internazionali', 'Sbagliata', 0),
(13, 2, 4, 'Micro: economia reale; Macro: economia finanziaria', 'Sbagliata', 0);
-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(13, 3, 1, 'Relazione tra prezzo e quantità che consumatori/produttori sono disposti a scambiare', 'Corretta', 10),
(13, 3, 2, 'L''equilibrio tra importazioni ed esportazioni', 'Sbagliata', 0),
(13, 3, 3, 'Il rapporto tra risparmi e investimenti', 'Sbagliata', 0),
(13, 3, 4, 'La differenza tra ricavi e costi totali', 'Sbagliata', 0);
-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(13, 4, 1, 'Aumento generalizzato e persistente dei prezzi', 'Corretta', 10),
(13, 4, 2, 'Diminuzione generalizzata dei prezzi', 'Sbagliata', 0), -- Deflazione
(13, 4, 3, 'Rallentamento della crescita economica', 'Sbagliata', 0), -- Recessione
(13, 4, 4, 'Aumento del tasso di disoccupazione', 'Sbagliata', 0);
-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(13, 5, 1, 'Keynes: necessità di intervento statale per sostenere la domanda aggregata', 'Corretta', 10),
(13, 5, 2, 'Marx: critica al capitalismo e teoria del plusvalore', 'Sbagliata', 0),
(13, 5, 3, 'Friedman: teoria monetarista e critica all''intervento statale', 'Sbagliata', 0),
(13, 5, 4, 'Ricardo: teoria dei vantaggi comparati nel commercio internazionale', 'Sbagliata', 0);

-- Quiz 14: Sociologia
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(14, 1, 1, 'La società umana, le sue istituzioni e le relazioni sociali', 'Corretta', 10),
(14, 1, 2, 'La mente e il comportamento individuale', 'Sbagliata', 0), -- Psicologia
(14, 1, 3, 'La produzione, distribuzione e consumo di beni e servizi', 'Sbagliata', 0), -- Economia
(14, 1, 4, 'Il potere politico, lo stato e il governo', 'Sbagliata', 0); -- Scienza politica
-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(14, 2, 1, 'Comte, Durkheim, Marx, Weber', 'Corretta', 10),
(14, 2, 2, 'Platone, Aristotele, Socrate', 'Sbagliata', 0), -- Filosofi antichi
(14, 2, 3, 'Freud, Jung, Adler', 'Sbagliata', 0), -- Psicoanalisti
(14, 2, 4, 'Smith, Ricardo, Keynes', 'Sbagliata', 0); -- Economisti
-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(14, 3, 1, 'Il modello organizzato di relazioni sociali e istituzioni che compongono una società', 'Corretta', 10),
(14, 3, 2, 'L''insieme delle norme e dei valori condivisi', 'Sbagliata', 0), -- Cultura
(14, 3, 3, 'La divisione della società in classi o strati', 'Sbagliata', 0), -- Stratificazione sociale
(14, 3, 4, 'Il processo di apprendimento delle norme sociali', 'Sbagliata', 0); -- Socializzazione
-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(14, 4, 1, 'Il processo di apprendimento di norme, valori e comportamenti sociali', 'Corretta', 10),
(14, 4, 2, 'La mobilità tra diverse classi sociali', 'Sbagliata', 0), -- Mobilità sociale
(14, 4, 3, 'L''organizzazione gerarchica della società', 'Sbagliata', 0), -- Stratificazione sociale
(14, 4, 4, 'L''interazione tra individui e gruppi', 'Sbagliata', 0); -- Interazione sociale
-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(14, 5, 1, 'Primario: intimo (famiglia); Secondario: formale (lavoro)', 'Corretta', 10),
(14, 5, 2, 'Primario: grande; Secondario: piccolo', 'Sbagliata', 0),
(14, 5, 3, 'Primario: volontario; Secondario: obbligatorio', 'Sbagliata', 0),
(14, 5, 4, 'Primario: rurale; Secondario: urbano', 'Sbagliata', 0);

-- Quiz 15: Antropologia
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(15, 1, 1, 'L''essere umano sotto l''aspetto culturale, sociale e biologico', 'Corretta', 10),
(15, 1, 2, 'Le società animali', 'Sbagliata', 0), -- Etologia
(15, 1, 3, 'I resti materiali delle civiltà passate', 'Sbagliata', 0), -- Archeologia (una branca)
(15, 1, 4, 'Le lingue umane e la loro evoluzione', 'Sbagliata', 0); -- Antropologia linguistica (una branca)
-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(15, 2, 1, 'Culturale/Sociale, Fisica/Biologica, Archeologia, Linguistica', 'Corretta', 10),
(15, 2, 2, 'Storica, Economica, Politica, Geografica', 'Sbagliata', 0),
(15, 2, 3, 'Psicologica, Sociologica, Filosofica, Medica', 'Sbagliata', 0),
(15, 2, 4, 'Urbana, Rurale, Industriale, Post-industriale', 'Sbagliata', 0);
-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(15, 3, 1, 'L''insieme di idee, comportamenti, simboli e pratiche appresi e condivisi da un gruppo umano', 'Corretta', 10),
(15, 3, 2, 'L''insieme delle opere d''arte e letterarie di una società', 'Sbagliata', 0), -- Accezione ristretta
(15, 3, 3, 'Il patrimonio genetico di una popolazione', 'Sbagliata', 0),
(15, 3, 4, 'L''organizzazione politica ed economica di una società', 'Sbagliata', 0);
-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(15, 4, 1, 'Giudicare le altre culture basandosi sui propri standard culturali', 'Corretta', 10),
(15, 4, 2, 'Considerare tutte le culture come ugualmente valide', 'Sbagliata', 0), -- Relativismo culturale
(15, 4, 3, 'Lo studio delle diverse etnie umane', 'Sbagliata', 0), -- Etnologia
(15, 4, 4, 'La diffusione di elementi culturali da una società all''altra', 'Sbagliata', 0); -- Acculturazione/Diffusione
-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(15, 5, 1, 'Claude Lévi-Strauss: strutturalismo', 'Corretta', 10),
(15, 5, 2, 'Sigmund Freud: psicoanalisi', 'Sbagliata', 0),
(15, 5, 3, 'Max Weber: sociologia comprendente', 'Sbagliata', 0),
(15, 5, 4, 'Charles Darwin: teoria dell''evoluzione', 'Sbagliata', 0);

-- Quiz 16: Storia medievale
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(16, 1, 1, 'Caduta dell''Impero Romano d''Occidente (476 d.C.)', 'Corretta', 10),
(16, 1, 2, 'Scoperta dell''America (1492)', 'Sbagliata', 0), -- Fine Medioevo / Inizio Età Moderna
(16, 1, 3, 'Nascita di Cristo', 'Sbagliata', 0),
(16, 1, 4, 'Inizio della Prima Crociata (1096)', 'Sbagliata', 0); -- Evento medievale, non inizio
-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(16, 2, 1, 'Sistema sociale, politico ed economico basato su legami personali e concessione di terre (feudi)', 'Corretta', 10),
(16, 2, 2, 'Sistema basato sulla proprietà privata dei mezzi di produzione', 'Sbagliata', 0), -- Capitalismo
(16, 2, 3, 'Sistema basato sulla schiavitù diffusa', 'Sbagliata', 0), -- Tipico dell'antichità
(16, 2, 4, 'Sistema di governo democratico', 'Sbagliata', 0);
-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(16, 3, 1, 'Riconquista (temporanea) di Gerusalemme, intensificazione scambi culturali/commerciali, rafforzamento autorità papale', 'Corretta', 10),
(16, 3, 2, 'Caduta dell''Impero Bizantino', 'Sbagliata', 0), -- Avvenuta dopo, anche se legata
(16, 3, 3, 'Diffusione del Protestantesimo', 'Sbagliata', 0), -- Secoli dopo
(16, 3, 4, 'Unificazione dell''Italia', 'Sbagliata', 0); -- Secoli dopo
-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(16, 4, 1, 'Centro della vita spirituale, culturale, politica ed economica', 'Corretta', 10),
(16, 4, 2, 'Ruolo marginale e perseguitata', 'Sbagliata', 0), -- Come nel primo periodo romano
(16, 4, 3, 'Esclusivamente focalizzata sulla vita monastica', 'Sbagliata', 0), -- Ruolo molto più ampio
(16, 4, 4, 'Subordinata al potere imperiale', 'Sbagliata', 0); -- Spesso in conflitto o alleanza
-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(16, 5, 1, 'Re dei Franchi e Imperatore del Sacro Romano Impero', 'Corretta', 10),
(16, 5, 2, 'Condottiero normanno che conquistò l''Inghilterra', 'Sbagliata', 0), -- Guglielmo il Conquistatore
(16, 5, 3, 'Papa che indisse la Prima Crociata', 'Sbagliata', 0), -- Urbano II
(16, 5, 4, 'Imperatore bizantino durante la caduta di Costantinopoli', 'Sbagliata', 0); -- Costantino XI

-- Quiz 17: Letteratura inglese
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(17, 1, 1, 'William Shakespeare', 'Corretta', 10),
(17, 1, 2, 'Christopher Marlowe', 'Sbagliata', 0),
(17, 1, 3, 'Geoffrey Chaucer', 'Sbagliata', 0),
(17, 1, 4, 'John Milton', 'Sbagliata', 0);
-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(17, 2, 1, 'Fioritura del teatro, poesia lirica (sonetto), mecenatismo', 'Corretta', 10),
(17, 2, 2, 'Critica sociale, realismo, romanzo come forma dominante', 'Sbagliata', 0), -- Periodo Vittoriano
(17, 2, 3, 'Enfasi sul sentimento, natura, individualismo', 'Sbagliata', 0), -- Romanticismo
(17, 2, 4, 'Sperimentalismo formale, frammentazione, soggettività', 'Sbagliata', 0); -- Modernismo
-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(17, 3, 1, 'Orgoglio e Pregiudizio', 'Corretta', 10),
(17, 3, 2, 'Jane Eyre', 'Sbagliata', 0), -- Charlotte Brontë
(17, 3, 3, 'Grandi Speranze', 'Sbagliata', 0), -- Charles Dickens
(17, 3, 4, 'Frankenstein', 'Sbagliata', 0); -- Mary Shelley
-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(17, 4, 1, 'Movimento letterario che enfatizza emozione, immaginazione e natura', 'Corretta', 10),
(17, 4, 2, 'Movimento focalizzato sulla ragione e l''ordine (Illuminismo)', 'Sbagliata', 0),
(17, 4, 3, 'Movimento che rappresenta realisticamente la vita quotidiana (Realismo)', 'Sbagliata', 0),
(17, 4, 4, 'Movimento con forme sperimentali e soggettive (Modernismo)', 'Sbagliata', 0);
-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(17, 5, 1, 'George Orwell', 'Corretta', 10),
(17, 5, 2, 'Aldous Huxley', 'Sbagliata', 0), -- Autore di "Brave New World"
(17, 5, 3, 'James Joyce', 'Sbagliata', 0),
(17, 5, 4, 'Virginia Woolf', 'Sbagliata', 0);

-- Quiz 18: Fisica quantistica
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(18, 1, 1, 'Il comportamento della materia e dell''energia a scale atomiche e subatomiche', 'Corretta', 10),
(18, 1, 2, 'Il moto dei pianeti e dei corpi celesti', 'Sbagliata', 0), -- Meccanica celeste / Astrofisica
(18, 1, 3, 'I fenomeni termici e le leggi della termodinamica', 'Sbagliata', 0), -- Termodinamica
(18, 1, 4, 'La propagazione della luce e i fenomeni ottici', 'Sbagliata', 0); -- Ottica
-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(18, 2, 1, 'Introdusse l''idea che l''energia è quantizzata (in quanti)', 'Corretta', 10),
(18, 2, 2, 'Formulò la teoria della relatività', 'Sbagliata', 0), -- Einstein
(18, 2, 3, 'Sviluppò il modello atomico con orbite quantizzate', 'Sbagliata', 0), -- Bohr
(18, 2, 4, 'Formulò il principio di indeterminazione', 'Sbagliata', 0); -- Heisenberg
-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(18, 3, 1, 'Non si possono misurare simultaneamente con precisione coppie di grandezze coniugate', 'Corretta', 10),
(18, 3, 2, 'L''energia totale di un sistema isolato si conserva', 'Sbagliata', 0),
(18, 3, 3, 'La velocità della luce nel vuoto è costante', 'Sbagliata', 0),
(18, 3, 4, 'Le particelle hanno una natura duale onda-corpuscolo', 'Sbagliata', 0);
-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(18, 4, 1, 'Il quanto di luce (particella del campo elettromagnetico)', 'Corretta', 10),
(18, 4, 2, 'Una particella subatomica con carica negativa', 'Sbagliata', 0), -- Elettrone
(18, 4, 3, 'Una particella neutra nel nucleo atomico', 'Sbagliata', 0), -- Neutrone
(18, 4, 4, 'Il nucleo di un atomo di idrogeno', 'Sbagliata', 0); -- Protone
-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(18, 5, 1, 'Dimostra la natura ondulatoria delle particelle (interferenza)', 'Corretta', 10),
(18, 5, 2, 'Misura la carica dell''elettrone', 'Sbagliata', 0), -- Esperimento di Millikan
(18, 5, 3, 'Dimostra l''esistenza del nucleo atomico', 'Sbagliata', 0), -- Esperimento di Rutherford
(18, 5, 4, 'Misura la velocità della luce', 'Sbagliata', 0); -- Esperimento di Michelson-Morley

-- Quiz 19: Chimica inorganica
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(19, 1, 1, 'Organica studia composti del carbonio, Inorganica gli altri elementi', 'Corretta', 10),
(19, 1, 2, 'Organica studia esseri viventi, Inorganica non viventi', 'Sbagliata', 0), -- Troppo semplicistico
(19, 1, 3, 'Organica studia molecole grandi, Inorganica piccole', 'Sbagliata', 0), -- Non sempre vero
(19, 1, 4, 'Organica usa solventi organici, Inorganica acquosi', 'Sbagliata', 0);
-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(19, 2, 1, 'Elementi del Gruppo 1 (Li, Na, K...)', 'Corretta', 10),
(19, 2, 2, 'Elementi del Gruppo 2 (Be, Mg, Ca...)', 'Sbagliata', 0), -- Alcalino-terrosi
(19, 2, 3, 'Elementi del Gruppo 17 (F, Cl, Br...)', 'Sbagliata', 0), -- Alogeni
(19, 2, 4, 'Elementi del Gruppo 18 (He, Ne, Ar...)', 'Sbagliata', 0); -- Gas nobili
-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(19, 3, 1, 'Legame formato da attrazione elettrostatica tra ioni di carica opposta', 'Corretta', 10),
(19, 3, 2, 'Legame formato dalla condivisione di elettroni', 'Sbagliata', 0), -- Legame covalente
(19, 3, 3, 'Legame debole tra molecole polari contenenti idrogeno', 'Sbagliata', 0), -- Legame idrogeno
(19, 3, 4, 'Legame tra atomi metallici con elettroni delocalizzati', 'Sbagliata', 0); -- Legame metallico
-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(19, 4, 1, 'Tabella che ordina gli elementi per numero atomico e proprietà periodiche', 'Corretta', 10),
(19, 4, 2, 'Elenco alfabetico degli elementi chimici', 'Sbagliata', 0),
(19, 4, 3, 'Schema delle reazioni chimiche più comuni', 'Sbagliata', 0),
(19, 4, 4, 'Diagramma dei livelli energetici atomici', 'Sbagliata', 0);
-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(19, 5, 1, 'Acqua (H2O)', 'Corretta', 10),
(19, 5, 2, 'Metano (CH4)', 'Sbagliata', 0), -- Organico
(19, 5, 3, 'Etanolo (C2H5OH)', 'Sbagliata', 0), -- Organico
(19, 5, 4, 'Glucosio (C6H12O6)', 'Sbagliata', 0); -- Organico

-- Quiz 20: Geologia
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(20, 1, 1, 'La scienza della Terra, la sua storia, struttura e processi', 'Corretta', 10),
(20, 1, 2, 'Lo studio dell''atmosfera e del tempo meteorologico', 'Sbagliata', 0), -- Meteorologia
(20, 1, 3, 'Lo studio degli oceani', 'Sbagliata', 0), -- Oceanografia
(20, 1, 4, 'Lo studio degli organismi viventi', 'Sbagliata', 0); -- Biologia
-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(20, 2, 1, 'Ignee, Sedimentarie, Metamorfiche', 'Corretta', 10),
(20, 2, 2, 'Dure, Morbide, Friabili', 'Sbagliata', 0), -- Proprietà fisiche
(20, 2, 3, 'Vulcaniche, Plutoniche, Effusive', 'Sbagliata', 0), -- Sottotipi di rocce ignee
(20, 2, 4, 'Calcaree, Silicee, Argillose', 'Sbagliata', 0); -- Classificazione basata sulla composizione
-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(20, 3, 1, 'La litosfera è divisa in placche che si muovono', 'Corretta', 10),
(20, 3, 2, 'La Terra si sta espandendo', 'Sbagliata', 0), -- Teoria superata
(20, 3, 3, 'I continenti erano uniti in un supercontinente (Pangea)', 'Sbagliata', 0), -- Deriva dei continenti (parte della tettonica)
(20, 3, 4, 'Le montagne si formano per accumulo di sedimenti', 'Sbagliata', 0); -- Processo parziale
-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(20, 4, 1, 'Una spaccatura della crosta da cui fuoriesce magma', 'Corretta', 10),
(20, 4, 2, 'Una montagna molto alta', 'Sbagliata', 0),
(20, 4, 3, 'Una sorgente di acqua calda (geyser)', 'Sbagliata', 0),
(20, 4, 4, 'Una depressione causata da un impatto meteoritico', 'Sbagliata', 0);
-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(20, 5, 1, 'Rilascio improvviso di energia lungo una faglia', 'Corretta', 10),
(20, 5, 2, 'Movimento lento delle placche tettoniche', 'Sbagliata', 0),
(20, 5, 3, 'Eruzione vulcanica sottomarina', 'Sbagliata', 0), -- Può causare tsunami, non il terremoto in sé
(20, 5, 4, 'Crollo di grandi cavità sotterranee', 'Sbagliata', 0); -- Terremoti da crollo (rari)

-- ... (continuando con questo schema per tutti i quiz fino al 498)

-- Quiz 482: Programmazione Python
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(482, 1, 1, 'Interi (int), float, stringhe (str), booleani (bool), liste (list), tuple (tuple), dizionari (dict)', 'Corretta', 10),
(482, 1, 2, 'Char, double, long, short', 'Sbagliata', 0), -- Tipi comuni in C/Java
(482, 1, 3, 'Arrays, pointers, structs', 'Sbagliata', 0), -- Concetti di C/C++
(482, 1, 4, 'Solo numeri e stringhe', 'Sbagliata', 0);
-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(482, 2, 1, 'Usando la parola chiave `def` seguita dal nome e parentesi', 'Corretta', 10),
(482, 2, 2, 'Usando la parola chiave `function`', 'Sbagliata', 0), -- JavaScript/PHP
(482, 2, 3, 'Non si possono definire funzioni in Python', 'Sbagliata', 0),
(482, 2, 4, 'Dichiarando prima il tipo di ritorno', 'Sbagliata', 0); -- Tipico di C/Java
-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(482, 3, 1, 'if/elif/else, for, while', 'Corretta', 10),
(482, 3, 2, 'switch, do-while, foreach', 'Sbagliata', 0), -- Esistono ma `switch` è diverso, `foreach` implicito nel `for`
(482, 3, 3, 'goto, label', 'Sbagliata', 0), -- Non usate o sconsigliate
(482, 3, 4, 'try/catch, function, class', 'Sbagliata', 0); -- Gestione eccezioni e definizioni
-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(482, 4, 1, 'Liste (mutabili), tuple (immutabili), dizionari (chiave-valore)', 'Corretta', 10),
(482, 4, 2, 'Sono tutti tipi di array numerici', 'Sbagliata', 0),
(482, 4, 3, 'Liste (ordinate), tuple (non ordinate), dizionari (immutabili)', 'Sbagliata', 0),
(482, 4, 4, 'Servono solo per contenere stringhe', 'Sbagliata', 0);
-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(482, 5, 1, 'Usando i blocchi `try` e `except`', 'Corretta', 10),
(482, 5, 2, 'Usando `if error then ...`', 'Sbagliata', 0),
(482, 5, 3, 'Le eccezioni non possono essere gestite', 'Sbagliata', 0),
(482, 5, 4, 'Usando `throw` e `catch`', 'Sbagliata', 0); -- C++/Java

-- Quiz 483: Machine Learning Basics
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(483, 1, 1, 'Supervisionato (dati etichettati), Non supervisionato (dati non etichettati), Rinforzo (premi/punizioni)', 'Corretta', 10),
(483, 1, 2, 'Regressione, Classificazione, Clustering', 'Sbagliata', 0), -- Tipi di problemi, non paradigmi
(483, 1, 3, 'Apprendimento profondo, Apprendimento superficiale', 'Sbagliata', 0),
(483, 1, 4, 'Online, Offline, Batch', 'Sbagliata', 0); -- Modalità di apprendimento
-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(483, 2, 1, 'Regressione Lineare', 'Corretta', 10),
(483, 2, 2, 'K-Means Clustering', 'Sbagliata', 0), -- Non supervisionato
(483, 2, 3, 'Analisi delle Componenti Principali (PCA)', 'Sbagliata', 0), -- Non supervisionato
(483, 2, 4, 'Q-Learning', 'Sbagliata', 0); -- Rinforzo
-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(483, 3, 1, 'La selezione, trasformazione e creazione di variabili (feature) dai dati grezzi', 'Corretta', 10),
(483, 3, 2, 'La scelta dell''algoritmo di machine learning più adatto', 'Sbagliata', 0),
(483, 3, 3, 'L''ottimizzazione degli iperparametri del modello', 'Sbagliata', 0),
(483, 3, 4, 'La valutazione delle prestazioni del modello finale', 'Sbagliata', 0);
-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(483, 4, 1, 'Training (addestramento), Validation (ottimizzazione iperparametri), Test (valutazione finale)', 'Corretta', 10),
(483, 4, 2, 'Training (addestramento), Test (verifica), Production (uso reale)', 'Sbagliata', 0),
(483, 4, 3, 'Input set, Output set, Function set', 'Sbagliata', 0),
(483, 4, 4, 'Tutti i dati vengono usati per l''addestramento', 'Sbagliata', 0);
-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(483, 5, 1, 'Il modello impara troppo bene i dati di training e generalizza male su dati nuovi', 'Corretta', 10),
(483, 5, 2, 'Il modello è troppo semplice e non cattura la complessità dei dati (underfitting)', 'Sbagliata', 0),
(483, 5, 3, 'L''algoritmo non converge durante l''addestramento', 'Sbagliata', 0),
(483, 5, 4, 'I dati di input contengono errori o valori mancanti', 'Sbagliata', 0);

-- Quiz 484: Data Science Fundamentals
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(484, 1, 1, 'Raccolta dati, Pulizia/Pre-elaborazione, Analisi esplorativa, Modellazione, Valutazione, Deployment/Comunicazione', 'Corretta', 10),
(484, 1, 2, 'Solo Modellazione e Valutazione', 'Sbagliata', 0),
(484, 1, 3, 'Definizione problema, Sviluppo software, Testing', 'Sbagliata', 0), -- Ciclo sviluppo software
(484, 1, 4, 'Ricerca keyword, Creazione contenuti, Promozione', 'Sbagliata', 0); -- Marketing
-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(484, 2, 1, 'Gestione valori mancanti, rimozione duplicati, correzione errori, standardizzazione formati', 'Corretta', 10),
(484, 2, 2, 'Creazione di grafici e visualizzazioni', 'Sbagliata', 0), -- Analisi esplorativa
(484, 2, 3, 'Addestramento di modelli di machine learning', 'Sbagliata', 0), -- Modellazione
(484, 2, 4, 'Scrittura di query SQL', 'Sbagliata', 0); -- Raccolta dati
-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(484, 3, 1, 'L''analisi iniziale dei dati per scoprire pattern, anomalie e formulare ipotesi', 'Corretta', 10),
(484, 3, 2, 'L''addestramento finale del modello predittivo', 'Sbagliata', 0),
(484, 3, 3, 'La presentazione dei risultati finali agli stakeholder', 'Sbagliata', 0),
(484, 3, 4, 'La pulizia dei dati grezzi', 'Sbagliata', 0);
-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(484, 4, 1, 'Aiuta a comprendere i dati, identificare pattern e comunicare i risultati efficacemente', 'Corretta', 10),
(484, 4, 2, 'Serve solo a rendere i report più belli esteticamente', 'Sbagliata', 0),
(484, 4, 3, 'È utile solo per dati geografici', 'Sbagliata', 0),
(484, 4, 4, 'Rallenta il processo di analisi dei dati', 'Sbagliata', 0);
-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(484, 5, 1, 'Python (con librerie come Pandas, NumPy, Scikit-learn), R, SQL', 'Corretta', 10),
(484, 5, 2, 'Excel, PowerPoint, Word', 'Sbagliata', 0), -- Strumenti di produttività generici
(484, 5, 3, 'Java, C++, C#', 'Sbagliata', 0), -- Linguaggi di programmazione generici
(484, 5, 4, 'Photoshop, Illustrator, InDesign', 'Sbagliata', 0); -- Strumenti grafici

-- Quiz 485: Web Development
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(485, 1, 1, 'Front-end: interfaccia utente (browser); Back-end: logica server, database', 'Corretta', 10),
(485, 1, 2, 'Front-end: design grafico; Back-end: programmazione', 'Sbagliata', 0), -- Impreciso
(485, 1, 3, 'Front-end: HTML/CSS; Back-end: JavaScript', 'Sbagliata', 0), -- JS è anche front-end
(485, 1, 4, 'Non c''è differenza sostanziale', 'Sbagliata', 0);
-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(485, 2, 1, 'HTML (struttura), CSS (stile), JavaScript (interattività)', 'Corretta', 10),
(485, 2, 2, 'HTML (stile), CSS (struttura), JavaScript (database)', 'Sbagliata', 0),
(485, 2, 3, 'HTML (interattività), CSS (stile), JavaScript (struttura)', 'Sbagliata', 0),
(485, 2, 4, 'Sono tutti linguaggi per il back-end', 'Sbagliata', 0);
-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(485, 3, 1, 'Librerie/strutture predefinite per facilitare e velocizzare lo sviluppo', 'Corretta', 10),
(485, 3, 2, 'Programmi per disegnare l''interfaccia grafica', 'Sbagliata', 0), -- Strumenti di design
(485, 3, 3, 'Tipi di database', 'Sbagliata', 0),
(485, 3, 4, 'Protocolli di comunicazione di rete', 'Sbagliata', 0);
-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(485, 4, 1, 'Archivia i dati persistenti dell''applicazione (utenti, prodotti, etc.)', 'Corretta', 10),
(485, 4, 2, 'Gestisce lo stile grafico della pagina', 'Sbagliata', 0), -- CSS
(485, 4, 3, 'Contiene il codice JavaScript del front-end', 'Sbagliata', 0),
(485, 4, 4, 'È responsabile dell''hosting del sito web', 'Sbagliata', 0); -- Web server/Hosting provider
-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(485, 5, 1, 'Interfacce che permettono a diversi software di comunicare tra loro', 'Corretta', 10),
(485, 5, 2, 'Linguaggi di programmazione specifici per il web', 'Sbagliata', 0),
(485, 5, 3, 'Protocolli per la sicurezza delle connessioni (es. HTTPS)', 'Sbagliata', 0),
(485, 5, 4, 'Strumenti per il testing automatico delle applicazioni', 'Sbagliata', 0);

-- Quiz 486: Database Management
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(486, 1, 1, 'SQL: dati strutturati in tabelle relazionate; NoSQL: modelli flessibili (documenti, key-value, etc.)', 'Corretta', 10),
(486, 1, 2, 'SQL: open source; NoSQL: proprietari', 'Sbagliata', 0), -- Non sempre vero
(486, 1, 3, 'SQL: solo per dati numerici; NoSQL: per testi e immagini', 'Sbagliata', 0),
(486, 1, 4, 'SQL: più veloci; NoSQL: più lenti', 'Sbagliata', 0); -- Dipende dall'uso
-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(486, 2, 1, 'Tabelle (relazioni), Righe (tuple), Colonne (attributi), Chiavi (primarie/esterne)', 'Corretta', 10),
(486, 2, 2, 'Documenti, Collezioni, Campi', 'Sbagliata', 0), -- Tipico di DB a documenti (NoSQL)
(486, 2, 3, 'Nodi, Archi, Proprietà', 'Sbagliata', 0), -- Tipico di DB a grafo (NoSQL)
(486, 2, 4, 'Query, Indici, Trigger', 'Sbagliata', 0); -- Oggetti/Operazioni DB
-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(486, 3, 1, 'Il processo di organizzazione delle tabelle per ridurre la ridondanza e migliorare l''integrità dei dati', 'Corretta', 10),
(486, 3, 2, 'Il processo di creazione di copie di backup del database', 'Sbagliata', 0),
(486, 3, 3, 'L''ottimizzazione delle query per migliorare le prestazioni', 'Sbagliata', 0),
(486, 3, 4, 'L''aggiunta di nuove colonne a una tabella esistente', 'Sbagliata', 0);
-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(486, 4, 1, 'INSERT (Creare), SELECT (Leggere), UPDATE (Aggiornare), DELETE (Cancellare)', 'Corretta', 10),
(486, 4, 2, 'CREATE, ALTER, DROP, TRUNCATE', 'Sbagliata', 0), -- Comandi DDL (Data Definition Language)
(486, 4, 3, 'JOIN, GROUP BY, ORDER BY', 'Sbagliata', 0), -- Clausole SELECT
(486, 4, 4, 'COMMIT, ROLLBACK, SAVEPOINT', 'Sbagliata', 0); -- Comandi di transazione
-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(486, 5, 1, 'Document (es. MongoDB), Key-Value (es. Redis), Column-Family (es. Cassandra), Graph (es. Neo4j)', 'Corretta', 10),
(486, 5, 2, 'MySQL, PostgreSQL, SQL Server, Oracle', 'Sbagliata', 0), -- Database relazionali (SQL)
(486, 5, 3, 'File System, Foglio di calcolo, File di testo', 'Sbagliata', 0),
(486, 5, 4, 'Cache, Log, Indice', 'Sbagliata', 0); -- Componenti interni DB

-- Quiz 487: Cybersecurity Essentials
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(487, 1, 1, 'Malware, Phishing, Ransomware, DDoS', 'Corretta', 10),
(487, 1, 2, 'Bug, Errori di codice, Crash del sistema', 'Sbagliata', 0), -- Problemi software
(487, 1, 3, 'Spam, Fake news, Cyberbullismo', 'Sbagliata', 0), -- Problemi correlati ma diversi
(487, 1, 4, 'Firewall, Antivirus, VPN', 'Sbagliata', 0); -- Strumenti di difesa
-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(487, 2, 1, 'Confidenzialità, Integrità, Disponibilità (CIA)', 'Corretta', 10),
(487, 2, 2, 'Autenticazione, Autorizzazione, Accounting (AAA)', 'Sbagliata', 0), -- Gestione accessi
(487, 2, 3, 'Prevenzione, Rilevamento, Risposta', 'Sbagliata', 0), -- Fasi gestione incidenti
(487, 2, 4, 'Software, Hardware, Rete', 'Sbagliata', 0); -- Componenti sistema
-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(487, 3, 1, 'Autenticazione (chi sei?), Autorizzazione (cosa puoi fare?)', 'Corretta', 10),
(487, 3, 2, 'Crittografia (nascondere dati), Decrittografia (rivelare dati)', 'Sbagliata', 0),
(487, 3, 3, 'Backup (copia dati), Restore (ripristino dati)', 'Sbagliata', 0),
(487, 3, 4, 'Identificazione (riconoscere utente), Auditing (registrare azioni)', 'Sbagliata', 0);
-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(487, 4, 1, 'Correzione vulnerabilità e uso di password complesse e uniche', 'Corretta', 10),
(487, 4, 2, 'Ignorare gli aggiornamenti e usare password semplici', 'Sbagliata', 0),
(487, 4, 3, 'Aggiornare solo il sistema operativo e non le applicazioni', 'Sbagliata', 0),
(487, 4, 4, 'Usare la stessa password per tutti gli account', 'Sbagliata', 0);
-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(487, 5, 1, 'Diffidare di link/allegati sospetti, usare HTTPS, non condividere dati sensibili', 'Corretta', 10),
(487, 5, 2, 'Cliccare su qualsiasi link pubblicitario', 'Sbagliata', 0),
(487, 5, 3, 'Scaricare software da fonti non ufficiali', 'Sbagliata', 0),
(487, 5, 4, 'Usare reti Wi-Fi pubbliche non protette per operazioni sensibili', 'Sbagliata', 0);

-- Quiz 488: AI Ethics
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(488, 1, 1, 'Bias, privacy, trasparenza, responsabilità, impatto sociale/lavorativo, sicurezza', 'Corretta', 10),
(488, 1, 2, 'Costo elevato, complessità algoritmi, necessità di grandi dataset', 'Sbagliata', 0), -- Sfide tecniche
(488, 1, 3, 'Mancanza di creatività, incapacità di provare emozioni', 'Sbagliata', 0), -- Limiti attuali dell'IA
(488, 1, 4, 'Velocità di calcolo, capacità di analisi, automazione compiti ripetitivi', 'Sbagliata', 0); -- Vantaggi dell'IA
-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(488, 2, 1, 'Pregiudizi sistematici nei dati o nell''algoritmo che portano a risultati ingiusti o discriminatori', 'Corretta', 10),
(488, 2, 2, 'Errori casuali nell''output del modello', 'Sbagliata', 0),
(488, 2, 3, 'La tendenza del modello a sovra-adattarsi ai dati di training (overfitting)', 'Sbagliata', 0),
(488, 2, 4, 'L''incapacità dell''algoritmo di gestire dati rumorosi', 'Sbagliata', 0);
-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(488, 3, 1, 'Raccolta massiva di dati personali, riconoscimento facciale, profilazione', 'Corretta', 10),
(488, 3, 2, 'Necessità di hardware potente', 'Sbagliata', 0),
(488, 3, 3, 'Difficoltà nel trovare data scientist qualificati', 'Sbagliata', 0),
(488, 3, 4, 'Lentezza degli algoritmi di deep learning', 'Sbagliata', 0);
-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(488, 4, 1, 'La capacità di capire come un modello AI prende le sue decisioni', 'Corretta', 10),
(488, 4, 2, 'La velocità con cui l''algoritmo fornisce una risposta', 'Sbagliata', 0),
(488, 4, 3, 'L''accuratezza delle previsioni del modello', 'Sbagliata', 0),
(488, 4, 4, 'La quantità di dati necessaria per addestrare il modello', 'Sbagliata', 0);
-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(488, 5, 1, 'Automazione del lavoro, disoccupazione tecnologica, aumento disuguaglianze, uso in armi autonome', 'Corretta', 10),
(488, 5, 2, 'Creazione di nuove forme d''arte, miglioramento diagnosi mediche', 'Sbagliata', 0), -- Impatti positivi
(488, 5, 3, 'Necessità di aggiornare continuamente i modelli', 'Sbagliata', 0),
(488, 5, 4, 'Difficoltà nell''integrazione con sistemi legacy', 'Sbagliata', 0);

-- Quiz 489: Cloud Computing
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(489, 1, 1, 'Erogazione di risorse IT (calcolo, storage, database) on-demand tramite Internet', 'Corretta', 10),
(489, 1, 2, 'Un tipo di rete locale (LAN)', 'Sbagliata', 0),
(489, 1, 3, 'Un software per la gestione di macchine virtuali', 'Sbagliata', 0), -- Hypervisor
(489, 1, 4, 'Un metodo per archiviare file su un disco esterno', 'Sbagliata', 0);
-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(489, 2, 1, 'IaaS (Infrastruttura), PaaS (Piattaforma), SaaS (Software)', 'Corretta', 10),
(489, 2, 2, 'Pubblico, Privato, Ibrido', 'Sbagliata', 0), -- Modelli di deployment
(489, 2, 3, 'CPU, RAM, Storage', 'Sbagliata', 0), -- Risorse IT
(489, 2, 4, 'TCP, UDP, HTTP', 'Sbagliata', 0); -- Protocolli di rete
-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(489, 3, 1, 'Pubblico (provider terzi), Privato (infrastruttura dedicata), Ibrido (mix), Multi-cloud (più provider)', 'Corretta', 10),
(489, 3, 2, 'IaaS, PaaS, SaaS', 'Sbagliata', 0), -- Modelli di servizio
(489, 3, 3, 'Scalabilità verticale, Scalabilità orizzontale', 'Sbagliata', 0), -- Concetti di scalabilità
(489, 3, 4, 'Regioni, Zone di disponibilità, Edge location', 'Sbagliata', 0); -- Infrastruttura provider
-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(489, 4, 1, 'Archiviazione oggetti (es. S3), Database gestiti (es. RDS), Macchine virtuali (es. EC2), Funzioni serverless (es. Lambda)', 'Corretta', 10),
(489, 4, 2, 'Sistemi operativi, Browser web, Applicazioni Office', 'Sbagliata', 0), -- Software generico
(489, 4, 3, 'Firewall, Antivirus, Sistemi di backup', 'Sbagliata', 0),
(489, 4, 4, 'Monitor, Tastiera, Mouse', 'Sbagliata', 0); -- Hardware
-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(489, 5, 1, 'Protezione dei dati, gestione accessi, conformità normativa, privacy dei dati', 'Corretta', 10),
(489, 5, 2, 'Costo elevato delle risorse', 'Sbagliata', 0), -- Può essere un vantaggio (pay-per-use)
(489, 5, 3, 'Lentezza della connessione Internet', 'Sbagliata', 0), -- Possibile problema, non intrinseco alla sicurezza
(489, 5, 4, 'Mancanza di scalabilità', 'Sbagliata', 0); -- È un vantaggio chiave

-- Quiz 490: Big Data Analytics
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(490, 1, 1, 'Dati estremamente grandi, veloci e vari, che richiedono tecnologie specifiche per l''analisi (5V)', 'Corretta', 10),
(490, 1, 2, 'Qualsiasi database di grandi dimensioni', 'Sbagliata', 0), -- Troppo generico
(490, 1, 3, 'Dati provenienti esclusivamente dai social media', 'Sbagliata', 0),
(490, 1, 4, 'Dati archiviati nel cloud', 'Sbagliata', 0);
-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(490, 2, 1, 'Hadoop (HDFS, MapReduce/YARN), Spark, Kafka, NoSQL DBs', 'Corretta', 10),
(490, 2, 2, 'Database relazionali tradizionali (es. MySQL, PostgreSQL)', 'Sbagliata', 0), -- Non adatti per Big Data non strutturati
(490, 2, 3, 'Fogli di calcolo (es. Excel)', 'Sbagliata', 0), -- Limitati per volume/velocità
(490, 2, 4, 'Sistemi di controllo versione (es. Git)', 'Sbagliata', 0); -- Per codice sorgente
-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(490, 3, 1, 'Machine learning, data mining, analisi statistica, elaborazione linguaggio naturale (NLP)', 'Corretta', 10),
(490, 3, 2, 'Creazione di siti web', 'Sbagliata', 0),
(490, 3, 3, 'Gestione di progetti software', 'Sbagliata', 0),
(490, 3, 4, 'Amministrazione di sistemi operativi', 'Sbagliata', 0);
-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(490, 4, 1, 'Volume, velocità, varietà, qualità dei dati, scalabilità infrastruttura, privacy', 'Corretta', 10),
(490, 4, 2, 'Mancanza di algoritmi adeguati', 'Sbagliata', 0), -- Esistono molti algoritmi
(490, 4, 3, 'Costo eccessivo del software open source', 'Sbagliata', 0), -- Molti strumenti sono gratuiti
(490, 4, 4, 'Difficoltà nel trovare dati interessanti', 'Sbagliata', 0);
-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(490, 5, 1, 'Marketing (profilazione clienti), Finanza (rilevamento frodi), Sanità (diagnosi), Industria (manutenzione predittiva)', 'Corretta', 10),
(490, 5, 2, 'Scrittura di romanzi', 'Sbagliata', 0),
(490, 5, 3, 'Giardinaggio', 'Sbagliata', 0),
(490, 5, 4, 'Restauro di opere d''arte', 'Sbagliata', 0);

-- Quiz 491: Internet of Things
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(491, 1, 1, 'La rete di oggetti fisici ("cose") dotati di sensori, software e connettività per scambiare dati', 'Corretta', 10),
(491, 1, 2, 'Un nuovo tipo di connessione Internet ad alta velocità', 'Sbagliata', 0),
(491, 1, 3, 'Un social network per oggetti inanimati', 'Sbagliata', 0),
(491, 1, 4, 'Un sistema operativo per dispositivi embedded', 'Sbagliata', 0);
-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(491, 2, 1, 'Dispositivi (sensori/attuatori), Gateway, Rete/Connettività, Piattaforma Cloud, Applicazioni', 'Corretta', 10),
(491, 2, 2, 'Smartphone, Computer, Tablet', 'Sbagliata', 0), -- Dispositivi utente
(491, 2, 3, 'Router, Switch, Firewall', 'Sbagliata', 0), -- Componenti di rete generici
(491, 2, 4, 'Database, Web Server, Application Server', 'Sbagliata', 0); -- Componenti back-end generici
-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(491, 3, 1, 'MQTT, CoAP, Bluetooth LE, Wi-Fi, LoRaWAN, NB-IoT', 'Corretta', 10),
(491, 3, 2, 'HTTP, FTP, SMTP, DNS', 'Sbagliata', 0), -- Protocolli Internet standard
(491, 3, 3, 'TCP, UDP, IP', 'Sbagliata', 0), -- Protocolli di trasporto/rete
(491, 3, 4, 'JSON, XML, CSV', 'Sbagliata', 0); -- Formati dati
-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(491, 4, 1, 'Sicurezza dei dispositivi, protezione dei dati trasmessi, privacy degli utenti, gestione aggiornamenti', 'Corretta', 10),
(491, 4, 2, 'Costo elevato dei sensori', 'Sbagliata', 0),
(491, 4, 3, 'Scarsa durata delle batterie', 'Sbagliata', 0), -- Sfida tecnica, non sicurezza/privacy
(491, 4, 4, 'Interoperabilità tra dispositivi diversi', 'Sbagliata', 0); -- Sfida tecnica
-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(491, 5, 1, 'Smart Home, Smart City, Industria 4.0, Agricoltura di precisione, Wearable/Sanità', 'Corretta', 10),
(491, 5, 2, 'Videogiochi online', 'Sbagliata', 0),
(491, 5, 3, 'Social media', 'Sbagliata', 0),
(491, 5, 4, 'Editing video', 'Sbagliata', 0);

-- Quiz 492: Blockchain Technologies
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(492, 1, 1, 'Un registro distribuito, immutabile e sicuro basato su blocchi concatenati crittograficamente', 'Corretta', 10),
(492, 1, 2, 'Un tipo di database centralizzato ad alta sicurezza', 'Sbagliata', 0),
(492, 1, 3, 'Una criptovaluta come Bitcoin', 'Sbagliata', 0), -- Applicazione della blockchain
(492, 1, 4, 'Un protocollo per la comunicazione peer-to-peer', 'Sbagliata', 0);
-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(492, 2, 1, 'Contiene transazioni, un hash del blocco precedente e un proprio hash', 'Corretta', 10),
(492, 2, 2, 'Contiene solo il saldo degli account', 'Sbagliata', 0),
(492, 2, 3, 'È un file di testo semplice con le transazioni', 'Sbagliata', 0),
(492, 2, 4, 'Contiene il codice di uno smart contract', 'Sbagliata', 0); -- Può contenere, ma non solo
-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(492, 3, 1, 'Proof-of-Work (risoluzione puzzle computazionale), Proof-of-Stake (basato sul possesso di token)', 'Corretta', 10),
(492, 3, 2, 'Proof-of-Authority (basato sull''identità), Proof-of-Burn (distruzione token)', 'Sbagliata', 0), -- Esistono, ma PoW/PoS sono i più noti
(492, 3, 3, 'Voto a maggioranza semplice', 'Sbagliata', 0),
(492, 3, 4, 'Consenso centralizzato da un''autorità', 'Sbagliata', 0);
-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(492, 4, 1, 'Programmi auto-eseguibili registrati sulla blockchain che automatizzano accordi', 'Corretta', 10),
(492, 4, 2, 'Contratti legali tradizionali firmati digitalmente', 'Sbagliata', 0),
(492, 4, 3, 'Portafogli digitali per criptovalute', 'Sbagliata', 0), -- Wallets
(492, 4, 4, 'Algoritmi di crittografia usati nella blockchain', 'Sbagliata', 0);
-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(492, 5, 1, 'Pubbliche (aperte a tutti), Private (accesso ristretto), Consortium (gestite da un gruppo)', 'Corretta', 10),
(492, 5, 2, 'Veloci, Lente, Medie', 'Sbagliata', 0),
(492, 5, 3, 'Costose, Economiche, Gratuite', 'Sbagliata', 0),
(492, 5, 4, 'Sicure, Insicure, Mediamente sicure', 'Sbagliata', 0);

-- Quiz 493: UI/UX Design
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(493, 1, 1, 'UI: aspetto grafico e interattivo; UX: esperienza complessiva dell''utente', 'Corretta', 10),
(493, 1, 2, 'UI: esperienza utente; UX: interfaccia grafica', 'Sbagliata', 0), -- Invertiti
(493, 1, 3, 'UI: codice front-end; UX: codice back-end', 'Sbagliata', 0),
(493, 1, 4, 'Sono sinonimi', 'Sbagliata', 0);
-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(493, 2, 1, 'Ricerca Utente, Definizione Architettura Informativa, Progettazione Interazione, Prototipazione, Test Utente', 'Corretta', 10),
(493, 2, 2, 'Scrittura codice, Debugging, Deployment', 'Sbagliata', 0), -- Sviluppo software
(493, 2, 3, 'Analisi mercato, Sviluppo prodotto, Marketing, Vendita', 'Sbagliata', 0), -- Ciclo prodotto
(493, 2, 4, 'Solo disegno grafico e scelta colori', 'Sbagliata', 0); -- Solo parte UI
-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(493, 3, 1, 'Rappresentazioni fittizie di utenti tipo (personas) e mappe del loro percorso (journey maps)', 'Corretta', 10),
(493, 3, 2, 'Tipi di grafici per visualizzare dati', 'Sbagliata', 0),
(493, 3, 3, 'Tecniche di programmazione', 'Sbagliata', 0),
(493, 3, 4, 'Strumenti per il testing automatico', 'Sbagliata', 0);
-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(493, 4, 1, 'Garantire che l''interfaccia sia facile da usare e accessibile a tutti gli utenti, inclusi quelli con disabilità', 'Corretta', 10),
(493, 4, 2, 'Rendere l''interfaccia esteticamente piacevole', 'Sbagliata', 0), -- Importante ma non unico scopo
(493, 4, 3, 'Aumentare la velocità di caricamento della pagina', 'Sbagliata', 0), -- Aspetto tecnico
(493, 4, 4, 'Limitare il numero di funzionalità', 'Sbagliata', 0);
-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(493, 5, 1, 'Figma, Sketch, Adobe XD, InVision', 'Corretta', 10),
(493, 5, 2, 'Photoshop, Illustrator, GIMP', 'Sbagliata', 0), -- Principalmente grafica
(493, 5, 3, 'Visual Studio Code, Sublime Text, Atom', 'Sbagliata', 0), -- Editor di codice
(493, 5, 4, 'Jira, Trello, Asana', 'Sbagliata', 0); -- Strumenti project management

-- Quiz 494: Mobile App Development
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(494, 1, 1, 'iOS (Swift/Objective-C), Android (Kotlin/Java)', 'Corretta', 10),
(494, 1, 2, 'Windows (C#), macOS (Swift)', 'Sbagliata', 0), -- Piattaforme desktop
(494, 1, 3, 'Linux (C++), Web (JavaScript)', 'Sbagliata', 0),
(494, 1, 4, 'Solo Java per entrambe', 'Sbagliata', 0);
-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(494, 2, 1, 'Scrivere codice una sola volta per eseguirlo su più piattaforme (es. React Native, Flutter)', 'Corretta', 10),
(494, 2, 2, 'Sviluppare separatamente per ogni piattaforma (nativo)', 'Sbagliata', 0),
(494, 2, 3, 'Sviluppare solo per una piattaforma', 'Sbagliata', 0),
(494, 2, 4, 'Sviluppare applicazioni web responsive', 'Sbagliata', 0);
-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(494, 3, 1, 'Material Design (Android), Human Interface Guidelines (iOS)', 'Corretta', 10),
(494, 3, 2, 'Bootstrap, Tailwind CSS', 'Sbagliata', 0), -- Framework CSS web
(494, 3, 3, 'MVC, MVVM, MVP', 'Sbagliata', 0), -- Pattern architetturali
(494, 3, 4, 'Non ci sono linee guida specifiche', 'Sbagliata', 0);
-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(494, 4, 1, 'Gestire stati come attiva, in background, sospesa, terminata', 'Corretta', 10),
(494, 4, 2, 'Il processo di pubblicazione sullo store', 'Sbagliata', 0),
(494, 4, 3, 'Il versionamento del codice sorgente', 'Sbagliata', 0),
(494, 4, 4, 'Il debug e il testing dell''applicazione', 'Sbagliata', 0);
-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(494, 5, 1, 'Ottimizzazione performance, gestione memoria, consumo energetico, connettività, frammentazione dispositivi (Android)', 'Corretta', 10),
(494, 5, 2, 'Scelta del colore dei pulsanti', 'Sbagliata', 0),
(494, 5, 3, 'Scrittura della documentazione utente', 'Sbagliata', 0),
(494, 5, 4, 'Marketing e promozione dell''app', 'Sbagliata', 0);

-- Quiz 495: Game Design
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(495, 1, 1, 'Regole e azioni (meccaniche), comportamento emergente (dinamiche), aspetto sensoriale (estetica), storia (narrativa)', 'Corretta', 10),
(495, 1, 2, 'Grafica, Sonoro, Codice, Testing', 'Sbagliata', 0), -- Aspetti sviluppo
(495, 1, 3, 'Marketing, Monetizzazione, Community Management', 'Sbagliata', 0), -- Aspetti business
(495, 1, 4, 'Giocatore singolo, Multigiocatore, Cooperativo', 'Sbagliata', 0); -- Modalità di gioco
-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(495, 2, 1, 'Il ciclo principale di attività che il giocatore ripete nel gioco', 'Corretta', 10),
(495, 2, 2, 'La trama principale del gioco', 'Sbagliata', 0),
(495, 2, 3, 'Un bug che causa un ciclo infinito', 'Sbagliata', 0),
(495, 2, 4, 'Il menù principale del gioco', 'Sbagliata', 0);
-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(495, 3, 1, 'Assicurare che le diverse strategie, abilità o elementi del gioco siano equi e interessanti', 'Corretta', 10),
(495, 3, 2, 'Rendere il gioco il più difficile possibile', 'Sbagliata', 0),
(495, 3, 3, 'Ottimizzare le prestazioni grafiche', 'Sbagliata', 0),
(495, 3, 4, 'Scrivere il codice senza errori', 'Sbagliata', 0);
-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(495, 4, 1, 'Progettazione dei livelli/ambienti e progressione della sfida per il giocatore', 'Corretta', 10),
(495, 4, 2, 'La scelta dei colori e dello stile grafico', 'Sbagliata', 0),
(495, 4, 3, 'Lo sviluppo dell''intelligenza artificiale dei nemici', 'Sbagliata', 0),
(495, 4, 4, 'Il testing finale del gioco', 'Sbagliata', 0);
-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(495, 5, 1, 'Azione, Avventura, RPG, Strategia, Puzzle, Simulazione', 'Corretta', 10),
(495, 5, 2, 'Console, PC, Mobile', 'Sbagliata', 0), -- Piattaforme
(495, 5, 3, 'Indie, AAA, Free-to-play', 'Sbagliata', 0), -- Modelli business/produzione
(495, 5, 4, 'Fantasy, Sci-fi, Storico', 'Sbagliata', 0); -- Ambientazioni

-- Quiz 496: Digital Marketing
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(496, 1, 1, 'SEO, SEM, Social Media, Email, Content, Affiliate Marketing', 'Corretta', 10),
(496, 1, 2, 'TV, Radio, Stampa, Cartellonistica', 'Sbagliata', 0), -- Marketing tradizionale
(496, 1, 3, 'Vendita diretta, Telemarketing, Fiere', 'Sbagliata', 0), -- Tecniche di vendita
(496, 1, 4, 'Ricerca di mercato, Sviluppo prodotto, Pricing', 'Sbagliata', 0); -- Fasi del marketing mix
-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(496, 2, 1, 'Ottimizzazione per i motori di ricerca per migliorare la visibilità organica', 'Corretta', 10),
(496, 2, 2, 'Pubblicità a pagamento sui motori di ricerca', 'Sbagliata', 0), -- SEM
(496, 2, 3, 'Marketing sui social media', 'Sbagliata', 0),
(496, 2, 4, 'Invio di email promozionali', 'Sbagliata', 0); -- Email marketing
-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(496, 3, 1, 'Marketing sui motori di ricerca, include SEO e pubblicità a pagamento (PPC)', 'Corretta', 10),
(496, 3, 2, 'Solo l''ottimizzazione organica (SEO)', 'Sbagliata', 0),
(496, 3, 3, 'Gestione dei profili social aziendali', 'Sbagliata', 0),
(496, 3, 4, 'Analisi dei dati di traffico del sito web', 'Sbagliata', 0); -- Web analytics
-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(496, 4, 1, 'Creare e distribuire contenuti di valore per attrarre e fidelizzare un pubblico', 'Corretta', 10),
(496, 4, 2, 'Comprare spazi pubblicitari online', 'Sbagliata', 0), -- Advertising
(496, 4, 3, 'Ottimizzare il sito per i motori di ricerca', 'Sbagliata', 0), -- SEO
(496, 4, 4, 'Gestire le campagne di email marketing', 'Sbagliata', 0);
-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(496, 5, 1, 'Traffico sito, Tasso di conversione, Costo per acquisizione (CPA), Ritorno sull''investimento (ROI), Engagement social', 'Corretta', 10),
(496, 5, 2, 'Numero di dipendenti dell''azienda', 'Sbagliata', 0),
(496, 5, 3, 'Fatturato totale dell''azienda', 'Sbagliata', 0),
(496, 5, 4, 'Numero di computer in ufficio', 'Sbagliata', 0);

-- Quiz 497: SEO Optimization
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(497, 1, 1, 'On-page: ottimizzazioni sul sito; Off-page: fattori esterni (es. backlink)', 'Corretta', 10),
(497, 1, 2, 'On-page: contenuti testuali; Off-page: immagini e video', 'Sbagliata', 0),
(497, 1, 3, 'On-page: per Google; Off-page: per altri motori di ricerca', 'Sbagliata', 0),
(497, 1, 4, 'On-page: gratuita; Off-page: a pagamento', 'Sbagliata', 0);
-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(497, 2, 1, 'Identificare i termini che gli utenti usano per cercare informazioni pertinenti', 'Corretta', 10),
(497, 2, 2, 'Scrivere contenuti molto lunghi', 'Sbagliata', 0),
(497, 2, 3, 'Ottenere il maggior numero possibile di backlink', 'Sbagliata', 0),
(497, 2, 4, 'Scegliere il nome del dominio del sito', 'Sbagliata', 0);
-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(497, 3, 1, 'Link provenienti da altri siti web che puntano al proprio sito', 'Corretta', 10),
(497, 3, 2, 'Link interni tra pagine dello stesso sito', 'Sbagliata', 0),
(497, 3, 3, 'Link a pagamento inseriti in articoli sponsorizzati', 'Sbagliata', 0),
(497, 3, 4, 'Link presenti nei commenti dei blog', 'Sbagliata', 0); -- Spesso di bassa qualità o spam
-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(497, 4, 1, 'Velocità caricamento, ottimizzazione mobile, struttura URL, sitemap XML, HTTPS', 'Corretta', 10),
(497, 4, 2, 'Qualità dei contenuti, ricerca keyword', 'Sbagliata', 0), -- SEO on-page (contenuti)
(497, 4, 3, 'Numero di backlink, autorevolezza dominio', 'Sbagliata', 0), -- SEO off-page
(497, 4, 4, 'Presenza sui social media', 'Sbagliata', 0); -- Fattore indiretto
-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(497, 5, 1, 'Google Analytics, Google Search Console, SEMrush, Ahrefs, Moz', 'Corretta', 10),
(497, 5, 2, 'Photoshop, Figma, Sketch', 'Sbagliata', 0), -- Strumenti design
(497, 5, 3, 'WordPress, Joomla, Drupal', 'Sbagliata', 0), -- CMS
(497, 5, 4, 'Excel, Google Sheets', 'Sbagliata', 0); -- Fogli di calcolo

-- Quiz 498: E-commerce Strategies
-- Domanda 1
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(498, 1, 1, 'B2C (azienda-consumatore), B2B (azienda-azienda), C2C (consumatore-consumatore), D2C (diretto al consumatore)', 'Corretta', 10),
(498, 1, 2, 'Negozio fisico, Mercato ambulante, Vendita porta a porta', 'Sbagliata', 0), -- Modelli offline
(498, 1, 3, 'Freemium, Subscription, Pay-per-use', 'Sbagliata', 0), -- Modelli di pricing/accesso
(498, 1, 4, 'SEO, SEM, Social Media Marketing', 'Sbagliata', 0); -- Strategie di marketing
-- Domanda 2
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(498, 2, 1, 'Fondamentale per guidare l''utente e facilitare l''acquisto', 'Corretta', 10),
(498, 2, 2, 'Secondaria rispetto al prezzo dei prodotti', 'Sbagliata', 0),
(498, 2, 3, 'Importante solo per siti di abbigliamento', 'Sbagliata', 0),
(498, 2, 4, 'Gestita esclusivamente dal provider di hosting', 'Sbagliata', 0);
-- Domanda 3
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(498, 3, 1, 'Ottimizzare il sito per aumentare la percentuale di visitatori che completano un acquisto', 'Corretta', 10),
(498, 3, 2, 'Aumentare il traffico totale verso il sito', 'Sbagliata', 0),
(498, 3, 3, 'Migliorare il posizionamento sui motori di ricerca (SEO)', 'Sbagliata', 0),
(498, 3, 4, 'Ridurre i costi di spedizione', 'Sbagliata', 0);
-- Domanda 4
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(498, 4, 1, 'SEO, SEM, Social Media Marketing, Email Marketing, Content Marketing, Programmi fedeltà', 'Corretta', 10),
(498, 4, 2, 'Solo sconti e promozioni', 'Sbagliata', 0),
(498, 4, 3, 'Pubblicità su TV e radio', 'Sbagliata', 0), -- Marketing tradizionale
(498, 4, 4, 'Assumere più personale di vendita', 'Sbagliata', 0);
-- Domanda 5
INSERT INTO Risposta (quiz, domanda, numero, testo, tipo, punteggio) VALUES
(498, 5, 1, 'Gestione magazzino, evasione ordini, spedizioni, resi, sicurezza pagamenti, frodi', 'Corretta', 10),
(498, 5, 2, 'Scelta dei colori del sito', 'Sbagliata', 0),
(498, 5, 3, 'Creazione di contenuti per il blog', 'Sbagliata', 0),
(498, 5, 4, 'Assunzione di personale IT', 'Sbagliata', 0);

-- Popolamento tabella Partecipazione (200 partecipazioni con utenti validi)
INSERT INTO Partecipazione (utente, quiz, data) VALUES
('beatrice_barberini', 1, '2025-01-05'),
('rocco_fagiani', 2, '2025-01-10'),
('eva_angiolello', 3, '2025-01-15'),
('antonia_venditti', 4, '2025-01-20'),
('patrizio_bruno', 5, '2025-01-25'),
('gianluca_tommaseo', 6, '2025-01-30'),
('carla_tonisto', 7, '2025-02-05'),
('nicoletta_carriera', 8, '2025-02-10'),
('ubaldo_paltrinieri', 9, '2025-02-15'),
('goffredo_magnani', 10, '2025-02-20'),
('rita_druso', 11, '2025-02-25'),
('dina_leoncavallo', 12, '2025-03-02'),
('gian_bacosi', 13, '2025-03-08'),
('rosa_peranda', 14, '2025-03-12'),
('lucia_leone', 15, '2025-03-18'),
('marina_bernini', 16, '2025-03-22'),
('diana_barracco', 17, '2025-03-28'),
('gino_zichichi', 18, '2025-04-01'),
('alessia_sagnelli', 19, '2025-04-05'),
('graziella_lopresti', 20, '2025-04-09'),
('griselda_bandello', 21, '2025-04-12'),
('adelasia_gianvecchio', 22, '2025-04-18'),
('jolanda_petralli', 23, '2025-04-22'),
('lidia_agazzi', 24, '2025-04-28'),
('laureano_peruzzi', 25, '2025-05-01'),
('francesco_roero', 26, '2025-05-05'),
('venancio_juvara', 27, '2025-05-10'),
('matilda_pace', 28, '2025-05-15'),
('nicoletta_fusani', 29, '2025-05-20'),
('mercedes_ceci', 30, '2025-05-25'),
('federico_zanzi', 31, '2025-06-01'),
('lauretta_fagiani', 32, '2025-06-08'),
('gaetano_finetti', 33, '2025-06-12'),
('nedda_moschino', 34, '2025-06-18'),
('giovanni_zaccagnini', 35, '2025-06-22'),
('edoardo_amato', 36, '2025-06-28'),
('calogero_ritacca', 37, '2025-07-01'),
('tonino_nitti', 38, '2025-07-05'),
('franco_faranda', 39, '2025-07-10'),
('flora_ceci', 40, '2025-07-15'),
('tonino_stradivari', 41, '2025-07-20'),
('giulietta_lombardi', 42, '2025-07-25'),
('carolina_tomasini', 43, '2025-08-01'),
('licia_greggio', 44, '2025-08-08'),
('tiziano_antonacci', 45, '2025-08-12'),
('dina_argenti', 46, '2025-08-18'),
('durante_palombi', 47, '2025-08-22'),
('uberto_gravina', 48, '2025-08-28'),
('rembrandt_bergoglio', 49, '2025-09-01'),
('franco_garozzo', 50, '2025-09-05'),
('goffredo_angeli', 51, '2025-09-10'),
('girolamo_ferretti', 52, '2025-09-15'),
('nicolò_manzoni', 53, '2025-09-20'),
('orlando_zetticci', 54, '2025-09-25'),
('ludovico_rapisardi', 55, '2025-10-01'),
('gemma_bellò', 56, '2025-10-08'),
('stefania_montanelli', 57, '2025-10-12'),
('raimondo_micheletti', 58, '2025-10-18'),
('sandra_ioppi', 59, '2025-10-22'),
('federica_gadda', 60, '2025-10-28'),
('raffaellino_trillini', 61, '2025-11-01'),
('tonino_gulotta', 62, '2025-11-05'),
('concetta_verdi', 63, '2025-11-10'),
('gustavo_gelli', 64, '2025-11-15'),
('mirko_errani', 65, '2025-11-20'),
('riccardo_monaco', 66, '2025-11-25'),
('luigi_liverotti', 67, '2025-12-01'),
('silvia_rosmini', 68, '2025-12-08'),
('costantino_gargallo', 69, '2025-12-12'),
('gaspare_cortese', 70, '2025-12-18'),
('gianluigi_duse', 71, '2025-12-22'),
('ippazio_moresi', 72, '2025-12-28'),
('pompeo_romiti', 73, '2025-01-06'),
('alberico_lussu', 74, '2025-01-11'),
('orazio_nordio', 75, '2025-01-16'),
('pierangelo_stein', 76, '2025-01-21'),
('giuliana_carnera', 77, '2025-01-26'),
('pierpaolo_iannotti', 78, '2025-01-31'),
('cesare_cocci', 79, '2025-02-06'),
('rosario_cossiga', 80, '2025-02-11'),
('antonietta_virgilio', 81, '2025-02-16'),
('lucio_gritti', 82, '2025-02-21'),
('olga_barillaro', 83, '2025-02-26'),
('beatrice_barberini', 84, '2025-03-03'),
('rocco_fagiani', 85, '2025-03-07'),
('eva_angiolello', 86, '2025-03-11'),
('antonia_venditti', 87, '2025-03-16'),
('patrizio_bruno', 88, '2025-03-21'),
('gianluca_tommaseo', 89, '2025-03-26'),
('carla_tonisto', 90, '2025-03-31'),
('nicoletta_carriera', 91, '2025-04-03'),
('ubaldo_paltrinieri', 92, '2025-04-07'),
('goffredo_magnani', 93, '2025-04-11'),
('rita_druso', 94, '2025-04-16'),
('dina_leoncavallo', 95, '2025-04-21'),
('gian_bacosi', 96, '2025-04-26'),
('rosa_peranda', 97, '2025-05-01'),
('lucia_leone', 98, '2025-05-06'),
('marina_bernini', 99, '2025-05-11'),
('diana_barracco', 100, '2025-05-16'),
('gino_zichichi', 101, '2025-05-21'),
('alessia_sagnelli', 102, '2025-05-26'),
('graziella_lopresti', 103, '2025-05-31'),
('griselda_bandello', 104, '2025-06-06'),
('adelasia_gianvecchio', 105, '2025-06-11'),
('jolanda_petralli', 106, '2025-06-16'),
('lidia_agazzi', 107, '2025-06-21'),
('laureano_peruzzi', 108, '2025-06-26'),
('francesco_roero', 109, '2025-07-01'),
('venancio_juvara', 110, '2025-07-06'),
('matilda_pace', 111, '2025-07-11'),
('nicoletta_fusani', 112, '2025-07-16'),
('mercedes_ceci', 113, '2025-07-21'),
('federico_zanzi', 114, '2025-07-26'),
('lauretta_fagiani', 115, '2025-07-31'),
('gaetano_finetti', 116, '2025-08-06'),
('nedda_moschino', 117, '2025-08-11'),
('giovanni_zaccagnini', 118, '2025-08-16'),
('edoardo_amato', 119, '2025-08-21'),
('calogero_ritacca', 120, '2025-08-26'),
('tonino_nitti', 121, '2025-08-31'),
('franco_faranda', 122, '2025-09-06'),
('flora_ceci', 123, '2025-09-11'),
('tonino_stradivari', 124, '2025-09-16'),
('giulietta_lombardi', 125, '2025-09-21'),
('carolina_tomasini', 126, '2025-09-26'),
('licia_greggio', 127, '2025-10-01'),
('tiziano_antonacci', 128, '2025-10-06'),
('dina_argenti', 129, '2025-10-11'),
('durante_palombi', 130, '2025-10-16'),
('uberto_gravina', 131, '2025-10-21'),
('rembrandt_bergoglio', 132, '2025-10-26'),
('franco_garozzo', 133, '2025-10-31'),
('goffredo_angeli', 134, '2025-11-06'),
('girolamo_ferretti', 135, '2025-11-11'),
('nicolò_manzoni', 136, '2025-11-16'),
('orlando_zetticci', 137, '2025-11-21'),
('ludovico_rapisardi', 138, '2025-11-26'),
('gemma_bellò', 139, '2025-12-01'),
('stefania_montanelli', 140, '2025-12-06'),
('raimondo_micheletti', 141, '2025-12-11'),
('sandra_ioppi', 142, '2025-12-16'),
('federica_gadda', 143, '2025-12-21'),
('raffaellino_trillini', 144, '2025-12-26'),
('giulia_galilei', 145, '2025-01-07'),
('costantino_traversa', 146, '2025-01-12'),
('dolores_condoleo', 147, '2025-01-17'),
('enzio_dallara', 148, '2025-01-22'),
('ippazio_sansoni', 149, '2025-01-27'),
('livio_lattuada', 150, '2025-02-01'),
('ivo_donati', 151, '2025-02-07'),
('pierina_antonello', 152, '2025-02-12'),
('raffaello_spallanzani', 153, '2025-02-17'),
('ramona_satta', 154, '2025-02-22'),
('tiziano_marazzi', 155, '2025-02-27'),
('rosa_brambilla', 156, '2025-03-03'),
('zaira_morpurgo', 157, '2025-03-08'),
('ornella_niscoromni', 158, '2025-03-13'),
('olga_inzaghi', 159, '2025-03-17'),
('francesca_sgarbi', 160, '2025-03-22'),
('ludovica_federico', 161, '2025-03-27'),
('luchino_zanichelli', 162, '2025-04-01'),
('camillo_pausini', 163, '2025-04-06'),
('santino_spadafora', 164, '2025-04-09'),
('alfio_visintini', 165, '2025-04-13'),
('mario_zola', 166, '2025-04-17'),
('antonina_palumbo', 167, '2025-04-22'),
('elladio_morandini', 168, '2025-04-27'),
('carlo_barozzi', 169, '2025-05-01'),
('raimondo_balotelli', 170, '2025-05-07'),
('maurizio_gaito', 171, '2025-05-12'),
('costanzo_borghese', 172, '2025-05-17'),
('francesca_nosiglia', 173, '2025-05-22'),
('viridiana_pagnotto', 174, '2025-05-27'),
('ida_jilani', 175, '2025-06-02'),
('angelo_scalera', 176, '2025-06-07'),
('patrizio_pertile', 177, '2025-06-12'),
('dante_respighi', 178, '2025-06-17'),
('sergius_ravaglioli', 179, '2025-06-22'),
('ubaldo_biagiotti', 180, '2025-06-27'),
('alphons_morandi', 181, '2025-07-02'),
('luchino_iadanza', 182, '2025-07-07'),
('federigo_cesarotti', 183, '2025-07-12'),
('lando_galilei', 184, '2025-07-17'),
('rocco_baggio', 185, '2025-07-22'),
('severino_scarpa', 186, '2025-07-27'),
('iolanda_casellati', 187, '2025-08-01');

-- Popolamento tabella RispostaUtenteQuiz (risposte degli utenti alle domande)
-- Popolamento tabella RispostaUtenteQuiz (risposte per 200 partecipazioni)

-- Partecipazione 1: beatrice_barberini al Quiz 1
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(1, 1, 1, 1),
(1, 1, 2, 1),
(1, 1, 3, 1),
(1, 1, 4, 2), -- Sbagliata
(1, 1, 5, 1);

-- Partecipazione 2: rocco_fagiani al Quiz 2
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(2, 2, 1, 1),
(2, 2, 2, 1),
(2, 2, 3, 1),
(2, 2, 4, 1),
(2, 2, 5, 3); -- Sbagliata

-- Partecipazione 3: eva_angiolello al Quiz 3
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(3, 3, 1, 1),
(3, 3, 2, 1),
(3, 3, 3, 2), -- Sbagliata
(3, 3, 4, 1),
(3, 3, 5, 1);

-- Partecipazione 4: antonia_venditti al Quiz 4
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(4, 4, 1, 1),
(4, 4, 2, 4), -- Sbagliata
(4, 4, 3, 1),
(4, 4, 4, 1),
(4, 4, 5, 1);

-- Partecipazione 5: patrizio_bruno al Quiz 5
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(5, 5, 1, 1),
(5, 5, 2, 1),
(5, 5, 3, 1),
(5, 5, 4, 1),
(5, 5, 5, 1);

-- Partecipazione 6: gianluca_tommaseo al Quiz 6
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(6, 6, 1, 1),
(6, 6, 2, 2), -- Sbagliata
(6, 6, 3, 1),
(6, 6, 4, 3), -- Sbagliata
(6, 6, 5, 1);

-- Partecipazione 7: carla_tonisto al Quiz 7
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(7, 7, 1, 1),
(7, 7, 2, 1),
(7, 7, 3, 1),
(7, 7, 4, 1),
(7, 7, 5, 1);

-- Partecipazione 8: nicoletta_carriera al Quiz 8
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(8, 8, 1, 1),
(8, 8, 2, 1),
(8, 8, 3, 1),
(8, 8, 4, 4), -- Sbagliata
(8, 8, 5, 1);

-- Partecipazione 9: ubaldo_paltrinieri al Quiz 9
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(9, 9, 1, 1),
(9, 9, 2, 1),
(9, 9, 3, 2), -- Sbagliata
(9, 9, 4, 1),
(9, 9, 5, 1);

-- Partecipazione 10: goffredo_magnani al Quiz 10
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(10, 10, 1, 1),
(10, 10, 2, 1),
(10, 10, 3, 1),
(10, 10, 4, 1),
(10, 10, 5, 1);

-- Partecipazione 11: rita_druso al Quiz 11
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(11, 11, 1, 1),
(11, 11, 2, 3), -- Sbagliata
(11, 11, 3, 1),
(11, 11, 4, 1),
(11, 11, 5, 1);

-- Partecipazione 12: dina_leoncavallo al Quiz 12
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(12, 12, 1, 1),
(12, 12, 2, 1),
(12, 12, 3, 1),
(12, 12, 4, 1),
(12, 12, 5, 2); -- Sbagliata

-- Partecipazione 13: gian_bacosi al Quiz 13
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(13, 13, 1, 1),
(13, 13, 2, 1),
(13, 13, 3, 4), -- Sbagliata
(13, 13, 4, 1),
(13, 13, 5, 1);

-- Partecipazione 14: rosa_peranda al Quiz 14
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(14, 14, 1, 1),
(14, 14, 2, 1),
(14, 14, 3, 1),
(14, 14, 4, 1),
(14, 14, 5, 1);

-- Partecipazione 15: lucia_leone al Quiz 15
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(15, 15, 1, 1),
(15, 15, 2, 2), -- Sbagliata
(15, 15, 3, 1),
(15, 15, 4, 1),
(15, 15, 5, 3); -- Sbagliata

-- Partecipazione 16: marina_bernini al Quiz 16
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(16, 16, 1, 1),
(16, 16, 2, 1),
(16, 16, 3, 1),
(16, 16, 4, 1),
(16, 16, 5, 1);

-- Partecipazione 17: diana_barracco al Quiz 17
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(17, 17, 1, 1),
(17, 17, 2, 1),
(17, 17, 3, 1),
(17, 17, 4, 2), -- Sbagliata
(17, 17, 5, 1);

-- Partecipazione 18: gino_zichichi al Quiz 18
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(18, 18, 1, 1),
(18, 18, 2, 1),
(18, 18, 3, 1),
(18, 18, 4, 1),
(18, 18, 5, 1);

-- Partecipazione 19: alessia_sagnelli al Quiz 19
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(19, 19, 1, 1),
(19, 19, 2, 1),
(19, 19, 3, 3), -- Sbagliata
(19, 19, 4, 1),
(19, 19, 5, 1);

-- Partecipazione 20: graziella_lopresti al Quiz 20
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(20, 20, 1, 1),
(20, 20, 2, 1),
(20, 20, 3, 1),
(20, 20, 4, 1),
(20, 20, 5, 4); -- Sbagliata

-- Partecipazione 21: griselda_bandello al Quiz 21
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(21, 21, 1, 1),
(21, 21, 2, 2), -- Sbagliata
(21, 21, 3, 1),
(21, 21, 4, 1),
(21, 21, 5, 1);

-- Partecipazione 22: adelasia_gianvecchio al Quiz 22
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(22, 22, 1, 1),
(22, 22, 2, 1),
(22, 22, 3, 1),
(22, 22, 4, 1),
(22, 22, 5, 1);

-- Partecipazione 23: jolanda_petralli al Quiz 23
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(23, 23, 1, 1),
(23, 23, 2, 1),
(23, 23, 3, 1),
(23, 23, 4, 3), -- Sbagliata
(23, 23, 5, 1);

-- Partecipazione 24: lidia_agazzi al Quiz 24
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(24, 24, 1, 1),
(24, 24, 2, 1),
(24, 24, 3, 1),
(24, 24, 4, 1),
(24, 24, 5, 2); -- Sbagliata

-- Partecipazione 25: laureano_peruzzi al Quiz 25
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(25, 25, 1, 1),
(25, 25, 2, 4), -- Sbagliata
(25, 25, 3, 1),
(25, 25, 4, 1),
(25, 25, 5, 1);

-- Partecipazione 26: francesco_roero al Quiz 26
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(26, 26, 1, 1),
(26, 26, 2, 1),
(26, 26, 3, 1),
(26, 26, 4, 1),
(26, 26, 5, 1);

-- Partecipazione 27: venancio_juvara al Quiz 27
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(27, 27, 1, 1),
(27, 27, 2, 2), -- Sbagliata
(27, 27, 3, 1),
(27, 27, 4, 3), -- Sbagliata
(27, 27, 5, 1);

-- Partecipazione 28: matilda_pace al Quiz 28
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(28, 28, 1, 1),
(28, 28, 2, 1),
(28, 28, 3, 1),
(28, 28, 4, 1),
(28, 28, 5, 1);

-- Partecipazione 29: nicoletta_fusani al Quiz 29
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(29, 29, 1, 1),
(29, 29, 2, 1),
(29, 29, 3, 1),
(29, 29, 4, 4), -- Sbagliata
(29, 29, 5, 1);

-- Partecipazione 30: mercedes_ceci al Quiz 30
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(30, 30, 1, 1),
(30, 30, 2, 1),
(30, 30, 3, 2), -- Sbagliata
(30, 30, 4, 1),
(30, 30, 5, 1);

-- Partecipazione 31: federico_zanzi al Quiz 31
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(31, 31, 1, 1),
(31, 31, 2, 1),
(31, 31, 3, 1),
(31, 31, 4, 1),
(31, 31, 5, 1);

-- Partecipazione 32: lauretta_fagiani al Quiz 32
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(32, 32, 1, 1),
(32, 32, 2, 3), -- Sbagliata
(32, 32, 3, 1),
(32, 32, 4, 1),
(32, 32, 5, 1);

-- Partecipazione 33: gaetano_finetti al Quiz 33
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(33, 33, 1, 1),
(33, 33, 2, 1),
(33, 33, 3, 1),
(33, 33, 4, 1),
(33, 33, 5, 2); -- Sbagliata

-- Partecipazione 34: nedda_moschino al Quiz 34
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(34, 34, 1, 1),
(34, 34, 2, 1),
(34, 34, 3, 4), -- Sbagliata
(34, 34, 4, 1),
(34, 34, 5, 1);

-- Partecipazione 35: giovanni_zaccagnini al Quiz 35
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(35, 35, 1, 1),
(35, 35, 2, 1),
(35, 35, 3, 1),
(35, 35, 4, 1),
(35, 35, 5, 1);

-- Partecipazione 36: edoardo_amato al Quiz 36
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(36, 36, 1, 1),
(36, 36, 2, 2), -- Sbagliata
(36, 36, 3, 1),
(36, 36, 4, 3), -- Sbagliata
(36, 36, 5, 1);

-- Partecipazione 37: calogero_ritacca al Quiz 37
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(37, 37, 1, 1),
(37, 37, 2, 1),
(37, 37, 3, 1),
(37, 37, 4, 1),
(37, 37, 5, 1);

-- Partecipazione 38: tonino_nitti al Quiz 38
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(38, 38, 1, 1),
(38, 38, 2, 1),
(38, 38, 3, 1),
(38, 38, 4, 4), -- Sbagliata
(38, 38, 5, 1);

-- Partecipazione 39: franco_faranda al Quiz 39
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(39, 39, 1, 1),
(39, 39, 2, 1),
(39, 39, 3, 2), -- Sbagliata
(39, 39, 4, 1),
(39, 39, 5, 1);

-- Partecipazione 40: flora_ceci al Quiz 40
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(40, 40, 1, 1),
(40, 40, 2, 1),
(40, 40, 3, 1),
(40, 40, 4, 1),
(40, 40, 5, 1);

-- Partecipazione 41: tonino_stradivari al Quiz 41
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(41, 41, 1, 1),
(41, 41, 2, 3), -- Sbagliata
(41, 41, 3, 1),
(41, 41, 4, 1),
(41, 41, 5, 1);

-- Partecipazione 42: giulietta_lombardi al Quiz 42
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(42, 42, 1, 1),
(42, 42, 2, 1),
(42, 42, 3, 1),
(42, 42, 4, 1),
(42, 42, 5, 2); -- Sbagliata

-- Partecipazione 43: carolina_tomasini al Quiz 43
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(43, 43, 1, 1),
(43, 43, 2, 1),
(43, 43, 3, 4), -- Sbagliata
(43, 43, 4, 1),
(43, 43, 5, 1);

-- Partecipazione 44: licia_greggio al Quiz 44
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(44, 44, 1, 1),
(44, 44, 2, 1),
(44, 44, 3, 1),
(44, 44, 4, 1),
(44, 44, 5, 1);

-- Partecipazione 45: tiziano_antonacci al Quiz 45
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(45, 45, 1, 1),
(45, 45, 2, 2), -- Sbagliata
(45, 45, 3, 1),
(45, 45, 4, 1),
(45, 45, 5, 3); -- Sbagliata

-- Partecipazione 46: dina_argenti al Quiz 46
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(46, 46, 1, 1),
(46, 46, 2, 1),
(46, 46, 3, 1),
(46, 46, 4, 1),
(46, 46, 5, 1);

-- Partecipazione 47: durante_palombi al Quiz 47
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(47, 47, 1, 1),
(47, 47, 2, 1),
(47, 47, 3, 1),
(47, 47, 4, 2), -- Sbagliata
(47, 47, 5, 1);

-- Partecipazione 48: uberto_gravina al Quiz 48
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(48, 48, 1, 1),
(48, 48, 2, 1),
(48, 48, 3, 1),
(48, 48, 4, 1),
(48, 48, 5, 1);

-- Partecipazione 49: rembrandt_bergoglio al Quiz 49
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(49, 49, 1, 1),
(49, 49, 2, 1),
(49, 49, 3, 3), -- Sbagliata
(49, 49, 4, 1),
(49, 49, 5, 1);

-- Partecipazione 50: franco_garozzo al Quiz 50
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(50, 50, 1, 1),
(50, 50, 2, 1),
(50, 50, 3, 1),
(50, 50, 4, 1),
(50, 50, 5, 4); -- Sbagliata

-- Partecipazione 51: goffredo_angeli al Quiz 51
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(51, 51, 1, 1),
(51, 51, 2, 2), -- Sbagliata
(51, 51, 3, 1),
(51, 51, 4, 1),
(51, 51, 5, 1);

-- Partecipazione 52: girolamo_ferretti al Quiz 52
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(52, 52, 1, 1),
(52, 52, 2, 1),
(52, 52, 3, 1),
(52, 52, 4, 1),
(52, 52, 5, 1);

-- Partecipazione 53: nicolò_manzoni al Quiz 53
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(53, 53, 1, 1),
(53, 53, 2, 1),
(53, 53, 3, 1),
(53, 53, 4, 3), -- Sbagliata
(53, 53, 5, 1);

-- Partecipazione 54: orlando_zetticci al Quiz 54
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(54, 54, 1, 1),
(54, 54, 2, 1),
(54, 54, 3, 1),
(54, 54, 4, 1),
(54, 54, 5, 2); -- Sbagliata

-- Partecipazione 55: ludovico_rapisardi al Quiz 55
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(55, 55, 1, 1),
(55, 55, 2, 4), -- Sbagliata
(55, 55, 3, 1),
(55, 55, 4, 1),
(55, 55, 5, 1);

-- Partecipazione 56: gemma_bellò al Quiz 56
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(56, 56, 1, 1),
(56, 56, 2, 1),
(56, 56, 3, 1),
(56, 56, 4, 1),
(56, 56, 5, 1);

-- Partecipazione 57: stefania_montanelli al Quiz 57
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(57, 57, 1, 1),
(57, 57, 2, 2), -- Sbagliata
(57, 57, 3, 1),
(57, 57, 4, 3), -- Sbagliata
(57, 57, 5, 1);

-- Partecipazione 58: raimondo_micheletti al Quiz 58
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(58, 58, 1, 1),
(58, 58, 2, 1),
(58, 58, 3, 1),
(58, 58, 4, 1),
(58, 58, 5, 1);

-- Partecipazione 59: sandra_ioppi al Quiz 59
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(59, 59, 1, 1),
(59, 59, 2, 1),
(59, 59, 3, 1),
(59, 59, 4, 4), -- Sbagliata
(59, 59, 5, 1);

-- Partecipazione 60: federica_gadda al Quiz 60
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(60, 60, 1, 1),
(60, 60, 2, 1),
(60, 60, 3, 2), -- Sbagliata
(60, 60, 4, 1),
(60, 60, 5, 1);

-- Partecipazione 61: raffaellino_trillini al Quiz 61
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(61, 61, 1, 1),
(61, 61, 2, 1),
(61, 61, 3, 1),
(61, 61, 4, 1),
(61, 61, 5, 1);

-- Partecipazione 62: tonino_gulotta al Quiz 62
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(62, 62, 1, 1),
(62, 62, 2, 3), -- Sbagliata
(62, 62, 3, 1),
(62, 62, 4, 1),
(62, 62, 5, 1);

-- Partecipazione 63: concetta_verdi al Quiz 63
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(63, 63, 1, 1),
(63, 63, 2, 1),
(63, 63, 3, 1),
(63, 63, 4, 1),
(63, 63, 5, 2); -- Sbagliata

-- Partecipazione 64: gustavo_gelli al Quiz 64
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(64, 64, 1, 1),
(64, 64, 2, 1),
(64, 64, 3, 4), -- Sbagliata
(64, 64, 4, 1),
(64, 64, 5, 1);

-- Partecipazione 65: mirko_errani al Quiz 65
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(65, 65, 1, 1),
(65, 65, 2, 1),
(65, 65, 3, 1),
(65, 65, 4, 1),
(65, 65, 5, 1);

-- Partecipazione 66: riccardo_monaco al Quiz 66
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(66, 66, 1, 1),
(66, 66, 2, 2), -- Sbagliata
(66, 66, 3, 1),
(66, 66, 4, 1),
(66, 66, 5, 3); -- Sbagliata

-- Partecipazione 67: luigi_liverotti al Quiz 67
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(67, 67, 1, 1),
(67, 67, 2, 1),
(67, 67, 3, 1),
(67, 67, 4, 1),
(67, 67, 5, 1);

-- Partecipazione 68: silvia_rosmini al Quiz 68
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(68, 68, 1, 1),
(68, 68, 2, 1),
(68, 68, 3, 1),
(68, 68, 4, 4), -- Sbagliata
(68, 68, 5, 1);

-- Partecipazione 69: costantino_gargallo al Quiz 69
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(69, 69, 1, 1),
(69, 69, 2, 1),
(69, 69, 3, 2), -- Sbagliata
(69, 69, 4, 1),
(69, 69, 5, 1);

-- Partecipazione 70: gaspare_cortese al Quiz 70
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(70, 70, 1, 1),
(70, 70, 2, 1),
(70, 70, 3, 1),
(70, 70, 4, 1),
(70, 70, 5, 1);

-- Partecipazione 71: gianluigi_duse al Quiz 71
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(71, 71, 1, 1),
(71, 71, 2, 3), -- Sbagliata
(71, 71, 3, 1),
(71, 71, 4, 1),
(71, 71, 5, 1);

-- Partecipazione 72: ippazio_moresi al Quiz 72
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(72, 72, 1, 1),
(72, 72, 2, 1),
(72, 72, 3, 1),
(72, 72, 4, 1),
(72, 72, 5, 2); -- Sbagliata

-- Partecipazione 73: pompeo_romiti al Quiz 73
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(73, 73, 1, 1),
(73, 73, 2, 1),
(73, 73, 3, 4), -- Sbagliata
(73, 73, 4, 1),
(73, 73, 5, 1);

-- Partecipazione 74: alberico_lussu al Quiz 74
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(74, 74, 1, 1),
(74, 74, 2, 1),
(74, 74, 3, 1),
(74, 74, 4, 1),
(74, 74, 5, 1);

-- Partecipazione 75: orazio_nordio al Quiz 75
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(75, 75, 1, 1),
(75, 75, 2, 2), -- Sbagliata
(75, 75, 3, 1),
(75, 75, 4, 1),
(75, 75, 5, 3); -- Sbagliata

-- Partecipazione 76: pierangelo_stein al Quiz 76
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(76, 76, 1, 1),
(76, 76, 2, 1),
(76, 76, 3, 1),
(76, 76, 4, 1),
(76, 76, 5, 1);

-- Partecipazione 77: giuliana_carnera al Quiz 77
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(77, 77, 1, 1),
(77, 77, 2, 1),
(77, 77, 3, 1),
(77, 77, 4, 2), -- Sbagliata
(77, 77, 5, 1);

-- Partecipazione 78: pierpaolo_iannotti al Quiz 78
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(78, 78, 1, 1),
(78, 78, 2, 1),
(78, 78, 3, 1),
(78, 78, 4, 1),
(78, 78, 5, 1);

-- Partecipazione 79: cesare_cocci al Quiz 79
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(79, 79, 1, 1),
(79, 79, 2, 1),
(79, 79, 3, 3), -- Sbagliata
(79, 79, 4, 1),
(79, 79, 5, 1);

-- Partecipazione 80: rosario_cossiga al Quiz 80
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(80, 80, 1, 1),
(80, 80, 2, 1),
(80, 80, 3, 1),
(80, 80, 4, 1),
(80, 80, 5, 4); -- Sbagliata

-- Partecipazione 81: antonietta_virgilio al Quiz 81
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(81, 81, 1, 1),
(81, 81, 2, 2), -- Sbagliata
(81, 81, 3, 1),
(81, 81, 4, 1),
(81, 81, 5, 1);

-- Partecipazione 82: lucio_gritti al Quiz 82
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(82, 82, 1, 1),
(82, 82, 2, 1),
(82, 82, 3, 1),
(82, 82, 4, 1),
(82, 82, 5, 1);

-- Partecipazione 83: olga_barillaro al Quiz 83
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(83, 83, 1, 1),
(83, 83, 2, 1),
(83, 83, 3, 1),
(83, 83, 4, 3), -- Sbagliata
(83, 83, 5, 1);

-- Partecipazione 84: beatrice_barberini al Quiz 84
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(84, 84, 1, 1),
(84, 84, 2, 1),
(84, 84, 3, 1),
(84, 84, 4, 1),
(84, 84, 5, 2); -- Sbagliata

-- Partecipazione 85: rocco_fagiani al Quiz 85
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(85, 85, 1, 1),
(85, 85, 2, 4), -- Sbagliata
(85, 85, 3, 1),
(85, 85, 4, 1),
(85, 85, 5, 1);

-- Partecipazione 86: eva_angiolello al Quiz 86
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(86, 86, 1, 1),
(86, 86, 2, 1),
(86, 86, 3, 1),
(86, 86, 4, 1),
(86, 86, 5, 1);

-- Partecipazione 87: antonia_venditti al Quiz 87
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(87, 87, 1, 1),
(87, 87, 2, 2), -- Sbagliata
(87, 87, 3, 1),
(87, 87, 4, 3), -- Sbagliata
(87, 87, 5, 1);

-- Partecipazione 88: patrizio_bruno al Quiz 88
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(88, 88, 1, 1),
(88, 88, 2, 1),
(88, 88, 3, 1),
(88, 88, 4, 1),
(88, 88, 5, 1);

-- Partecipazione 89: gianluca_tommaseo al Quiz 89
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(89, 89, 1, 1),
(89, 89, 2, 1),
(89, 89, 3, 1),
(89, 89, 4, 4), -- Sbagliata
(89, 89, 5, 1);

-- Partecipazione 90: carla_tonisto al Quiz 90
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(90, 90, 1, 1),
(90, 90, 2, 1),
(90, 90, 3, 2), -- Sbagliata
(90, 90, 4, 1),
(90, 90, 5, 1);

-- Partecipazione 91: nicoletta_carriera al Quiz 91
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(91, 91, 1, 1),
(91, 91, 2, 1),
(91, 91, 3, 1),
(91, 91, 4, 1),
(91, 91, 5, 1);

-- Partecipazione 92: ubaldo_paltrinieri al Quiz 92
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(92, 92, 1, 1),
(92, 92, 2, 3), -- Sbagliata
(92, 92, 3, 1),
(92, 92, 4, 1),
(92, 92, 5, 1);

-- Partecipazione 93: goffredo_magnani al Quiz 93
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(93, 93, 1, 1),
(93, 93, 2, 1),
(93, 93, 3, 1),
(93, 93, 4, 1),
(93, 93, 5, 2); -- Sbagliata

-- Partecipazione 94: rita_druso al Quiz 94
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(94, 94, 1, 1),
(94, 94, 2, 1),
(94, 94, 3, 4), -- Sbagliata
(94, 94, 4, 1),
(94, 94, 5, 1);

-- Partecipazione 95: dina_leoncavallo al Quiz 95
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(95, 95, 1, 1),
(95, 95, 2, 1),
(95, 95, 3, 1),
(95, 95, 4, 1),
(95, 95, 5, 1);

-- Partecipazione 96: gian_bacosi al Quiz 96
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(96, 96, 1, 1),
(96, 96, 2, 2), -- Sbagliata
(96, 96, 3, 1),
(96, 96, 4, 1),
(96, 96, 5, 3); -- Sbagliata

-- Partecipazione 97: rosa_peranda al Quiz 97
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(97, 97, 1, 1),
(97, 97, 2, 1),
(97, 97, 3, 1),
(97, 97, 4, 1),
(97, 97, 5, 1);

-- Partecipazione 98: lucia_leone al Quiz 98
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(98, 98, 1, 1),
(98, 98, 2, 1),
(98, 98, 3, 1),
(98, 98, 4, 4), -- Sbagliata
(98, 98, 5, 1);

-- Partecipazione 99: marina_bernini al Quiz 99
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(99, 99, 1, 1),
(99, 99, 2, 1),
(99, 99, 3, 2), -- Sbagliata
(99, 99, 4, 1),
(99, 99, 5, 1);

-- Partecipazione 100: diana_barracco al Quiz 100
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(100, 100, 1, 1),
(100, 100, 2, 1),
(100, 100, 3, 1),
(100, 100, 4, 1),
(100, 100, 5, 1);

-- Partecipazione 101: gino_zichichi al Quiz 101
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(101, 101, 1, 1),
(101, 101, 2, 3), -- Sbagliata
(101, 101, 3, 1),
(101, 101, 4, 1),
(101, 101, 5, 1);

-- Partecipazione 102: alessia_sagnelli al Quiz 102
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(102, 102, 1, 1),
(102, 102, 2, 1),
(102, 102, 3, 1),
(102, 102, 4, 1),
(102, 102, 5, 2); -- Sbagliata

-- Partecipazione 103: graziella_lopresti al Quiz 103
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(103, 103, 1, 1),
(103, 103, 2, 1),
(103, 103, 3, 4), -- Sbagliata
(103, 103, 4, 1),
(103, 103, 5, 1);

-- Partecipazione 104: griselda_bandello al Quiz 104
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(104, 104, 1, 1),
(104, 104, 2, 1),
(104, 104, 3, 1),
(104, 104, 4, 1),
(104, 104, 5, 1);

-- Partecipazione 105: adelasia_gianvecchio al Quiz 105
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(105, 105, 1, 1),
(105, 105, 2, 2), -- Sbagliata
(105, 105, 3, 1),
(105, 105, 4, 1),
(105, 105, 5, 3); -- Sbagliata

-- Partecipazione 106: jolanda_petralli al Quiz 106
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(106, 106, 1, 1),
(106, 106, 2, 1),
(106, 106, 3, 1),
(106, 106, 4, 1),
(106, 106, 5, 1);

-- Partecipazione 107: lidia_agazzi al Quiz 107
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(107, 107, 1, 1),
(107, 107, 2, 1),
(107, 107, 3, 1),
(107, 107, 4, 2), -- Sbagliata
(107, 107, 5, 1);

-- Partecipazione 108: laureano_peruzzi al Quiz 108
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(108, 108, 1, 1),
(108, 108, 2, 1),
(108, 108, 3, 1),
(108, 108, 4, 1),
(108, 108, 5, 1);

-- Partecipazione 109: francesco_roero al Quiz 109
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(109, 109, 1, 1),
(109, 109, 2, 1),
(109, 109, 3, 3), -- Sbagliata
(109, 109, 4, 1),
(109, 109, 5, 1);

-- Partecipazione 110: venancio_juvara al Quiz 110
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(110, 110, 1, 1),
(110, 110, 2, 1),
(110, 110, 3, 1),
(110, 110, 4, 1),
(110, 110, 5, 4); -- Sbagliata

-- Partecipazione 111: matilda_pace al Quiz 111
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(111, 111, 1, 1),
(111, 111, 2, 2), -- Sbagliata
(111, 111, 3, 1),
(111, 111, 4, 1),
(111, 111, 5, 1);

-- Partecipazione 112: nicoletta_fusani al Quiz 112
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(112, 112, 1, 1),
(112, 112, 2, 1),
(112, 112, 3, 1),
(112, 112, 4, 1),
(112, 112, 5, 1);

-- Partecipazione 113: mercedes_ceci al Quiz 113
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(113, 113, 1, 1),
(113, 113, 2, 1),
(113, 113, 3, 1),
(113, 113, 4, 3), -- Sbagliata
(113, 113, 5, 1);

-- Partecipazione 114: federico_zanzi al Quiz 114
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(114, 114, 1, 1),
(114, 114, 2, 1),
(114, 114, 3, 1),
(114, 114, 4, 1),
(114, 114, 5, 2); -- Sbagliata

-- Partecipazione 115: lauretta_fagiani al Quiz 115
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(115, 115, 1, 1),
(115, 115, 2, 4), -- Sbagliata
(115, 115, 3, 1),
(115, 115, 4, 1),
(115, 115, 5, 1);

-- Partecipazione 116: gaetano_finetti al Quiz 116
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(116, 116, 1, 1),
(116, 116, 2, 1),
(116, 116, 3, 1),
(116, 116, 4, 1),
(116, 116, 5, 1);

-- Partecipazione 117: nedda_moschino al Quiz 117
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(117, 117, 1, 1),
(117, 117, 2, 2), -- Sbagliata
(117, 117, 3, 1),
(117, 117, 4, 3), -- Sbagliata
(117, 117, 5, 1);

-- Partecipazione 118: giovanni_zaccagnini al Quiz 118
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(118, 118, 1, 1),
(118, 118, 2, 1),
(118, 118, 3, 1),
(118, 118, 4, 1),
(118, 118, 5, 1);

-- Partecipazione 119: edoardo_amato al Quiz 119
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(119, 119, 1, 1),
(119, 119, 2, 1),
(119, 119, 3, 1),
(119, 119, 4, 4), -- Sbagliata
(119, 119, 5, 1);

-- Partecipazione 120: calogero_ritacca al Quiz 120
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(120, 120, 1, 1),
(120, 120, 2, 1),
(120, 120, 3, 2), -- Sbagliata
(120, 120, 4, 1),
(120, 120, 5, 1);

-- Partecipazione 121: tonino_nitti al Quiz 121
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(121, 121, 1, 1),
(121, 121, 2, 1),
(121, 121, 3, 1),
(121, 121, 4, 1),
(121, 121, 5, 1);

-- Partecipazione 122: franco_faranda al Quiz 122
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(122, 122, 1, 1),
(122, 122, 2, 3), -- Sbagliata
(122, 122, 3, 1),
(122, 122, 4, 1),
(122, 122, 5, 1);

-- Partecipazione 123: flora_ceci al Quiz 123
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(123, 123, 1, 1),
(123, 123, 2, 1),
(123, 123, 3, 1),
(123, 123, 4, 1),
(123, 123, 5, 2); -- Sbagliata

-- Partecipazione 124: tonino_stradivari al Quiz 124
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(124, 124, 1, 1),
(124, 124, 2, 1),
(124, 124, 3, 4), -- Sbagliata
(124, 124, 4, 1),
(124, 124, 5, 1);

-- Partecipazione 125: giulietta_lombardi al Quiz 125
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(125, 125, 1, 1),
(125, 125, 2, 1),
(125, 125, 3, 1),
(125, 125, 4, 1),
(125, 125, 5, 1);

-- Partecipazione 126: carolina_tomasini al Quiz 126
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(126, 126, 1, 1),
(126, 126, 2, 2), -- Sbagliata
(126, 126, 3, 1),
(126, 126, 4, 1),
(126, 126, 5, 3); -- Sbagliata

-- Partecipazione 127: licia_greggio al Quiz 127
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(127, 127, 1, 1),
(127, 127, 2, 1),
(127, 127, 3, 1),
(127, 127, 4, 1),
(127, 127, 5, 1);

-- Partecipazione 128: tiziano_antonacci al Quiz 128
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(128, 128, 1, 1),
(128, 128, 2, 1),
(128, 128, 3, 1),
(128, 128, 4, 4), -- Sbagliata
(128, 128, 5, 1);

-- Partecipazione 129: dina_argenti al Quiz 129
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(129, 129, 1, 1),
(129, 129, 2, 1),
(129, 129, 3, 2), -- Sbagliata
(129, 129, 4, 1),
(129, 129, 5, 1);

-- Partecipazione 130: durante_palombi al Quiz 130
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(130, 130, 1, 1),
(130, 130, 2, 1),
(130, 130, 3, 1),
(130, 130, 4, 1),
(130, 130, 5, 1);

-- Partecipazione 131: uberto_gravina al Quiz 131
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(131, 131, 1, 1),
(131, 131, 2, 3), -- Sbagliata
(131, 131, 3, 1),
(131, 131, 4, 1),
(131, 131, 5, 1);

-- Partecipazione 132: rembrandt_bergoglio al Quiz 132
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(132, 132, 1, 1),
(132, 132, 2, 1),
(132, 132, 3, 1),
(132, 132, 4, 1),
(132, 132, 5, 2); -- Sbagliata

-- Partecipazione 133: franco_garozzo al Quiz 133
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(133, 133, 1, 1),
(133, 133, 2, 1),
(133, 133, 3, 4), -- Sbagliata
(133, 133, 4, 1),
(133, 133, 5, 1);

-- Partecipazione 134: goffredo_angeli al Quiz 134
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(134, 134, 1, 1),
(134, 134, 2, 1),
(134, 134, 3, 1),
(134, 134, 4, 1),
(134, 134, 5, 1);

-- Partecipazione 135: girolamo_ferretti al Quiz 135
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(135, 135, 1, 1),
(135, 135, 2, 2), -- Sbagliata
(135, 135, 3, 1),
(135, 135, 4, 1),
(135, 135, 5, 3); -- Sbagliata

-- Partecipazione 136: nicolò_manzoni al Quiz 136
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(136, 136, 1, 1),
(136, 136, 2, 1),
(136, 136, 3, 1),
(136, 136, 4, 1),
(136, 136, 5, 1);

-- Partecipazione 137: orlando_zetticci al Quiz 137
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(137, 137, 1, 1),
(137, 137, 2, 1),
(137, 137, 3, 1),
(137, 137, 4, 2), -- Sbagliata
(137, 137, 5, 1);

-- Partecipazione 138: ludovico_rapisardi al Quiz 138
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(138, 138, 1, 1),
(138, 138, 2, 1),
(138, 138, 3, 1),
(138, 138, 4, 1),
(138, 138, 5, 1);

-- Partecipazione 139: gemma_bellò al Quiz 139
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(139, 139, 1, 1),
(139, 139, 2, 1),
(139, 139, 3, 3), -- Sbagliata
(139, 139, 4, 1),
(139, 139, 5, 1);

-- Partecipazione 140: stefania_montanelli al Quiz 140
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(140, 140, 1, 1),
(140, 140, 2, 1),
(140, 140, 3, 1),
(140, 140, 4, 1),
(140, 140, 5, 4); -- Sbagliata

-- Partecipazione 141: raimondo_micheletti al Quiz 141
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(141, 141, 1, 1),
(141, 141, 2, 2), -- Sbagliata
(141, 141, 3, 1),
(141, 141, 4, 1),
(141, 141, 5, 1);

-- Partecipazione 142: sandra_ioppi al Quiz 142
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(142, 142, 1, 1),
(142, 142, 2, 1),
(142, 142, 3, 1),
(142, 142, 4, 1),
(142, 142, 5, 1);

-- Partecipazione 143: federica_gadda al Quiz 143
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(143, 143, 1, 1),
(143, 143, 2, 1),
(143, 143, 3, 1),
(143, 143, 4, 3), -- Sbagliata
(143, 143, 5, 1);

-- Partecipazione 144: raffaellino_trillini al Quiz 144
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(144, 144, 1, 1),
(144, 144, 2, 1),
(144, 144, 3, 1),
(144, 144, 4, 1),
(144, 144, 5, 2); -- Sbagliata

-- Partecipazione 145: giulia_galilei al Quiz 145
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(145, 145, 1, 1),
(145, 145, 2, 4), -- Sbagliata
(145, 145, 3, 1),
(145, 145, 4, 1),
(145, 145, 5, 1);

-- Partecipazione 146: costantino_traversa al Quiz 146
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(146, 146, 1, 1),
(146, 146, 2, 1),
(146, 146, 3, 1),
(146, 146, 4, 1),
(146, 146, 5, 1);

-- Partecipazione 147: dolores_condoleo al Quiz 147
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(147, 147, 1, 1),
(147, 147, 2, 2), -- Sbagliata
(147, 147, 3, 1),
(147, 147, 4, 3), -- Sbagliata
(147, 147, 5, 1);

-- Partecipazione 148: enzio_dallara al Quiz 148
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(148, 148, 1, 1),
(148, 148, 2, 1),
(148, 148, 3, 1),
(148, 148, 4, 1),
(148, 148, 5, 1);

-- Partecipazione 149: ippazio_sansoni al Quiz 149
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(149, 149, 1, 1),
(149, 149, 2, 1),
(149, 149, 3, 1),
(149, 149, 4, 4), -- Sbagliata
(149, 149, 5, 1);

-- Partecipazione 150: livio_lattuada al Quiz 150
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(150, 150, 1, 1),
(150, 150, 2, 1),
(150, 150, 3, 2), -- Sbagliata
(150, 150, 4, 1),
(150, 150, 5, 1);

-- Partecipazione 151: ivo_donati al Quiz 151
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(151, 151, 1, 1),
(151, 151, 2, 1),
(151, 151, 3, 1),
(151, 151, 4, 1),
(151, 151, 5, 1);

-- Partecipazione 152: pierina_antonello al Quiz 152
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(152, 152, 1, 1),
(152, 152, 2, 3), -- Sbagliata
(152, 152, 3, 1),
(152, 152, 4, 1),
(152, 152, 5, 1);

-- Partecipazione 153: raffaello_spallanzani al Quiz 153
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(153, 153, 1, 1),
(153, 153, 2, 1),
(153, 153, 3, 1),
(153, 153, 4, 1),
(153, 153, 5, 2); -- Sbagliata

-- Partecipazione 154: ramona_satta al Quiz 154
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(154, 154, 1, 1),
(154, 154, 2, 1),
(154, 154, 3, 4), -- Sbagliata
(154, 154, 4, 1),
(154, 154, 5, 1);

-- Partecipazione 155: tiziano_marazzi al Quiz 155
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(155, 155, 1, 1),
(155, 155, 2, 1),
(155, 155, 3, 1),
(155, 155, 4, 1),
(155, 155, 5, 1);

-- Partecipazione 156: rosa_brambilla al Quiz 156
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(156, 156, 1, 1),
(156, 156, 2, 2), -- Sbagliata
(156, 156, 3, 1),
(156, 156, 4, 1),
(156, 156, 5, 3); -- Sbagliata

-- Partecipazione 157: zaira_morpurgo al Quiz 157
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(157, 157, 1, 1),
(157, 157, 2, 1),
(157, 157, 3, 1),
(157, 157, 4, 1),
(157, 157, 5, 1);

-- Partecipazione 158: ornella_niscoromni al Quiz 158
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(158, 158, 1, 1),
(158, 158, 2, 1),
(158, 158, 3, 1),
(158, 158, 4, 4), -- Sbagliata
(158, 158, 5, 1);

-- Partecipazione 159: olga_inzaghi al Quiz 159
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(159, 159, 1, 1),
(159, 159, 2, 1),
(159, 159, 3, 2), -- Sbagliata
(159, 159, 4, 1),
(159, 159, 5, 1);

-- Partecipazione 160: francesca_sgarbi al Quiz 160
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(160, 160, 1, 1),
(160, 160, 2, 1),
(160, 160, 3, 1),
(160, 160, 4, 1),
(160, 160, 5, 1);

-- Partecipazione 161: ludovica_federico al Quiz 161
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(161, 161, 1, 1),
(161, 161, 2, 3), -- Sbagliata
(161, 161, 3, 1),
(161, 161, 4, 1),
(161, 161, 5, 1);

-- Partecipazione 162: luchino_zanichelli al Quiz 162
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(162, 162, 1, 1),
(162, 162, 2, 1),
(162, 162, 3, 1),
(162, 162, 4, 1),
(162, 162, 5, 2); -- Sbagliata

-- Partecipazione 163: camillo_pausini al Quiz 163
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(163, 163, 1, 1),
(163, 163, 2, 1),
(163, 163, 3, 4), -- Sbagliata
(163, 163, 4, 1),
(163, 163, 5, 1);

-- Partecipazione 164: santino_spadafora al Quiz 164
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(164, 164, 1, 1),
(164, 164, 2, 1),
(164, 164, 3, 1),
(164, 164, 4, 1),
(164, 164, 5, 1);

-- Partecipazione 165: alfio_visintini al Quiz 165
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(165, 165, 1, 1),
(165, 165, 2, 2), -- Sbagliata
(165, 165, 3, 1),
(165, 165, 4, 1),
(165, 165, 5, 3); -- Sbagliata

-- Partecipazione 166: mario_zola al Quiz 166
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(166, 166, 1, 1),
(166, 166, 2, 1),
(166, 166, 3, 1),
(166, 166, 4, 1),
(166, 166, 5, 1);

-- Partecipazione 167: antonina_palumbo al Quiz 167
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(167, 167, 1, 1),
(167, 167, 2, 1),
(167, 167, 3, 1),
(167, 167, 4, 4), -- Sbagliata
(167, 167, 5, 1);

-- Partecipazione 168: elladio_morandini al Quiz 168
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(168, 168, 1, 1),
(168, 168, 2, 1),
(168, 168, 3, 2), -- Sbagliata
(168, 168, 4, 1),
(168, 168, 5, 1);

-- Partecipazione 169: carlo_barozzi al Quiz 169
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(169, 169, 1, 1),
(169, 169, 2, 1),
(169, 169, 3, 1),
(169, 169, 4, 1),
(169, 169, 5, 1);

-- Partecipazione 170: raimondo_balotelli al Quiz 170
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(170, 170, 1, 1),
(170, 170, 2, 3), -- Sbagliata
(170, 170, 3, 1),
(170, 170, 4, 1),
(170, 170, 5, 1);

-- Partecipazione 171: maurizio_gaito al Quiz 171
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(171, 171, 1, 1),
(171, 171, 2, 1),
(171, 171, 3, 1),
(171, 171, 4, 1),
(171, 171, 5, 2); -- Sbagliata

-- Partecipazione 172: costanzo_borghese al Quiz 172
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(172, 172, 1, 1),
(172, 172, 2, 1),
(172, 172, 3, 4), -- Sbagliata
(172, 172, 4, 1),
(172, 172, 5, 1);

-- Partecipazione 173: francesca_nosiglia al Quiz 173
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(173, 173, 1, 1),
(173, 173, 2, 1),
(173, 173, 3, 1),
(173, 173, 4, 1),
(173, 173, 5, 1);

-- Partecipazione 174: viridiana_pagnotto al Quiz 174
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(174, 174, 1, 1),
(174, 174, 2, 2), -- Sbagliata
(174, 174, 3, 1),
(174, 174, 4, 1),
(174, 174, 5, 3); -- Sbagliata

-- Partecipazione 175: ida_jilani al Quiz 175
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(175, 175, 1, 1),
(175, 175, 2, 1),
(175, 175, 3, 1),
(175, 175, 4, 1),
(175, 175, 5, 1);

-- Partecipazione 176: angelo_scalera al Quiz 176
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(176, 176, 1, 1),
(176, 176, 2, 1),
(176, 176, 3, 1),
(176, 176, 4, 4), -- Sbagliata
(176, 176, 5, 1);

-- Partecipazione 177: patrizio_pertile al Quiz 177
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(177, 177, 1, 1),
(177, 177, 2, 1),
(177, 177, 3, 2), -- Sbagliata
(177, 177, 4, 1),
(177, 177, 5, 1);

-- Partecipazione 178: dante_respighi al Quiz 178
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(178, 178, 1, 1),
(178, 178, 2, 1),
(178, 178, 3, 1),
(178, 178, 4, 1),
(178, 178, 5, 1);

-- Partecipazione 179: sergius_ravaglioli al Quiz 179
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(179, 179, 1, 1),
(179, 179, 2, 3), -- Sbagliata
(179, 179, 3, 1),
(179, 179, 4, 1),
(179, 179, 5, 1);

-- Partecipazione 180: ubaldo_biagiotti al Quiz 180
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(180, 180, 1, 1),
(180, 180, 2, 1),
(180, 180, 3, 1),
(180, 180, 4, 1),
(180, 180, 5, 2); -- Sbagliata

-- Partecipazione 181: alphons_morandi al Quiz 181
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(181, 181, 1, 1),
(181, 181, 2, 1),
(181, 181, 3, 4), -- Sbagliata
(181, 181, 4, 1),
(181, 181, 5, 1);

-- Partecipazione 182: luchino_iadanza al Quiz 182
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(182, 182, 1, 1),
(182, 182, 2, 1),
(182, 182, 3, 1),
(182, 182, 4, 1),
(182, 182, 5, 1);

-- Partecipazione 183: federigo_cesarotti al Quiz 183
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(183, 183, 1, 1),
(183, 183, 2, 2), -- Sbagliata
(183, 183, 3, 1),
(183, 183, 4, 1),
(183, 183, 5, 3); -- Sbagliata

-- Partecipazione 184: lando_galilei al Quiz 184
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(184, 184, 1, 1),
(184, 184, 2, 1),
(184, 184, 3, 1),
(184, 184, 4, 1),
(184, 184, 5, 1);

-- Partecipazione 185: rocco_baggio al Quiz 185
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(185, 185, 1, 1),
(185, 185, 2, 1),
(185, 185, 3, 1),
(185, 185, 4, 4), -- Sbagliata
(185, 185, 5, 1);

-- Partecipazione 186: severino_scarpa al Quiz 186
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(186, 186, 1, 1),
(186, 186, 2, 1),
(186, 186, 3, 2), -- Sbagliata
(186, 186, 4, 1),
(186, 186, 5, 1);

-- Partecipazione 187: iolanda_casellati al Quiz 187
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(187, 187, 1, 1),
(187, 187, 2, 1),
(187, 187, 3, 1),
(187, 187, 4, 1),
(187, 187, 5, 1);

-- Partecipazione 188: sante_baracca al Quiz 116 (Esempio cambio quiz)
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(188, 116, 1, 1),
(188, 116, 2, 1),
(188, 116, 3, 1),
(188, 116, 4, 3), -- Sbagliata
(188, 116, 5, 1);

-- Partecipazione 189: mattia_mazzacurati al Quiz 129 (Esempio cambio quiz)
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(189, 129, 1, 1),
(189, 129, 2, 1),
(189, 129, 3, 1),
(189, 129, 4, 1),
(189, 129, 5, 2); -- Sbagliata

-- Partecipazione 190: tonia_gucci al Quiz 137 (Esempio cambio quiz)
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(190, 137, 1, 1),
(190, 137, 2, 4), -- Sbagliata
(190, 137, 3, 1),
(190, 137, 4, 1),
(190, 137, 5, 1);

-- Partecipazione 191: flavio_cilea al Quiz 191 (Esempio cambio quiz)
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(191, 191, 1, 1),
(191, 191, 2, 1),
(191, 191, 3, 1),
(191, 191, 4, 1),
(191, 191, 5, 1);

-- Partecipazione 192: nino_versace al Quiz 192 (Esempio cambio quiz)
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(192, 192, 1, 1),
(192, 192, 2, 2), -- Sbagliata
(192, 192, 3, 1),
(192, 192, 4, 1),
(192, 192, 5, 3); -- Sbagliata

-- Partecipazione 193: barbara_babbo al Quiz 193 (Esempio cambio quiz)
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(193, 193, 1, 1),
(193, 193, 2, 1),
(193, 193, 3, 1),
(193, 193, 4, 1),
(193, 193, 5, 1);

-- Partecipazione 194: ignazio_stefanelli al Quiz 194 (Esempio cambio quiz)
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(194, 194, 1, 1),
(194, 194, 2, 1),
(194, 194, 3, 1),
(194, 194, 4, 4), -- Sbagliata
(194, 194, 5, 1);

-- Partecipazione 195: tonia_ferrata al Quiz 195 (Esempio cambio quiz)
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(195, 195, 1, 1),
(195, 195, 2, 1),
(195, 195, 3, 2), -- Sbagliata
(195, 195, 4, 1),
(195, 195, 5, 1);

-- Partecipazione 196: lucia_boaga al Quiz 196 (Esempio cambio quiz)
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(196, 196, 1, 1),
(196, 196, 2, 1),
(196, 196, 3, 1),
(196, 196, 4, 1),
(196, 196, 5, 1);

-- Partecipazione 197: rodolfo_filippini al Quiz 197 (Esempio cambio quiz)
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(197, 197, 1, 1),
(197, 197, 2, 3), -- Sbagliata
(197, 197, 3, 1),
(197, 197, 4, 1),
(197, 197, 5, 1);

-- Partecipazione 198: loretta_mercadante al Quiz 198 (Esempio cambio quiz)
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(198, 198, 1, 1),
(198, 198, 2, 1),
(198, 198, 3, 1),
(198, 198, 4, 1),
(198, 198, 5, 2); -- Sbagliata

-- Partecipazione 199: cecilia_tomei al Quiz 199 (Esempio cambio quiz)
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(199, 199, 1, 1),
(199, 199, 2, 1),
(199, 199, 3, 4), -- Sbagliata
(199, 199, 4, 1),
(199, 199, 5, 1);

-- Partecipazione 200: calogero_scarlatti al Quiz 200 (Esempio cambio quiz)
INSERT INTO RispostaUtenteQuiz (partecipazione, quiz, domanda, risposta) VALUES
(200, 200, 1, 1),
(200, 200, 2, 1),
(200, 200, 3, 1),
(200, 200, 4, 1),
(200, 200, 5, 1);
