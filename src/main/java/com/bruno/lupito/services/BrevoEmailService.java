package com.bruno.lupito.services;

import java.time.Duration;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClient;

/**
 * Envia e-mails pela API HTTP da Brevo (https://api.brevo.com), em vez de SMTP.
 * Usado porque o Render bloqueia conexoes SMTP de saida; a API HTTP usa a porta 443.
 */
@Service
public class BrevoEmailService {

    private final RestClient restClient;
    private final String fromEmail;
    private final String fromName;

    public BrevoEmailService(
            @Value("${brevo.api.key:}") String apiKey,
            @Value("${app.mail.from:brunothome51@gmail.com}") String fromEmail,
            @Value("${app.mail.from-name:Lupito}") String fromName) {
        this.fromEmail = fromEmail;
        this.fromName = fromName;

        SimpleClientHttpRequestFactory factory = new SimpleClientHttpRequestFactory();
        factory.setConnectTimeout(Duration.ofSeconds(10));
        factory.setReadTimeout(Duration.ofSeconds(15));

        this.restClient = RestClient.builder()
                .baseUrl("https://api.brevo.com/v3")
                .requestFactory(factory)
                .defaultHeader("api-key", apiKey)
                .defaultHeader("accept", "application/json")
                .build();
    }

    public void sendText(String toEmail, String toName, String subject, String textContent) {
        Map<String, Object> body = Map.of(
                "sender", Map.of("name", fromName, "email", fromEmail),
                "to", List.of(Map.of("email", toEmail, "name", toName == null ? toEmail : toName)),
                "subject", subject,
                "textContent", textContent
        );

        restClient.post()
                .uri("/smtp/email")
                .contentType(MediaType.APPLICATION_JSON)
                .body(body)
                .retrieve()
                .toBodilessEntity();
    }
}
