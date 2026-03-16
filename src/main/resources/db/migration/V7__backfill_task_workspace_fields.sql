-- Copia challenge_instructions e starter_code dos templates para as tasks já criadas
-- que ainda não possuem esses dados (criadas antes da V6)
UPDATE tb_kanban_tasks t
SET
    challenge_instructions = tmpl.challenge_instructions,
    starter_code            = tmpl.starter_code
FROM tb_kanban_templates tmpl
WHERE t.lesson_id = tmpl.lesson_id
  AND (t.challenge_instructions IS NULL OR t.starter_code IS NULL);
