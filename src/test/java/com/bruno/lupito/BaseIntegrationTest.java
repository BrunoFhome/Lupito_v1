package com.bruno.lupito;

import com.bruno.lupito.config.TokenConfig;
import com.bruno.lupito.entity.*;
import com.bruno.lupito.repository.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.AfterEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.webmvc.test.autoconfigure.AutoConfigureMockMvc;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

import java.util.List;

/**
 * Classe base para todos os testes de integração.
 *
 * Sobe o contexto completo do Spring com banco H2 em memória,
 * Flyway desabilitado e serviços de e-mail mockados nas subclasses.
 */
@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
public abstract class BaseIntegrationTest {

    @Autowired
    protected MockMvc mockMvc;

    @Autowired
    protected ObjectMapper objectMapper;

    @Autowired
    protected TokenConfig tokenConfig;

    @Autowired
    protected PasswordEncoder passwordEncoder;

    // Repositórios disponíveis para todas as subclasses
    @Autowired
    protected UserRepository userRepository;

    @Autowired
    protected CourseRepository courseRepository;

    @Autowired
    protected SectionRepository sectionRepository;

    @Autowired
    protected LessonRepository lessonRepository;

    @Autowired
    protected ExerciseRepository exerciseRepository;

    @Autowired
    protected KanbanTaskRepository kanbanTaskRepository;

    @Autowired
    protected KanbanTemplateRepository kanbanTemplateRepository;

    @Autowired
    protected UserProgressRepository userProgressRepository;

    @Autowired
    protected StudyActivityRepository studyActivityRepository;

    // ── Limpeza após cada teste ──────────────────────────────────────────────

    @AfterEach
    void limparBanco() {
        studyActivityRepository.deleteAll();
        kanbanTaskRepository.deleteAll();
        kanbanTemplateRepository.deleteAll();
        userProgressRepository.deleteAll();
        userRepository.deleteAll();
        exerciseRepository.deleteAll();
        lessonRepository.deleteAll();
        sectionRepository.deleteAll();
        courseRepository.deleteAll();
    }

    // ── Helpers de criação de entidades ─────────────────────────────────────

    /** Cria e salva um usuário com e-mail verificado (apto para login). */
    protected User criarUsuarioVerificado(String email, String senha) {
        User user = new User();
        user.setName("Usuario Teste");
        user.setEmail(email);
        user.setPassword(passwordEncoder.encode(senha));
        user.setEmailVerified(true);
        user.setLearningProgress(0);
        user.setCurrentStreak(0);
        return userRepository.save(user);
    }

    /** Cria e salva um usuário com e-mail NÃO verificado. */
    protected User criarUsuarioNaoVerificado(String email, String senha) {
        User user = new User();
        user.setName("Usuario Nao Verificado");
        user.setEmail(email);
        user.setPassword(passwordEncoder.encode(senha));
        user.setEmailVerified(false);
        return userRepository.save(user);
    }

    /** Gera o header Authorization com o JWT do usuário. */
    protected String tokenHeader(User user) {
        return "Bearer " + tokenConfig.generateToken(user);
    }

    /**
     * Cria um curso completo: curso → seções → lições → exercícios.
     * Retorna o curso salvo.
     */
    protected Course criarCursoCompleto(String tituloCurso, int numSecoes, int licoesPorSecao) {
        Course course = new Course();
        course.setTitle(tituloCurso);
        course.setDescription("Descricao de " + tituloCurso);
        course = courseRepository.save(course);

        for (int s = 1; s <= numSecoes; s++) {
            Section section = new Section();
            section.setTitle("Secao " + s);
            section.setListOrder(s);
            section.setCourse(course);
            section = sectionRepository.save(section);

            for (int l = 1; l <= licoesPorSecao; l++) {
                Lesson lesson = new Lesson();
                lesson.setTitle("Licao " + s + "." + l);
                lesson.setTheoryContent("<p>Teoria da licao " + l + "</p>");
                lesson.setCodeExample("console.log('exemplo');");
                lesson.setCodeLanguage("javascript");
                lesson.setListOrder(l);
                lesson.setSection(section);
                lesson = lessonRepository.save(lesson);

                Exercise exercise = new Exercise();
                exercise.setQuestion("Qual é a resposta correta?");
                exercise.setOptions(List.of("Opcao A", "Opcao B", "Opcao C"));
                exercise.setCorrectAnswer(0);
                exercise.setType("multiple-choice");
                exercise.setLesson(lesson);
                exerciseRepository.save(exercise);
            }
        }

        return courseRepository.findById(course.getId()).orElseThrow();
    }

    /** Retorna a primeira lição da primeira seção do curso. */
    protected Lesson primeiraLicao(Course course) {
        Section secao = sectionRepository.findByCourseIdOrderByListOrderAsc(course.getId()).get(0);
        return lessonRepository.findBySectionIdOrderByListOrderAsc(secao.getId()).get(0);
    }

    /** Cria uma KanbanTask para o usuário com o status informado. */
    protected KanbanTask criarTarefa(User user, Lesson lesson, String status) {
        KanbanTask task = new KanbanTask();
        task.setUser(user);
        task.setLesson(lesson);
        task.setTitle("Desafio de Teste");
        task.setDescription("Implemente algo");
        task.setPriority("Média");
        task.setAssignee("Você");
        task.setStatus(status);
        task.setStarterCode("// início");
        task.setLanguage("javascript");
        task.setExpectedOutput("Olá Mundo");
        return kanbanTaskRepository.save(task);
    }
}
