package com.bruno.lupito.controller;

import com.bruno.lupito.BaseIntegrationTest;
import com.bruno.lupito.entity.Course;
import com.bruno.lupito.entity.Section;
import com.bruno.lupito.entity.User;
import com.bruno.lupito.services.EmailVerificationService;
import com.bruno.lupito.services.PasswordResetService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.test.context.bean.override.mockito.MockitoBean;

import static org.hamcrest.Matchers.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

/**
 * Testes de integração para LearningPathController (/api/learning-path).
 *
 * Valida que a API de trilha de aprendizado retorna os dados
 * corretos e exige autenticação em todos os endpoints.
 */
@DisplayName("LearningPath Controller — Testes de Integração")
class LearningPathControllerTest extends BaseIntegrationTest {

    @MockitoBean
    private EmailVerificationService emailVerificationService;

    @MockitoBean
    private PasswordResetService passwordResetService;

    private User usuario;
    private Course curso;

    @BeforeEach
    void setup() {
        usuario = criarUsuarioVerificado("aluno@email.com", "Senha@123");
        curso = criarCursoCompleto("JavaScript", 2, 3); // 2 seções, 3 lições cada
    }

    // ── GET /api/learning-path/courses ──────────────────────────────────────

    @Test
    @DisplayName("Listar cursos: sem token → 401 Unauthorized")
    void listarCursos_semToken_retorna401() throws Exception {
        mockMvc.perform(get("/api/learning-path/courses"))
                .andExpect(status().isUnauthorized());
    }

    @Test
    @DisplayName("Listar cursos: com token → 200 OK com lista de cursos")
    void listarCursos_comToken_retornaLista() throws Exception {
        mockMvc.perform(get("/api/learning-path/courses")
                .header("Authorization", tokenHeader(usuario)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$").isArray())
                .andExpect(jsonPath("$", hasSize(greaterThanOrEqualTo(1))))
                .andExpect(jsonPath("$[0].title").value("JavaScript"));
    }

    // ── GET /api/learning-path/courses/{id} ─────────────────────────────────

    @Test
    @DisplayName("Buscar curso por ID: existente → 200 OK com dados do curso")
    void buscarCursoPorId_existente_retornaCurso() throws Exception {
        mockMvc.perform(get("/api/learning-path/courses/{id}", curso.getId())
                .header("Authorization", tokenHeader(usuario)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.id").value(curso.getId()))
                .andExpect(jsonPath("$.title").value("JavaScript"))
                .andExpect(jsonPath("$.description").isNotEmpty());
    }

    @Test
    @DisplayName("Buscar curso por ID: inexistente → 404 Not Found")
    void buscarCursoPorId_inexistente_retorna404() throws Exception {
        mockMvc.perform(get("/api/learning-path/courses/{id}", 99999L)
                .header("Authorization", tokenHeader(usuario)))
                .andExpect(status().isNotFound());
    }

    // ── GET /api/learning-path/courses/{courseId}/sections ──────────────────

    @Test
    @DisplayName("Listar seções do curso → 200 OK com seções em ordem")
    void listarSecoes_cursoExistente_retornaSecoes() throws Exception {
        mockMvc.perform(get("/api/learning-path/courses/{courseId}/sections", curso.getId())
                .header("Authorization", tokenHeader(usuario)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$").isArray())
                .andExpect(jsonPath("$", hasSize(2)))
                .andExpect(jsonPath("$[0].listOrder").value(1))
                .andExpect(jsonPath("$[1].listOrder").value(2));
    }

    @Test
    @DisplayName("Listar seções: curso inexistente → 200 OK com lista vazia")
    void listarSecoes_cursoInexistente_retornaListaVazia() throws Exception {
        mockMvc.perform(get("/api/learning-path/courses/{courseId}/sections", 99999L)
                .header("Authorization", tokenHeader(usuario)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$").isArray())
                .andExpect(jsonPath("$").isEmpty());
    }

    // ── GET /api/learning-path/sections/{sectionId}/lessons ─────────────────

    @Test
    @DisplayName("Listar lições da seção → 200 OK com lições em ordem")
    void listarLicoes_secaoExistente_retornaLicoes() throws Exception {
        Section secao = sectionRepository.findByCourseIdOrderByListOrderAsc(curso.getId()).get(0);

        mockMvc.perform(get("/api/learning-path/sections/{sectionId}/lessons", secao.getId())
                .header("Authorization", tokenHeader(usuario)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$").isArray())
                .andExpect(jsonPath("$", hasSize(3)))
                .andExpect(jsonPath("$[0].listOrder").value(1))
                .andExpect(jsonPath("$[1].listOrder").value(2))
                .andExpect(jsonPath("$[2].listOrder").value(3));
    }

    // ── GET /api/learning-path/lessons/{lessonId} ───────────────────────────

    @Test
    @DisplayName("Buscar lição por ID → 200 OK com teoria e exemplo de código")
    void buscarLicaoPorId_existente_retornaLicao() throws Exception {
        Section secao = sectionRepository.findByCourseIdOrderByListOrderAsc(curso.getId()).get(0);
        Long licaoId = lessonRepository.findBySectionIdOrderByListOrderAsc(secao.getId()).get(0).getId();

        mockMvc.perform(get("/api/learning-path/lessons/{lessonId}", licaoId)
                .header("Authorization", tokenHeader(usuario)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.id").value(licaoId))
                .andExpect(jsonPath("$.title").isNotEmpty())
                .andExpect(jsonPath("$.theoryContent").isNotEmpty())
                .andExpect(jsonPath("$.codeExample").isNotEmpty());
    }

    @Test
    @DisplayName("Buscar lição por ID: inexistente → 404 Not Found")
    void buscarLicaoPorId_inexistente_retorna404() throws Exception {
        mockMvc.perform(get("/api/learning-path/lessons/{lessonId}", 99999L)
                .header("Authorization", tokenHeader(usuario)))
                .andExpect(status().isNotFound());
    }

    // ── GET /api/learning-path/lessons/{lessonId}/exercises ─────────────────

    @Test
    @DisplayName("Listar exercícios da lição → 200 OK com lista de exercícios")
    void listarExercicios_licaoExistente_retornaExercicios() throws Exception {
        Section secao = sectionRepository.findByCourseIdOrderByListOrderAsc(curso.getId()).get(0);
        Long licaoId = lessonRepository.findBySectionIdOrderByListOrderAsc(secao.getId()).get(0).getId();

        mockMvc.perform(get("/api/learning-path/lessons/{lessonId}/exercises", licaoId)
                .header("Authorization", tokenHeader(usuario)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$").isArray())
                .andExpect(jsonPath("$", hasSize(1)))
                .andExpect(jsonPath("$[0].question").isNotEmpty())
                .andExpect(jsonPath("$[0].options").isArray());
    }
}
