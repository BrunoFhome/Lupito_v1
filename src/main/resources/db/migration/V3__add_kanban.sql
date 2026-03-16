CREATE TABLE tb_kanban_templates (
    id BIGSERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    priority VARCHAR(50),
    lesson_id BIGINT NOT NULL,
    CONSTRAINT fk_template_lesson FOREIGN KEY (lesson_id) REFERENCES tb_lessons(id) ON DELETE CASCADE
);

CREATE TABLE tb_kanban_tasks (
    id BIGSERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    priority VARCHAR(50),
    assignee VARCHAR(255),
    status VARCHAR(50) DEFAULT 'todo',
    user_id INTEGER NOT NULL,
    lesson_id BIGINT,
    CONSTRAINT fk_kanban_user FOREIGN KEY (user_id) REFERENCES tb_users(id) ON DELETE CASCADE,
    CONSTRAINT fk_kanban_lesson FOREIGN KEY (lesson_id) REFERENCES tb_lessons(id) ON DELETE CASCADE
);
