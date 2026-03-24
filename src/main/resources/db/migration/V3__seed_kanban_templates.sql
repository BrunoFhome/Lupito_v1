-- ════════════════════════════════════════════════════════════════════════════
-- TEMPLATES DE KANBAN — um por lição (20 no total)
-- Trilha 1 (lições 1–10): language = 'javascript'
-- Trilha 2 (lições 11–20): language = 'web' (starter_code em JSON)
-- ════════════════════════════════════════════════════════════════════════════

-- ── Lição 1: Introdução à Lógica e ao JavaScript ─────────────────────────────
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(1,
 'Introdução à Lógica e ao JavaScript',
 'Primeiro contato com lógica de programação e com a sintaxe básica do JavaScript.',
 'Alta',
 1,
 'javascript',
 'Use console.log() para imprimir uma mensagem de boas-vindas. Em seguida, descreva em um comentário o que é um algoritmo com suas próprias palavras.',
 $code$// Desafio: Primeiro programa em JavaScript
// 1. Imprima "Olá, mundo!" no console
// 2. Adicione um comentário explicando o que é um algoritmo

console.log("Olá, mundo!");

// Um algoritmo é:
// (escreva sua definição aqui)
$code$);

-- ── Lição 2: Variáveis e Tipos de Dados ──────────────────────────────────────
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(2,
 'Variáveis e Tipos de Dados',
 'Aprendendo a armazenar informações em variáveis e identificar tipos básicos.',
 'Alta',
 2,
 'javascript',
 'Declare variáveis para representar um perfil de usuário: nome (string), idade (number) e ativo (boolean). Depois imprima cada variável e seu tipo usando typeof.',
 $code$// Desafio: Declare e inspecione variáveis
// 1. Crie variáveis para nome, idade e ativo
// 2. Use typeof para verificar o tipo de cada uma

var nome = "Maria";
var idade = 20;
var ativo = true;

console.log(nome, typeof nome);
console.log(idade, typeof idade);
console.log(ativo, typeof ativo);
$code$);

-- ── Lição 3: Operadores Matemáticos e Comparação ─────────────────────────────
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(3,
 'Operadores Matemáticos e Comparação',
 'Uso de operadores para cálculos e comparações no código.',
 'Média',
 3,
 'javascript',
 'Calcule o dobro e a metade de um número. Depois verifique se o dobro é maior que 10 e se a metade é igual a 5. Imprima os resultados.',
 $code$// Desafio: Operadores em ação
// 1. Defina um número
// 2. Calcule o dobro e a metade
// 3. Compare os resultados e imprima true ou false

var numero = 10;

var dobro = numero * 2;
var metade = numero / 2;

console.log("Dobro:", dobro);
console.log("Metade:", metade);
console.log("Dobro maior que 10?", dobro > 10);
console.log("Metade igual a 5?", metade === 5);
$code$);

-- ── Lição 4: Estruturas Condicionais ─────────────────────────────────────────
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(4,
 'Estruturas Condicionais',
 'Tomada de decisão com if, else e else if.',
 'Alta',
 4,
 'javascript',
 'Crie uma variável com uma nota de 0 a 10. Use if, else if e else para classificar a nota como "Aprovado" (>= 7), "Recuperação" (>= 5) ou "Reprovado" (< 5).',
 $code$// Desafio: Classificador de notas
// Altere o valor de 'nota' e veja o resultado

var nota = 8;

if (nota >= 7) {
  console.log("Aprovado");
} else if (nota >= 5) {
  console.log("Recuperação");
} else {
  console.log("Reprovado");
}
$code$);

-- ── Lição 5: Operadores Lógicos ───────────────────────────────────────────────
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(5,
 'Operadores Lógicos',
 'Combinação de condições com AND, OR e NOT.',
 'Média',
 5,
 'javascript',
 'Crie variáveis de idade e possuiIngresso. Use && para verificar se alguém pode entrar em um evento (>= 18 E possui ingresso). Use || para verificar se é menor de 18 OU não tem ingresso.',
 $code$// Desafio: Controle de acesso com operadores lógicos

var idade = 20;
var possuiIngresso = true;

var podeEntrar = idade >= 18 && possuiIngresso;
var bloqueado  = idade < 18 || !possuiIngresso;

console.log("Pode entrar?", podeEntrar);
console.log("Bloqueado?",   bloqueado);
$code$);

