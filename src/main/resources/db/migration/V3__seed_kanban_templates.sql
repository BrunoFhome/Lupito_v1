-- ════════════════════════════════════════════════════════════════════════════
-- TEMPLATES DE KANBAN — um por módulo (seção)
-- Cada template está vinculado à ÚLTIMA aula do módulo, então só é
-- desbloqueado quando o aluno conclui o módulo inteiro.
--
-- Trilha 1 (10 módulos → lessons 3,6,9,12,15,18,21,24,27,30)
-- Trilha 2 (2 módulos  → lessons 33, 35)
-- Trilha 3 (2 módulos  → lessons 38, 40)
-- ════════════════════════════════════════════════════════════════════════════

-- ── Trilha 1 — Módulo 1: Primeiros Passos (lesson 3) ─────────────────────

INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(1,
 'Desafio: Primeiros Passos',
 'Consolide variáveis, tipos e console.log em um mini-programa.',
 'Alta',
 3,
 'javascript',
 'Crie um mini-programa que: (1) declare variáveis com seu nome, idade e linguagem favorita; (2) exiba uma apresentação completa usando template literals; (3) mostre o tipo de cada variável com typeof; (4) adicione comentários explicando cada bloco.',
$code$// Desafio — Primeiros Passos
// Preencha as variáveis e complete as exibições

const nome = "";        // seu nome
const idade = 0;        // sua idade
const linguagem = "";   // sua linguagem favorita

// Apresentação com template literal
console.log(`Olá, meu nome é ${nome}...`);

// Tipos de cada variável
console.log(typeof nome);
console.log(typeof idade);
console.log(typeof linguagem);
$code$);

-- ── Trilha 1 — Módulo 2: Operadores (lesson 6) ───────────────────────────

INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(2,
 'Desafio: Calculadora Básica',
 'Implemente uma calculadora com os quatro operadores e operadores de incremento.',
 'Alta',
 6,
 'javascript',
 'Crie uma calculadora que receba dois números e exiba: soma, subtração, multiplicação, divisão e resto. Demonstre também o uso de ++, -- e operadores de atribuição composta (+=, -=, *=, /=).',
$code$// Desafio — Calculadora Básica
let a = 10;
let b = 3;

// Operações básicas
console.log("Soma:", a + b);
console.log("Subtração:", a - b);
console.log("Multiplicação:", a * b);
console.log("Divisão:", a / b);
console.log("Resto:", a % b);

// Incremento / decremento
let contador = 0;
contador++;
console.log("Após ++:", contador);
contador--;
console.log("Após --:", contador);

// Atribuição composta
a += 5;
console.log("a após += 5:", a);
$code$);

-- ── Trilha 1 — Módulo 3: Comparação e Lógica (lesson 9) ──────────────────

INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(3,
 'Desafio: Verificador de Acesso',
 'Use operadores lógicos e de comparação para controlar acesso a um sistema.',
 'Alta',
 9,
 'javascript',
 'Crie um verificador que receba idade e pontuação. Exiba: (1) se a pessoa tem 18 anos ou mais; (2) se a pontuação é entre 50 e 100; (3) se pode acessar o sistema (idade >= 18 E pontuação >= 50); (4) se está bloqueada (pontuação < 10 OU idade < 13). Use ===, !==, &&, || e !.',
$code$// Desafio — Verificador de Acesso
const idade = 20;
const pontuacao = 75;

// É maior de idade?
console.log("Maior de idade:", idade >= 18);

// Pontuação entre 50 e 100?
console.log("Pontuação válida:", pontuacao >= 50 && pontuacao <= 100);

// Pode acessar?
const podeAcessar = idade >= 18 && pontuacao >= 50;
console.log("Acesso permitido:", podeAcessar);

// Está bloqueado?
const bloqueado = pontuacao < 10 || idade < 13;
console.log("Bloqueado:", bloqueado);
$code$);

-- ── Trilha 1 — Módulo 4: Condicionais (lesson 12) ────────────────────────

INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(4,
 'Desafio: Classificador de Notas',
 'Use if/else e switch para classificar notas e dias da semana.',
 'Alta',
 12,
 'javascript',
 'Crie um programa que: (1) classifique uma nota de 0–10 (A ≥ 9, B ≥ 7, C ≥ 5, D < 5) usando if/else if; (2) use switch para exibir se um número de dia (1–7) é dia de semana ou fim de semana; (3) use operador ternário para exibir "Aprovado" ou "Reprovado" com base na nota.',
$code$// Desafio — Classificador de Notas
const nota = 8;
const diaSemana = 6; // 1 = segunda, 7 = domingo

// Classificação com if/else if
if (nota >= 9) {
  console.log("Conceito: A");
} else if (nota >= 7) {
  console.log("Conceito: B");
} else if (nota >= 5) {
  console.log("Conceito: C");
} else {
  console.log("Conceito: D");
}

// Dia com switch
switch (diaSemana) {
  case 1: case 2: case 3: case 4: case 5:
    console.log("Dia útil"); break;
  case 6: case 7:
    console.log("Fim de semana"); break;
  default:
    console.log("Dia inválido");
}

// Ternário
console.log(nota >= 5 ? "Aprovado" : "Reprovado");
$code$);

-- ── Trilha 1 — Módulo 5: Laços de Repetição (lesson 15) ──────────────────

INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(5,
 'Desafio: Tabuada e FizzBuzz',
 'Combine for, while e do/while para gerar sequências numéricas.',
 'Alta',
 15,
 'javascript',
 'Crie um programa que: (1) exiba a tabuada de 7 usando for; (2) implemente FizzBuzz de 1 a 30 (múltiplo de 3 → "Fizz", de 5 → "Buzz", de ambos → "FizzBuzz"); (3) use while para somar números de 1 a 100 e exibir o resultado.',
$code$// Desafio — Tabuada e FizzBuzz

// 1. Tabuada do 7
for (let i = 1; i <= 10; i++) {
  console.log(`7 x ${i} = ${7 * i}`);
}

// 2. FizzBuzz
for (let n = 1; n <= 30; n++) {
  if (n % 15 === 0) console.log("FizzBuzz");
  else if (n % 3 === 0) console.log("Fizz");
  else if (n % 5 === 0) console.log("Buzz");
  else console.log(n);
}

// 3. Soma com while
let soma = 0;
let i = 1;
while (i <= 100) {
  soma += i;
  i++;
}
console.log("Soma 1–100:", soma);
$code$);

-- ── Trilha 1 — Módulo 6: Funções (lesson 18) ─────────────────────────────

INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(6,
 'Desafio: Biblioteca de Funções',
 'Crie funções reutilizáveis com declaração, expressão e arrow function.',
 'Alta',
 18,
 'javascript',
 'Implemente: (1) função `calcularMedia(a, b, c)` que retorna a média de três números; (2) arrow function `ehPar` que retorna true/false; (3) função `saudacao(nome, periodo = "dia")` com parâmetro padrão que exibe "Bom {periodo}, {nome}!"; (4) chame cada função com exemplos.',
$code$// Desafio — Biblioteca de Funções

// 1. Função de média
function calcularMedia(a, b, c) {
  return (a + b + c) / 3;
}
console.log("Média:", calcularMedia(7, 8, 9));

// 2. Arrow function
const ehPar = (n) => n % 2 === 0;
console.log("4 é par?", ehPar(4));
console.log("7 é par?", ehPar(7));

// 3. Parâmetro padrão
function saudacao(nome, periodo = "dia") {
  console.log(`Bom ${periodo}, ${nome}!`);
}
saudacao("Ana");
saudacao("Carlos", "tarde");
$code$);

-- ── Trilha 1 — Módulo 7: Strings (lesson 21) ─────────────────────────────

INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(7,
 'Desafio: Processador de Textos',
 'Manipule strings com métodos built-in e template literals.',
 'Alta',
 21,
 'javascript',
 'Crie um processador que: (1) receba uma frase e exiba em maiúsculas e minúsculas; (2) conte quantas palavras existem (dica: split); (3) substitua todos os espaços por hífens; (4) verifique se a frase contém a palavra "JavaScript"; (5) exiba os 10 primeiros caracteres com slice.',
$code$// Desafio — Processador de Textos
const frase = "Aprender JavaScript é muito divertido";

// 1. Maiúsculas e minúsculas
console.log(frase.toUpperCase());
console.log(frase.toLowerCase());

// 2. Contagem de palavras
const palavras = frase.split(" ");
console.log("Palavras:", palavras.length);

// 3. Espaços → hífens
console.log(frase.replaceAll(" ", "-"));

// 4. Contém "JavaScript"?
console.log("Contém JavaScript:", frase.includes("JavaScript"));

// 5. Primeiros 10 caracteres
console.log(frase.slice(0, 10));
$code$);

-- ── Trilha 1 — Módulo 8: Arrays (lesson 24) ──────────────────────────────

INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(8,
 'Desafio: Gerenciador de Lista',
 'Use métodos de array para filtrar, transformar e reduzir dados.',
 'Alta',
 24,
 'javascript',
 'Dado um array de números [3, 7, 1, 9, 4, 6, 2, 8, 5]: (1) filtre apenas os pares com filter; (2) dobre cada valor com map; (3) calcule a soma total com reduce; (4) ordene em ordem crescente; (5) verifique se algum número é maior que 8 com some.',
$code$// Desafio — Gerenciador de Lista
const numeros = [3, 7, 1, 9, 4, 6, 2, 8, 5];

// 1. Filtrar pares
const pares = numeros.filter(n => n % 2 === 0);
console.log("Pares:", pares);

// 2. Dobrar valores
const dobrados = numeros.map(n => n * 2);
console.log("Dobrados:", dobrados);

// 3. Soma total
const soma = numeros.reduce((acc, n) => acc + n, 0);
console.log("Soma:", soma);

// 4. Ordenar
const ordenados = [...numeros].sort((a, b) => a - b);
console.log("Ordenados:", ordenados);

// 5. Algum > 8?
console.log("Algum > 8:", numeros.some(n => n > 8));
$code$);

-- ── Trilha 1 — Módulo 9: Objetos (lesson 27) ─────────────────────────────

INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(9,
 'Desafio: Sistema de Cadastro',
 'Modele dados com objetos, destructuring e métodos.',
 'Alta',
 27,
 'javascript',
 'Crie um objeto `pessoa` com nome, idade, email e um método `apresentar()`. Então: (1) acesse propriedades com dot notation e bracket notation; (2) use destructuring para extrair nome e email; (3) adicione uma nova propriedade `cidade` dinamicamente; (4) itere as propriedades com for...in.',
$code$// Desafio — Sistema de Cadastro
const pessoa = {
  nome: "Maria",
  idade: 28,
  email: "maria@email.com",
  apresentar() {
    console.log(`Olá, sou ${this.nome}, tenho ${this.idade} anos.`);
  }
};

// Chamando o método
pessoa.apresentar();

// Dot e bracket notation
console.log(pessoa.nome);
console.log(pessoa["email"]);

// Destructuring
const { nome, email } = pessoa;
console.log(`Nome: ${nome}, E-mail: ${email}`);

// Propriedade dinâmica
pessoa.cidade = "São Paulo";
console.log("Cidade:", pessoa.cidade);

// for...in
for (const chave in pessoa) {
  if (typeof pessoa[chave] !== "function") {
    console.log(`${chave}: ${pessoa[chave]}`);
  }
}
$code$);

-- ── Trilha 1 — Módulo 10: Combinando Tudo (lesson 30) ────────────────────

INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(10,
 'Desafio: Mini Sistema de Alunos',
 'Combine funções, arrays e objetos para construir um mini sistema.',
 'Alta',
 30,
 'javascript',
 'Crie um array de objetos `alunos` (mínimo 4), cada um com nome, notas (array de 3 valores) e um método `media()`. Então: (1) calcule a média de cada aluno; (2) filtre os aprovados (média >= 6); (3) encontre o aluno com maior média; (4) exiba um relatório formatado para cada aluno.',
$code$// Desafio — Mini Sistema de Alunos

const alunos = [
  { nome: "Ana",    notas: [8, 7, 9],  media() { return this.notas.reduce((s, n) => s + n, 0) / this.notas.length; } },
  { nome: "Bruno",  notas: [5, 4, 6],  media() { return this.notas.reduce((s, n) => s + n, 0) / this.notas.length; } },
  { nome: "Clara",  notas: [9, 10, 8], media() { return this.notas.reduce((s, n) => s + n, 0) / this.notas.length; } },
  { nome: "Diego",  notas: [3, 5, 4],  media() { return this.notas.reduce((s, n) => s + n, 0) / this.notas.length; } },
];

// Aprovados
const aprovados = alunos.filter(a => a.media() >= 6);
console.log("Aprovados:", aprovados.map(a => a.nome));

// Maior média
const melhor = alunos.reduce((m, a) => a.media() > m.media() ? a : m);
console.log("Melhor aluno:", melhor.nome, "→", melhor.media().toFixed(1));

// Relatório
alunos.forEach(a => {
  const status = a.media() >= 6 ? "✓ Aprovado" : "✗ Reprovado";
  console.log(`${a.nome}: média ${a.media().toFixed(1)} — ${status}`);
});
$code$);

-- ── Trilha 2 — Módulo 1: HTML Estrutural (lesson 33) ─────────────────────

INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(11,
 'Desafio: Página de Perfil HTML',
 'Construa uma página de perfil completa usando tags semânticas HTML.',
 'Alta',
 33,
 'web',
 'Crie uma página de perfil pessoal usando HTML semântico: (1) use <header>, <main>, <section> e <footer>; (2) adicione uma foto com <img> e texto alternativo; (3) crie uma lista de habilidades com <ul>; (4) adicione uma tabela de experiências com <table>; (5) insira links de redes sociais com <a>.',
$json${"html":"<!DOCTYPE html>\n<html lang=\"pt-BR\">\n<head>\n  <meta charset=\"UTF-8\">\n  <title>Meu Perfil</title>\n</head>\n<body>\n\n  <header>\n    <h1>Seu Nome</h1>\n    <p>Desenvolvedor Web</p>\n  </header>\n\n  <main>\n    <section id=\"sobre\">\n      <img src=\"foto.jpg\" alt=\"Foto de perfil\">\n      <p>Escreva uma breve descricao sobre voce aqui.</p>\n    </section>\n\n    <section id=\"habilidades\">\n      <h2>Habilidades</h2>\n      <ul>\n        <li>HTML</li>\n        <li>CSS</li>\n        <li>JavaScript</li>\n      </ul>\n    </section>\n\n    <section id=\"experiencia\">\n      <h2>Experiencia</h2>\n      <table>\n        <tr><th>Empresa</th><th>Cargo</th><th>Periodo</th></tr>\n        <tr><td>Empresa A</td><td>Dev Jr</td><td>2023-2024</td></tr>\n      </table>\n    </section>\n  </main>\n\n  <footer>\n    <a href=\"#\">LinkedIn</a> | <a href=\"#\">GitHub</a>\n  </footer>\n\n</body>\n</html>","css":"","js":""}$json$);

-- ── Trilha 2 — Módulo 2: CSS Estilização (lesson 35) ─────────────────────

INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(12,
 'Desafio: Card Estilizado com CSS',
 'Estilize um card de produto usando seletores, box model e Flexbox.',
 'Alta',
 35,
 'web',
 'Crie um card de produto com CSS: (1) use Flexbox para centralizar o card na tela; (2) aplique border-radius, box-shadow e padding no card; (3) estilize o titulo com uma cor destacada; (4) adicione um botao com hover state; (5) use variaveis CSS (--cor-primaria) para as cores principais.',
$json${"html":"<!DOCTYPE html>\n<html lang=\"pt-BR\">\n<head>\n  <meta charset=\"UTF-8\">\n  <title>Card de Produto</title>\n</head>\n<body>\n\n  <div class=\"container\">\n    <div class=\"card\">\n      <div class=\"card-badge\">Novo</div>\n      <h2 class=\"card-title\">Nome do Produto</h2>\n      <p class=\"card-desc\">Descricao breve do produto.</p>\n      <div class=\"card-price\">R$ 99,90</div>\n      <button class=\"card-btn\">Comprar</button>\n    </div>\n  </div>\n\n</body>\n</html>","css":":root {\n  --cor-primaria: #00b4cc;\n}\n\nbody {\n  margin: 0;\n  font-family: sans-serif;\n  background: #f0f4f8;\n}\n\n.container {\n  display: flex;\n  justify-content: center;\n  align-items: center;\n  min-height: 100vh;\n}\n\n.card {\n  background: white;\n  border-radius: 16px;\n  padding: 32px;\n  box-shadow: 0 4px 24px rgba(0,0,0,0.1);\n  width: 280px;\n}\n\n.card-btn {\n  background: var(--cor-primaria);\n  color: white;\n  border: none;\n  padding: 12px 24px;\n  border-radius: 8px;\n  cursor: pointer;\n  width: 100%;\n}\n\n.card-btn:hover {\n  opacity: 0.85;\n}","js":""}$json$);

-- ── Trilha 3 — Módulo 1: JavaScript no Navegador (lesson 38) ─────────────

INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(13,
 'Desafio: Lista de Tarefas Interativa',
 'Manipule o DOM para criar uma lista de tarefas com JavaScript.',
 'Alta',
 38,
 'web',
 'Crie uma lista de tarefas funcional: (1) ao clicar em Adicionar, insira uma nova tarefa na lista; (2) ao clicar em uma tarefa, marque-a como concluida (riscada); (3) adicione um botao X em cada tarefa para remove-la; (4) exiba o total de tarefas pendentes atualizado dinamicamente.',
$json${"html":"<!DOCTYPE html>\n<html lang=\"pt-BR\">\n<head>\n  <meta charset=\"UTF-8\">\n  <title>Lista de Tarefas</title>\n  <style>\n    body { font-family: sans-serif; max-width: 400px; margin: 40px auto; }\n    .done { text-decoration: line-through; color: #999; }\n    li { display: flex; justify-content: space-between; padding: 8px 0; }\n    #contador { color: #666; font-size: 14px; }\n  </style>\n</head>\n<body>\n  <h1>Minhas Tarefas</h1>\n  <div>\n    <input id=\"input\" type=\"text\" placeholder=\"Nova tarefa...\">\n    <button id=\"btnAdd\">Adicionar</button>\n  </div>\n  <p id=\"contador\">0 pendentes</p>\n  <ul id=\"lista\"></ul>\n  <script src=\"script.js\"></script>\n</body>\n</html>","css":"","js":"const input = document.getElementById('input');\nconst btnAdd = document.getElementById('btnAdd');\nconst lista = document.getElementById('lista');\nconst contador = document.getElementById('contador');\n\nfunction atualizarContador() {\n  const pendentes = lista.querySelectorAll('li:not(.done)').length;\n  contador.textContent = pendentes + ' pendentes';\n}\n\nbtnAdd.addEventListener('click', function() {\n  const texto = input.value.trim();\n  if (!texto) { return; }\n\n  const li = document.createElement('li');\n  const span = document.createElement('span');\n  span.textContent = texto;\n  span.addEventListener('click', function() {\n    li.classList.toggle('done');\n    atualizarContador();\n  });\n\n  const btn = document.createElement('button');\n  btn.textContent = 'X';\n  btn.addEventListener('click', function() {\n    li.remove();\n    atualizarContador();\n  });\n\n  li.appendChild(span);\n  li.appendChild(btn);\n  lista.appendChild(li);\n  input.value = '';\n  atualizarContador();\n});\n"}$json$);

