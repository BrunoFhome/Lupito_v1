-- ════════════════════════════════════════════════════════════════════════════
-- TEMPLATES DE KANBAN — um por lição (20 no total)
-- ════════════════════════════════════════════════════════════════════════════

-- ── Lição 1: Introdução à Lógica e ao JavaScript ─────────────────────────────
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, challenge_instructions, starter_code) VALUES
(1,
 'Introdução à Lógica e ao JavaScript',
 'Primeiro contato com lógica de programação e com a sintaxe básica do JavaScript.',
 'Alta',
 1,
 'Use console.log() para imprimir uma mensagem de boas-vindas. Em seguida, descreva em um comentário o que é um algoritmo com suas próprias palavras.',
 $code$// Desafio: Primeiro programa em JavaScript
// 1. Imprima "Olá, mundo!" no console
// 2. Adicione um comentário explicando o que é um algoritmo

console.log("Olá, mundo!");

// Um algoritmo é:
// (escreva sua definição aqui)
$code$);

-- ── Lição 2: Variáveis e Tipos de Dados ──────────────────────────────────────
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, challenge_instructions, starter_code) VALUES
(2,
 'Variáveis e Tipos de Dados',
 'Aprendendo a armazenar informações em variáveis e identificar tipos básicos.',
 'Alta',
 2,
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
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, challenge_instructions, starter_code) VALUES
(3,
 'Operadores Matemáticos e Comparação',
 'Uso de operadores para cálculos e comparações no código.',
 'Média',
 3,
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
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, challenge_instructions, starter_code) VALUES
(4,
 'Estruturas Condicionais',
 'Tomada de decisão com if, else e else if.',
 'Alta',
 4,
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
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, challenge_instructions, starter_code) VALUES
(5,
 'Operadores Lógicos',
 'Combinação de condições com AND, OR e NOT.',
 'Média',
 5,
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
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, challenge_instructions, starter_code) VALUES
(6,
 'Laços de Repetição',
 'Automatizando tarefas repetitivas com for e while.',
 'Alta',
 6,
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
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, challenge_instructions, starter_code) VALUES
(7,
 'Funções',
 'Organizando o código em blocos reutilizáveis.',
 'Alta',
 7,
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
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, challenge_instructions, starter_code) VALUES
(8,
 'Arrays',
 'Armazenando coleções de valores em uma única estrutura.',
 'Média',
 8,
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
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, challenge_instructions, starter_code) VALUES
(9,
 'Objetos',
 'Representando entidades com propriedades e valores.',
 'Média',
 9,
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
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, challenge_instructions, starter_code) VALUES
(10,
 'Resolução de Problemas',
 'Aplicando lógica para interpretar e resolver desafios simples.',
 'Alta',
 10,
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

-- ── Lição 11: Introdução ao Desenvolvimento Web ──────────────────────────────
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, challenge_instructions, starter_code) VALUES
(11,
 'Introdução ao Desenvolvimento Web',
 'Visão geral sobre como páginas web funcionam e o papel de cada tecnologia.',
 'Baixa',
 11,
 'Usando console.log, explique o papel de cada tecnologia web (HTML, CSS e JavaScript). Imprima uma descrição resumida de cada uma.',
 $code$// Desafio: Papel de cada tecnologia web

var tecnologias = [
  { nome: "HTML",       papel: "Estrutura o conteúdo da página" },
  { nome: "CSS",        papel: "Estiliza a aparência dos elementos" },
  { nome: "JavaScript", papel: "Adiciona comportamento e interatividade" }
];

for (var i = 0; i < tecnologias.length; i++) {
  console.log(tecnologias[i].nome + ": " + tecnologias[i].papel);
}
$code$);

-- ── Lição 12: Estrutura Básica do HTML ───────────────────────────────────────
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, challenge_instructions, starter_code) VALUES
(12,
 'Estrutura Básica do HTML',
 'Aprendendo a criar a base de um documento HTML.',
 'Média',
 12,
 'Use JavaScript para representar a estrutura de um documento HTML como um objeto. Liste as tags principais (doctype, html, head, body) e descreva a função de cada uma.',
 $code$// Desafio: Estrutura do HTML representada em JavaScript

var estruturaHTML = {
  doctype: "Declara o tipo do documento como HTML5",
  html:    "Elemento raiz que envolve todo o conteúdo",
  head:    "Contém metadados, título e links para CSS/JS",
  body:    "Contém todo o conteúdo visível da página"
};

for (var tag in estruturaHTML) {
  console.log("<" + tag + ">: " + estruturaHTML[tag]);
}
$code$);

