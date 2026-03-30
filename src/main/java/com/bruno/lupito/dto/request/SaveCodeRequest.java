package com.bruno.lupito.dto.request;

import jakarta.validation.constraints.NotNull;

public record SaveCodeRequest(
        @NotNull(message = "O campo 'code' é obrigatório") String code) {}