-- ── Lição 6: Laços de Repetição ──────────────────────────────────────────────
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(6,
 'Laços de Repetição',
 'Automatizando tarefas repetitivas com for e while.',
 'Alta',
 6,
 'javascript',
 'Use um laço for para imprimir os números de 1 a 10. Em seguida, use um laço while para imprimir apenas os números pares de 2 a 10.',
 $code$// Desafio: Laços de repetição

// 1. Imprima números de 1 a 10 com for
for (var i = 1; i <= 10; i++) {
  console.log(i);
}

// 2. Imprima números pares de 2 a 10 com while
var j = 2;
while (j <= 10) {
  console.log("Par:", j);
  j += 2;
}
$code$);

-- ── Lição 7: Funções ─────────────────────────────────────────────────────────
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(7,
 'Funções',
 'Organizando o código em blocos reutilizáveis.',
 'Alta',
 7,
 'javascript',
 'Crie uma função chamada saudacao que receba um nome como parâmetro e retorne "Olá, <nome>!". Depois crie uma função soma que receba dois números e retorne a soma. Teste ambas.',
 $code$// Desafio: Criando e chamando funções

function saudacao(nome) {
  return "Olá, " + nome + "!";
}

function soma(a, b) {
  return a + b;
}

console.log(saudacao("Ana"));
console.log("Soma:", soma(3, 7));
$code$);

-- ── Lição 8: Arrays ───────────────────────────────────────────────────────────
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(8,
 'Arrays',
 'Armazenando coleções de valores em uma única estrutura.',
 'Média',
 8,
 'javascript',
 'Crie um array com 5 frutas. Imprima o primeiro e o último elemento. Use um laço for para imprimir todas as frutas. Adicione uma nova fruta com push e imprima o tamanho final.',
 $code$// Desafio: Trabalhando com arrays

var frutas = ["maçã", "banana", "laranja", "uva", "morango"];

console.log("Primeira:", frutas[0]);
console.log("Última:",   frutas[frutas.length - 1]);

for (var i = 0; i < frutas.length; i++) {
  console.log(frutas[i]);
}

frutas.push("manga");
console.log("Total de frutas:", frutas.length);
$code$);

-- ── Lição 9: Objetos ─────────────────────────────────────────────────────────
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(9,
 'Objetos',
 'Representando entidades com propriedades e valores.',
 'Média',
 9,
 'javascript',
 'Crie um objeto aluno com as propriedades nome, idade e nota. Imprima cada propriedade. Depois adicione uma nova propriedade aprovado com base na nota (>= 7) e imprima o objeto completo.',
 $code$// Desafio: Criando e manipulando objetos

var aluno = {
  nome:  "João",
  idade: 17,
  nota:  8.5
};

console.log("Nome:",  aluno.nome);
console.log("Idade:", aluno.idade);
console.log("Nota:",  aluno.nota);

aluno.aprovado = aluno.nota >= 7;
console.log("Aprovado:", aluno.aprovado);
console.log(aluno);
$code$);

-- ── Lição 10: Resolução de Problemas ─────────────────────────────────────────
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(10,
 'Resolução de Problemas',
 'Aplicando lógica para interpretar e resolver desafios simples.',
 'Alta',
 10,
 'javascript',
 'Crie uma função calcularMedia que receba um array de notas e retorne a média. Depois crie uma função classificar que receba a média e retorne "Aprovado", "Recuperação" ou "Reprovado".',
 $code$// Desafio: Calcular e classificar notas

function calcularMedia(notas) {
  var soma = 0;
  for (var i = 0; i < notas.length; i++) {
    soma += notas[i];
  }
  return soma / notas.length;
}

function classificar(media) {
  if (media >= 7) return "Aprovado";
  if (media >= 5) return "Recuperação";
  return "Reprovado";
}

var notas = [8, 6, 9, 7, 5];
var media = calcularMedia(notas);

console.log("Média:", media);
console.log("Resultado:", classificar(media));
$code$);

