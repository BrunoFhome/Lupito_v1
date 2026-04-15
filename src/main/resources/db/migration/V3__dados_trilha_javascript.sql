INSERT INTO tb_sections (id, title, list_order, course_id) VALUES
(1,  'Introdução ao JavaScript',       1,  1),
(2,  'Como usar JS no HTML',           2,  1),
(3,  'Saída de Dados',                 3,  1),
(4,  'Sintaxe',                        4,  1),
(5,  'Variáveis',                      5,  1),
(6,  'Tipos de Dados',                 6,  1),
(7,  'Operadores',                     7,  1),
(8,  'Condicionais',                   8,  1),
(9,  'Loops',                          9,  1),
(10, 'Funções',                        10, 1),
(11, 'DOM',                            11, 1),
(12, 'Eventos',                        12, 1);


INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(1, 'O que é JavaScript',
$t$<p>JavaScript é a linguagem de programação da web. Ela roda diretamente no navegador, sem precisar instalar nada.</p>
<p>Com JavaScript você pode tornar páginas interativas: responder cliques, mostrar mensagens, alterar conteúdo e muito mais.</p>
<p>JavaScript também roda fora do navegador, em servidores, usando o <strong>Node.js</strong>.</p>$t$,
$code$// JavaScript roda no navegador — abra o console com F12
console.log("Olá! Eu sou JavaScript.");

// Você pode fazer cálculos
console.log(2 + 3);   // 5

// E trabalhar com texto
console.log("Meu nome é JS!");$code$,
'javascript', 1, 1),

(2, 'JavaScript na web',
$t$<p>O HTML cria a estrutura da página, o CSS cuida da aparência e o <strong>JavaScript adiciona comportamento</strong>.</p>
<p>Eles trabalham juntos: o HTML cria um botão, o CSS o estiliza, e o JavaScript faz algo acontecer quando ele é clicado.</p>
<ul>
  <li><strong>HTML</strong> — estrutura</li>
  <li><strong>CSS</strong> — estilo</li>
  <li><strong>JavaScript</strong> — comportamento</li>
</ul>$t$,
$code$// O HTML cria elementos, o JS os controla
// Exemplo: alterar o texto de um parágrafo
document.getElementById("titulo").textContent = "Olá, JavaScript!";

// Exemplo: mudar a cor de fundo da página
document.body.style.backgroundColor = "#f0f0f0";$code$,
'javascript', 2, 1),

(3, 'Seu primeiro programa',
$t$<p>Todo programador começa com um programa simples. Em JavaScript, o mais básico é exibir uma mensagem.</p>
<p>Usamos <code>console.log()</code> para mostrar mensagens no console do navegador (pressione F12 para abrir).</p>
<p>Tente escrever seu próprio <code>console.log</code> com uma mensagem personalizada!</p>$t$,
$code$// Seu primeiro programa em JavaScript!
console.log("Hello, JavaScript!");

// Você pode exibir números também
console.log(42);

// E várias mensagens seguidas
console.log("Linha 1");
console.log("Linha 2");
console.log("Linha 3");$code$,
'javascript', 3, 1);

INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(4, 'Script na página',
$t$<p>Para adicionar JavaScript em uma página HTML, usamos a tag <code>&lt;script&gt;</code>.</p>
<p>Você pode escrever o JavaScript diretamente dentro dessa tag — isso é chamado de <strong>script inline</strong>.</p>
<pre><code>&lt;script&gt;
  console.log("Olá!");
&lt;/script&gt;</code></pre>$t$,
$code$<!-- Exemplo de script inline no HTML -->
<!DOCTYPE html>
<html>
<body>
  <h1>Minha Página</h1>

  <script>
    console.log("Script carregado!");
    alert("Bem-vindo à página!");
  </script>
</body>
</html>$code$,
'html', 1, 2),

(5, 'Arquivo externo',
$t$<p>A forma mais organizada de usar JavaScript é em um <strong>arquivo separado</strong> com extensão <code>.js</code>.</p>
<p>Para conectar o arquivo à página HTML, usamos a tag <code>&lt;script&gt;</code> com o atributo <code>src</code>:</p>
<pre><code>&lt;script src="script.js"&gt;&lt;/script&gt;</code></pre>
<p>Dessa forma o código JS fica separado do HTML, deixando tudo mais organizado.</p>$t$,
$code$<!-- index.html -->
<!DOCTYPE html>
<html>
<body>
  <h1>Página com JS externo</h1>
  <script src="script.js"></script>
</body>
</html>

/* script.js */
console.log("Arquivo externo carregado!");$code$,
'html', 2, 2),

(6, 'Onde colocar o script',
$t$<p>A posição da tag <code>&lt;script&gt;</code> no HTML importa. Se colocada no <code>&lt;head&gt;</code>, o script é carregado antes do conteúdo da página.</p>
<p>O mais recomendado para iniciantes é colocar o <code>&lt;script&gt;</code> <strong>antes do fechamento do &lt;/body&gt;</strong>. Assim a página carrega primeiro e o JS já encontra todos os elementos prontos.</p>$t$,
$code$<!DOCTYPE html>
<html>
<head>
  <title>Minha Página</title>
  <!-- NÃO recomendado: script aqui carrega antes do HTML -->
  <!-- <script src="script.js"></script> -->
</head>
<body>
  <h1>Conteúdo da Página</h1>
  <p>Parágrafo de exemplo.</p>

  <!-- RECOMENDADO: script no final do body -->
  <script src="script.js"></script>
</body>
</html>$code$,
'html', 3, 2);


INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(7, 'console.log',
$t$<p><code>console.log()</code> é a função mais usada para exibir informações durante o desenvolvimento.</p>
<p>Ela mostra o resultado no <strong>console do navegador</strong> (F12 → aba Console). É ideal para depurar código e entender o que está acontecendo.</p>
<p>Você pode passar texto, números, variáveis ou expressões para o <code>console.log()</code>.</p>$t$,
$code$console.log("Texto simples");
console.log(100);
console.log(true);

// Múltiplos valores de uma vez
console.log("Nome:", "Ana", "Idade:", 25);

// Resultado de uma expressão
console.log(10 + 5);   // 15
console.log(3 * 4);    // 12$code$,
'javascript', 1, 3),

