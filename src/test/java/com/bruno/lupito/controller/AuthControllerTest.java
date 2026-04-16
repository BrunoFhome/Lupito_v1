package com.bruno.lupito.controller;

import com.bruno.lupito.BaseIntegrationTest;
import com.bruno.lupito.dto.request.LoginRequest;
import com.bruno.lupito.dto.request.RegisterUserRequest;
import com.bruno.lupito.services.EmailVerificationService;
import com.bruno.lupito.services.PasswordResetService;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.http.MediaType;
import org.springframework.test.context.bean.override.mockito.MockitoBean;

import static org.hamcrest.Matchers.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.doNothing;
import static org.mockito.Mockito.verify;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

/**
 * Testes de integração para AuthController (/auth).
 *
 * Os serviços de e-mail são mockados para evitar
 * tentativas de conexão SMTP durante os testes.
 */
@DisplayName("Auth Controller — Testes de Integração")
class AuthControllerTest extends BaseIntegrationTest {

    @MockitoBean
    private EmailVerificationService emailVerificationService;

    @MockitoBean
    private PasswordResetService passwordResetService;

    // ── POST /auth/register ──────────────────────────────────────────────────

    @Test
    @DisplayName("Registro: dados válidos → 201 Created com nome e e-mail")
    void register_dadosValidos_retorna201() throws Exception {
        doNothing().when(emailVerificationService).sendVerificationEmail(any());

        var request = new RegisterUserRequest("Novo Usuario", "novo@email.com", "Senha@123", "Campinas", "SP");

        mockMvc.perform(post("/auth/register")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(request)))
                .andExpect(status().isCreated())
                .andExpect(jsonPath("$.name").value("Novo Usuario"))
                .andExpect(jsonPath("$.email").value("novo@email.com"));

        verify(emailVerificationService).sendVerificationEmail(any());
    }

    @Test
    @DisplayName("Registro: e-mail duplicado → 409 Conflict")
    void register_emailDuplicado_retorna409() throws Exception {
        doNothing().when(emailVerificationService).sendVerificationEmail(any());

        criarUsuarioVerificado("duplicado@email.com", "Senha@123");

        var request = new RegisterUserRequest("Outro Usuario", "duplicado@email.com", "Senha@123", null, null);

        mockMvc.perform(post("/auth/register")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(request)))
                .andExpect(status().isConflict());
    }

    @Test
    @DisplayName("Registro: campos obrigatórios ausentes → 400 Bad Request")
    void register_camposAusentes_retorna400() throws Exception {
        // Sem e-mail e sem senha
        String body = """
                { "name": "Sem Email" }
                """;

        mockMvc.perform(post("/auth/register")
                .contentType(MediaType.APPLICATION_JSON)
                .content(body))
                .andExpect(status().isBadRequest());
    }

    // ── POST /auth/login ─────────────────────────────────────────────────────

    @Test
    @DisplayName("Login: credenciais válidas → 200 OK com token JWT")
    void login_credenciaisValidas_retornaToken() throws Exception {
        criarUsuarioVerificado("user@email.com", "Senha@123");

        var request = new LoginRequest("user@email.com", "Senha@123");

        mockMvc.perform(post("/auth/login")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(request)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.token").isNotEmpty())
                .andExpect(jsonPath("$.token", startsWith("ey")));  // JWT começa com "ey"
    }

    @Test
    @DisplayName("Login: senha incorreta → 401 Unauthorized")
    void login_senhaErrada_retorna401() throws Exception {
        criarUsuarioVerificado("user@email.com", "SenhaCorreta@123");

        var request = new LoginRequest("user@email.com", "SenhaErrada@999");

        mockMvc.perform(post("/auth/login")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(request)))
                .andExpect(status().isUnauthorized());
    }

    @Test
    @DisplayName("Login: e-mail inexistente → 401 Unauthorized")
    void login_emailInexistente_retorna401() throws Exception {
        var request = new LoginRequest("inexistente@email.com", "qualquersenha");

        mockMvc.perform(post("/auth/login")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(request)))
                .andExpect(status().isUnauthorized());
    }

    @Test
    @DisplayName("Login: e-mail não verificado → 403 Forbidden")
    void login_emailNaoVerificado_retorna403() throws Exception {
        criarUsuarioNaoVerificado("noverificado@email.com", "Senha@123");

        var request = new LoginRequest("noverificado@email.com", "Senha@123");

        mockMvc.perform(post("/auth/login")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(request)))
                .andExpect(status().isForbidden());
    }

    // ── POST /auth/forgot-password ───────────────────────────────────────────

    @Test
    @DisplayName("Forgot-password: sempre retorna 200 (não revela se e-mail existe)")
    void forgotPassword_sempreRetorna200() throws Exception {
        doNothing().when(passwordResetService).sendResetEmail(any());

        String body = """
                { "email": "qualquer@email.com" }
                """;

        mockMvc.perform(post("/auth/forgot-password")
                .contentType(MediaType.APPLICATION_JSON)
                .content(body))
                .andExpect(status().isOk());
    }

    // ── Endpoint sem autenticação ────────────────────────────────────────────

    @Test
    @DisplayName("Rota protegida sem token → 401 com mensagem em JSON")
    void rotaProtegida_semToken_retorna401() throws Exception {
        mockMvc.perform(post("/api/kanban/tasks/unlock/1"))
                .andExpect(status().isUnauthorized())
                .andExpect(jsonPath("$.status").value(401))
                .andExpect(jsonPath("$.mensagem").isNotEmpty());
    }
}
