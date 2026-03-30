package com.bruno.lupito.dto.request;

import jakarta.validation.constraints.NotBlank;

public record AIEvaluationRequest(
        @NotBlank(message = "O código não pode estar vazio") String code,
        String language,
        String challengeInstructions) {}