(8, 'alert e prompt',
$t$<p>O <code>alert()</code> exibe uma caixa de diálogo com uma mensagem na tela.</p>
<p>O <code>prompt()</code> exibe uma caixa onde o usuário pode digitar algo — o valor digitado é retornado como texto.</p>
<p>Essas funções são úteis para interações rápidas, mas em aplicações modernas usamos elementos HTML para isso.</p>$t$,
$code$// alert: mostra uma mensagem
alert("Bem-vindo ao site!");

// prompt: pede uma informação ao usuário
let nome = prompt("Qual é o seu nome?");
console.log("Olá, " + nome + "!");

// confirm: pergunta sim/não (retorna true ou false)
let confirmou = confirm("Deseja continuar?");
console.log(confirmou);  // true ou false$code$,
'javascript', 2, 3),

(9, 'innerHTML',
$t$<p>Com JavaScript podemos alterar o conteúdo de elementos HTML diretamente, usando a propriedade <code>innerHTML</code>.</p>
<p>Primeiro selecionamos o elemento com <code>getElementById()</code>, depois atribuímos um novo valor ao <code>innerHTML</code>.</p>
<p>Isso permite atualizar a página sem precisar recarregá-la!</p>$t$,
$code$// HTML: <p id="mensagem">Texto original</p>

// JavaScript:
let elemento = document.getElementById("mensagem");
elemento.innerHTML = "Texto alterado pelo JavaScript!";

// Podemos usar HTML dentro também
elemento.innerHTML = "<strong>Texto em negrito!</strong>";

// Ou usar textContent para texto puro (sem HTML)
elemento.textContent = "Apenas texto, sem HTML";$code$,
'javascript', 3, 3);


INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(10, 'Case-sensitivity e ponto e vírgula',
$t$<p>JavaScript é <strong>case-sensitive</strong>: isso significa que letras maiúsculas e minúsculas fazem diferença.</p>
<p><code>nome</code>, <code>Nome</code> e <code>NOME</code> são três variáveis completamente diferentes.</p>
<p>O <strong>ponto e vírgula</strong> (<code>;</code>) marca o fim de uma instrução. Embora opcional em muitos casos, usá-lo é uma boa prática para evitar comportamentos inesperados.</p>$t$,
$code$// Case-sensitive: estas são variáveis DIFERENTES
let nome = "Ana";
let Nome = "Bruno";
let NOME = "Carlos";

console.log(nome);  // Ana
console.log(Nome);  // Bruno
console.log(NOME);  // Carlos

// Ponto e vírgula — boas práticas
let x = 10;
let y = 20;
console.log(x + y);  // 30$code$,
'javascript', 1, 4),

(11, 'Comentários',
$t$<p>Comentários são trechos de código que o JavaScript <strong>ignora completamente</strong>. Eles servem para explicar o código para humanos.</p>
<ul>
  <li><code>//</code> — comentário de uma linha</li>
  <li><code>/* */</code> — comentário de várias linhas</li>
</ul>
<p>Bons comentários explicam o <em>porquê</em> de uma decisão, não apenas o que o código faz.</p>$t$,
$code$// Este é um comentário de uma linha — JS ignora isso

let idade = 18; // comentário no final da linha também funciona

/*
  Este é um comentário de bloco.
  Pode ocupar várias linhas.
  Útil para explicações longas.
*/

// Comentários também servem para desativar código temporariamente:
// console.log("Esta linha está desativada");
console.log("Esta linha está ativa");$code$,
'javascript', 2, 4),

(12, 'Palavras reservadas',
$t$<p><strong>Palavras reservadas</strong> são palavras que o JavaScript já usa internamente e que não podem ser usadas como nomes de variáveis ou funções.</p>
<p>Exemplos: <code>let</code>, <code>const</code>, <code>var</code>, <code>if</code>, <code>else</code>, <code>for</code>, <code>while</code>, <code>function</code>, <code>return</code>, <code>true</code>, <code>false</code>, <code>null</code>.</p>
<p>Se tentar usar uma palavra reservada como nome de variável, o JavaScript dará um erro de sintaxe.</p>$t$,
$code$// CORRETO: nomes de variáveis válidos
let nome = "Ana";
let minhaIdade = 20;
let _valor = 100;
let $preco = 9.99;

// ERRADO: palavras reservadas não podem ser nomes de variáveis
// let if = 5;       ← ERRO!
// let return = 10;  ← ERRO!
// let for = "algo"; ← ERRO!

// CORRETO: combinar palavras reservadas com outras letras é ok
let ifCondition = true;
let returnValue = 42;
console.log(nome, minhaIdade);$code$,
'javascript', 3, 4);


INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(13, 'var, let e const',
$t$<p>Existem três formas de declarar variáveis em JavaScript:</p>
<ul>
  <li><code>var</code> — forma antiga, tem comportamentos problemáticos. Evite.</li>
  <li><code>let</code> — forma moderna. O valor pode ser alterado depois.</li>
  <li><code>const</code> — o valor <strong>não pode ser reatribuído</strong> após a declaração.</li>
</ul>
<p>Na dúvida, use <code>const</code> por padrão e <code>let</code> quando precisar mudar o valor.</p>$t$,
$code$// const: valor fixo — não pode ser reatribuído
const PI = 3.14159;
const linguagem = "JavaScript";
// PI = 3; ← ERRO! const não permite reatribuição

// let: valor pode mudar
let pontos = 0;
pontos = pontos + 10;
pontos = 50;
console.log(pontos);  // 50

// var: evite usar (comportamento inesperado em alguns casos)
var antigo = "não recomendado";$code$,
'javascript', 1, 5),

(14, 'Declaração e atribuição',
$t$<p><strong>Declarar</strong> uma variável é criar ela com um nome. <strong>Atribuir</strong> é colocar um valor dentro dela.</p>
<p>Você pode declarar e atribuir na mesma linha, ou em linhas separadas.</p>
<p>O operador de atribuição é o <code>=</code> (um sinal de igual). Não confunda com <code>==</code> que é comparação!</p>$t$,
$code$// Declaração e atribuição juntas (mais comum)
let nome = "Carlos";
let idade = 30;

// Declaração sem valor (variável fica "undefined")
let cidade;
console.log(cidade);  // undefined

// Atribuição depois da declaração
cidade = "São Paulo";
console.log(cidade);  // São Paulo

// Reatribuição: troca o valor
idade = 31;
console.log(idade);  // 31$code$,
'javascript', 2, 5),