-- ════════════════════════════════════════════════════════════════════════════
-- TRILHA 2 — Desenvolvimento Web (lições 11–20)
-- starter_code em formato JSON: {"html":"...","css":"...","js":"..."}
-- ════════════════════════════════════════════════════════════════════════════

-- ── Lição 11: Introdução ao Desenvolvimento Web ───────────────────────────────
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(11,
 'Introdução ao Desenvolvimento Web',
 'Visão geral sobre como páginas web funcionam e o papel de cada tecnologia.',
 'Baixa',
 11,
 'web',
 'Você está criando sua primeira página web completa! Na aba HTML, escreva a estrutura da página. Na aba CSS, aplique estilos. Na aba JS, adicione um console.log de boas-vindas. Clique em Visualizar para ver o resultado das três tecnologias juntas.',
 $code${"html":"<!DOCTYPE html>\n<html lang=\"pt-BR\">\n<head>\n  <meta charset=\"UTF-8\">\n  <title>Desenvolvimento Web</title>\n</head>\n<body>\n  <h1>Desenvolvimento Web</h1>\n  <p>HTML define a <strong>estrutura</strong> do conteúdo.</p>\n  <p>CSS define a <strong>aparência</strong> dos elementos.</p>\n  <p>JavaScript adiciona <strong>comportamento</strong> à página.</p>\n</body>\n</html>","css":"body {\n  font-family: sans-serif;\n  max-width: 600px;\n  margin: 40px auto;\n  padding: 0 24px;\n  color: #333;\n}\n\nh1 {\n  color: #00b4cc;\n  border-bottom: 2px solid #00b4cc;\n  padding-bottom: 8px;\n}\n\nstrong {\n  color: #00b4cc;\n}","js":"// Opcional: adicione interatividade\nconsole.log('Desenvolvimento Web carregado!');"}$code$);

-- ── Lição 12: Estrutura Básica do HTML ────────────────────────────────────────
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(12,
 'Estrutura Básica do HTML',
 'Aprendendo a criar a base de um documento HTML.',
 'Média',
 12,
 'web',
 'Construa a estrutura completa de um documento HTML. Na aba HTML: inclua DOCTYPE, html, head (com title e meta charset) e body. Dentro do body, adicione um título h1, dois parágrafos descrevendo você e um rodapé. Estilize na aba CSS.',
 $code${"html":"<!DOCTYPE html>\n<html lang=\"pt-BR\">\n<head>\n  <meta charset=\"UTF-8\">\n  <title>Minha Primeira Página</title>\n</head>\n<body>\n\n  <!-- Adicione um título h1, dois parágrafos e um rodapé aqui -->\n\n</body>\n</html>","css":"body {\n  font-family: sans-serif;\n  margin: 0;\n  padding: 24px;\n  background: #f5f5f5;\n}\n\n/* Estilize os elementos que você adicionar */","js":"// Deixe vazio por enquanto"}$code$);

-- ── Lição 13: Textos e Elementos Semânticos ───────────────────────────────────
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(13,
 'Textos e Elementos Semânticos',
 'Uso de títulos, parágrafos e tags semânticas.',
 'Baixa',
 13,
 'web',
 'Crie uma página usando tags semânticas. Na aba HTML: utilize header (com h1), main (com section e article) e footer. Cada área deve ter conteúdo relevante. Na aba CSS: estilize visualmente as diferentes áreas com cores e espaçamentos distintos.',
 $code${"html":"<!DOCTYPE html>\n<html lang=\"pt-BR\">\n<head>\n  <meta charset=\"UTF-8\">\n  <title>Elementos Semânticos</title>\n</head>\n<body>\n\n  <header>\n    <h1>Meu Site</h1>\n    <p>Slogan do site</p>\n  </header>\n\n  <main>\n    <section>\n      <h2>Seção Principal</h2>\n      <article>\n        <h3>Artigo 1</h3>\n        <p>Conteúdo do artigo aqui.</p>\n      </article>\n    </section>\n  </main>\n\n  <footer>\n    <p>© 2025 Meu Site</p>\n  </footer>\n\n</body>\n</html>","css":"body {\n  font-family: sans-serif;\n  margin: 0;\n}\n\nheader {\n  background: #00b4cc;\n  color: white;\n  padding: 24px;\n}\n\nmain {\n  max-width: 800px;\n  margin: 24px auto;\n  padding: 0 24px;\n}\n\narticle {\n  background: white;\n  border: 1px solid #e0e0e0;\n  border-radius: 8px;\n  padding: 16px;\n  margin-bottom: 16px;\n}\n\nfooter {\n  background: #333;\n  color: white;\n  text-align: center;\n  padding: 16px;\n  margin-top: 24px;\n}","js":"// Deixe vazio por enquanto"}$code$);

