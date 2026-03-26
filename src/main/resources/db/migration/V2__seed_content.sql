-- ════════════════════════════════════════════════════════════════════════════
-- TRILHAS (CURSOS)
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_courses (id, title, description) VALUES
(1, 'Lógica de Programação com JavaScript',
 'Aprenda a pensar como um programador do zero. 10 módulos progressivos com variáveis, operadores, condicionais, laços, funções, strings, arrays e objetos.'),
(2, 'HTML e CSS',
 'Construa páginas web do zero. Aprenda a estruturar conteúdo com HTML e a estilizar com CSS.'),
(3, 'HTML, CSS e JavaScript Juntos',
 'Una as três tecnologias e crie páginas interativas. Manipule o DOM, responda a eventos e construa um mini-projeto real.');

-- ════════════════════════════════════════════════════════════════════════════
-- SEÇÕES
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_sections (id, title, list_order, course_id) VALUES
-- Trilha 1: 10 módulos
(1,  'Primeiros Passos',       1,  1),
(2,  'Operadores',             2,  1),
(3,  'Comparação e Lógica',    3,  1),
(4,  'Condicionais',           4,  1),
(5,  'Laços de Repetição',     5,  1),
(6,  'Funções',                6,  1),
(7,  'Strings',                7,  1),
(8,  'Arrays',                 8,  1),
(9,  'Objetos',                9,  1),
(10, 'Combinando Tudo',        10, 1),
-- Trilha 2: HTML e CSS
(11, 'HTML',                   1,  2),
(12, 'CSS',                    2,  2),
-- Trilha 3: HTML, CSS e JS
(13, 'JavaScript no Navegador',1,  3),
(14, 'Projeto Prático',        2,  3);

-- ════════════════════════════════════════════════════════════════════════════
-- TRILHA 1 — MÓDULO 1: Primeiros Passos
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(1,
 'Seu Primeiro Programa',
 '<p>JavaScript é a linguagem de programação da web. Ela roda dentro dos navegadores e também em servidores (com Node.js).</p>
<p>O primeiro comando que todo programador aprende é <code>console.log()</code> — ele exibe mensagens no console do navegador (F12 → Console).</p>
<p><strong>Comentários</strong> são trechos que o JavaScript ignora, usados para explicar o código:</p>
<ul>
  <li><code>// comentário de uma linha</code></li>
  <li><code>/* comentário de várias linhas */</code></li>
</ul>',
 $code$// Este é um comentário — o JavaScript ignora esta linha

console.log("Olá, mundo!");   // exibe: Olá, mundo!
console.log("Estou aprendendo JavaScript!");
console.log(42);              // também funciona com números
console.log(true);            // e com verdadeiro/falso

/*
  Este é um bloco de comentário.
  Pode ocupar várias linhas.
  Útil para explicações longas.
*/$code$,
 'javascript', 1, 1),

(2,
 'Variáveis com let',
 '<p>Uma <strong>variável</strong> é como uma caixa com nome: você guarda um valor dentro e pode usá-lo depois.</p>
<p>Em JavaScript moderno usamos <code>let</code> para declarar variáveis:</p>
<pre><code>let nomeDaVariavel = valor;</code></pre>
<p>Regras para nomear variáveis:</p>
<ul>
  <li>Começar com letra, <code>_</code> ou <code>$</code></li>
  <li>Não usar espaços — use camelCase: <code>minhaVariavel</code></li>
  <li>Não usar palavras reservadas: <code>let</code>, <code>if</code>, <code>for</code>…</li>
</ul>
<p>Uma variável declarada com <code>let</code> pode ter seu valor trocado a qualquer momento.</p>',
 $code$let nome = "Ana";      // declara a variável 'nome' com valor "Ana"
let idade = 25;        // declara 'idade' com valor 25

console.log(nome);     // Ana
console.log(idade);    // 25

// Reatribuindo valores
nome = "Carlos";       // troca o valor de 'nome'
idade = 30;

console.log(nome);     // Carlos
console.log(idade);    // 30$code$,
 'javascript', 2, 1),

(3,
 'Tipos de Dados',
 '<p>Cada valor em JavaScript tem um <strong>tipo</strong>. Os três tipos mais fundamentais são:</p>
<ul>
  <li><strong>string</strong> — texto entre aspas: <code>"Olá"</code> ou <code>''Olá''</code></li>
  <li><strong>number</strong> — números inteiros ou decimais: <code>42</code>, <code>3.14</code></li>
  <li><strong>boolean</strong> — verdadeiro ou falso: <code>true</code> / <code>false</code></li>
</ul>
<p>Existem ainda <code>null</code> (ausência intencional de valor) e <code>undefined</code> (variável declarada mas sem valor).</p>
<p>Use o operador <code>typeof</code> para descobrir o tipo de um valor.</p>',
 $code$let texto   = "Programação";   // string
let numero  = 100;               // number
let decimal = 3.14;              // number
let ativo   = true;              // boolean
let vazio   = null;              // null
let nada;                        // undefined (sem valor atribuído)

// typeof revela o tipo
console.log(typeof texto);    // "string"
console.log(typeof numero);   // "number"
console.log(typeof decimal);  // "number"
console.log(typeof ativo);    // "boolean"
console.log(typeof vazio);    // "object"  ← peculiaridade do JS
console.log(typeof nada);     // "undefined"$code$,
 'javascript', 3, 1);

-- ════════════════════════════════════════════════════════════════════════════
-- TRILHA 1 — MÓDULO 2: Operadores
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(4,
 'Operadores Aritméticos',
 '<p><strong>Operadores aritméticos</strong> realizam cálculos matemáticos:</p>
<ul>
  <li><code>+</code> adição, <code>-</code> subtração</li>
  <li><code>*</code> multiplicação, <code>/</code> divisão</li>
  <li><code>%</code> <strong>resto</strong> da divisão inteira (também chamado módulo)</li>
</ul>
<p>O operador <code>+</code> com strings faz <strong>concatenação</strong>: <code>"Olá" + " mundo"</code> → <code>"Olá mundo"</code>.</p>
<p>O operador <code>%</code> é muito útil para verificar se um número é par (<code>n % 2 === 0</code>) ou divisível por outro.</p>',
 $code$let a = 10;
let b = 3;

console.log(a + b);  // 13  — adição
console.log(a - b);  // 7   — subtração
console.log(a * b);  // 30  — multiplicação
console.log(a / b);  // 3.333... — divisão
console.log(a % b);  // 1   — resto de 10 ÷ 3

// % para verificar se é par
let n = 8;
console.log(n % 2);  // 0 → é par

// + com strings = concatenação
let saudacao = "Olá" + ", " + "Maria" + "!";
console.log(saudacao);  // Olá, Maria!$code$,
 'javascript', 1, 2),

(5,
 'Atribuição e Incremento',
 '<p>Os <strong>operadores de atribuição composta</strong> combinam uma operação com uma atribuição, tornando o código mais curto:</p>
<ul>
  <li><code>x += 5</code> é igual a <code>x = x + 5</code></li>
  <li><code>x -= 3</code> é igual a <code>x = x - 3</code></li>
  <li><code>x *= 2</code> é igual a <code>x = x * 2</code></li>
  <li><code>x /= 4</code> é igual a <code>x = x / 4</code></li>
</ul>
<p>Os operadores <strong>de incremento e decremento</strong> adicionam ou subtraem 1:</p>
<ul>
  <li><code>x++</code> incrementa x em 1 (pós-incremento)</li>
  <li><code>x--</code> decrementa x em 1 (pós-decremento)</li>
</ul>',
 $code$let pontos = 10;

pontos += 5;   // pontos = 10 + 5 → 15
console.log(pontos);  // 15

pontos -= 3;   // pontos = 15 - 3 → 12
console.log(pontos);  // 12

pontos *= 2;   // pontos = 12 * 2 → 24
console.log(pontos);  // 24

// Incremento e decremento
let vidas = 3;
vidas--;       // vidas = 3 - 1 → 2
console.log(vidas);   // 2

let nivel = 1;
nivel++;       // nivel = 1 + 1 → 2
console.log(nivel);   // 2$code$,
 'javascript', 2, 2),