(15, 'Nomenclatura de variáveis',
$t$<p>As regras para nomear variáveis em JavaScript:</p>
<ul>
  <li>Pode conter letras, números, <code>_</code> e <code>$</code></li>
  <li>Deve começar com letra, <code>_</code> ou <code>$</code> — nunca com número</li>
  <li>Não pode ter espaços</li>
  <li>Não pode ser uma palavra reservada</li>
</ul>
<p>A convenção usada em JavaScript é o <strong>camelCase</strong>: primeira palavra em minúsculo, palavras seguintes com inicial maiúscula. Ex: <code>minhaVariavel</code>, <code>nomeDoUsuario</code>.</p>$t$,
$code$// VÁLIDOS — seguem as regras
let nomeCompleto = "Ana Silva";
let idadeDoUsuario = 25;
let _privado = true;
let $elemento = null;
let item3 = "terceiro";

// camelCase — convenção JavaScript
let firstName = "João";
let lastName = "Souza";
let emailAddress = "joao@email.com";

// INVÁLIDOS — causam erro
// let 3itens = [];    ← começa com número
// let meu nome = "";  ← tem espaço
// let if = 1;         ← palavra reservada

console.log(nomeCompleto, idadeDoUsuario);$code$,
'javascript', 3, 5);


INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(16, 'String e Number',
$t$<p><strong>String</strong> representa texto. Deve estar entre aspas simples, duplas ou crases:</p>
<ul>
  <li><code>"texto"</code>, <code>''texto''</code>, <code>`texto`</code></li>
</ul>
<p><strong>Number</strong> representa números — inteiros ou decimais. Não usa aspas:</p>
<ul>
  <li><code>42</code>, <code>3.14</code>, <code>-10</code></li>
</ul>
<p>Atenção: <code>"42"</code> (string) é diferente de <code>42</code> (number)!</p>$t$,
$code$// Strings — texto entre aspas
let nome = "Ana";
let cidade = 'São Paulo';
let frase = `Olá, ${nome}!`;  // template literal com crase

// Numbers — sem aspas
let idade = 25;
let altura = 1.75;
let temperatura = -5;

// "42" (string) vs 42 (number) — são diferentes!
console.log("42" + 1);  // "421" ← concatenação de texto!
console.log(42 + 1);    // 43   ← soma numérica$code$,
'javascript', 1, 6),

(17, 'Boolean, null e undefined',
$t$<p><strong>Boolean</strong> representa verdadeiro ou falso: <code>true</code> ou <code>false</code>. Muito usado em condições.</p>
<p><strong>null</strong> representa a ausência intencional de valor — você atribui null quando quer dizer "vazio de propósito".</p>
<p><strong>undefined</strong> significa que a variável foi declarada mas nenhum valor foi atribuído a ela ainda.</p>$t$,
$code$// Boolean
let logado = true;
let premium = false;

// null — vazio intencionalmente
let usuario = null;  // ainda não temos usuário

// undefined — variável sem valor
let resultado;
console.log(resultado);  // undefined

// Diferença:
console.log(null == undefined);   // true  (ambos "vazios")
console.log(null === undefined);  // false (tipos diferentes!)$code$,
'javascript', 2, 6),

(18, 'typeof',
$t$<p>O operador <code>typeof</code> retorna uma <strong>string</strong> com o nome do tipo de um valor.</p>
<p>É muito útil para verificar o tipo de uma variável antes de usá-la.</p>
<p>Resultados possíveis: <code>"string"</code>, <code>"number"</code>, <code>"boolean"</code>, <code>"undefined"</code>, <code>"object"</code> (para null, arrays e objetos), <code>"function"</code>.</p>$t$,
$code$console.log(typeof "Olá");        // "string"
console.log(typeof 42);           // "number"
console.log(typeof 3.14);         // "number"
console.log(typeof true);         // "boolean"
console.log(typeof false);        // "boolean"
console.log(typeof undefined);    // "undefined"
console.log(typeof null);         // "object" ← bug histórico do JS!

// Usando typeof para verificar antes de operar
let valor = "10";
if (typeof valor === "string") {
  console.log("É um texto:", valor);
}$code$,
'javascript', 3, 6);

-- ── Seção 7: Operadores ───────────────────────────────────────────────────────
INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(19, 'Operadores aritméticos',
$t$<p>Os operadores aritméticos realizam cálculos matemáticos:</p>
<ul>
  <li><code>+</code> soma &nbsp;&nbsp; <code>-</code> subtração</li>
  <li><code>*</code> multiplicação &nbsp;&nbsp; <code>/</code> divisão</li>
  <li><code>%</code> resto da divisão (módulo)</li>
  <li><code>**</code> potência</li>
</ul>
<p>O operador <code>%</code> retorna o <strong>resto</strong> de uma divisão inteira. Exemplo: <code>10 % 3 = 1</code> (10 dividido por 3 dá 3 com resto 1).</p>$t$,
$code$let a = 10;
let b = 3;

console.log(a + b);   // 13
console.log(a - b);   // 7
console.log(a * b);   // 30
console.log(a / b);   // 3.333...
console.log(a % b);   // 1  (resto de 10 ÷ 3)
console.log(a ** b);  // 1000 (10³)

// Útil: verificar se um número é par (resto 0)
let numero = 8;
console.log(numero % 2);  // 0 → par
console.log(7 % 2);       // 1 → ímpar$code$,
'javascript', 1, 7),

(20, 'Operadores de comparação e lógicos',
$t$<p><strong>Operadores de comparação</strong> comparam dois valores e retornam <code>true</code> ou <code>false</code>:</p>
<ul>
  <li><code>===</code> igual (valor e tipo) &nbsp; <code>!==</code> diferente</li>
  <li><code>&gt;</code> maior &nbsp; <code>&lt;</code> menor &nbsp; <code>&gt;=</code> maior ou igual &nbsp; <code>&lt;=</code> menor ou igual</li>
</ul>
<p><strong>Operadores lógicos</strong> combinam condições:</p>
<ul>
  <li><code>&&</code> E (ambas verdadeiras) &nbsp; <code>||</code> OU (uma verdadeira) &nbsp; <code>!</code> NÃO</li>
</ul>$t$,
$code$// Comparação
console.log(5 === 5);    // true
console.log(5 === "5");  // false (tipos diferentes)
console.log(10 > 3);     // true
console.log(2 <= 2);     // true

// Lógicos
let idade = 20;
console.log(idade >= 18 && idade < 65);  // true (adulto)
console.log(idade < 12 || idade > 60);  // false

// NOT (!) inverte o valor
console.log(!true);   // false
console.log(!false);  // true$code$,
'javascript', 2, 7),

