
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;

@WebServlet("/migrate")
public class MigrationServlet extends HttpServlet {

    private static final String PHP_BASE_URL = "http://tuo_dominio_altervista.org/1°_progetto/migration_api/"; // CAMBIA QUESTO!
    private static final String DJANGO_BASE_URL = "http://127.0.0.1:8000/api/import/";

    private final HttpClient httpClient = HttpClient.newBuilder().version(HttpClient.Version.HTTP_2).build();
    private final ObjectMapper objectMapper = new ObjectMapper();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/plain");
        StringBuilder log = new StringBuilder();

        // Ordine di migrazione
        String[] entities = {
            "users", "quizzes", "questions", "answers", "participations", "user_quiz_answers"
        };
        // Nomi file PHP corrispondenti (se diversi dalla entity key)
        String[] phpScripts = {
            "export_users.php", "export_quizzes.php", "export_questions.php",
            "export_answers.php", "export_participations.php", "export_user_quiz_answers.php"
        };
        // Endpoint Django corrispondenti (se diversi dalla entity key)
         String[] djangoEndpoints = {
            "users/", "quizzes/", "questions/", "answers/",
            "participations/", "user_quiz_answers/"
        };

        // Pulisci la mappa degli ID in Django prima di iniziare una nuova migrazione
        log.append("Clearing Django ID map...\n");
        String clearMapResponse = postToDjango(DJANGO_BASE_URL + "clear_id_map/", "{}"); // Invia un JSON vuoto
        log.append("Clear map response: ").append(clearMapResponse).append("\n\n");


        for (int i = 0; i < entities.length; i++) {
            String entity = entities[i];
            String phpScript = phpScripts[i];
            String djangoEndpoint = djangoEndpoints[i];

            log.append("Migrating ").append(entity).append("...\n");

            try {
                // 1. Fetch data from PHP service
                String phpUrl = PHP_BASE_URL + phpScript;
                log.append("  Fetching from: ").append(phpUrl).append("\n");

                HttpRequest getRequest = HttpRequest.newBuilder()
                        .uri(URI.create(phpUrl))
                        .GET()
                        .build();
                HttpResponse<InputStream> phpResponse = httpClient.send(getRequest, HttpResponse.BodyHandlers.ofInputStream());

                if (phpResponse.statusCode() == 200) {
                    JsonNode rootNode = objectMapper.readTree(phpResponse.body());
                    if (rootNode.path("success").asBoolean(false)) {
                        ArrayNode dataArray = (ArrayNode) rootNode.path("data");
                        if (dataArray.size() > 0) {
                            String jsonData = objectMapper.writeValueAsString(dataArray);
                            log.append("    Fetched ").append(dataArray.size()).append(" items.\n");

                            // 2. Post data to Django service
                            String djangoUrl = DJANGO_BASE_URL + djangoEndpoint;
                            log.append("    Posting to: ").append(djangoUrl).append("\n");
                            String djangoResponse = postToDjango(djangoUrl, jsonData);
                            log.append("    Django response: ").append(djangoResponse).append("\n");
                        } else {
                            log.append("    No data to migrate for ").append(entity).append(".\n");
                        }
                    } else {
                         log.append("    PHP service error for ").append(entity).append(": ")
                            .append(rootNode.path("message").asText("Unknown error from PHP service."))
                            .append("\n");
                    }
                } else {
                    log.append("    Error fetching from PHP: ").append(phpResponse.statusCode()).append("\n");
                     // Leggi il corpo dell'errore se presente
                    String errorBody = new String(phpResponse.body().readAllBytes());
                    log.append("    PHP Error Body: ").append(errorBody).append("\n");
                }

            } catch (Exception e) {
                log.append("  Error during migration of ").append(entity).append(": ").append(e.getMessage()).append("\n");
                e.printStackTrace(resp.getWriter()); // Stampa stack trace nel log di Tomcat e nella risposta
            }
            log.append("\n");
        }

        log.append("Migration process finished.\n");
        resp.getWriter().write(log.toString());
    }

    private String postToDjango(String url, String jsonPayload) throws IOException, InterruptedException {
        HttpRequest postRequest = HttpRequest.newBuilder()
                .uri(URI.create(url))
                .POST(HttpRequest.BodyPublishers.ofString(jsonPayload))
                .header("Content-Type", "application/json")
                .build();
        HttpResponse<String> djangoResponse = httpClient.send(postRequest, HttpResponse.BodyHandlers.ofString());
        return "Status: " + djangoResponse.statusCode() + ", Body: " + djangoResponse.body();
    }
}