(6,
 'Precedência de Operadores',
 '<p>Quando uma expressão tem múltiplos operadores, o JavaScript segue uma ordem de avaliação chamada <strong>precedência</strong>:</p>
<ol>
  <li><strong>Parênteses</strong> <code>()</code> — sempre primeiro</li>
  <li><strong>Multiplicação, Divisão e Resto</strong> <code>* / %</code></li>
  <li><strong>Adição e Subtração</strong> <code>+ -</code></li>
  <li>Da <strong>esquerda para direita</strong> em caso de empate</li>
</ol>
<p>Use parênteses para deixar a intenção clara e evitar erros.</p>',
 $code$// Sem parênteses: * é resolvido antes do +
let resultado1 = 2 + 3 * 4;
console.log(resultado1);  // 14  (não 20!)

// Com parênteses: + é resolvido primeiro
let resultado2 = (2 + 3) * 4;
console.log(resultado2);  // 20

// Exemplo prático: média de 3 notas
let nota1 = 8, nota2 = 7, nota3 = 9;
let media = (nota1 + nota2 + nota3) / 3;
console.log(media);  // 8

// Da esquerda para direita
let calc = 10 - 3 + 2;
console.log(calc);   // 9  (10-3=7, depois 7+2=9)$code$,
 'javascript', 3, 2);

-- ════════════════════════════════════════════════════════════════════════════
-- TRILHA 1 — MÓDULO 3: Comparação e Lógica
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(7,
 'Operadores de Comparação',
 '<p><strong>Operadores de comparação</strong> comparam dois valores e sempre retornam <code>true</code> ou <code>false</code>:</p>
<ul>
  <li><code>&gt;</code> maior que, <code>&lt;</code> menor que</li>
  <li><code>&gt;=</code> maior ou igual, <code>&lt;=</code> menor ou igual</li>
  <li><code>===</code> igual em valor <em>e</em> tipo (use sempre este)</li>
  <li><code>!==</code> diferente em valor ou tipo</li>
</ul>
<p><strong>Atenção:</strong> evite <code>==</code> (igualdade fraca), pois ele faz conversões implícitas de tipo que causam resultados inesperados. Prefira sempre <code>===</code>.</p>',
 $code$let idade = 20;

console.log(idade > 18);    // true
console.log(idade < 18);    // false
console.log(idade >= 18);   // true
console.log(idade <= 20);   // true
console.log(idade === 20);  // true  (valor E tipo)
console.log(idade !== 30);  // true

// Armadilha do == (evite!)
console.log(5 == "5");   // true  ← conversão automática
console.log(5 === "5");  // false ← correto!

// Comparando strings
let cor = "azul";
console.log(cor === "azul");   // true
console.log(cor === "verde");  // false$code$,
 'javascript', 1, 3),

(8,
 'Operadores Lógicos AND e OR',
 '<p>Os operadores lógicos combinam expressões booleanas:</p>
<ul>
  <li><code>&&</code> (<strong>AND</strong>): retorna <code>true</code> somente se <em>ambas</em> as condições forem verdadeiras</li>
  <li><code>||</code> (<strong>OR</strong>): retorna <code>true</code> se <em>pelo menos uma</em> condição for verdadeira</li>
</ul>
<p>Tabela verdade do AND:</p>
<ul>
  <li><code>true && true</code> → <code>true</code></li>
  <li><code>true && false</code> → <code>false</code></li>
  <li><code>false && true</code> → <code>false</code></li>
</ul>
<p>Tabela verdade do OR:</p>
<ul>
  <li><code>true || false</code> → <code>true</code></li>
  <li><code>false || false</code> → <code>false</code></li>
</ul>',
 $code$let idade = 22;
let temIngresso = true;

// && (AND): as DUAS precisam ser verdadeiras
let podeEntrar = idade >= 18 && temIngresso;
console.log(podeEntrar);  // true

// || (OR): pelo menos UMA precisa ser verdadeira
let temDesconto = idade < 12 || idade >= 60;
console.log(temDesconto);  // false (22 não é < 12 nem >= 60)

// Combinando múltiplas condições
let aprovado = true;
let entregou = false;
let passosDeCertificado = aprovado && entregou;
console.log(passosDeCertificado);  // false

let podeRecurso = !aprovado || !entregou;
console.log(podeRecurso);  // true$code$,
 'javascript', 2, 3),

(9,
 'Operador NOT e Expressões Compostas',
 '<p>O operador <code>!</code> (<strong>NOT</strong>) inverte um valor booleano:</p>
<ul>
  <li><code>!true</code> → <code>false</code></li>
  <li><code>!false</code> → <code>true</code></li>
</ul>
<p>Também pode ser usado com qualquer expressão: <code>!(idade >= 18)</code> é o mesmo que <code>idade &lt; 18</code>.</p>
<p>Ao combinar <code>!</code>, <code>&&</code> e <code>||</code>, use parênteses para deixar a precedência clara. A ordem de avaliação é: <code>!</code> primeiro, depois <code>&&</code>, depois <code>||</code>.</p>',
 $code$console.log(!true);   // false
console.log(!false);  // true

let logado = false;
console.log(!logado);  // true — "não está logado"

// ! com expressão
let idade = 15;
let menorDeIdade = !(idade >= 18);
console.log(menorDeIdade);  // true

// Precedência: ! > && > ||
let a = true, b = false, c = true;

console.log(!a || b);         // false  (!true=false, false||false=false)
console.log(a && !b);         // true   (!false=true, true&&true=true)
console.log(!a || b || c);    // true   (false||false||true=true)
console.log(!(a && b));       // true   (true&&false=false, !false=true)$code$,
 'javascript', 3, 3);

-- ════════════════════════════════════════════════════════════════════════════
-- TRILHA 1 — MÓDULO 4: Condicionais
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(10,
 'if e else',
 '<p>O <code>if</code> permite que o programa tome <strong>decisões</strong>: executa um bloco de código apenas quando uma condição for verdadeira.</p>
<pre><code>if (condição) {
  // executa se verdadeiro
} else {
  // executa se falso
}</code></pre>
<p>O bloco <code>else</code> é opcional — use quando quiser tratar o caso em que a condição é <code>false</code>.</p>
<p>O código entre <code>{ }</code> é chamado de <strong>bloco</strong>. Tudo dentro do bloco pertence àquele <code>if</code> ou <code>else</code>.</p>',
 $code$let hora = 14;

if (hora < 12) {
  console.log("Bom dia!");
} else {
  console.log("Boa tarde ou noite!");
}
// Saída: Boa tarde ou noite!

// if sem else (quando não precisamos tratar o caso falso)
let temperatura = 35;
if (temperatura > 30) {
  console.log("Está muito quente, beba água!");
}

// Verificando acesso
let idade = 17;
let podeEntrar;
if (idade >= 18) {
  podeEntrar = true;
} else {
  podeEntrar = false;
}
console.log(podeEntrar);  // false$code$,
 'javascript', 1, 4),

(11,
 'else if',
 '<p>Quando temos <strong>mais de duas possibilidades</strong>, encadeamos condições com <code>else if</code>:</p>
<pre><code>if (condição1) {
  ...
} else if (condição2) {
  ...
} else if (condição3) {
  ...
} else {
  // nenhuma das anteriores
}</code></pre>
<p>O JavaScript testa cada condição em ordem — ao encontrar a primeira verdadeira, executa aquele bloco e <strong>pula todos os outros</strong>. O <code>else</code> final é o "caso padrão" quando nenhuma condição anterior foi satisfeita.</p>',
 $code$let nota = 75;

if (nota >= 90) {
  console.log("Conceito A — Excelente!");
} else if (nota >= 80) {
  console.log("Conceito B — Bom!");
} else if (nota >= 70) {
  console.log("Conceito C — Aprovado.");
} else if (nota >= 50) {
  console.log("Conceito D — Recuperação.");
} else {
  console.log("Conceito F — Reprovado.");
}
// Saída: Conceito C — Aprovado.

// Classificando horário do dia
let horario = 19;
if (horario < 6) {
  console.log("Madrugada");
} else if (horario < 12) {
  console.log("Manhã");
} else if (horario < 18) {
  console.log("Tarde");
} else {
  console.log("Noite");
}$code$,
 'javascript', 2, 4),

(12,
 'Operador Ternário',
 '<p>O <strong>operador ternário</strong> é uma forma compacta de escrever um <code>if/else</code> simples, especialmente útil para atribuições:</p>
<pre><code>condição ? valorSeVerdadeiro : valorSeFalso</code></pre>
<p>Leia assim: <em>"se condição, então valorSeVerdadeiro, senão valorSeFalso"</em>.</p>
<p>Use o ternário quando o resultado é uma <em>expressão simples</em>. Para lógicas mais complexas, prefira o <code>if/else</code> tradicional para manter a legibilidade.</p>',
 $code$let idade = 20;

// Ternário: versão compacta de if/else
let status = idade >= 18 ? "adulto" : "menor de idade";
console.log(status);  // adulto

// Equivalente com if/else tradicional:
// if (idade >= 18) { status = "adulto"; }
// else { status = "menor de idade"; }

// Ternário em console.log diretamente
let nota = 65;
console.log(nota >= 70 ? "Aprovado" : "Reprovado");  // Reprovado

// Ternários aninhados (use com moderação)
let pontuacao = 85;
let nivel = pontuacao >= 90 ? "Ouro"
           : pontuacao >= 70 ? "Prata"
           : "Bronze";
console.log(nivel);  // Prata$code$,
 'javascript', 3, 4);