(21, 'Operadores de atribuição',
$t$<p>Além do <code>=</code> básico, existem operadores que <strong>combinam atribuição com operação</strong>:</p>
<ul>
  <li><code>+=</code> soma e atribui: <code>x += 3</code> é o mesmo que <code>x = x + 3</code></li>
  <li><code>-=</code> subtrai e atribui</li>
  <li><code>*=</code> multiplica e atribui</li>
  <li><code>/=</code> divide e atribui</li>
  <li><code>++</code> incrementa em 1 &nbsp; <code>--</code> decrementa em 1</li>
</ul>$t$,
$code$let pontos = 10;

pontos += 5;   // pontos = pontos + 5 → 15
console.log(pontos);  // 15

pontos -= 3;   // 15 - 3 = 12
console.log(pontos);  // 12

pontos *= 2;   // 12 * 2 = 24
console.log(pontos);  // 24

pontos /= 4;   // 24 / 4 = 6
console.log(pontos);  // 6

// Incremento e decremento
let contador = 0;
contador++;   // 1
contador++;   // 2
contador--;   // 1
console.log(contador);  // 1$code$,
'javascript', 3, 7);

-- ── Seção 8: Condicionais ─────────────────────────────────────────────────────
INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(22, 'if e else',
$t$<p>O <code>if</code> executa um bloco de código <strong>somente se</strong> uma condição for verdadeira.</p>
<p>O <code>else</code> é executado quando a condição do <code>if</code> for falsa — é o "caso contrário".</p>
<pre><code>if (condição) {
  // executa se verdadeiro
} else {
  // executa se falso
}</code></pre>$t$,
$code$let hora = 14;

if (hora < 12) {
  console.log("Bom dia!");
} else {
  console.log("Boa tarde!");
}

// Outro exemplo
let saldo = 150;
let preco = 200;

if (saldo >= preco) {
  console.log("Compra realizada!");
} else {
  console.log("Saldo insuficiente.");
}$code$,
'javascript', 1, 8),

(23, 'else if e switch',
$t$<p>Quando há <strong>mais de duas possibilidades</strong>, usamos <code>else if</code> para encadear condições.</p>
<p>O <code>switch</code> é uma alternativa quando comparamos uma variável com <strong>vários valores fixos</strong>. Cada caso usa <code>case</code> e termina com <code>break</code>.</p>$t$,
$code$// else if: múltiplas condições
let nota = 75;

if (nota >= 90) {
  console.log("A");
} else if (nota >= 80) {
  console.log("B");
} else if (nota >= 70) {
  console.log("C");
} else {
  console.log("Reprovado");
}
// Resultado: C

// switch: comparar com valores fixos
let dia = "segunda";
switch (dia) {
  case "segunda":
    console.log("Início da semana");
    break;
  case "sexta":
    console.log("Quase fim de semana!");
    break;
  default:
    console.log("Dia comum");
}$code$,
'javascript', 2, 8),

(24, 'Operador ternário',
$t$<p>O <strong>operador ternário</strong> é uma forma compacta de escrever um <code>if/else</code> simples em uma linha.</p>
<pre><code>condição ? valorSeVerdadeiro : valorSeFalso</code></pre>
<p>Use quando a lógica for simples. Para condições complexas, prefira o <code>if/else</code> tradicional por clareza.</p>$t$,
$code$// if/else tradicional
let idade = 20;
let mensagem;
if (idade >= 18) {
  mensagem = "Maior de idade";
} else {
  mensagem = "Menor de idade";
}

// Equivalente com ternário (mais compacto)
let msg = idade >= 18 ? "Maior de idade" : "Menor de idade";
console.log(msg);  // Maior de idade

// Outros exemplos
let logado = true;
let status = logado ? "Online" : "Offline";
console.log(status);  // Online$code$,
'javascript', 3, 8);

-- ── Seção 9: Loops ────────────────────────────────────────────────────────────
INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(25, 'Loop for',
$t$<p>O loop <code>for</code> repete um bloco de código um <strong>número definido de vezes</strong>.</p>
<p>Ele tem três partes separadas por <code>;</code>:</p>
<ul>
  <li><strong>Inicialização</strong>: <code>let i = 0</code> — cria e inicializa o contador</li>
  <li><strong>Condição</strong>: <code>i &lt; 5</code> — enquanto verdadeiro, continua</li>
  <li><strong>Incremento</strong>: <code>i++</code> — avança o contador a cada repetição</li>
</ul>$t$,
$code$// Contar de 1 a 5
for (let i = 1; i <= 5; i++) {
  console.log(i);
}
// Exibe: 1, 2, 3, 4, 5

// Contar de 0 a 9
for (let i = 0; i < 10; i++) {
  console.log(i);
}

// Múltiplos de 2 até 10
for (let i = 2; i <= 10; i += 2) {
  console.log(i);  // 2, 4, 6, 8, 10
}$code$,
'javascript', 1, 9),

(26, 'while e do-while',
$t$<p>O <code>while</code> repete enquanto a condição for verdadeira. Diferente do <code>for</code>, é ideal quando <strong>não sabemos quantas vezes</strong> vamos repetir.</p>
<p>O <code>do-while</code> é semelhante, mas <strong>executa o bloco ao menos uma vez</strong>, verificando a condição só depois.</p>$t$,
$code$// while: verifica antes de executar
let contador = 1;
while (contador <= 3) {
  console.log("Contagem:", contador);
  contador++;
}
// Exibe: 1, 2, 3

// do-while: executa ao menos uma vez
let tentativas = 0;
do {
  tentativas++;
  console.log("Tentativa:", tentativas);
} while (tentativas < 3);
// Exibe: 1, 2, 3$code$,
'javascript', 2, 9),

(27, 'break e continue',
$t$<p><code>break</code> <strong>encerra o loop</strong> imediatamente, mesmo que a condição ainda seja verdadeira.</p>
<p><code>continue</code> <strong>pula a iteração atual</strong> e vai para a próxima, sem encerrar o loop.</p>$t$,
$code$// break: para o loop quando encontra o número 3
for (let i = 1; i <= 5; i++) {
  if (i === 3) break;
  console.log(i);
}
// Exibe: 1, 2

// continue: pula o número 3
for (let i = 1; i <= 5; i++) {
  if (i === 3) continue;
  console.log(i);
}
// Exibe: 1, 2, 4, 5$code$,
'javascript', 3, 9);

