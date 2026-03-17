ALTER TABLE tb_users ADD COLUMN current_streak INTEGER DEFAULT 0 NOT NULL;
ALTER TABLE tb_users ADD COLUMN last_study_date DATE;
