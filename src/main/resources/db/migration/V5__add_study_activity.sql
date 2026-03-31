-- Tabela de atividade diária de estudo por usuário
CREATE TABLE tb_study_activity (
    id           BIGSERIAL PRIMARY KEY,
    user_id      BIGINT  NOT NULL REFERENCES tb_users(id) ON DELETE CASCADE,
    study_date   DATE    NOT NULL,
    lessons_done INTEGER NOT NULL DEFAULT 1,
    CONSTRAINT uq_user_study_date UNIQUE (user_id, study_date)
);

CREATE INDEX idx_study_activity_user_date ON tb_study_activity (user_id, study_date);
