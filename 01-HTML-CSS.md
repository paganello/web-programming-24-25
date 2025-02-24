# 1.0 HTML
Sta per Hyper-Text-MarkUp-Lenguage. Un testo non deve essere come un libro, l'idea du un Hyper-Testo è quella di non avere sequenzialità, ma poter saltare da una parte all'altra in modo fluido. E' un formato aperto, ognuno puo aprirlo e leggerlo, definito da uno standard IEEE.

 ## 1.1 Struttura a Marcatori
 Di base abbiamo una strutta ASCII con dei marcatori che definisco delle sezioni che avranno delle funzioni o particolarità in basa al marcatore utilizzato. I marcatori possono avere una struttara annidata.

- **Elemento**: una pagina è costituita da tanti elementi, ogni elementi è un blocco composto da marcatore di apertura e relativo marcatore di chiusura.
E.g: Tutto il documento deve stare all'interno dei marcatori HTML, a sua volta tutto il campo informativo deve stare all'interno di HEAD, e il titolo all'interno dell'elemento TITLE.

Vediamo alcuni elementi:
- **Paragrafo (p)**: un documento è principalmente composto da paragrafi, dove al loro interno inseriamo un contenuto, che puo essere testuale.
- **Capo (br)**: Sta per "breack", elemento vuoto che non ha contenuto, manda semplicemente a capo. Esempio piu semplice di elemento vuoto.
- **Caratteri scomodi (uso delle Entity)**: Non potendo direttamente utilizzare i caratteri che cosituiscono sintassi HTML, esitsono diverse entity (codici) che corrispondono ad un determinato carattere e che quindi ne permettono l'uso nel documento renderizzato. queste stesse entity possono essere scritte anche come &#*CODICE_ASCII_CARATTERE*. tra questi caratteri  sono presenti lettere maiuscole accentate, apici (><), ecc.
- **Ancora (a)**: Elemento HTML che significa "Ancora", permette di inserire collegamenti ipertestuali utilizzando href (hyper-reference). si possono utilizzare anche delle ancore (tag "#") 