-- ════════════════════════════════════════════════════════════════════════════
-- TRILHA 1 — MÓDULO 5: Laços de Repetição
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(13,
 'O Laço for',
 '<p>O laço <code>for</code> repete um bloco de código um número determinado de vezes. É composto por três partes:</p>
<pre><code>for (inicialização; condição; incremento) {
  // bloco repetido
}</code></pre>
<ul>
  <li><strong>Inicialização</strong>: executada uma vez antes do laço (<code>let i = 0</code>)</li>
  <li><strong>Condição</strong>: verificada antes de cada repetição — enquanto <code>true</code>, o laço continua</li>
  <li><strong>Incremento</strong>: executado após cada repetição, avança a variável de controle</li>
</ul>',
 $code$// Contar de 1 a 5
for (let i = 1; i <= 5; i++) {
  console.log("Número: " + i);
}
// Número: 1 … Número: 5

// Tabuada do 3
for (let i = 1; i <= 10; i++) {
  console.log("3 × " + i + " = " + (3 * i));
}

// Somar de 1 a 100
let soma = 0;
for (let i = 1; i <= 100; i++) {
  soma += i;
}
console.log("Soma de 1 a 100:", soma);  // 5050

// Contar de trás para frente
for (let i = 5; i >= 1; i--) {
  console.log(i);
}$code$,
 'javascript', 1, 5),

(14,
 'O Laço while',
 '<p>O <code>while</code> repete um bloco <strong>enquanto</strong> uma condição for verdadeira. Ideal quando não sabemos de antemão quantas vezes vamos repetir:</p>
<pre><code>while (condição) {
  // bloco repetido
}</code></pre>
<p><strong>Atenção:</strong> sempre garanta que a condição eventualmente se tornará <code>false</code>, ou o programa ficará em <strong>loop infinito</strong> e travará.</p>
<p>Sempre que usar <code>while</code>, verifique: "Existe algo dentro do bloco que vai tornar a condição falsa em algum momento?"</p>',
 $code$// while com contador
let contador = 1;
while (contador <= 5) {
  console.log("Contagem: " + contador);
  contador++;  // ← essencial! sem isso, loop infinito
}

// Enquanto não acertar um número "secreto"
let tentativas = 0;
let chute = 0;
let segredo = 7;

while (chute !== segredo) {
  tentativas++;
  chute = tentativas;  // simula o usuário tentando 1, 2, 3...
}
console.log("Acertou na tentativa " + tentativas);  // 7

// Somando enquanto total < 50
let total = 0;
let numero = 1;
while (total < 50) {
  total += numero;
  numero++;
}
console.log("Total:", total);  // 55 (1+2+...+10=55)$code$,
 'javascript', 2, 5),

(15,
 'break e continue',
 '<p>Dentro de qualquer laço, dois comandos permitem controlar o fluxo:</p>
<ul>
  <li><code>break</code> — <strong>encerra o laço imediatamente</strong>, independentemente da condição</li>
  <li><code>continue</code> — <strong>pula a iteração atual</strong> e vai direto para o próximo ciclo</li>
</ul>
<p>Use <code>break</code> quando encontrar o que procurava e não precisa continuar percorrendo. Use <code>continue</code> para ignorar casos específicos sem sair do laço.</p>',
 $code$// break: para ao encontrar o número 4
for (let i = 1; i <= 10; i++) {
  if (i === 4) {
    console.log("Encontrei o 4! Parando.");
    break;
  }
  console.log(i);
}
// 1, 2, 3, Encontrei o 4! Parando.

// continue: pula os números ímpares
for (let i = 1; i <= 10; i++) {
  if (i % 2 !== 0) {
    continue;  // pula ímpares
  }
  console.log("Par:", i);
}
// Par: 2, Par: 4, Par: 6, Par: 8, Par: 10

// break em while: procura o primeiro múltiplo de 7
let n = 1;
while (n <= 100) {
  if (n % 7 === 0) {
    console.log("Primeiro múltiplo de 7:", n);  // 7
    break;
  }
  n++;
}$code$,
 'javascript', 3, 5);

-- ════════════════════════════════════════════════════════════════════════════
-- TRILHA 1 — MÓDULO 6: Funções
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(16,
 'Declarando e Chamando Funções',
 '<p>Uma <strong>função</strong> agrupa um conjunto de instruções com um nome. Escreva uma vez — chame quantas vezes quiser.</p>
<pre><code>function nomeDaFuncao() {
  // instruções
}</code></pre>
<p>Para <strong>chamar</strong> (executar) a função, use seu nome seguido de parênteses: <code>nomeDaFuncao()</code>.</p>
<p>Sem os parênteses, você está apenas referenciando a função, não a executando. Com parênteses, o código dentro é executado.</p>',
 $code$// Declarando uma função
function exibirBoasVindas() {
  console.log("=== Bem-vindo ao sistema! ===");
  console.log("Preparando ambiente...");
  console.log("Tudo pronto!");
}

// Chamando a função (pode chamar várias vezes)
exibirBoasVindas();
exibirBoasVindas();

// Função sem parênteses NÃO executa:
// exibirBoasVindas  ← apenas referência, não executa

// Outra função
function mostrarLinha() {
  console.log("----------------------------");
}

mostrarLinha();
exibirBoasVindas();
mostrarLinha();$code$,
 'javascript', 1, 6),

(17,
 'Parâmetros e Retorno',
 '<p><strong>Parâmetros</strong> são variáveis que a função recebe como entrada. Eles tornam as funções flexíveis e reutilizáveis.</p>
<p><strong>return</strong> envia um valor de volta para quem chamou a função. Ao chegar no <code>return</code>, a função para de executar imediatamente.</p>
<pre><code>function somar(a, b) {
  return a + b;
}
let resultado = somar(3, 5);  // resultado = 8</code></pre>
<p>Uma função sem <code>return</code> (ou com <code>return</code> sem valor) retorna <code>undefined</code>.</p>',
 $code$// Parâmetros: a e b são os "apelidos" dos valores que entram
function somar(a, b) {
  return a + b;
}

console.log(somar(3, 7));    // 10
console.log(somar(100, 50)); // 150

// Podemos guardar o retorno em uma variável
let resultado = somar(4, 6);
console.log("Resultado:", resultado);  // 10

// Função com múltiplos parâmetros
function apresentar(nome, idade, cidade) {
  return nome + " tem " + idade + " anos e mora em " + cidade + ".";
}

let frase = apresentar("Beatriz", 23, "Curitiba");
console.log(frase);

// return para imediatamente
function verificarIdade(idade) {
  if (idade < 0) {
    return "Idade inválida";
  }
  return idade >= 18 ? "Adulto" : "Menor de idade";
}

console.log(verificarIdade(-1));  // Idade inválida
console.log(verificarIdade(15));  // Menor de idade
console.log(verificarIdade(25));  // Adulto$code$,
 'javascript', 2, 6),

(18,
 'Arrow Functions',
 '<p><strong>Arrow functions</strong> são uma sintaxe alternativa e mais compacta para criar funções:</p>
<pre><code>const nomeDaFuncao = (parametros) => {
  return valor;
};</code></pre>
<p>Para funções que retornam apenas uma expressão, podemos omitir o <code>return</code> e as chaves:</p>
<pre><code>const somar = (a, b) => a + b;</code></pre>
<p>Arrow functions são muito usadas com métodos de array como <code>forEach</code>, <code>map</code> e <code>filter</code>, que veremos nos próximos módulos.</p>',
 $code$// Função tradicional
function quadrado(n) {
  return n * n;
}

// Arrow function equivalente
const quadradoArrow = (n) => n * n;

// Com parâmetro único, parênteses são opcionais:
const quadradoCompacto = n => n * n;

console.log(quadrado(4));          // 16
console.log(quadradoArrow(4));     // 16
console.log(quadradoCompacto(4));  // 16

// Arrow com múltiplos parâmetros e lógica
const saudar = (nome, periodo) => {
  let msg = periodo === "manhã" ? "Bom dia" : "Boa tarde";
  return msg + ", " + nome + "!";
};

console.log(saudar("Pedro", "manhã"));  // Bom dia, Pedro!

// Sem parâmetros: parênteses obrigatórios
const dizer = () => "JavaScript é incrível!";
console.log(dizer());$code$,
 'javascript', 3, 6);