-- ── Seção 10: Funções ─────────────────────────────────────────────────────────
INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(28, 'Declaração e chamada de função',
$t$<p>Uma <strong>função</strong> é um bloco de código com nome que você pode executar quantas vezes quiser.</p>
<p>Criamos (declaramos) a função com a palavra <code>function</code> seguida do nome e <code>()</code>. Para executá-la, escrevemos o nome com <code>()</code> — isso é chamado de <strong>chamar</strong> a função.</p>$t$,
$code$// Declaração da função
function saudar() {
  console.log("Olá! Bem-vindo!");
}

// Chamada da função — executa o bloco acima
saudar();  // Olá! Bem-vindo!
saudar();  // podemos chamar quantas vezes quisermos
saudar();

// Funções organizam e reutilizam código
function mostrarSeparador() {
  console.log("-------------------");
}

mostrarSeparador();
console.log("Conteúdo");
mostrarSeparador();$code$,
'javascript', 1, 10),

(29, 'Parâmetros e retorno',
$t$<p><strong>Parâmetros</strong> são variáveis que a função recebe ao ser chamada. Permitem que a função trabalhe com valores diferentes a cada chamada.</p>
<p><code>return</code> envia um valor de volta para quem chamou a função. Após o <code>return</code>, a função para de executar.</p>$t$,
$code$// Função com parâmetros
function saudar(nome) {
  console.log("Olá, " + nome + "!");
}
saudar("Ana");    // Olá, Ana!
saudar("Bruno");  // Olá, Bruno!

// Função com retorno
function somar(a, b) {
  return a + b;
}

let resultado = somar(3, 7);
console.log(resultado);  // 10
console.log(somar(10, 20));  // 30$code$,
'javascript', 2, 10),

(30, 'Arrow functions',
$t$<p>As <strong>arrow functions</strong> são uma forma mais curta de escrever funções, introduzida no ES6.</p>
<p>Em vez de <code>function</code>, usamos <code>=&gt;</code> (seta). Para funções de uma linha, podemos omitir as chaves e o <code>return</code>.</p>
<pre><code>const nome = (param) =&gt; expressao;</code></pre>$t$,
$code$// Função tradicional
function dobrar(x) {
  return x * 2;
}

// Arrow function equivalente
const dobrarArrow = (x) => x * 2;

// Com um só parâmetro, os parênteses são opcionais
const triplicar = x => x * 3;

// Com múltiplos parâmetros
const somar = (a, b) => a + b;

console.log(dobrar(5));       // 10
console.log(dobrarArrow(5));  // 10
console.log(triplicar(4));    // 12
console.log(somar(3, 7));     // 10$code$,
'javascript', 3, 10);

-- ── Seção 11: DOM ─────────────────────────────────────────────────────────────
INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(31, 'O que é o DOM',
$t$<p>DOM significa <strong>Document Object Model</strong>. É a representação da página HTML como uma árvore de objetos que o JavaScript pode manipular.</p>
<p>Quando o navegador carrega uma página HTML, ele cria o DOM — uma estrutura em memória com todos os elementos da página. O JavaScript acessa e altera essa estrutura.</p>
<p>O objeto principal é o <code>document</code>, que representa a página inteira.</p>$t$,
$code$// O objeto document representa a página
console.log(document.title);  // título da aba

// Verificar o tipo do document
console.log(typeof document);  // "object"

// A estrutura do DOM é uma árvore:
// document
//   └── html
//       ├── head
//       │   └── title
//       └── body
//           ├── h1
//           └── p

console.log(document.body);  // o elemento <body>$code$,
'javascript', 1, 11),

(32, 'Selecionar elementos',
$t$<p>Para manipular um elemento da página, primeiro precisamos <strong>selecioná-lo</strong>. Os principais métodos são:</p>
<ul>
  <li><code>getElementById("id")</code> — seleciona pelo ID</li>
  <li><code>querySelector(".classe")</code> — seleciona o primeiro que combine com o seletor CSS</li>
  <li><code>querySelectorAll("p")</code> — seleciona todos que combinam</li>
</ul>$t$,
$code$// HTML: <h1 id="titulo">Olá</h1>
//        <p class="texto">Parágrafo</p>

// Selecionar pelo ID
let titulo = document.getElementById("titulo");
console.log(titulo);  // <h1 id="titulo">Olá</h1>

// Selecionar pelo seletor CSS (primeiro encontrado)
let paragrafo = document.querySelector(".texto");
let qualquerP  = document.querySelector("p");

// Selecionar todos os elementos <p> da página
let todosParagrafos = document.querySelectorAll("p");
console.log(todosParagrafos.length);  // quantidade de parágrafos$code$,
'javascript', 2, 11),

(33, 'Modificar conteúdo',
$t$<p>Depois de selecionar um elemento, podemos alterar seu conteúdo e estilo com JavaScript.</p>
<ul>
  <li><code>innerHTML</code> — define o conteúdo HTML interno</li>
  <li><code>textContent</code> — define apenas o texto (sem HTML)</li>
  <li><code>style.propriedade</code> — altera estilos CSS inline</li>
</ul>$t$,
$code$// HTML: <p id="msg">Texto original</p>

let el = document.getElementById("msg");

// Alterar texto
el.textContent = "Texto novo!";

// Alterar conteúdo HTML
el.innerHTML = "<strong>Texto em negrito!</strong>";

// Alterar estilo
el.style.color = "blue";
el.style.fontSize = "20px";
el.style.backgroundColor = "#f0f0f0";

// Alterar atributos
let img = document.querySelector("img");
img.src = "nova-imagem.jpg";
img.alt = "Nova descrição";$code$,
'javascript', 3, 11);

-- ── Seção 12: Eventos ─────────────────────────────────────────────────────────
INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(34, 'O que são eventos',
$t$<p><strong>Eventos</strong> são ações que acontecem na página: o usuário clicou, moveu o mouse, pressionou uma tecla, a página terminou de carregar, etc.</p>
<p>JavaScript pode <strong>detectar e responder</strong> a esses eventos, tornando a página interativa.</p>
<p>Exemplos de eventos: <code>click</code>, <code>mouseover</code>, <code>keydown</code>, <code>submit</code>, <code>load</code>.</p>$t$,
$code$// Eventos são ações que ocorrem na página
// Exemplos comuns:
// - click: usuário clicou em algo
// - mouseover: mouse passou sobre um elemento
// - keydown: tecla foi pressionada
// - submit: formulário foi enviado
// - load: página terminou de carregar

// Reagir quando a página carregar completamente:
window.addEventListener("load", () => {
  console.log("Página carregada!");
});$code$,
'javascript', 1, 12),

