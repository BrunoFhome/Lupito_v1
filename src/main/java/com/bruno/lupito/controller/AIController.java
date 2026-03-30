package com.bruno.lupito.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;

import com.bruno.lupito.dto.request.AIEvaluationRequest;
import com.bruno.lupito.dto.response.AIEvaluationResponse;
import com.bruno.lupito.services.AIService;

@RestController
@RequestMapping("/api/ai")
public class AIController {

    private final AIService aiService;

    public AIController(AIService aiService) {
        this.aiService = aiService;
    }

    @PostMapping("/evaluate")
    public ResponseEntity<AIEvaluationResponse> evaluate(@Valid @RequestBody AIEvaluationRequest request) {
        String feedback = aiService.evaluate(request);
        return ResponseEntity.ok(new AIEvaluationResponse(feedback));
    }
}