-- ════════════════════════════════════════════════════════════════════════════
-- TRILHA 1 — MÓDULO 7: Strings
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(19,
 'Propriedades e Métodos de String',
 '<p>Strings em JavaScript têm <strong>propriedades</strong> (dados) e <strong>métodos</strong> (funções embutidas):</p>
<ul>
  <li><code>.length</code> — número de caracteres</li>
  <li><code>.toUpperCase()</code> — converte para MAIÚSCULAS</li>
  <li><code>.toLowerCase()</code> — converte para minúsculas</li>
  <li><code>.includes("texto")</code> — verifica se contém a substring, retorna <code>true/false</code></li>
  <li><code>.trim()</code> — remove espaços extras no início e no fim</li>
  <li><code>.replace("antigo", "novo")</code> — substitui a primeira ocorrência</li>
</ul>',
 $code$let frase = "  Olá, Mundo!  ";

console.log(frase.length);        // 15 (incluindo espaços)
console.log(frase.trim());        // "Olá, Mundo!"
console.log(frase.trim().length); // 11

let nome = "JavaScript";
console.log(nome.toUpperCase()); // "JAVASCRIPT"
console.log(nome.toLowerCase()); // "javascript"

let email = "usuario@gmail.com";
console.log(email.includes("gmail"));   // true
console.log(email.includes("yahoo"));   // false

let mensagem = "Eu gosto de Java";
let nova = mensagem.replace("Java", "JavaScript");
console.log(nova);  // "Eu gosto de JavaScript"$code$,
 'javascript', 1, 7),

(20,
 'Extraindo Partes de Strings',
 '<p>Para trabalhar com partes de uma string:</p>
<ul>
  <li><code>.slice(início, fim)</code> — extrai do índice <code>início</code> até (não incluindo) <code>fim</code>. Índices negativos contam do final.</li>
  <li><code>.indexOf("texto")</code> — retorna o índice da primeira ocorrência, ou <code>-1</code> se não encontrar</li>
  <li><code>.split("separador")</code> — divide a string em um array de partes</li>
</ul>
<p>Lembre: o primeiro caractere de uma string tem índice <code>0</code>.</p>',
 $code$let linguagem = "JavaScript";
// Índices:          0123456789

console.log(linguagem.slice(0, 4));   // "Java"   (0 até 4, não inclui 4)
console.log(linguagem.slice(4));      // "Script" (do 4 até o final)
console.log(linguagem.slice(-6));     // "Script" (6 do final)

// indexOf: encontra a posição
let texto = "Eu aprendo JavaScript todo dia";
console.log(texto.indexOf("JavaScript"));  // 10
console.log(texto.indexOf("Python"));      // -1 (não encontrado)

// split: divide em array
let csvLinha = "Ana,25,São Paulo";
let partes = csvLinha.split(",");
console.log(partes);           // ["Ana", "25", "São Paulo"]
console.log(partes[0]);        // "Ana"
console.log(partes.length);    // 3

// Combinando métodos
let url = "  https://exemplo.com  ";
let urlLimpa = url.trim().toLowerCase();
console.log(urlLimpa);$code$,
 'javascript', 2, 7),

(21,
 'Template Literals',
 '<p><strong>Template literals</strong> são strings escritas com crase (<code>`</code>) em vez de aspas. Elas permitem:</p>
<ul>
  <li><strong>Interpolação</strong>: inserir variáveis e expressões diretamente com <code>${expressão}</code></li>
  <li><strong>Multilinha</strong>: quebras de linha sem precisar de <code>\\n</code></li>
</ul>
<p>Antes dos template literals, concatenar strings com variáveis era trabalhoso: <code>"Olá, " + nome + "! Você tem " + idade + " anos."</code></p>
<p>Com template literals fica muito mais legível: <code>`Olá, ${nome}! Você tem ${idade} anos.`</code></p>',
 $code$let nome = "Larissa";
let idade = 22;
let cidade = "Belo Horizonte";

// Concatenação antiga (trabalhosa)
let msg1 = "Olá, " + nome + "! Você tem " + idade + " anos e mora em " + cidade + ".";

// Template literal (limpo e legível)
let msg2 = `Olá, ${nome}! Você tem ${idade} anos e mora em ${cidade}.`;

console.log(msg1);  // mesma saída
console.log(msg2);  // mesma saída

// Expressões dentro de ${}
let preco = 49.9;
let quantidade = 3;
console.log(`Total: R$ ${(preco * quantidade).toFixed(2)}`);
// Total: R$ 149.70

// Multilinha
let poema = `Primeira linha
Segunda linha
Terceira linha`;
console.log(poema);$code$,
 'javascript', 3, 7);

-- ════════════════════════════════════════════════════════════════════════════
-- TRILHA 1 — MÓDULO 8: Arrays
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(22,
 'Criando e Acessando Arrays',
 '<p>Um <strong>array</strong> armazena uma <em>coleção ordenada</em> de valores em uma única variável. É como uma lista numerada.</p>
<pre><code>let frutas = ["maçã", "banana", "laranja"];</code></pre>
<p>Cada item tem um <strong>índice</strong> (posição), começando em <code>0</code>:</p>
<ul>
  <li><code>frutas[0]</code> → <code>"maçã"</code></li>
  <li><code>frutas[1]</code> → <code>"banana"</code></li>
</ul>
<p>A propriedade <code>.length</code> retorna o número de elementos. O último elemento está sempre no índice <code>array.length - 1</code>.</p>',
 $code$let cores = ["vermelho", "verde", "azul", "amarelo"];

// Acessando por índice
console.log(cores[0]);  // "vermelho"
console.log(cores[1]);  // "verde"
console.log(cores[3]);  // "amarelo" (último)

// length
console.log(cores.length);  // 4

// Último elemento (sem saber o índice exato)
console.log(cores[cores.length - 1]);  // "amarelo"

// Arrays podem misturar tipos
let misto = ["Alice", 30, true, null];
console.log(misto[0]);  // "Alice"
console.log(misto[1]);  // 30

// Modificando um elemento
cores[1] = "roxo";
console.log(cores);  // ["vermelho", "roxo", "azul", "amarelo"]$code$,
 'javascript', 1, 8),

(23,
 'Modificando Arrays',
 '<p>Arrays possuem métodos para adicionar e remover elementos:</p>
<ul>
  <li><code>push(item)</code> — adiciona ao <strong>final</strong></li>
  <li><code>pop()</code> — remove do <strong>final</strong> (e retorna o removido)</li>
  <li><code>unshift(item)</code> — adiciona ao <strong>início</strong></li>
  <li><code>shift()</code> — remove do <strong>início</strong> (e retorna o removido)</li>
  <li><code>splice(índice, quantidade)</code> — remove elementos a partir de uma posição</li>
</ul>',
 $code$let lista = ["banana", "maçã", "uva"];

// push: adiciona ao final
lista.push("morango");
console.log(lista);  // ["banana", "maçã", "uva", "morango"]

// pop: remove do final
let removido = lista.pop();
console.log(removido);  // "morango"
console.log(lista);     // ["banana", "maçã", "uva"]

// unshift: adiciona no início
lista.unshift("abacaxi");
console.log(lista);  // ["abacaxi", "banana", "maçã", "uva"]

// shift: remove do início
let primeiro = lista.shift();
console.log(primeiro);  // "abacaxi"
console.log(lista);     // ["banana", "maçã", "uva"]

// Adicionando múltiplos itens com push
lista.push("manga", "kiwi");
console.log(lista.length);  // 5$code$,
 'javascript', 2, 8),

(24,
 'Percorrendo Arrays',
 '<p>Existem várias formas de percorrer todos os elementos de um array:</p>
<ul>
  <li><strong>for com índice</strong>: clássico, dá controle total</li>
  <li><strong>forEach(função)</strong>: método moderno e legível — chama uma função para cada elemento</li>
</ul>
<p><code>forEach</code> recebe uma função como argumento. Essa função é chamada uma vez por elemento, recebendo o <strong>elemento</strong> atual (e opcionalmente o <strong>índice</strong>).</p>',
 $code$let notas = [8.5, 7.0, 9.5, 6.0, 8.0];

// for com índice
console.log("=== for com índice ===");
for (let i = 0; i < notas.length; i++) {
  console.log(`Nota ${i + 1}: ${notas[i]}`);
}

// forEach — mais limpo para percorrer
console.log("=== forEach ===");
notas.forEach(function(nota, indice) {
  console.log(`Aluno ${indice + 1}: ${nota}`);
});

// forEach com arrow function (ainda mais compacto)
notas.forEach((nota, i) => console.log(`[${i}] = ${nota}`));

// Calculando soma com forEach
let soma = 0;
notas.forEach(nota => {
  soma += nota;
});
let media = soma / notas.length;
console.log(`Média: ${media.toFixed(1)}`);  // 7.8$code$,
 'javascript', 3, 8);