(35, 'addEventListener',
$t$<p>O método <code>addEventListener</code> conecta um evento a uma função que será executada quando o evento acontecer.</p>
<pre><code>elemento.addEventListener("evento", função);</code></pre>
<p>A função passada é chamada de <strong>callback</strong> — ela só é executada quando o evento ocorre, não imediatamente.</p>$t$,
$code$// HTML: <button id="btn">Clique aqui</button>

let botao = document.getElementById("btn");

// Forma com função nomeada
function aoClicar() {
  console.log("Botão clicado!");
}
botao.addEventListener("click", aoClicar);

// Forma com arrow function (mais comum)
botao.addEventListener("click", () => {
  console.log("Clicou de novo!");
});

// Evento de mouseover
botao.addEventListener("mouseover", () => {
  botao.style.backgroundColor = "blue";
});$code$,
'javascript', 2, 12),

(36, 'Tipos de eventos',
$t$<p>Existem muitos tipos de eventos em JavaScript. Os mais usados são:</p>
<ul>
  <li><strong>Mouse</strong>: <code>click</code>, <code>dblclick</code>, <code>mouseover</code>, <code>mouseout</code></li>
  <li><strong>Teclado</strong>: <code>keydown</code>, <code>keyup</code>, <code>keypress</code></li>
  <li><strong>Formulário</strong>: <code>submit</code>, <code>change</code>, <code>input</code>, <code>focus</code></li>
  <li><strong>Página</strong>: <code>load</code>, <code>resize</code>, <code>scroll</code></li>
</ul>$t$,
$code$// HTML: <input id="campo" type="text" />
//        <button id="btn">Enviar</button>

let campo = document.getElementById("campo");
let btn   = document.getElementById("btn");

// Evento de digitação em tempo real
campo.addEventListener("input", () => {
  console.log("Valor atual:", campo.value);
});

// Evento de clique no botão
btn.addEventListener("click", () => {
  alert("Enviado: " + campo.value);
});

// Detectar tecla pressionada
document.addEventListener("keydown", (e) => {
  console.log("Tecla:", e.key);
});$code$,
'javascript', 3, 12);

-- ════════════════════════════════════════════════════════════════════════════
-- TRILHA JS — EXERCÍCIOS (1 por aula, 4 opções, correct_answer 0-indexed)
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_exercises (id, question, correct_answer, lesson_id) VALUES
-- Seção 1
(1,  'O que é JavaScript?',                                                         2, 1),
(2,  'Onde o JavaScript pode ser executado?',                                       2, 2),
(3,  'Qual função exibe texto no console do navegador?',                            2, 3),
-- Seção 2
(4,  'Qual tag HTML usamos para adicionar JavaScript a uma página?',                2, 4),
(5,  'Para usar um arquivo JS externo, qual atributo da tag script devemos usar?',  2, 5),
(6,  'Onde é mais recomendado colocar a tag script no HTML?',                       3, 6),
-- Seção 3
(7,  'O que console.log() faz?',                                                    1, 7),
(8,  'Qual função exibe uma caixa de diálogo com uma mensagem na tela?',            3, 8),
(9,  'Qual propriedade JS altera o conteúdo HTML interno de um elemento?',          2, 9),
-- Seção 4
(10, 'JavaScript é case-sensitive. O que isso significa?',                          2, 10),
(11, 'Como criamos um comentário de uma única linha em JavaScript?',                3, 11),
(12, 'Qual das palavras abaixo é uma palavra reservada do JavaScript?',             3, 12),
-- Seção 5
(13, 'Qual declaração cria uma variável que NÃO pode ter seu valor reatribuído?',   2, 13),
(14, 'O que significa "atribuir" um valor a uma variável?',                         2, 14),
(15, 'Qual das opções abaixo usa corretamente a convenção camelCase?',              3, 15),
-- Seção 6
(16, 'O que é uma String em JavaScript?',                                           2, 16),
(17, 'Qual é o valor de uma variável declarada mas não inicializada?',              3, 17),
(18, 'O que o operador typeof retorna?',                                            2, 18),
-- Seção 7
(19, 'Qual é o resultado de 17 % 5?',                                               1, 19),
(20, 'O que o operador === verifica?',                                               2, 20),
(21, 'O que x += 3 faz com o valor de x?',                                          2, 21),
-- Seção 8
(22, 'Qual bloco é executado quando a condição do if é falsa?',                     1, 22),
(23, 'Qual estrutura é mais indicada para comparar uma variável com vários valores fixos?', 3, 23),
(24, 'No ternário: condição ? "sim" : "não", o que é retornado quando é false?',   3, 24),
-- Seção 9
(25, 'Para que serve o i++ no laço for?',                                           2, 25),
(26, 'Qual a diferença entre while e do-while?',                                    1, 26),
(27, 'O que a instrução break faz dentro de um laço?',                              2, 27),
-- Seção 10
(28, 'Como chamamos (executamos) uma função chamada saudar em JavaScript?',         1, 28),
(29, 'O que a palavra-chave return faz dentro de uma função?',                      2, 29),
(30, 'Qual das opções abaixo é uma arrow function válida?',                         2, 30),
-- Seção 11
(31, 'O que significa a sigla DOM?',                                                2, 31),
(32, 'Qual método seleciona um elemento HTML pelo seu ID?',                         2, 32),
(33, 'Qual propriedade altera o conteúdo HTML interno de um elemento?',             2, 33),
-- Seção 12
(34, 'O que é um evento em JavaScript?',                                            1, 34),
(35, 'Qual método registra um ouvinte de evento em um elemento?',                   3, 35),
(36, 'Qual evento é acionado quando o usuário clica em um elemento?',               3, 36);