-- ── Lição 14: Links e Imagens ─────────────────────────────────────────────────
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(14,
 'Links e Imagens',
 'Inserindo navegação e conteúdo visual em páginas web.',
 'Baixa',
 14,
 'web',
 'Crie uma página com um menu de navegação usando links <a>. Adicione ao menos uma imagem com <img> e atributo alt descritivo. Estilize o menu e a imagem com CSS. Use href="#" para links que não levam a lugar algum.',
 $code${"html":"<!DOCTYPE html>\n<html lang=\"pt-BR\">\n<head>\n  <meta charset=\"UTF-8\">\n  <title>Links e Imagens</title>\n</head>\n<body>\n\n  <nav>\n    <a href=\"#\">Início</a>\n    <a href=\"#\">Sobre</a>\n    <a href=\"#\">Contato</a>\n  </nav>\n\n  <main>\n    <h1>Galeria</h1>\n    <img src=\"https://picsum.photos/600/300\" alt=\"Imagem de exemplo\">\n    <p>Adicione mais imagens e links abaixo.</p>\n  </main>\n\n</body>\n</html>","css":"body {\n  font-family: sans-serif;\n  margin: 0;\n}\n\nnav {\n  background: #00b4cc;\n  padding: 12px 24px;\n  display: flex;\n  gap: 16px;\n}\n\nnav a {\n  color: white;\n  text-decoration: none;\n  font-weight: 600;\n}\n\nnav a:hover {\n  text-decoration: underline;\n}\n\nmain {\n  max-width: 800px;\n  margin: 24px auto;\n  padding: 0 24px;\n}\n\nimg {\n  width: 100%;\n  border-radius: 8px;\n  margin-top: 16px;\n}","js":"// Deixe vazio por enquanto"}$code$);

-- ── Lição 15: Listas e Tabelas ────────────────────────────────────────────────
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(15,
 'Listas e Tabelas',
 'Organizando informações em listas ordenadas, não ordenadas e tabelas.',
 'Média',
 15,
 'web',
 'Na aba HTML, crie: (1) uma lista não ordenada com 4 frutas, (2) uma lista ordenada com 3 passos para aprender HTML, (3) uma tabela com cabeçalho e 3 linhas de dados sobre tecnologias. Estilize tudo com CSS.',
 $code${"html":"<!DOCTYPE html>\n<html lang=\"pt-BR\">\n<head>\n  <meta charset=\"UTF-8\">\n  <title>Listas e Tabelas</title>\n</head>\n<body>\n  <div class=\"container\">\n    <h1>Listas e Tabelas</h1>\n\n    <h2>Frutas favoritas</h2>\n    <ul>\n      <li>Manga</li>\n      <li>Morango</li>\n      <li>Abacaxi</li>\n    </ul>\n\n    <h2>Como criar uma página web</h2>\n    <ol>\n      <li>Crie um arquivo .html</li>\n      <li>Adicione a estrutura básica</li>\n      <li>Adicione conteúdo ao body</li>\n    </ol>\n\n    <h2>Tecnologias</h2>\n    <table>\n      <thead>\n        <tr><th>Tecnologia</th><th>Ano</th></tr>\n      </thead>\n      <tbody>\n        <tr><td>HTML</td><td>1991</td></tr>\n        <tr><td>CSS</td><td>1996</td></tr>\n        <tr><td>JavaScript</td><td>1995</td></tr>\n      </tbody>\n    </table>\n  </div>\n</body>\n</html>","css":"body {\n  font-family: sans-serif;\n  background: #f5f5f5;\n  margin: 0;\n  padding: 24px;\n}\n\n.container {\n  max-width: 600px;\n  margin: 0 auto;\n  background: white;\n  padding: 24px;\n  border-radius: 12px;\n}\n\nh1 { color: #00b4cc; }\n\nul, ol { padding-left: 20px; line-height: 2; }\n\ntable {\n  width: 100%;\n  border-collapse: collapse;\n  margin-top: 8px;\n}\n\nth {\n  background: #00b4cc;\n  color: white;\n  padding: 10px;\n  text-align: left;\n}\n\ntd {\n  padding: 10px;\n  border-bottom: 1px solid #e0e0e0;\n}\n\ntr:hover { background: #f0f4f8; }","js":"// Deixe vazio por enquanto"}$code$);

