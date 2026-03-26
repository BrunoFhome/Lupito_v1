-- ════════════════════════════════════════════════════════════════════════════
-- Saídas esperadas para os templates de Kanban JavaScript (ids 2–10)
-- Templates web (11–14) e template aberto (1) ficam sem expected_output
-- ════════════════════════════════════════════════════════════════════════════

-- Template 2 — Calculadora Básica
UPDATE tb_kanban_templates SET expected_output =
'Soma: 13
Subtração: 7
Multiplicação: 30
Divisão: 3.3333333333333335
Resto: 1
Após ++: 1
Após --: 0
a após += 5: 15'
WHERE id = 2;

-- Template 3 — Verificador de Acesso
UPDATE tb_kanban_templates SET expected_output =
'Maior de idade: true
Pontuação válida: true
Acesso permitido: true
Bloqueado: false'
WHERE id = 3;

-- Template 4 — Classificador de Notas
UPDATE tb_kanban_templates SET expected_output =
'Conceito: B
Fim de semana
Aprovado'
WHERE id = 4;

-- Template 5 — Tabuada e FizzBuzz
UPDATE tb_kanban_templates SET expected_output =
'7 x 1 = 7
7 x 2 = 14
7 x 3 = 21
7 x 4 = 28
7 x 5 = 35
7 x 6 = 42
7 x 7 = 49
7 x 8 = 56
7 x 9 = 63
7 x 10 = 70
1
2
Fizz
4
Buzz
Fizz
7
8
Fizz
Buzz
11
Fizz
13
14
FizzBuzz
16
17
Fizz
19
Buzz
Fizz
22
23
Fizz
Buzz
26
Fizz
28
29
FizzBuzz
Soma 1–100: 5050'
WHERE id = 5;

-- Template 6 — Biblioteca de Funções
UPDATE tb_kanban_templates SET expected_output =
'Média: 8
4 é par? true
7 é par? false
Bom dia, Ana!
Bom tarde, Carlos!'
WHERE id = 6;

-- Template 7 — Processador de Textos
UPDATE tb_kanban_templates SET expected_output =
'APRENDER JAVASCRIPT É MUITO DIVERTIDO
aprender javascript é muito divertido
Palavras: 5
Aprender-JavaScript-é-muito-divertido
Contém JavaScript: true
Aprender J'
WHERE id = 7;

-- Template 8 — Gerenciador de Lista
-- Arrays são serializados via JSON.stringify(a, null, 2) pelo console.log customizado
UPDATE tb_kanban_templates SET expected_output =
'Pares: [
  4,
  6,
  2,
  8
]
Dobrados: [
  6,
  14,
  2,
  18,
  8,
  12,
  4,
  16,
  10
]
Soma: 45
Ordenados: [
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9
]
Algum > 8: true'
WHERE id = 8;

-- Template 9 — Sistema de Cadastro
UPDATE tb_kanban_templates SET expected_output =
'Olá, sou Maria, tenho 28 anos.
Maria
maria@email.com
Nome: Maria, E-mail: maria@email.com
Cidade: São Paulo
nome: Maria
idade: 28
email: maria@email.com
cidade: São Paulo'
WHERE id = 9;

-- Template 10 — Mini Sistema de Alunos
-- Arrays de strings são serializados via JSON.stringify
UPDATE tb_kanban_templates SET expected_output =
'Aprovados: [
  "Ana",
  "Clara"
]
Melhor aluno: Clara → 9.0
Ana: média 8.0 — ✓ Aprovado
Bruno: média 5.0 — ✗ Reprovado
Clara: média 9.0 — ✓ Aprovado
Diego: média 4.0 — ✗ Reprovado'
WHERE id = 10;

-- ── Propaga expected_output para as tarefas já existentes ─────────────────
-- Tarefas existentes não passaram pelo syncTasksForUser() com o novo campo,
-- por isso precisamos atualizar diretamente via join de lesson_id.
UPDATE tb_kanban_tasks t
SET    expected_output = tmpl.expected_output
FROM   tb_kanban_templates tmpl
WHERE  t.lesson_id = tmpl.lesson_id
AND    tmpl.expected_output IS NOT NULL;
