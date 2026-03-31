-- ════════════════════════════════════════════════════════════════════════════
-- Exercícios drag-fill de teste
-- Converte 5 exercícios existentes para o tipo 'drag-fill'
-- ════════════════════════════════════════════════════════════════════════════

-- ── Exercício 3 — Lição: "Seu primeiro programa" (JS, Seção 1) ────────────
-- console.___("Olá, Mundo!");   → resposta: log (índice 0)
UPDATE tb_exercises
SET question = 'console.___("Olá, Mundo!");', correct_answer = 0, type = 'drag-fill'
WHERE id = 3;

DELETE FROM tb_exercises_options WHERE exercise_id = 3;

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(3, 'log'),
(3, 'print'),
(3, 'write'),
(3, 'show');

-- ── Exercício 13 — Lição: "var, let e const" (JS, Seção 5) ───────────────
-- ___ PI = 3.14;   → resposta: const (índice 2)
UPDATE tb_exercises
SET question = '___ PI = 3.14;', correct_answer = 2, type = 'drag-fill'
WHERE id = 13;

DELETE FROM tb_exercises_options WHERE exercise_id = 13;

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(13, 'let'),
(13, 'var'),
(13, 'const'),
(13, 'function');

-- ── Exercício 22 — Lição: "if e else" (JS, Seção 8) ──────────────────────
-- if (idade ___ 18) {   → resposta: >= (índice 0)
UPDATE tb_exercises
SET question = 'if (idade ___ 18) {', correct_answer = 0, type = 'drag-fill'
WHERE id = 22;

DELETE FROM tb_exercises_options WHERE exercise_id = 22;

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(22, '>='),
(22, '<='),
(22, '=='),
(22, '!=');

-- ── Exercício 32 — Lição: "Qual método seleciona pelo ID" (JS, Seção 11) ──
-- document.___("titulo");   → resposta: getElementById (índice 0)
UPDATE tb_exercises
SET question = 'document.___("titulo");', correct_answer = 0, type = 'drag-fill'
WHERE id = 32;

DELETE FROM tb_exercises_options WHERE exercise_id = 32;

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(32, 'getElementById'),
(32, 'querySelector'),
(32, 'getElement'),
(32, 'findById');

-- ── Exercício 65 — Lição: "Background, Bordas e Cores" (CSS, Seção 22) ───
-- background-___: #00b4cc;   → resposta: color (índice 0)
UPDATE tb_exercises
SET question = 'background-___: #00b4cc;', correct_answer = 0, type = 'drag-fill'
WHERE id = 65;

DELETE FROM tb_exercises_options WHERE exercise_id = 65;

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(65, 'color'),
(65, 'image'),
(65, 'size'),
(65, 'repeat');
