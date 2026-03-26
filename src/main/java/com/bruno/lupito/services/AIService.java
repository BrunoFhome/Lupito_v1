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
    private static final String MODEL    = "llama-3.1-8b-instant";
    private static final String SYS_PROMPT = """
            Você é um mentor de programação da plataforma Lupito, especializado em ensinar estudantes iniciantes.
            Avalie o código do estudante com base no desafio proposto e responda em português.
            Estruture sua resposta com estas três seções:

            ## Resultado
            O código resolve o desafio? Responda "Sim", "Não" ou "Parcialmente" e explique brevemente.

            ## Boas Práticas
            Liste até 3 pontos de melhoria (nomenclatura, legibilidade, eficiência).
            Se o código já estiver ótimo, diga isso com entusiasmo.

            ## Sugestão
            Dê uma dica concreta ou alternativa de implementação com um pequeno exemplo de código.

            Seja encorajador, didático e conciso. Limite a resposta a 300 palavras.
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
                "max_tokens", 800,
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