-- ── Trilha 3 — Módulo 2: Projeto Prático (lesson 40) ─────────────────────

INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(14,
 'Desafio: Calculadora Web Completa',
 'Construa uma calculadora web com HTML, CSS e JavaScript integrados.',
 'Alta',
 40,
 'web',
 'Crie uma calculadora funcional: (1) exiba um display com o numero atual; (2) adicione botoes 0-9, operadores (+, -, *, /), ponto decimal, CE e =; (3) implemente a logica de calculo em JavaScript; (4) estilize com CSS Grid para o teclado numerico; (5) trate divisao por zero exibindo Erro.',
$json${"html":"<!DOCTYPE html>\n<html lang=\"pt-BR\">\n<head>\n  <meta charset=\"UTF-8\">\n  <title>Calculadora</title>\n</head>\n<body>\n  <div class=\"calc\">\n    <div id=\"display\">0</div>\n    <div class=\"teclado\">\n      <button class=\"btn-op\" data-action=\"clear\">CE</button>\n      <button class=\"btn-op\" data-op=\"/\">div</button>\n      <button class=\"btn-op\" data-op=\"*\">x</button>\n      <button class=\"btn-op\" data-op=\"-\">-</button>\n      <button data-num=\"7\">7</button>\n      <button data-num=\"8\">8</button>\n      <button data-num=\"9\">9</button>\n      <button class=\"btn-op\" data-op=\"+\">+</button>\n      <button data-num=\"4\">4</button>\n      <button data-num=\"5\">5</button>\n      <button data-num=\"6\">6</button>\n      <button data-num=\"1\">1</button>\n      <button data-num=\"2\">2</button>\n      <button data-num=\"3\">3</button>\n      <button class=\"btn-eq\" data-action=\"calc\">=</button>\n      <button data-num=\"0\">0</button>\n      <button data-num=\".\">.</button>\n    </div>\n  </div>\n  <script src=\"script.js\"></script>\n</body>\n</html>","css":"body { display:flex; justify-content:center; align-items:center; min-height:100vh; background:#1a1a2e; }\n.calc { background:#16213e; border-radius:16px; padding:20px; width:260px; }\n#display { background:#0f3460; color:#e0e0e0; font-size:32px; text-align:right; padding:16px; border-radius:8px; margin-bottom:12px; }\n.teclado { display:grid; grid-template-columns:repeat(4,1fr); gap:8px; }\nbutton { padding:16px; font-size:18px; border:none; border-radius:8px; cursor:pointer; background:#1a1a2e; color:#fff; }\nbutton:hover { background:#00b4cc; }\n.btn-op { color:#00dffc; }\n.btn-eq { background:#00b4cc; }","js":"var display = document.getElementById('display');\nvar expr = '';\n\ndocument.querySelectorAll('button').forEach(function(btn) {\n  btn.addEventListener('click', function() {\n    var num = btn.dataset.num;\n    var op  = btn.dataset.op;\n    var act = btn.dataset.action;\n\n    if (num !== undefined) {\n      expr += num;\n      display.textContent = expr;\n    } else if (op) {\n      expr += op;\n      display.textContent = expr;\n    } else if (act === 'clear') {\n      expr = '';\n      display.textContent = '0';\n    } else if (act === 'calc') {\n      try {\n        var result = eval(expr);\n        display.textContent = isFinite(result) ? result : 'Erro';\n        expr = isFinite(result) ? String(result) : '';\n      } catch(e) {\n        display.textContent = 'Erro';\n        expr = '';\n      }\n    }\n  });\n});\n"}$json$);

-- Atualizar sequência
SELECT setval('tb_kanban_templates_id_seq', 14, true);