-- ── Lição 16: Fundamentos do CSS ──────────────────────────────────────────────
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(16,
 'Fundamentos do CSS',
 'Primeiros passos na estilização de páginas web.',
 'Média',
 16,
 'web',
 'Pratique as propriedades CSS fundamentais! Na aba CSS, estilize o container, o título, o parágrafo, o botão e a caixa já existentes no HTML. Use: color, background-color, font-size, padding, margin, border e border-radius. Tente pelo menos 5 propriedades diferentes em cada elemento.',
 $code${"html":"<!DOCTYPE html>\n<html lang=\"pt-BR\">\n<head>\n  <meta charset=\"UTF-8\">\n  <title>Fundamentos do CSS</title>\n</head>\n<body>\n  <div class=\"container\">\n    <h1>Meu Título</h1>\n    <p>Este é um parágrafo de exemplo para você estilizar com CSS.</p>\n    <button class=\"botao\">Clique aqui</button>\n    <div class=\"caixa\">Esta é uma caixa</div>\n  </div>\n</body>\n</html>","css":"/* Estilize cada elemento abaixo! */\n\nbody {\n  background: #f0f4f8;\n  font-family: sans-serif;\n  margin: 0;\n  padding: 24px;\n}\n\n.container {\n  max-width: 500px;\n  margin: 0 auto;\n  background: white;\n  padding: 32px;\n  border-radius: 12px;\n}\n\nh1 {\n  /* Adicione: color, font-size */\n  color: #00b4cc;\n}\n\np {\n  /* Adicione: line-height, color */\n}\n\n.botao {\n  /* Adicione: background-color, color, padding, border, border-radius, cursor */\n}\n\n.caixa {\n  /* Adicione: background, padding, margin-top, border */\n}","js":"// Deixe vazio por enquanto"}$code$);

