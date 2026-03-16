ALTER TABLE tb_kanban_templates
    ADD COLUMN challenge_instructions TEXT,
    ADD COLUMN starter_code TEXT;

ALTER TABLE tb_kanban_tasks
    ADD COLUMN challenge_instructions TEXT,
    ADD COLUMN starter_code TEXT;
