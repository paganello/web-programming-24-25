<?php
/**
 * Pagina di ricerca avanzata dei quiz.
 *
 * Questa pagina permette agli utenti di cercare quiz disponibili
 * in base a titolo, creatore, e periodo di disponibilità.
 */
include 'includes/header.php';

$today = date('Y-m-d');

?>

<div class="content">
    <a href="index.php" class="btn">⟵ Torna alla Home</a>
    <h1>Ricerca Quiz</h1>

    <form method="GET" action="quiz_search.php" class="search-form">
        <div class="form-grid">
            <div class="form-group">
                <label for="search_titolo">Titolo del Quiz:</label>
                <input type="text" id="search_titolo" name="search_titolo"
                    value="<?php echo htmlspecialchars($search_titolo); ?>">
            </div>

            <div class="form-group">
                <label for="search_creatore">Creatore (Nome Utente, Nome o Cognome):</label>
                <input type="text" id="search_creatore" name="search_creatore"
                    value="<?php echo htmlspecialchars($search_creatore); ?>">
            </div>

            <div class="form-group">
                <label for="search_data_inizio_da">Disponibile dal:</label>
                <input type="date" id="search_data_inizio_da" name="search_data_inizio_da"
                    value="<?php echo htmlspecialchars($search_data_inizio_da); ?>">
            </div>

            <div class="form-group">
                <label for="search_data_fine_a">Disponibile fino al:</label>
                <input type="date" id="search_data_fine_a" name="search_data_fine_a"
                    value="<?php echo htmlspecialchars($search_data_fine_a); ?>">
            </div>

            <div class="form-group">
                <label for="sort_by">Ordina per:</label>
                <select id="sort_by" name="sort_by">
                    <option value="codice_desc" <?php if ($sort_by == 'codice_desc')
                        echo 'selected'; ?>>Più Recenti
                        (Default)</option>
                    <option value="codice_asc" <?php if ($sort_by == 'codice_asc')
                        echo 'selected'; ?>>Meno Recenti
                    </option>
                    <option value="titolo_asc" <?php if ($sort_by == 'titolo_asc')
                        echo 'selected'; ?>>Titolo (A-Z)
                    </option>
                    <option value="titolo_desc" <?php if ($sort_by == 'titolo_desc')
                        echo 'selected'; ?>>Titolo (Z-A)
                    </option>
                    <option value="data_inizio_asc" <?php if ($sort_by == 'data_inizio_asc')
                        echo 'selected'; ?>>Data
                        Inizio (Crescente)</option>
                    <option value="data_inizio_desc" <?php if ($sort_by == 'data_inizio_desc')
                        echo 'selected'; ?>>Data
                        Inizio (Decrescente)</option>
                </select>
            </div>
        </div>

        <div class="form-actions">
            <button type="submit" class="btn">Cerca</button>
            <a href="quiz_search.php" class="btn btn-secondary">Resetta Filtri</a>
        </div>
    </form>

    <hr>
    <h2>Risultati della ricerca</h2>

    <?php if (empty($quizzes)): ?>
        <p>Nessun quiz trovato con i criteri specificati.</p>
    <?php else: ?>
        <div class="quiz-list">
            <?php foreach ($quizzes as $quiz): ?>
                <div class="quiz-item">
                    <h3 class="quiz-title"><?php echo htmlspecialchars($quiz['titolo']); ?></h3>
                    <div class="quiz-meta">
                        <p>Creato da: <?php echo htmlspecialchars($quiz['nome'] . ' ' . $quiz['cognome']); ?>
                            (<?php echo htmlspecialchars($quiz['creatore']); ?>)</p>
                        <p>Disponibile dal <?php echo date('d/m/Y', strtotime($quiz['dataInizio'])); ?> al
                            <?php echo date('d/m/Y', strtotime($quiz['dataFine'])); ?>
                        </p>
                        <?php
                        $now = new DateTime();
                        $dataInizio = new DateTime($quiz['dataInizio']);
                        $dataFine = new DateTime($quiz['dataFine']);
                        $dataFine->setTime(23, 59, 59); // Considera disponibile fino alla fine del giorno
                
                        if ($now >= $dataInizio && $now <= $dataFine) {
                            echo '<p><strong style="color: green;">Attualmente Disponibile</strong></p>';
                        } elseif ($now < $dataInizio) {
                            echo '<p><strong style="color: orange;">Non ancora disponibile</strong></p>';
                        } else {
                            echo '<p><strong style="color: red;">Scaduto</strong></p>';
                        }
                        ?>
                    </div>
                    <div class="quiz-actions">
                        <a href="quiz_view.php?id=<?php echo $quiz['codice']; ?>" class="btn">Visualizza</a>
                        <?php if (isset($_SESSION['user'])): ?>
                            <?php if ($now >= $dataInizio && $now <= $dataFine): // Solo se disponibile ?>
                                <a href="quiz_participate.php?id=<?php echo $quiz['codice']; ?>" class="btn btn-secondary">Partecipa</a>
                            <?php endif; ?>
                        <?php endif; ?>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    <?php endif; ?>
</div>

<?php include 'includes/footer.php'; ?>