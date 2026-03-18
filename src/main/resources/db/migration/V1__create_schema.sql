-- ── Usuários ──────────────────────────────────────────────────────────────────
CREATE TABLE tb_users (
    id               SERIAL PRIMARY KEY,
    name             VARCHAR(255) NOT NULL,
    email            VARCHAR(255) NOT NULL UNIQUE,
    password         VARCHAR(255) NOT NULL,
    bio              TEXT,
    created_at       TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    learning_progress INTEGER     DEFAULT 0,
    current_streak   INTEGER      NOT NULL DEFAULT 0,
    last_study_date  DATE,
    city             VARCHAR(100),
    state            VARCHAR(2)
);

-- ── Tokens de redefinição de senha ────────────────────────────────────────────
CREATE TABLE password_reset_tokens (
    id         BIGSERIAL    PRIMARY KEY,
    token      VARCHAR(255) NOT NULL UNIQUE,
    user_id    BIGINT       NOT NULL REFERENCES tb_users(id) ON DELETE CASCADE,
    expires_at TIMESTAMP    NOT NULL,
    used       BOOLEAN      NOT NULL DEFAULT FALSE
);

-- ── Cursos ────────────────────────────────────────────────────────────────────
CREATE TABLE tb_courses (
    id          BIGSERIAL    PRIMARY KEY,
    title       VARCHAR(255) NOT NULL,
    description TEXT
);

-- ── Seções ────────────────────────────────────────────────────────────────────
CREATE TABLE tb_sections (
    id         BIGSERIAL    PRIMARY KEY,
    title      VARCHAR(255) NOT NULL,
    list_order INTEGER      NOT NULL,
    course_id  BIGINT       NOT NULL,
    CONSTRAINT fk_section_course FOREIGN KEY (course_id) REFERENCES tb_courses(id) ON DELETE CASCADE
);

-- ── Lições ────────────────────────────────────────────────────────────────────
CREATE TABLE tb_lessons (
    id             BIGSERIAL    PRIMARY KEY,
    title          VARCHAR(255) NOT NULL,
    theory_content TEXT,
    list_order     INTEGER      NOT NULL,
    section_id     BIGINT       NOT NULL,
    CONSTRAINT fk_lesson_section FOREIGN KEY (section_id) REFERENCES tb_sections(id) ON DELETE CASCADE
);

-- ── Exercícios ────────────────────────────────────────────────────────────────
CREATE TABLE tb_exercises (
    id             BIGSERIAL PRIMARY KEY,
    question       TEXT      NOT NULL,
    correct_answer INTEGER   NOT NULL,
    lesson_id      BIGINT    NOT NULL,
    CONSTRAINT fk_exercise_lesson FOREIGN KEY (lesson_id) REFERENCES tb_lessons(id) ON DELETE CASCADE
);

-- ── Opções dos exercícios ─────────────────────────────────────────────────────
CREATE TABLE tb_exercises_options (
    exercise_id BIGINT       NOT NULL,
    options     VARCHAR(255),
    CONSTRAINT fk_exercise_options FOREIGN KEY (exercise_id) REFERENCES tb_exercises(id) ON DELETE CASCADE
);

-- ── Progresso do usuário ──────────────────────────────────────────────────────
CREATE TABLE tb_user_progress (
    id                    BIGSERIAL PRIMARY KEY,
    user_id               INTEGER   NOT NULL,
    course_id             BIGINT    NOT NULL,
    current_section_order INTEGER   NOT NULL DEFAULT 1,
    current_lesson_order  INTEGER   NOT NULL DEFAULT 1,
    CONSTRAINT fk_progress_user   FOREIGN KEY (user_id)   REFERENCES tb_users(id)   ON DELETE CASCADE,
    CONSTRAINT fk_progress_course FOREIGN KEY (course_id) REFERENCES tb_courses(id) ON DELETE CASCADE,
    CONSTRAINT uq_user_course     UNIQUE (user_id, course_id)
);

-- ── Templates de Kanban ───────────────────────────────────────────────────────
CREATE TABLE tb_kanban_templates (
    id                     BIGSERIAL    PRIMARY KEY,
    title                  VARCHAR(255) NOT NULL,
    description            TEXT,
    priority               VARCHAR(50),
    lesson_id              BIGINT       NOT NULL,
    challenge_instructions TEXT,
    starter_code           TEXT,
    CONSTRAINT fk_template_lesson FOREIGN KEY (lesson_id) REFERENCES tb_lessons(id) ON DELETE CASCADE
);

-- ── Tarefas de Kanban ─────────────────────────────────────────────────────────
CREATE TABLE tb_kanban_tasks (
    id                     BIGSERIAL    PRIMARY KEY,
    title                  VARCHAR(255) NOT NULL,
    description            TEXT,
    priority               VARCHAR(50),
    assignee               VARCHAR(255),
    status                 VARCHAR(50)  DEFAULT 'todo',
    user_id                INTEGER      NOT NULL,
    lesson_id              BIGINT,
    challenge_instructions TEXT,
    starter_code           TEXT,
    user_code              TEXT,
    CONSTRAINT fk_kanban_user   FOREIGN KEY (user_id)   REFERENCES tb_users(id)   ON DELETE CASCADE,
    CONSTRAINT fk_kanban_lesson FOREIGN KEY (lesson_id) REFERENCES tb_lessons(id) ON DELETE CASCADE
);