-- ════════════════════════════════════════════════════════════════════════════
-- TRILHA 1 — MÓDULO 9: Objetos
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(25,
 'Criando Objetos',
 '<p>Um <strong>objeto</strong> armazena dados relacionados em pares <strong>chave: valor</strong>. É a estrutura perfeita para representar entidades do mundo real.</p>
<pre><code>let pessoa = {
  nome: "Ana",
  idade: 25,
  ativo: true
};</code></pre>
<p>Cada par <code>chave: valor</code> é uma <strong>propriedade</strong>. As chaves são strings (sem aspas na notação literal), os valores podem ser de qualquer tipo.</p>
<p>Objetos são delimitados por <code>{ }</code> e as propriedades são separadas por vírgulas.</p>',
 $code$// Criando um objeto
let produto = {
  nome: "Notebook",
  preco: 2999.90,
  emEstoque: true,
  categoria: "Eletrônicos"
};

console.log(produto);
// {nome: "Notebook", preco: 2999.9, emEstoque: true, categoria: "Eletrônicos"}

// Objetos podem ter qualquer tipo como valor
let usuario = {
  id: 1,
  email: "ana@email.com",
  pontuacao: 850,
  premium: false
};

console.log(usuario.email);     // "ana@email.com"
console.log(typeof usuario);    // "object"$code$,
 'javascript', 1, 9),

(26,
 'Lendo e Modificando Propriedades',
 '<p>Para acessar propriedades de um objeto, use a <strong>notação de ponto</strong>:</p>
<pre><code>objeto.propriedade</code></pre>
<p>Ou a <strong>notação de colchetes</strong> (útil quando o nome da propriedade vem de uma variável):</p>
<pre><code>objeto["propriedade"]</code></pre>
<p>Para <strong>modificar</strong> uma propriedade, basta atribuir um novo valor. Para <strong>adicionar</strong> uma nova propriedade, basta atribuir a uma chave que ainda não existe.</p>',
 $code$let carro = {
  marca: "Toyota",
  modelo: "Corolla",
  ano: 2022,
  cor: "prata"
};

// Lendo propriedades (notação de ponto)
console.log(carro.marca);   // "Toyota"
console.log(carro.ano);     // 2022

// Lendo com colchetes
let campo = "modelo";
console.log(carro[campo]);  // "Corolla"

// Modificando uma propriedade existente
carro.cor = "preto";
console.log(carro.cor);  // "preto"

// Adicionando uma nova propriedade
carro.quilometragem = 15000;
console.log(carro.quilometragem);  // 15000

// Verificando se uma propriedade existe
console.log("marca" in carro);    // true
console.log("motor" in carro);    // false$code$,
 'javascript', 2, 9),

(27,
 'Métodos em Objetos',
 '<p>Um <strong>método</strong> é uma propriedade de um objeto cujo valor é uma <strong>função</strong>. Métodos encapsulam comportamentos relacionados ao objeto.</p>
<p>Dentro de um método, a palavra-chave <code>this</code> refere-se ao próprio objeto, permitindo acessar suas outras propriedades.</p>
<pre><code>let obj = {
  nome: "Ana",
  saudar: function() {
    return "Olá, " + this.nome;
  }
};</code></pre>',
 $code$let conta = {
  titular: "Carlos",
  saldo: 1500,

  // Método para depositar
  depositar: function(valor) {
    this.saldo += valor;
    console.log(`Depósito de R$${valor}. Novo saldo: R$${this.saldo}`);
  },

  // Método para sacar
  sacar: function(valor) {
    if (valor > this.saldo) {
      console.log("Saldo insuficiente!");
      return;
    }
    this.saldo -= valor;
    console.log(`Saque de R$${valor}. Novo saldo: R$${this.saldo}`);
  },

  // Método para exibir extrato
  extrato: function() {
    return `Titular: ${this.titular} | Saldo: R$${this.saldo}`;
  }
};

conta.depositar(500);   // Depósito de R$500. Novo saldo: R$2000
conta.sacar(200);       // Saque de R$200. Novo saldo: R$1800
console.log(conta.extrato());  // Titular: Carlos | Saldo: R$1800$code$,
 'javascript', 3, 9);

-- ════════════════════════════════════════════════════════════════════════════
-- TRILHA 1 — MÓDULO 10: Combinando Tudo
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(28,
 'Arrays de Objetos',
 '<p>A estrutura mais comum em programação real é um <strong>array de objetos</strong>: uma lista onde cada item possui múltiplas propriedades.</p>
<p>Exemplos do cotidiano: lista de produtos, lista de usuários, lista de tarefas — cada item tem nome, preço, status, etc.</p>
<p>Para acessar uma propriedade de um item específico, combine o acesso por índice com a notação de ponto:</p>
<pre><code>produtos[0].nome</code></pre>
<p>Para percorrer todos os itens e suas propriedades, use <code>forEach</code> ou <code>for</code>.</p>',
 $code$let produtos = [
  { nome: "Notebook",  preco: 2999.90, emEstoque: true  },
  { nome: "Mouse",     preco:   89.90, emEstoque: true  },
  { nome: "Monitor",   preco: 1299.00, emEstoque: false },
  { nome: "Teclado",   preco:  159.00, emEstoque: true  }
];

// Acessando elemento específico
console.log(produtos[0].nome);   // "Notebook"
console.log(produtos[2].preco);  // 1299

// Percorrendo com forEach
produtos.forEach(produto => {
  let disponivel = produto.emEstoque ? "disponível" : "indisponível";
  console.log(`${produto.nome} - R$${produto.preco} (${disponivel})`);
});

// Contando quantos estão em estoque
let emEstoque = 0;
produtos.forEach(p => {
  if (p.emEstoque) emEstoque++;
});
console.log(`Produtos disponíveis: ${emEstoque}`);  // 3$code$,
 'javascript', 1, 10),

(29,
 'Funções com Arrays e Objetos',
 '<p>Funções se tornam muito mais poderosas quando trabalham com arrays e objetos. Podemos criar funções que:</p>
<ul>
  <li>Recebem um array e retornam um <strong>cálculo</strong> (soma, média, contagem)</li>
  <li>Recebem um array e retornam um <strong>novo array filtrado</strong></li>
  <li>Recebem um objeto e retornam uma <strong>representação formatada</strong></li>
</ul>
<p>Esse padrão — funções que processam dados e retornam resultados — é a base da programação funcional e é muito usado em JavaScript moderno.</p>',
 $code$// Função que soma todos os elementos de um array
function somarArray(numeros) {
  let total = 0;
  numeros.forEach(n => { total += n; });
  return total;
}

// Função que calcula a média
function calcularMedia(numeros) {
  return somarArray(numeros) / numeros.length;
}

let notas = [8, 7.5, 9, 6.5, 8.5];
console.log("Soma:", somarArray(notas));           // 39.5
console.log("Média:", calcularMedia(notas));       // 7.9

// Função que filtra objetos por critério
function filtrarEmEstoque(produtos) {
  let resultado = [];
  produtos.forEach(p => {
    if (p.emEstoque) resultado.push(p);
  });
  return resultado;
}

let catalogo = [
  { nome: "Notebook", preco: 3000, emEstoque: true  },
  { nome: "Monitor",  preco: 1200, emEstoque: false },
  { nome: "Mouse",    preco:   90, emEstoque: true  }
];

let disponiveis = filtrarEmEstoque(catalogo);
console.log(`Disponíveis: ${disponiveis.length}`);  // 2
disponiveis.forEach(p => console.log(p.nome));$code$,
 'javascript', 2, 10),

(30,
 'Mini-Desafio Final',
 '<p>Chegou a hora de unir tudo que você aprendeu nesta trilha:</p>
<ul>
  <li><strong>Variáveis e tipos</strong> para guardar dados</li>
  <li><strong>Condicionais</strong> para tomar decisões</li>
  <li><strong>Laços</strong> para percorrer listas</li>
  <li><strong>Funções</strong> para organizar o código</li>
  <li><strong>Arrays de objetos</strong> para modelar dados reais</li>
</ul>
<p>O código abaixo implementa um pequeno sistema de gerenciamento de alunos. Leia, entenda como as peças se encaixam e, no desafio do Kanban, você vai expandi-lo!</p>',
 $code$// Sistema de gerenciamento de alunos
let alunos = [
  { nome: "Ana",    notas: [8, 9, 7, 10] },
  { nome: "Bruno",  notas: [5, 6, 7, 4]  },
  { nome: "Carla",  notas: [9, 10, 9, 8] },
  { nome: "Diego",  notas: [6, 5, 7, 6]  }
];

function calcularMedia(notas) {
  let soma = 0;
  notas.forEach(n => { soma += n; });
  return soma / notas.length;
}

function classificar(media) {
  if (media >= 9)   return "Excelente";
  if (media >= 7)   return "Aprovado";
  if (media >= 5)   return "Recuperação";
  return "Reprovado";
}

// Processar e exibir resultado de cada aluno
alunos.forEach(aluno => {
  let media = calcularMedia(aluno.notas);
  let status = classificar(media);
  console.log(`${aluno.nome}: média ${media.toFixed(1)} — ${status}`);
});

// Ana: média 8.5 — Aprovado
// Bruno: média 5.5 — Recuperação
// Carla: média 9.0 — Excelente
// Diego: média 6.0 — Recuperação$code$,
 'javascript', 3, 10);

