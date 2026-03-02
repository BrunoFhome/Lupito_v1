
-- Delete duplicates, keeping the one with the highest ID
DELETE FROM tb_users a USING tb_users b
WHERE a.id < b.id AND a.email = b.email;

ALTER TABLE tb_users ADD COLUMN IF NOT EXISTS bio TEXT;
ALTER TABLE tb_users ADD COLUMN IF NOT EXISTS created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'unique_email') THEN
        ALTER TABLE tb_users ADD CONSTRAINT unique_email UNIQUE (email);
    END IF;
END $$;