-- ── Lição 17: Seletores e Classes ─────────────────────────────────────────────
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(17,
 'Seletores e Classes',
 'Aplicando estilos em elementos específicos da página.',
 'Média',
 17,
 'web',
 'Use os três tipos de seletores CSS: (1) seletor de tag — estilize todas as tags p, (2) seletor de classe — estilize .card, .btn-primary e .btn-secondary com cores diferentes, (3) seletor de ID — destaque o #destaque com fundo colorido. Crie estilos bem distintos para cada tipo.',
 $code${"html":"<!DOCTYPE html>\n<html lang=\"pt-BR\">\n<head>\n  <meta charset=\"UTF-8\">\n  <title>Seletores e Classes</title>\n</head>\n<body>\n\n  <div id=\"destaque\">\n    <h1>Elemento em Destaque</h1>\n    <p>Este elemento tem um ID único.</p>\n  </div>\n\n  <div class=\"card\">\n    <h2>Card 1</h2>\n    <p>Conteúdo do primeiro card.</p>\n    <button class=\"btn-primary\">Ação principal</button>\n  </div>\n\n  <div class=\"card\">\n    <h2>Card 2</h2>\n    <p>Conteúdo do segundo card.</p>\n    <button class=\"btn-secondary\">Ação secundária</button>\n  </div>\n\n</body>\n</html>","css":"body {\n  font-family: sans-serif;\n  padding: 24px;\n  background: #f0f4f8;\n}\n\n/* Seletor de ID */\n#destaque {\n  background: #00b4cc;\n  color: white;\n  padding: 24px;\n  border-radius: 8px;\n  margin-bottom: 16px;\n}\n\n/* Seletor de classe */\n.card {\n  background: white;\n  padding: 24px;\n  border-radius: 8px;\n  margin-bottom: 16px;\n  box-shadow: 0 2px 8px rgba(0,0,0,0.1);\n}\n\n/* Complete os estilos dos botões */\n.btn-primary {\n  padding: 10px 20px;\n  border: none;\n  border-radius: 6px;\n  cursor: pointer;\n  /* Adicione: background-color, color */\n}\n\n.btn-secondary {\n  padding: 10px 20px;\n  border: none;\n  border-radius: 6px;\n  cursor: pointer;\n  /* Adicione cores diferentes de btn-primary */\n}","js":"// Deixe vazio por enquanto"}$code$);

-- ── Lição 18: Box Model e Espaçamentos ────────────────────────────────────────
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(18,
 'Box Model e Espaçamentos',
 'Entendendo margin, padding, border e content.',
 'Baixa',
 18,
 'web',
 'Pratique o Box Model! Na aba CSS, para cada .card: defina width, adicione padding interno, margin entre os cards, border e border-radius. Use box-sizing: border-box para que padding e border sejam incluídos na largura. Experimente diferentes valores e veja o efeito no preview.',
 $code${"html":"<!DOCTYPE html>\n<html lang=\"pt-BR\">\n<head>\n  <meta charset=\"UTF-8\">\n  <title>Box Model</title>\n</head>\n<body>\n  <h1>Box Model na prática</h1>\n  <div class=\"card\">Card 1 — área de conteúdo</div>\n  <div class=\"card\">Card 2 — área de conteúdo</div>\n  <div class=\"card\">Card 3 — área de conteúdo</div>\n</body>\n</html>","css":"body {\n  font-family: sans-serif;\n  background: #f0f4f8;\n  padding: 24px;\n}\n\n.card {\n  background: white;\n\n  /* Experimente mudar estes valores! */\n  width: 300px;\n  padding: 16px;       /* espaço interno */\n  margin: 12px 0;      /* espaço externo */\n  border: 2px solid #00b4cc;\n  border-radius: 8px;\n\n  /* Inclui padding e border na largura total */\n  box-sizing: border-box;\n}","js":"// Deixe vazio por enquanto"}$code$);

-- ── Lição 19: Introdução ao JavaScript no HTML ────────────────────────────────
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(19,
 'Introdução ao JavaScript no HTML',
 'Conectando scripts à página para adicionar comportamento.',
 'Alta',
 19,
 'web',
 'Na aba JS, selecione os elementos pelo ID usando document.getElementById(). Adicione eventos de clique aos botões: quando "Mudar texto" for clicado, altere o textContent do parágrafo #mensagem e mude sua cor. Quando "Resetar" for clicado, volte ao texto e cor originais.',
 $code${"html":"<!DOCTYPE html>\n<html lang=\"pt-BR\">\n<head>\n  <meta charset=\"UTF-8\">\n  <title>JavaScript no HTML</title>\n</head>\n<body>\n  <div class=\"container\">\n    <h1>Manipulação do DOM</h1>\n    <p id=\"mensagem\">Clique no botão para mudar este texto.</p>\n    <button id=\"btn-mudar\">Mudar texto</button>\n    <button id=\"btn-resetar\">Resetar</button>\n  </div>\n</body>\n</html>","css":"body {\n  font-family: sans-serif;\n  display: flex;\n  justify-content: center;\n  padding: 40px 24px;\n  background: #f0f4f8;\n}\n\n.container {\n  background: white;\n  padding: 32px;\n  border-radius: 12px;\n  text-align: center;\n  max-width: 400px;\n  width: 100%;\n}\n\n#mensagem {\n  font-size: 1.1rem;\n  color: #555;\n  margin: 16px 0;\n}\n\nbutton {\n  margin: 4px;\n  padding: 10px 20px;\n  border: none;\n  border-radius: 6px;\n  cursor: pointer;\n  font-size: 1rem;\n}\n\n#btn-mudar { background: #00b4cc; color: white; }\n#btn-resetar { background: #e0e0e0; color: #333; }","js":"// Selecione os elementos\nvar mensagem   = document.getElementById('mensagem');\nvar btnMudar   = document.getElementById('btn-mudar');\nvar btnResetar = document.getElementById('btn-resetar');\n\nvar textoOriginal = mensagem.textContent;\n\n// Adicione os eventos de clique abaixo\nbtnMudar.addEventListener('click', function() {\n  // Complete: mude o textContent e a cor de 'mensagem'\n});\n\nbtnResetar.addEventListener('click', function() {\n  // Complete: volte ao texto e cor originais\n});"}$code$);