-- ════════════════════════════════════════════════════════════════════════════
-- OPÇÕES DOS EXERCÍCIOS
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 1: O que é JavaScript
(1, 'Um banco de dados para guardar informações'),
(1, 'Uma linguagem de marcação como o HTML'),
(1, 'Uma linguagem de programação da web'),
(1, 'Um programa de edição de imagens');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 2: Onde JS executa
(2, 'Apenas em servidores Linux'),
(2, 'Apenas em computadores com Windows'),
(2, 'No navegador e em servidores com Node.js'),
(2, 'Somente dentro de arquivos PDF');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 3: console.log
(3, 'print()'),
(3, 'show()'),
(3, 'console.log()'),
(3, 'output()');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 4: tag script
(4, '<javascript>'),
(4, '<code>'),
(4, '<script>'),
(4, '<js>');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 5: atributo src
(5, 'href'),
(5, 'link'),
(5, 'src'),
(5, 'file');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 6: onde colocar script
(6, 'Dentro da tag <head>'),
(6, 'Antes da tag <html>'),
(6, 'No início do <body>'),
(6, 'Antes do fechamento do </body>');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 7: console.log
(7, 'Exibe uma caixa de diálogo na tela'),
(7, 'Mostra mensagens no console do navegador'),
(7, 'Envia dados para o servidor'),
(7, 'Cria uma variável global');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 8: alert
(8, 'console.log()'),
(8, 'prompt()'),
(8, 'confirm()'),
(8, 'alert()');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 9: innerHTML
(9, 'htmlContent'),
(9, 'domContent'),
(9, 'innerHTML'),
(9, 'writeHTML');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 10: case-sensitive
(10, 'O código deve ser escrito em caixa alta'),
(10, 'Espaços em branco são ignorados'),
(10, 'Letras maiúsculas e minúsculas fazem diferença'),
(10, 'Comentários são obrigatórios');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 11: comentário linha
(11, '/* comentário */'),
(11, '# comentário'),
(11, '<!-- comentário -->'),
(11, '// comentário');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 12: palavra reservada
(12, 'nome'),
(12, 'idade'),
(12, 'cor'),
(12, 'let');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 13: const
(13, 'var x = 1'),
(13, 'let x = 1'),
(13, 'const x = 1'),
(13, 'variable x = 1');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 14: atribuir
(14, 'Apagar a variável da memória'),
(14, 'Criar um comentário no código'),
(14, 'Guardar um valor dentro da variável'),
(14, 'Executar a variável como função');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 15: camelCase
(15, 'minha-variavel'),
(15, 'minha_variavel'),
(15, 'MinhaVariavel'),
(15, 'minhaVariavel');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 16: String
(16, 'Um número decimal'),
(16, 'Um valor verdadeiro ou falso'),
(16, 'Um texto entre aspas simples ou duplas'),
(16, 'Uma lista de valores');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 17: undefined
(17, 'null'),
(17, '0'),
(17, 'false'),
(17, 'undefined');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 18: typeof retorna
(18, 'Um número'),
(18, 'Um booleano'),
(18, 'Uma string com o nome do tipo'),
(18, 'Um objeto');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 19: 17 % 5 = 2
(19, '3'),
(19, '2'),
(19, '3.4'),
(19, '1');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 20: ===
(20, 'Apenas o valor dos dois lados'),
(20, 'Apenas o tipo dos dois lados'),
(20, 'O valor E o tipo ao mesmo tempo'),
(20, 'Se a variável foi declarada');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 21: x += 3
(21, 'Atribui o valor 3 a x'),
(21, 'Multiplica x por 3'),
(21, 'Soma 3 ao valor atual de x'),
(21, 'Subtrai 3 de x');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 22: else
(22, 'catch'),
(22, 'else'),
(22, 'finally'),
(22, 'default');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 23: switch
(23, 'if simples'),
(23, 'while'),
(23, 'for'),
(23, 'switch');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 24: ternário false → "não"
(24, '"sim"'),
(24, 'null'),
(24, 'undefined'),
(24, '"não"');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 25: i++ no for
(25, 'Verificar a condição de parada'),
(25, 'Inicializar o contador'),
(25, 'Avançar o contador a cada iteração'),
(25, 'Parar o laço imediatamente');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 26: do-while vs while
(26, 'while é mais rápido que do-while'),
(26, 'do-while executa o bloco ao menos uma vez antes de verificar a condição'),
(26, 'while não precisa de condição'),
(26, 'Não há nenhuma diferença entre eles');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 27: break
(27, 'Pula para a próxima iteração do laço'),
(27, 'Reinicia o laço do início'),
(27, 'Encerra o laço imediatamente'),
(27, 'Inverte a direção do laço');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 28: chamar função
(28, 'Usar a palavra function antes do nome'),
(28, 'Escrever o nome da função seguido de ()'),
(28, 'Usar a palavra-chave return'),
(28, 'Declarar a função dentro de outra');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 29: return
(29, 'Recebe um parâmetro externo'),
(29, 'Exibe um valor no console'),
(29, 'Encerra a função e retorna um valor'),
(29, 'Cria uma variável global');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 30: arrow function válida
(30, 'function => (x) { x * 2 }'),
(30, 'const dobrar = function x { x * 2 }'),
(30, 'const dobrar = (x) => x * 2'),
(30, 'arrow dobrar(x) = x * 2');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 31: DOM
(31, 'Document Output Manager'),
(31, 'Data Object Method'),
(31, 'Document Object Model'),
(31, 'Dynamic Object Module');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 32: getElementById
(32, 'querySelector()'),
(32, 'getElement()'),
(32, 'getElementById()'),
(32, 'findById()');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 33: innerHTML
(33, 'textContent'),
(33, 'nodeValue'),
(33, 'innerHTML'),
(33, 'content');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 34: evento
(34, 'Um tipo especial de variável JS'),
(34, 'Uma ação detectada pelo navegador como clique ou tecla'),
(34, 'Uma função sem valor de retorno'),
(34, 'Um operador matemático especial');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 35: addEventListener
(35, 'onEvent()'),
(35, 'registerEvent()'),
(35, 'listenEvent()'),
(35, 'addEventListener()');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 36: evento click
(36, 'press'),
(36, 'touch'),
(36, 'hover'),
(36, 'click');

-- ════════════════════════════════════════════════════════════════════════════
-- TRILHA JS — TEMPLATES KANBAN (1 por módulo, vinculado à 3ª aula)
-- Lessons: 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, 36
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code, expected_output) VALUES
(1,
 'Desafio: Olá, JavaScript!',
 'Escreva e execute seu primeiro programa em JavaScript.',
 'Baixa', 3, 'javascript',
 'Exiba a mensagem "Hello, JavaScript!" no console usando console.log().',
$code$// Desafio: Seu primeiro programa
// Use console.log() para exibir a mensagem abaixo

$code$,
 'Hello, JavaScript!');

INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code, expected_output) VALUES
(2,
 'Desafio: Script Carregado',
 'Demonstre que o JavaScript foi carregado corretamente.',
 'Baixa', 6, 'javascript',
 'Exiba a mensagem "Script carregado com sucesso!" no console.',
$code$// Desafio: Confirme que o script está funcionando
// Exiba: Script carregado com sucesso!

$code$,
 'Script carregado com sucesso!');

INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code, expected_output) VALUES
(3,
 'Desafio: Saída de Dados',
 'Use console.log para exibir diferentes tipos de dados.',
 'Baixa', 9, 'javascript',
 'Use console.log() para exibir em linhas separadas: o texto "Olá!", o número 42 e o valor true.',
$code$// Desafio: Exiba 3 valores em linhas separadas:
// 1) o texto "Olá!"
// 2) o número 42
// 3) o valor booleano true

$code$,
 'Olá!
42
true');

INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code, expected_output) VALUES
(4,
 'Desafio: Sintaxe Correta',
 'Complete o código seguindo a sintaxe correta do JavaScript.',
 'Baixa', 12, 'javascript',
 'Complete o código para que ele exiba "Sintaxe OK!" no console. Atenção ao ponto e vírgula e ao uso correto de aspas.',
$code$// Desafio: Complete a linha abaixo corretamente
let mensagem = "Sintaxe OK!";
// Exiba a variável mensagem com console.log

$code$,
 'Sintaxe OK!');

INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code, expected_output) VALUES
(5,
 'Desafio: Variáveis',
 'Declare variáveis e exiba seus valores.',
 'Média', 15, 'javascript',
 'Declare uma variável "nome" com o valor "Ana" e uma variável "idade" com o valor 20. Exiba cada uma no console em linhas separadas.',
$code$// Desafio: Declare as variáveis e exiba-as
let nome = "";   // coloque "Ana" aqui
let idade = 0;   // coloque 20 aqui

// Exiba nome e depois idade com console.log

$code$,
 'Ana
20');

INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code, expected_output) VALUES
(6,
 'Desafio: Tipos de Dados',
 'Use typeof para identificar os tipos.',
 'Média', 18, 'javascript',
 'Use console.log(typeof ...) para exibir o tipo de: uma string qualquer, o número 42 e o valor true. Cada typeof em uma linha.',
$code$// Desafio: descubra os tipos com typeof
// Exiba o tipo de cada valor abaixo em linhas separadas

console.log(typeof "");     // deve exibir: string
console.log(typeof 42);     // deve exibir: number
console.log(typeof true);   // deve exibir: boolean
$code$,
 'string
number
boolean');

INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code, expected_output) VALUES
(7,
 'Desafio: Calculadora',
 'Realize operações aritméticas com dois números.',
 'Média', 21, 'javascript',
 'Dado a = 10 e b = 5, exiba em linhas separadas: a+b, a-b, a*b, a/b e a%b.',
$code$// Desafio: Calculadora básica
let a = 10;
let b = 5;

// Exiba os resultados das 5 operações, cada uma em uma linha:
// a+b, a-b, a*b, a/b, a%b

$code$,
 '15
5
50
2
0');

INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code, expected_output) VALUES
(8,
 'Desafio: Verificar Idade',
 'Use condicional para verificar maioridade.',
 'Média', 24, 'javascript',
 'Declare uma variável idade com o valor 20. Se a idade for maior ou igual a 18, exiba "Maior de idade". Caso contrário, exiba "Menor de idade".',
$code$// Desafio: Verifique a maioridade
let idade = 20;

// Escreva um if/else que exiba:
// "Maior de idade" se idade >= 18
// "Menor de idade" se não

$code$,
 'Maior de idade');

INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code, expected_output) VALUES
(9,
 'Desafio: Contagem com Loop',
 'Use um laço for para contar de 1 a 5.',
 'Média', 27, 'javascript',
 'Use um laço for para exibir os números de 1 a 5, cada um em uma linha separada.',
$code$// Desafio: Conte de 1 a 5 com um laço for
// Cada número deve aparecer em uma linha separada

$code$,
 '1
2
3
4
5');

INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code, expected_output) VALUES
(10,
 'Desafio: Função Dobrar',
 'Crie uma arrow function e use-a.',
 'Alta', 30, 'javascript',
 'Crie uma arrow function chamada "dobrar" que receba um número e retorne o dobro dele. Exiba o resultado de dobrar(5) no console.',
$code$// Desafio: Crie a arrow function "dobrar"
// Ela deve receber um número e retornar o dobro

const dobrar = // complete aqui

console.log(dobrar(5));  // deve exibir: 10
$code$,
 '10');

INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code, expected_output) VALUES
(11,
 'Desafio: Manipular o DOM',
 'Selecione e modifique elementos da página.',
 'Alta', 33, 'web',
 'Crie uma página HTML com um parágrafo com id="texto". Use JavaScript para alterar o conteúdo do parágrafo para "Alterado pelo JavaScript!" quando a página carregar.',
$code$<!DOCTYPE html>
<html>
<head><title>DOM</title></head>
<body>
  <p id="texto">Texto original</p>

  <script>
    // Selecione o elemento e altere seu conteúdo
    let el = document.getElementById("texto");
    el.textContent = "";  // coloque o texto aqui
  </script>
</body>
</html>
$code$,
 NULL);

INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code, expected_output) VALUES
(12,
 'Desafio: Botão com Evento',
 'Crie um botão que responde ao clique.',
 'Alta', 36, 'web',
 'Crie uma página HTML com um botão. Quando o botão for clicado, exiba um alert com a mensagem "Botão clicado!".',
$code$<!DOCTYPE html>
<html>
<head><title>Eventos</title></head>
<body>
  <button id="btn">Clique em mim</button>

  <script>
    let botao = document.getElementById("btn");
    // Adicione um addEventListener de "click" que chama alert("Botão clicado!")
  </script>
</body>
</html>
$code$,
 NULL);

-- ════════════════════════════════════════════════════════════════════════════
-- Atualizar sequences após inserts com IDs explícitos
-- ════════════════════════════════════════════════════════════════════════════
SELECT setval('tb_sections_id_seq',          12, true);
SELECT setval('tb_lessons_id_seq',           36, true);
SELECT setval('tb_exercises_id_seq',         36, true);
SELECT setval('tb_kanban_templates_id_seq',  12, true);
SELECT setval('tb_kanban_templates_id_seq', 12, true);
