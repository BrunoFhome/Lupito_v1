package com.bruno.lupito.dto.request;

import jakarta.validation.constraints.NotEmpty;

public record RegisterUserRequest(@NotEmpty(message = "nome obrigatorio") String name,
								@NotEmpty(message = "email obrigatorio") String email,
								@NotEmpty(message = "senha obrigatorio") String password) {
	
}