-- ── Lição 20: Eventos e Interatividade ────────────────────────────────────────
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(20,
 'Eventos e Interatividade',
 'Criando páginas que respondem às ações do usuário.',
 'Alta',
 20,
 'web',
 'Complete o contador interativo! Na aba JS, os event listeners já estão parcialmente escritos. Complete cada um: btn-inc deve incrementar o valor em 1, btn-dec deve decrementar em 1 e btn-reset deve voltar a 0. Após cada operação, atualize o display.textContent com o novo valor.',
 $code${"html":"<!DOCTYPE html>\n<html lang=\"pt-BR\">\n<head>\n  <meta charset=\"UTF-8\">\n  <title>Contador Interativo</title>\n</head>\n<body>\n  <div class=\"contador-container\">\n    <h1>Contador</h1>\n    <div id=\"display\" class=\"display\">0</div>\n    <div class=\"botoes\">\n      <button id=\"btn-dec\">-</button>\n      <button id=\"btn-reset\">R</button>\n      <button id=\"btn-inc\">+</button>\n    </div>\n  </div>\n</body>\n</html>","css":"body {\n  font-family: sans-serif;\n  display: flex;\n  justify-content: center;\n  align-items: center;\n  min-height: 100vh;\n  margin: 0;\n  background: #f0f4f8;\n}\n\n.contador-container {\n  background: white;\n  padding: 40px;\n  border-radius: 16px;\n  text-align: center;\n  box-shadow: 0 4px 16px rgba(0,0,0,0.1);\n}\n\n.display {\n  font-size: 4rem;\n  font-weight: 800;\n  color: #00b4cc;\n  margin: 16px 0;\n}\n\n.botoes {\n  display: flex;\n  gap: 12px;\n  justify-content: center;\n  margin-top: 16px;\n}\n\n.botoes button {\n  width: 50px;\n  height: 50px;\n  border: none;\n  border-radius: 50%;\n  font-size: 1.4rem;\n  cursor: pointer;\n  background: #00b4cc;\n  color: white;\n  transition: background 0.2s;\n}\n\n.botoes button:hover { background: #008c9e; }\n#btn-reset { background: #e0e0e0; color: #333; }\n#btn-reset:hover { background: #ccc; }","js":"var valor = 0;\nvar display = document.getElementById('display');\n\ndocument.getElementById('btn-inc').addEventListener('click', function() {\n  // Complete: incremente valor e atualize display\n});\n\ndocument.getElementById('btn-dec').addEventListener('click', function() {\n  // Complete: decremente valor e atualize display\n});\n\ndocument.getElementById('btn-reset').addEventListener('click', function() {\n  // Complete: resets valor para 0 e atualize display\n});"}$code$);

-- ════════════════════════════════════════════════════════════════════════════
-- RESET DE SEQUENCE
-- ════════════════════════════════════════════════════════════════════════════

SELECT setval('tb_kanban_templates_id_seq', (SELECT MAX(id) FROM tb_kanban_templates));
