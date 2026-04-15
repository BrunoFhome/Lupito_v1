UPDATE tb_exercises
SET question = 'console.___("Olá, Mundo!");', correct_answer = 0, type = 'drag-fill'
WHERE id = 3;

DELETE FROM tb_exercises_options WHERE exercise_id = 3;

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(3, 'log'),
(3, 'print'),
(3, 'write'),
(3, 'show');


UPDATE tb_exercises
SET question = '___ PI = 3.14;', correct_answer = 2, type = 'drag-fill'
WHERE id = 13;

DELETE FROM tb_exercises_options WHERE exercise_id = 13;

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(13, 'let'),
(13, 'var'),
(13, 'const'),
(13, 'function');


UPDATE tb_exercises
SET question = 'if (idade ___ 18) {', correct_answer = 0, type = 'drag-fill'
WHERE id = 22;

DELETE FROM tb_exercises_options WHERE exercise_id = 22;

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(22, '>='),
(22, '<='),
(22, '=='),
(22, '!=');


UPDATE tb_exercises
SET question = 'document.___("titulo");', correct_answer = 0, type = 'drag-fill'
WHERE id = 32;

DELETE FROM tb_exercises_options WHERE exercise_id = 32;

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(32, 'getElementById'),
(32, 'querySelector'),
(32, 'getElement'),
(32, 'findById');


UPDATE tb_exercises
SET question = 'background-___: #00b4cc;', correct_answer = 0, type = 'drag-fill'
WHERE id = 65;

DELETE FROM tb_exercises_options WHERE exercise_id = 65;

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(65, 'color'),
(65, 'image'),
(65, 'size'),
(65, 'repeat');
