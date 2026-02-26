package com.bruno.lupito.dto.request;

import jakarta.validation.constraints.NotEmpty;

public record LoginRequest(@NotEmpty(message = "Email obrigatorio") String email,
							@NotEmpty(message = "Senha obrigatoria") String password) {

}