-- ════════════════════════════════════════════════════════════════════════════
-- TRILHA 2 — HTML e CSS (seções 11-12, lições 31-35)
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(31,
 'Estrutura do HTML',
 '<p>HTML (HyperText Markup Language) é a linguagem que <strong>estrutura</strong> o conteúdo das páginas web. Usamos <strong>tags</strong> para marcar o significado de cada parte.</p>
<p>Todo documento HTML tem uma estrutura base obrigatória:</p>
<ul>
  <li><code>&lt;!DOCTYPE html&gt;</code> — declara que é um documento HTML5</li>
  <li><code>&lt;html&gt;</code> — elemento raiz que envolve tudo</li>
  <li><code>&lt;head&gt;</code> — metadados (título, charset) — não aparece na página</li>
  <li><code>&lt;body&gt;</code> — tudo que aparece visualmente para o usuário</li>
</ul>',
 $code$<!DOCTYPE html>
<html lang="pt-BR">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Minha Primeira Página</title>
  </head>
  <body>
    <h1>Olá, mundo!</h1>
    <p>Esta é minha primeira página HTML.</p>
  </body>
</html>$code$,
 'html', 1, 11),

(32,
 'Títulos, Parágrafos e Semântica',
 '<p>HTML moderno usa tags <strong>semânticas</strong> — tags com significado claro — para organizar o conteúdo. Isso melhora a acessibilidade e o SEO.</p>
<p>Tags de conteúdo essenciais:</p>
<ul>
  <li><code>&lt;h1&gt;</code> a <code>&lt;h6&gt;</code> — títulos (h1 é o mais importante)</li>
  <li><code>&lt;p&gt;</code> — parágrafo de texto</li>
  <li><code>&lt;strong&gt;</code> — texto em negrito (ênfase importante)</li>
  <li><code>&lt;em&gt;</code> — texto em itálico (ênfase)</li>
</ul>
<p>Tags de estrutura semântica:</p>
<ul>
  <li><code>&lt;header&gt;</code> — cabeçalho, <code>&lt;main&gt;</code> — conteúdo principal</li>
  <li><code>&lt;section&gt;</code> — seção temática, <code>&lt;footer&gt;</code> — rodapé</li>
</ul>',
 $code$<!DOCTYPE html>
<html lang="pt-BR">
<body>

  <header>
    <h1>Meu Blog de Tecnologia</h1>
  </header>

  <main>
    <section>
      <h2>Por que aprender HTML?</h2>
      <p>HTML é a <strong>base de toda página web</strong>.</p>
      <p>Com ele você controla <em>a estrutura</em> do conteúdo.</p>
    </section>
  </main>

  <footer>
    <p>© 2024 Meu Blog</p>
  </footer>

</body>
</html>$code$,
 'html', 2, 11),

(33,
 'Links, Imagens e Listas',
 '<p><strong>Links</strong> — tag <code>&lt;a&gt;</code> com o atributo <code>href</code> — conectam páginas e recursos. Use <code>target="_blank"</code> para abrir em nova aba.</p>
<p><strong>Imagens</strong> — tag <code>&lt;img&gt;</code> com <code>src</code> (caminho) e <code>alt</code> (texto alternativo, obrigatório para acessibilidade).</p>
<p><strong>Listas</strong> organizam itens relacionados:</p>
<ul>
  <li><code>&lt;ul&gt;</code> — lista não ordenada (com bolinhas)</li>
  <li><code>&lt;ol&gt;</code> — lista ordenada (com números)</li>
  <li><code>&lt;li&gt;</code> — cada item da lista</li>
</ul>',
 $code$<!DOCTYPE html>
<html lang="pt-BR">
<body>

  <!-- Link simples -->
  <a href="https://www.google.com">Ir para o Google</a>

  <!-- Link em nova aba -->
  <a href="https://github.com" target="_blank">GitHub</a>

  <!-- Imagem com texto alternativo -->
  <img src="perfil.jpg" alt="Foto de perfil" width="150">

  <!-- Lista não ordenada -->
  <ul>
    <li>HTML</li>
    <li>CSS</li>
    <li>JavaScript</li>
  </ul>

  <!-- Lista ordenada -->
  <ol>
    <li>Instalar o editor</li>
    <li>Criar o arquivo HTML</li>
    <li>Abrir no navegador</li>
  </ol>

</body>
</html>$code$,
 'html', 3, 11);

INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(34,
 'Fundamentos do CSS',
 '<p>CSS (Cascading Style Sheets) controla a <strong>aparência visual</strong> das páginas: cores, tamanhos, fontes e layout.</p>
<p>Uma regra CSS tem a forma:</p>
<pre><code>seletor { propriedade: valor; }</code></pre>
<p>Os três tipos de seletor mais usados:</p>
<ul>
  <li><strong>Tag</strong> — seleciona todos os elementos daquela tag: <code>p { }</code></li>
  <li><strong>Classe</strong> — seleciona elementos com aquela classe (prefixo <code>.</code>): <code>.destaque { }</code></li>
  <li><strong>ID</strong> — seleciona um elemento único (prefixo <code>#</code>): <code>#titulo { }</code></li>
</ul>',
 $code$/* Seletor de tag — afeta todos os <p> */
p {
  color: #333;
  font-size: 16px;
  line-height: 1.6;
}

/* Seletor de classe — afeta elementos com class="destaque" */
.destaque {
  background-color: #fff3cd;
  font-weight: bold;
  padding: 4px 8px;
  border-radius: 4px;
}

/* Seletor de ID — afeta o elemento com id="titulo" */
#titulo {
  color: #1a73e8;
  font-size: 28px;
  text-align: center;
}$code$,
 'css', 1, 12),

(35,
 'Box Model e Espaçamentos',
 '<p>Todo elemento HTML é tratado como uma <strong>caixa retangular</strong>. O Box Model descreve as 4 camadas que compõem essa caixa, de dentro para fora:</p>
<ol>
  <li><strong>content</strong> — o conteúdo real (texto, imagem)</li>
  <li><strong>padding</strong> — espaço interno entre o conteúdo e a borda</li>
  <li><strong>border</strong> — a borda visível ao redor do elemento</li>
  <li><strong>margin</strong> — espaço externo entre o elemento e os vizinhos</li>
</ol>
<p>Dica: <code>box-sizing: border-box</code> faz o <code>width</code> incluir padding e border, evitando surpresas no layout.</p>',
 $code$.cartao {
  /* Conteúdo */
  width: 300px;

  /* Espaço interno (entre conteúdo e borda) */
  padding: 20px;

  /* Borda visível */
  border: 2px solid #ccc;
  border-radius: 8px;

  /* Espaço externo (entre este elemento e os outros) */
  margin: 16px auto; /* auto centraliza horizontalmente */

  background-color: #f8f9fa;

  /* Faz width incluir padding + border */
  box-sizing: border-box;
}$code$,
 'css', 2, 12);

-- ════════════════════════════════════════════════════════════════════════════
-- TRILHA 3 — HTML, CSS e JS (seções 13-14, lições 36-40)
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(36,
 'O DOM e getElementById',
 '<p>O <strong>DOM</strong> (Document Object Model) é a representação dos elementos HTML como objetos que o JavaScript pode ler e modificar.</p>
<p>Para selecionar um elemento pelo seu <code>id</code> usamos:</p>
<pre><code>let elemento = document.getElementById("meu-id");</code></pre>
<p>Com o elemento em mãos, podemos:</p>
<ul>
  <li>Alterar o texto: <code>elemento.textContent = "Novo texto";</code></li>
  <li>Alterar o HTML interno: <code>elemento.innerHTML = "&lt;b&gt;Negrito&lt;/b&gt;";</code></li>
  <li>Alterar um estilo: <code>elemento.style.color = "red";</code></li>
</ul>',
 $code$<!DOCTYPE html>
<html lang="pt-BR">
<body>

  <h1 id="titulo">Título original</h1>
  <p id="descricao">Texto original.</p>

  <script>
    let titulo = document.getElementById("titulo");
    let descricao = document.getElementById("descricao");

    titulo.textContent = "Título modificado pelo JS!";
    titulo.style.color = "#1a73e8";

    descricao.textContent = "O JavaScript alterou este parágrafo.";
  </script>

</body>
</html>$code$,
 'html', 1, 13),

