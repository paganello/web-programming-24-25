<?php

/**
 * Barra di Navigazione Principale dell'Applicazione Quiz Online.
 *
 * Questo file genera il menu di navigazione che appare in tutte le pagine.
 * Le voci di menu visualizzate possono variare a seconda dello stato di
 * autenticazione dell'utente (loggato o non loggato).
 * Inoltre, evidenzia la voce di menu corrispondente alla pagina
 * attualmente visualizzata dall'utente.
 */

// Ottiene il nome del file della pagina corrente (es. "index.php", "quiz_create.php").
// Questo è utilizzato per applicare la classe 'active' al link della pagina corrente.
$current_page = basename($_SERVER['PHP_SELF']);
?>
<nav>
    <div class="container"> <!-- Contenitore per centrare la lista di navigazione -->
        <ul>
            <!-- Voce di menu "Home", sempre visibile -->
            <li>
                <a href="index.php" <?php echo ($current_page == 'index.php') ? 'class="active"' : ''; ?>>
                    Home
                </a>
            </li>

            <?php if(isset($_SESSION['user'])): // Controlla se l'utente è loggato ?>
                <!-- Voci di menu visibili solo agli utenti autenticati -->
                <li>
                    <a href="quiz_create.php" <?php echo ($current_page == 'quiz_create.php') ? 'class="active"' : ''; ?>>
                        Crea Quiz
                    </a>
                </li>
                <li>
                    <a href="quiz_my.php" <?php echo ($current_page == 'quiz_my.php') ? 'class="active"' : ''; ?>>
                        I Miei Quiz
                    </a>
                </li>
                <li>
                    <a href="quiz_participations.php" <?php echo ($current_page == 'quiz_participations.php') ? 'class="active"' : ''; ?>>
                        Le Mie Partecipazioni
                    </a>
                </li>
            <?php endif; // Fine del blocco condizionale per utenti loggati ?>
            
            <!-- 
                Eventuali altre voci di menu pubbliche (visibili a tutti) 
                o specifiche per ruoli diversi potrebbero essere aggiunte qui.
                Esempio:
                <li><a href="about.php" <?php echo ($current_page == 'about.php') ? 'class="active"' : ''; ?>>Informazioni</a></li>
            -->
        </ul>
    </div>
</nav>