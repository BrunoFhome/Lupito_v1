package com.bruno.lupito.controller;

import com.bruno.lupito.BaseIntegrationTest;
import com.bruno.lupito.entity.Course;
import com.bruno.lupito.entity.User;
import com.bruno.lupito.services.EmailVerificationService;
import com.bruno.lupito.services.PasswordResetService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.test.context.bean.override.mockito.MockitoBean;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

/**
 * Testes de integração para UserProgressController (/api/progress).
 *
 * Valida o fluxo de progresso do usuário na trilha:
 * leitura da posição atual, avanço de lição e atualização de streak.
 */
@DisplayName("UserProgress Controller — Testes de Integração")
class UserProgressControllerTest extends BaseIntegrationTest {

    @MockitoBean
    private EmailVerificationService emailVerificationService;

    @MockitoBean
    private PasswordResetService passwordResetService;

    private User usuario;
    private Course curso;

    @BeforeEach
    void setup() {
        usuario = criarUsuarioVerificado("aluno@email.com", "Senha@123");
        // Curso com 2 seções, cada seção com 2 lições
        curso = criarCursoCompleto("JavaScript", 2, 2);
    }

    // ── GET /api/progress/{courseId} ────────────────────────────────────────

    @Test
    @DisplayName("Buscar progresso: sem token → 401 Unauthorized")
    void buscarProgresso_semToken_retorna401() throws Exception {
        mockMvc.perform(get("/api/progress/{courseId}", curso.getId()))
                .andExpect(status().isUnauthorized());
    }

    @Test
    @DisplayName("Buscar progresso: usuário sem registro → retorna posição padrão (seção 1, lição 1)")
    void buscarProgresso_semRegistro_retornaPadrao() throws Exception {
        mockMvc.perform(get("/api/progress/{courseId}", curso.getId())
                .header("Authorization", tokenHeader(usuario)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.currentSectionOrder").value(1))
                .andExpect(jsonPath("$.currentLessonOrder").value(1))
                .andExpect(jsonPath("$.courseId").value(curso.getId()))
                .andExpect(jsonPath("$.userId").value(usuario.getId()));
    }

    // ── POST /api/progress/complete-lesson ──────────────────────────────────

    @Test
    @DisplayName("Completar lição: sem token → 401 Unauthorized")
    void completarLicao_semToken_retorna401() throws Exception {
        mockMvc.perform(post("/api/progress/complete-lesson")
                .param("courseId", String.valueOf(curso.getId()))
                .param("currentSectionOrder", "1")
                .param("currentLessonOrder", "1"))
                .andExpect(status().isUnauthorized());
    }

    @Test
    @DisplayName("Completar lição: primeira lição → avança para lição 2 na mesma seção")
    void completarLicao_primeiraLicao_avancaParaLicao2() throws Exception {
        mockMvc.perform(post("/api/progress/complete-lesson")
                .header("Authorization", tokenHeader(usuario))
                .param("courseId", String.valueOf(curso.getId()))
                .param("currentSectionOrder", "1")
                .param("currentLessonOrder", "1"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.currentSectionOrder").value(1))
                .andExpect(jsonPath("$.currentLessonOrder").value(2));
    }

    @Test
    @DisplayName("Completar lição: última lição da seção 1 → avança para seção 2, lição 1")
    void completarLicao_ultimaLicaoDaSecao_avancaParaProximaSecao() throws Exception {
        // Primeiro avança da lição 1 para 2 (última da seção 1)
        mockMvc.perform(post("/api/progress/complete-lesson")
                .header("Authorization", tokenHeader(usuario))
                .param("courseId", String.valueOf(curso.getId()))
                .param("currentSectionOrder", "1")
                .param("currentLessonOrder", "1"))
                .andExpect(status().isOk());

        // Agora completa a lição 2 (última da seção 1) → deve ir para seção 2, lição 1
        mockMvc.perform(post("/api/progress/complete-lesson")
                .header("Authorization", tokenHeader(usuario))
                .param("courseId", String.valueOf(curso.getId()))
                .param("currentSectionOrder", "1")
                .param("currentLessonOrder", "2"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.currentSectionOrder").value(2))
                .andExpect(jsonPath("$.currentLessonOrder").value(1));
    }

    @Test
    @DisplayName("Completar lição: atualiza streak do usuário para 1 no primeiro estudo")
    void completarLicao_primeiroEstudo_atualizaStreak() throws Exception {
        mockMvc.perform(post("/api/progress/complete-lesson")
                .header("Authorization", tokenHeader(usuario))
                .param("courseId", String.valueOf(curso.getId()))
                .param("currentSectionOrder", "1")
                .param("currentLessonOrder", "1"))
                .andExpect(status().isOk());

        // Verifica que o streak foi atualizado no banco
        User atualizado = userRepository.findById(usuario.getId()).orElseThrow();
        assert atualizado.getCurrentStreak() == 1;
        assert atualizado.getLastStudyDate() != null;
    }

    @Test
    @DisplayName("Completar lição: seção inexistente no curso → 404 Not Found")
    void completarLicao_secaoInexistente_retorna404() throws Exception {
        mockMvc.perform(post("/api/progress/complete-lesson")
                .header("Authorization", tokenHeader(usuario))
                .param("courseId", String.valueOf(curso.getId()))
                .param("currentSectionOrder", "99")
                .param("currentLessonOrder", "1"))
                .andExpect(status().isNotFound());
    }

    @Test
    @DisplayName("Completar lição: parâmetros inválidos (0 ou negativos) → 400 Bad Request")
    void completarLicao_parametrosInvalidos_retorna400() throws Exception {
        mockMvc.perform(post("/api/progress/complete-lesson")
                .header("Authorization", tokenHeader(usuario))
                .param("courseId", String.valueOf(curso.getId()))
                .param("currentSectionOrder", "0")   // inválido: mínimo é 1
                .param("currentLessonOrder", "1"))
                .andExpect(status().isBadRequest());
    }
}