(37,
 'Estilos e Classes via JavaScript',
 '<p>Além de alterar estilos diretamente com <code>element.style.propriedade</code>, podemos manipular as <strong>classes CSS</strong> do elemento — o que é mais recomendado por separar estilo do comportamento.</p>
<ul>
  <li><code>element.classList.add("nome")</code> — adiciona uma classe</li>
  <li><code>element.classList.remove("nome")</code> — remove uma classe</li>
  <li><code>element.classList.toggle("nome")</code> — adiciona se não tem, remove se tem</li>
</ul>
<p>Dessa forma, toda a aparência fica no CSS e o JavaScript apenas alterna as classes.</p>',
 $code$<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <style>
    .ativo   { color: green; font-weight: bold; border: 2px solid green; padding: 8px; }
    .inativo { color: gray;  text-decoration: line-through; }
  </style>
</head>
<body>

  <p id="status">Aguardando...</p>

  <script>
    let status = document.getElementById("status");

    status.classList.add("ativo");
    status.textContent = "Sistema online!";

    // Para trocar de estado:
    // status.classList.remove("ativo");
    // status.classList.add("inativo");
  </script>

</body>
</html>$code$,
 'html', 2, 13),

(38,
 'Eventos',
 '<p><strong>Eventos</strong> são ações do usuário — clicar, digitar, mover o mouse — que o JavaScript pode detectar e responder.</p>
<p>Usamos <code>addEventListener</code> para "escutar" um evento em um elemento:</p>
<pre><code>elemento.addEventListener("evento", function() {
  // o que fazer quando acontecer
});</code></pre>
<p>Eventos mais comuns:</p>
<ul>
  <li><code>click</code> — clique do mouse</li>
  <li><code>input</code> — digitação em um campo</li>
  <li><code>submit</code> — envio de formulário</li>
</ul>',
 $code$<!DOCTYPE html>
<html lang="pt-BR">
<body>

  <button id="meuBotao">Clique aqui</button>
  <p id="mensagem">Nada aconteceu ainda.</p>

  <script>
    let botao = document.getElementById("meuBotao");
    let mensagem = document.getElementById("mensagem");

    botao.addEventListener("click", function() {
      mensagem.textContent = "Botão clicado!";
      mensagem.style.color = "green";
      botao.textContent = "Clicado!";
      botao.disabled = true;
    });
  </script>

</body>
</html>$code$,
 'html', 3, 13);

INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(39,
 'Formulários e Input',
 '<p>Formulários coletam dados do usuário. O elemento <code>&lt;input&gt;</code> é o mais versátil: com <code>type="text"</code> aceita texto livre, com <code>type="number"</code> aceita só números, etc.</p>
<p>Para ler o que foi digitado via JavaScript, usamos <code>input.value</code>. Para reagir em tempo real, escutamos o evento <code>input</code>.</p>
<p>Boas práticas:</p>
<ul>
  <li>Sempre valide a entrada: verifique se o campo não está vazio antes de usar o valor</li>
  <li>Use <code>placeholder</code> para dar dicas ao usuário</li>
  <li>Use <code>label</code> ligado ao input para acessibilidade</li>
</ul>',
 $code$<!DOCTYPE html>
<html lang="pt-BR">
<body>

  <label for="nome">Seu nome:</label>
  <input type="text" id="nome" placeholder="Digite seu nome">
  <p id="saudacao">Olá, visitante!</p>

  <script>
    let input = document.getElementById("nome");
    let saudacao = document.getElementById("saudacao");

    input.addEventListener("input", function() {
      let nome = input.value.trim();
      if (nome.length > 0) {
        saudacao.textContent = "Olá, " + nome + "!";
      } else {
        saudacao.textContent = "Olá, visitante!";
      }
    });
  </script>

</body>
</html>$code$,
 'html', 1, 14),

(40,
 'Mini-projeto: Lista de Tarefas',
 '<p>Chegou a hora de unir tudo! Neste projeto você vai usar:</p>
<ul>
  <li><strong>HTML</strong> — para estruturar a interface (input, botão, lista)</li>
  <li><strong>CSS</strong> — para dar uma aparência agradável</li>
  <li><strong>JavaScript</strong> — para criar itens dinamicamente no DOM</li>
</ul>
<p>Os conceitos-chave são:</p>
<ul>
  <li><code>document.createElement("li")</code> — cria um novo elemento HTML</li>
  <li><code>lista.appendChild(item)</code> — adiciona o elemento como filho de outro</li>
  <li><code>input.value = ""</code> — limpa o campo após adicionar</li>
</ul>',
 $code$<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <style>
    body { font-family: Arial, sans-serif; max-width: 400px; margin: 40px auto; }
    input { padding: 8px; width: 70%; font-size: 16px; }
    button { padding: 8px 16px; font-size: 16px; cursor: pointer; }
    ul { list-style: none; padding: 0; margin-top: 16px; }
    li { background: #f0f4ff; border-left: 4px solid #1a73e8;
         padding: 8px 12px; margin: 6px 0; border-radius: 4px; }
  </style>
</head>
<body>
  <h2>Lista de Tarefas</h2>
  <input type="text" id="novaTarefa" placeholder="Nova tarefa...">
  <button id="adicionar">Adicionar</button>
  <ul id="lista"></ul>

  <script>
    let btn   = document.getElementById("adicionar");
    let input = document.getElementById("novaTarefa");
    let lista = document.getElementById("lista");

    btn.addEventListener("click", function() {
      let texto = input.value.trim();
      if (texto !== "") {
        let item = document.createElement("li");
        item.textContent = texto;
        lista.appendChild(item);
        input.value = "";
        input.focus();
      }
    });
  </script>
</body>
</html>$code$,
 'html', 2, 14);

-- ════════════════════════════════════════════════════════════════════════════
-- EXERCÍCIOS — 1 por lição (40 no total)
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_exercises (id, question, correct_answer, lesson_id) VALUES
-- Módulo 1: Primeiros Passos
(1,  'Qual função usamos para exibir mensagens no console do JavaScript?',              1,  1),
(2,  'Qual palavra-chave usamos para declarar variáveis em JavaScript moderno?',        1,  2),
(3,  'Qual é o resultado de typeof "Olá"?',                                             2,  3),
-- Módulo 2: Operadores
(4,  'Qual é o resultado de 10 % 3?',                                                   2,  4),
(5,  'O que o operador i++ faz com o valor de i?',                                      2,  5),
(6,  'Qual é o resultado de 2 + 3 * 4 em JavaScript?',                                  1,  6),
-- Módulo 3: Comparação e Lógica
(7,  'Qual operador verifica igualdade de valor E tipo em JavaScript?',                 2,  7),
(8,  'Para que && (AND) retorne true, o que é necessário?',                             1,  8),
(9,  'Qual é o resultado de !true?',                                                    3,  9),
-- Módulo 4: Condicionais
(10, 'Qual bloco é executado quando a condição do if é false?',                         2, 10),
(11, 'Quantos blocos else if podemos encadear em um condicional?',                      3, 11),
(12, 'No ternário condição ? "sim" : "não", quando a condição é false, o retorno é…',  1, 12),
-- Módulo 5: Laços
(13, 'Para que serve o incremento (i++) no laço for?',                                  2, 13),
(14, 'O que acontece se a condição do while nunca se tornar false?',                    2, 14),
(15, 'O que break faz dentro de um laço?',                                              2, 15),
-- Módulo 6: Funções
(16, 'Como chamamos (executamos) uma função chamada saudar?',                           2, 16),
(17, 'O que a palavra-chave return faz dentro de uma função?',                          1, 17),
(18, 'Qual das opções abaixo é uma arrow function válida?',                             2, 18),
-- Módulo 7: Strings
(19, 'O que "texto".length retorna?',                                                   0, 19),
(20, 'O que "JavaScript".slice(0, 4) retorna?',                                         0, 20),
(21, 'Em um template literal, como inserimos o valor de uma variável?',                 2, 21),
-- Módulo 8: Arrays
(22, 'Qual é o índice do primeiro elemento de um array?',                               2, 22),
(23, 'Qual método adiciona um elemento ao FINAL de um array?',                          0, 23),
(24, 'O que forEach() faz com um array?',                                               2, 24),
-- Módulo 9: Objetos
(25, 'Como criamos um objeto em JavaScript?',                                           2, 25),
(26, 'Dado obj = { nome: "Ana" }, como lemos a propriedade nome?',                      2, 26),
(27, 'O que é um método em um objeto JavaScript?',                                      1, 27),
-- Módulo 10: Combinando Tudo
(28, 'Como acessamos a propriedade nome do primeiro objeto no array produtos?',         2, 28),
(29, 'Uma função que soma elementos de um array usa internamente…',                     1, 29),
(30, 'Qual declaração cria corretamente um array de objetos?',                          2, 30),
-- Trilha 2
(31, 'Qual tag HTML contém o conteúdo visível da página?',                              2, 31),
(32, 'Qual tag representa o conteúdo principal de uma página?',                         0, 32),
(33, 'Qual atributo da tag <a> define o destino de um link?',                           1, 33),
(34, 'Como selecionamos um elemento pela sua classe no CSS?',                           1, 34),
(35, 'Qual propriedade CSS define o espaçamento interno?',                              1, 35),
-- Trilha 3
(36, 'Qual método JavaScript seleciona um elemento pelo seu ID?',                       2, 36),
(37, 'Qual método adiciona uma classe CSS a um elemento via JavaScript?',               2, 37),
(38, 'Qual método usamos para registrar um ouvinte de eventos?',                        2, 38),
(39, 'Como lemos o valor digitado em um <input> via JavaScript?',                       1, 39),
(40, 'Qual método cria um novo elemento HTML via JavaScript?',                          2, 40);

