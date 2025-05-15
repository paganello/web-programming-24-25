<?php

/**
 * Footer Comune dell'Applicazione Quiz Online.
 *
 * Questo file contiene il piè di pagina HTML standard, visualizzato in
 * tutte le pagine. Include informazioni di copyright e il caricamento
 * degli script JavaScript globali.
 */

?>
    </div> <!-- Chiusura del contenitore principale (es. .main-content) -->
    
    <footer>
        <div class="container">
            <!-- Informazioni di Copyright con anno dinamico -->
            <p>© <?php echo date('Y'); ?> QuizBG - Università di Bergamo</p>
        </div>
    </footer>

    <!-- 
        Inclusione di Script JavaScript.
        Caricati alla fine del body per performance e per assicurare
        che il DOM sia pronto prima dell'esecuzione degli script.
    -->
    <!-- Libreria jQuery (da CDN) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Script JavaScript personalizzato dell'applicazione -->
    <script src="assets/js/main.js"></script>
</body>
</html>