-- ── Lição 13: Textos e Elementos Semânticos ──────────────────────────────────
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, challenge_instructions, starter_code) VALUES
(13,
 'Textos e Elementos Semânticos',
 'Uso de títulos, parágrafos e tags semânticas.',
 'Baixa',
 13,
 'Crie um objeto que represente a estrutura semântica de uma página. Liste as tags semânticas (header, main, section, footer) e explique a finalidade de cada uma.',
 $code$// Desafio: Tags semânticas do HTML

var tagsSemânticas = [
  { tag: "header",  uso: "Cabeçalho da página ou seção" },
  { tag: "main",    uso: "Conteúdo principal da página" },
  { tag: "section", uso: "Seção temática do conteúdo" },
  { tag: "article", uso: "Conteúdo independente e reutilizável" },
  { tag: "footer",  uso: "Rodapé da página ou seção" }
];

tagsSemânticas.forEach(function(item) {
  console.log("<" + item.tag + "> — " + item.uso);
});
$code$);

-- ── Lição 14: Links e Imagens ────────────────────────────────────────────────
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, challenge_instructions, starter_code) VALUES
(14,
 'Links e Imagens',
 'Inserindo navegação e conteúdo visual em páginas web.',
 'Baixa',
 14,
 'Crie um array de objetos representando links de navegação (nome e url) e um array de objetos representando imagens (alt e src). Imprima ambos de forma legível.',
 $code$// Desafio: Links e imagens como objetos JS

var links = [
  { nome: "Início",   url: "index.html" },
  { nome: "Sobre",    url: "sobre.html" },
  { nome: "Contato",  url: "contato.html" }
];

var imagens = [
  { alt: "Logo da empresa", src: "logo.png" },
  { alt: "Banner principal", src: "banner.jpg" }
];

console.log("=== Links ===");
links.forEach(function(link) {
  console.log('<a href="' + link.url + '">' + link.nome + '</a>');
});

console.log("=== Imagens ===");
imagens.forEach(function(img) {
  console.log('<img src="' + img.src + '" alt="' + img.alt + '">');
});
$code$);

-- ── Lição 15: Listas e Tabelas ───────────────────────────────────────────────
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, challenge_instructions, starter_code) VALUES
(15,
 'Listas e Tabelas',
 'Organizando informações em listas ordenadas, não ordenadas e tabelas.',
 'Média',
 15,
 'Crie um array de linguagens de programação e imprima como lista não ordenada. Depois crie um array de objetos com nome e ano de criação, imprimindo como tabela no console.',
 $code$// Desafio: Listas e tabelas em JavaScript

var linguagens = ["JavaScript", "Python", "Java", "C#", "PHP"];

console.log("=== Lista não ordenada ===");
linguagens.forEach(function(lang) {
  console.log("• " + lang);
});

var tabela = [
  { nome: "JavaScript", ano: 1995 },
  { nome: "Python",     ano: 1991 },
  { nome: "Java",       ano: 1995 }
];

console.log("\n=== Tabela ===");
console.log("Nome          | Ano");
console.log("--------------|-----");
tabela.forEach(function(linha) {
  console.log(linha.nome.padEnd(14) + "| " + linha.ano);
});
$code$);

-- ── Lição 16: Fundamentos do CSS ─────────────────────────────────────────────
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, challenge_instructions, starter_code) VALUES
(16,
 'Fundamentos do CSS',
 'Primeiros passos na estilização de páginas web.',
 'Média',
 16,
 'Crie um objeto representando o estilo de um botão com as propriedades: backgroundColor, color, fontSize, padding e borderRadius. Imprima cada propriedade CSS.',
 $code$// Desafio: Estilos CSS como objeto JavaScript

var estilosBotao = {
  backgroundColor: "#00b4cc",
  color:           "white",
  fontSize:        "16px",
  padding:         "12px 24px",
  borderRadius:    "8px",
  border:          "none",
  cursor:          "pointer"
};

console.log("=== Estilos do Botão ===");
for (var propriedade in estilosBotao) {
  console.log(propriedade + ": " + estilosBotao[propriedade] + ";");
}
$code$);