-- ════════════════════════════════════════════════════════════════════════════
-- OPÇÕES DOS EXERCÍCIOS
-- ════════════════════════════════════════════════════════════════════════════

-- Ex 1: console.log
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(1, 'console.show()'), (1, 'console.log()'), (1, 'console.print()'), (1, 'console.write()');

-- Ex 2: let
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(2, 'var'), (2, 'let'), (2, 'create'), (2, 'define');

-- Ex 3: typeof "Olá" → "string"
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(3, '"number"'), (3, '"text"'), (3, '"string"'), (3, '"boolean"');

-- Ex 4: 10 % 3 → 1
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(4, '3'), (4, '2'), (4, '1'), (4, '0');

-- Ex 5: i++ incrementa em 1
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(5, 'Decrementa i em 1'),
(5, 'Multiplica i por 2'),
(5, 'Incrementa i em 1'),
(5, 'Zera o valor de i');

-- Ex 6: 2 + 3 * 4 = 14
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(6, '20'), (6, '14'), (6, '10'), (6, '24');

-- Ex 7: ===
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(7, '=='), (7, '='), (7, '==='), (7, '!==');

-- Ex 8: && requer ambas verdadeiras
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(8, 'Pelo menos uma condição precisa ser verdadeira'),
(8, 'Ambas as condições precisam ser verdadeiras'),
(8, 'Nenhuma condição pode ser verdadeira'),
(8, 'Apenas a primeira condição importa');

-- Ex 9: !true → false
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(9, 'true'), (9, 'null'), (9, 'undefined'), (9, 'false');

-- Ex 10: else
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(10, 'catch'), (10, 'then'), (10, 'else'), (10, 'finally');

-- Ex 11: quantos else if quiser
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(11, 'Apenas 1'),
(11, 'No máximo 3'),
(11, 'Apenas 2'),
(11, 'Quantos precisar');

-- Ex 12: ternário false → segundo valor ("não")
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(12, '"sim"'), (12, '"não"'), (12, 'undefined'), (12, 'null');

-- Ex 13: incremento avança variável de controle
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(13, 'Define o valor inicial de i'),
(13, 'Determina quantas vezes repetir'),
(13, 'Avança a variável de controle a cada iteração'),
(13, 'Para o laço quando i chega ao limite');

-- Ex 14: loop infinito
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(14, 'O laço executa exatamente 10 vezes'),
(14, 'O programa continua normalmente após o laço'),
(14, 'O laço executa infinitamente e trava o programa'),
(14, 'O laço executa apenas uma vez');

-- Ex 15: break sai do laço
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(15, 'Pausa o laço temporariamente'),
(15, 'Pula para a próxima iteração'),
(15, 'Sai do laço imediatamente'),
(15, 'Reinicia o laço do início');

-- Ex 16: saudar()
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(16, 'call saudar()'), (16, 'run saudar()'), (16, 'saudar()'), (16, 'execute saudar');

-- Ex 17: return retorna valor ao chamador
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(17, 'Exibe um valor no console'),
(17, 'Retorna um valor para quem chamou a função'),
(17, 'Declara uma nova variável'),
(17, 'Cria um laço de repetição');

-- Ex 18: arrow function
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(18, 'function somar(a, b) { return a + b }'),
(18, 'const somar = function(a, b) { return a + b }'),
(18, 'const somar = (a, b) => a + b'),
(18, 'def somar(a, b): return a + b');

-- Ex 19: length retorna contagem de caracteres
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(19, 'O número de caracteres da string'),
(19, 'O tipo da variável'),
(19, 'O primeiro caractere'),
(19, 'O último caractere');

-- Ex 20: slice(0,4) → "Java"
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(20, '"Java"'), (20, '"Script"'), (20, '"avaS"'), (20, '"JavaScrip"');

-- Ex 21: ${variavel}
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(21, '{variavel}'), (21, '{{variavel}}'), (21, '${variavel}'), (21, '$(variavel)');

-- Ex 22: índice 0
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(22, '1'), (22, '-1'), (22, '0'), (22, 'Não existe índice em arrays');

-- Ex 23: push() adiciona ao final
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(23, 'push()'), (23, 'pop()'), (23, 'unshift()'), (23, 'shift()');

-- Ex 24: forEach executa função para cada elemento
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(24, 'Cria um novo array vazio'),
(24, 'Retorna o primeiro elemento do array'),
(24, 'Executa uma função para cada elemento do array'),
(24, 'Remove todos os elementos do array');

-- Ex 25: objeto com {}
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(25, 'Com colchetes []'),
(25, 'Com parênteses ()'),
(25, 'Com chaves {}'),
(25, 'Com sinais de menor/maior <>');

-- Ex 26: obj.nome
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(26, 'obj[nome]'), (26, 'obj->nome'), (26, 'obj.nome'), (26, 'nome.obj');

-- Ex 27: método = função como propriedade
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(27, 'Uma propriedade que armazena um número'),
(27, 'Uma propriedade que armazena uma função'),
(27, 'Uma propriedade que armazena um array'),
(27, 'Um valor constante que não pode ser alterado');

-- Ex 28: produtos[0].nome
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(28, 'produtos[0][nome]'),
(28, 'produtos.nome[0]'),
(28, 'produtos[0].nome'),
(28, 'produtos.0.nome');

-- Ex 29: um laço para iterar e acumular
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(29, 'Apenas if/else para comparar valores'),
(29, 'Um laço para iterar o array e acumular a soma'),
(29, 'Apenas o return sem nenhuma lógica adicional'),
(29, 'Um método de string para converter os números');

-- Ex 30: [{nome: "Ana"}, {nome: "Bob"}]
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(30, '[nome: "Ana", idade: 20]'),
(30, '{[nome: "Ana"], [nome: "Bob"]}'),
(30, '[{nome: "Ana"}, {nome: "Bob"}]'),
(30, '{nome: ["Ana", "Bob"]}');

-- Ex 31: <body>
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(31, '<head>'), (31, '<html>'), (31, '<body>'), (31, '<meta>');

-- Ex 32: <main>
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(32, '<main>'), (32, '<section>'), (32, '<div>'), (32, '<header>');

-- Ex 33: href
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(33, 'src'), (33, 'href'), (33, 'alt'), (33, 'link');

-- Ex 34: .minha-classe
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(34, '#minha-classe'), (34, '.minha-classe'), (34, 'minha-classe'), (34, '*minha-classe');

-- Ex 35: padding
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(35, 'margin'), (35, 'padding'), (35, 'border'), (35, 'spacing');

-- Ex 36: getElementById
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(36, 'document.getElement()'),
(36, 'document.findById()'),
(36, 'document.getElementById()'),
(36, 'document.selectId()');

-- Ex 37: classList.add
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(37, 'element.style.add()'),
(37, 'element.addClass()'),
(37, 'element.classList.add()'),
(37, 'element.class.push()');

-- Ex 38: addEventListener
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(38, 'element.onClick()'),
(38, 'element.on()'),
(38, 'element.addEventListener()'),
(38, 'element.listenTo()');

-- Ex 39: input.value
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(39, 'input.text'), (39, 'input.value'), (39, 'input.content'), (39, 'input.data');

-- Ex 40: createElement
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(40, 'document.newElement()'),
(40, 'document.addElement()'),
(40, 'document.createElement()'),
(40, 'document.makeElement()');

-- ════════════════════════════════════════════════════════════════════════════
-- RESET DE SEQUENCES
-- ════════════════════════════════════════════════════════════════════════════

SELECT setval('tb_courses_id_seq',   (SELECT MAX(id) FROM tb_courses));
SELECT setval('tb_sections_id_seq',  (SELECT MAX(id) FROM tb_sections));
SELECT setval('tb_lessons_id_seq',   (SELECT MAX(id) FROM tb_lessons));
SELECT setval('tb_exercises_id_seq', (SELECT MAX(id) FROM tb_exercises));
