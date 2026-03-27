package com.bruno.lupito.services;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClient;

import com.bruno.lupito.dto.request.AIEvaluationRequest;

@Service
public class AIService {

    private static final String GROQ_URL = "https://api.groq.com/openai/v1/chat/completions";
    private static final String MODEL    = "llama-3.3-70b-versatile";
    private static final String SYS_PROMPT = """
            Você é um tutor de programação da plataforma Lupito avaliando o código de um iniciante.

            Analise se o código resolve o desafio proposto e responda em português com no máximo 3 frases:
            - Frase 1: comece com ✓, ✗ ou ⚠ e diga se o código resolve o desafio, explicando brevemente o porquê.
            - Frase 2: aponte uma melhoria concreta e específica para o código atual (não genérica).
            - Frase 3 (opcional): só inclua se houver um segundo ponto realmente relevante.

            Sem markdown, sem listas, sem títulos. Seja direto e didático para iniciantes.
            """;

    @Value("${groq.api.key:}")
    private String apiKey;

    private final RestClient restClient = RestClient.create();

    @SuppressWarnings("unchecked")
    public String evaluate(AIEvaluationRequest req) {
        if (apiKey == null || apiKey.isBlank()) {
            return "IA não configurada. Adicione a chave `groq.api.key` no arquivo application-local.properties.";
        }

        String lang         = req.language()              != null ? req.language()              : "javascript";
        String instructions = req.challengeInstructions() != null ? req.challengeInstructions() : "Sem instruções específicas.";
        String code         = req.code()                  != null ? req.code()                  : "";

        String userPrompt = "Linguagem: " + lang
                + "\n\nDesafio:\n" + instructions
                + "\n\nCódigo do estudante:\n```" + lang + "\n" + code + "\n```";

        var body = Map.of(
                "model", MODEL,
                "max_tokens", 250,
                "temperature", 0.3,
                "messages", List.of(
                        Map.of("role", "system", "content", SYS_PROMPT),
                        Map.of("role", "user",   "content", userPrompt)
                )
        );
        // Nota: Map.of() não aceita null — as variáveis acima já garantem que nenhum valor é null

        Map<String, Object> response = restClient.post()
                .uri(GROQ_URL)
                .header("Authorization", "Bearer " + apiKey)
                .contentType(MediaType.APPLICATION_JSON)
                .body(body)
                .retrieve()
                .body(Map.class);

        List<Map<String, Object>> choices = (List<Map<String, Object>>) response.get("choices");
        Map<String, Object> message = (Map<String, Object>) choices.get(0).get("message");
        return (String) message.get("content");
    }
}