-- ── Lição 17: Seletores e Classes ────────────────────────────────────────────
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, challenge_instructions, starter_code) VALUES
(17,
 'Seletores e Classes',
 'Aplicando estilos em elementos específicos da página.',
 'Média',
 17,
 'Crie um array de seletores CSS com tipo (tag, class, id) e exemplo. Filtre e imprima apenas os seletores do tipo "class". Use indexOf ou includes para identificar o tipo.',
 $code$// Desafio: Identificando tipos de seletores CSS

var seletores = [
  { tipo: "tag",   exemplo: "p",            descricao: "Seleciona todas as tags <p>" },
  { tipo: "class", exemplo: ".btn-primary", descricao: "Seleciona elementos com classe btn-primary" },
  { tipo: "id",    exemplo: "#header",      descricao: "Seleciona o elemento com id header" },
  { tipo: "class", exemplo: ".card",        descricao: "Seleciona elementos com classe card" },
  { tipo: "tag",   exemplo: "h1",           descricao: "Seleciona todas as tags <h1>" }
];

console.log("=== Seletores de Classe ===");
seletores
  .filter(function(s) { return s.tipo === "class"; })
  .forEach(function(s) {
    console.log(s.exemplo + " — " + s.descricao);
  });
$code$);

-- ── Lição 18: Box Model e Espaçamentos ───────────────────────────────────────
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, challenge_instructions, starter_code) VALUES
(18,
 'Box Model e Espaçamentos',
 'Entendendo margin, padding, border e content.',
 'Baixa',
 18,
 'Crie uma função que simule o cálculo da largura total de um elemento com base no Box Model (content + padding esquerdo/direito + border esquerda/direita + margin esquerda/direita).',
 $code$// Desafio: Cálculo do Box Model

function calcularLarguraTotal(boxModel) {
  var total = boxModel.content
    + boxModel.paddingLeft  + boxModel.paddingRight
    + boxModel.borderLeft   + boxModel.borderRight
    + boxModel.marginLeft   + boxModel.marginRight;
  return total;
}

var elemento = {
  content:      200,
  paddingLeft:   16,
  paddingRight:  16,
  borderLeft:     2,
  borderRight:    2,
  marginLeft:    12,
  marginRight:   12
};

console.log("Largura do conteúdo:", elemento.content + "px");
console.log("Largura total (box model):", calcularLarguraTotal(elemento) + "px");
$code$);

-- ── Lição 19: Introdução ao JavaScript no HTML ───────────────────────────────
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, challenge_instructions, starter_code) VALUES
(19,
 'Introdução ao JavaScript no HTML',
 'Conectando scripts à página para adicionar comportamento.',
 'Alta',
 19,
 'Simule a manipulação do DOM usando JavaScript puro. Crie um objeto que represente um elemento HTML, atualize seu textContent e className, e imprima o estado antes e depois.',
 $code$// Desafio: Simulando manipulação do DOM

var elemento = {
  tag:         "button",
  id:          "meu-botao",
  className:   "btn",
  textContent: "Clique aqui"
};

console.log("=== Antes ===");
console.log(elemento);

// Simulando alterações via JavaScript
elemento.textContent = "Botão clicado!";
elemento.className   = "btn btn-ativo";

console.log("=== Depois ===");
console.log(elemento);
$code$);

-- ── Lição 20: Eventos e Interatividade ───────────────────────────────────────
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, challenge_instructions, starter_code) VALUES
(20,
 'Eventos e Interatividade',
 'Criando páginas que respondem às ações do usuário.',
 'Alta',
 20,
 'Simule um sistema de eventos usando JavaScript. Crie um objeto contador com um valor inicial de 0 e funções para incrementar, decrementar e resetar. Teste cada função e imprima o estado.',
 $code$// Desafio: Simulando eventos com um contador

var contador = {
  valor: 0,

  incrementar: function() {
    this.valor++;
    console.log("Incrementado:", this.valor);
  },

  decrementar: function() {
    this.valor--;
    console.log("Decrementado:", this.valor);
  },

  resetar: function() {
    this.valor = 0;
    console.log("Resetado:", this.valor);
  }
};

contador.incrementar();
contador.incrementar();
contador.incrementar();
contador.decrementar();
contador.resetar();
$code$);

-- ════════════════════════════════════════════════════════════════════════════
-- RESET DE SEQUENCE
-- ════════════════════════════════════════════════════════════════════════════

SELECT setval('tb_kanban_templates_id_seq', (SELECT MAX(id) FROM tb_kanban_templates));
