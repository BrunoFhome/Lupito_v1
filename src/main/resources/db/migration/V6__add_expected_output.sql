-- Adiciona suporte a saída esperada para verificação automática no workspace
ALTER TABLE tb_kanban_templates ADD COLUMN IF NOT EXISTS expected_output TEXT;
ALTER TABLE tb_kanban_tasks     ADD COLUMN IF NOT EXISTS expected_output TEXT;
