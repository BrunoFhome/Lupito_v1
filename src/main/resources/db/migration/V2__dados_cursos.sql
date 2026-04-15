INSERT INTO tb_courses (id, title, description) VALUES
(1, 'JavaScript', 'Aprenda JavaScript do zero: variáveis, funções, DOM e eventos. 12 módulos para quem nunca programou.'),
(2, 'HTML e CSS',  'Crie páginas web do zero com HTML e CSS. 15 módulos do básico ao layout completo.');

SELECT setval('tb_courses_id_seq', 2, true);
