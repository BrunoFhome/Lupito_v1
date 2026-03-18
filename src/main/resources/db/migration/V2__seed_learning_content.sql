-- ════════════════════════════════════════════════════════════════════════════
-- CURSOS
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_courses (id, title, description) VALUES
(1, 'Lógica de Programação com JavaScript',
 'Trilha focada em fundamentos de lógica, estrutura de controle, funções, arrays, objetos e resolução de problemas com JavaScript.'),
(2, 'Desenvolvimento Web Básico com HTML, CSS e JS',
 'Trilha introdutória sobre estrutura de páginas com HTML, estilização com CSS e interatividade básica com JavaScript.');

-- ════════════════════════════════════════════════════════════════════════════
-- SEÇÕES — Curso 1 (Lógica de Programação com JavaScript)
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_sections (id, title, list_order, course_id) VALUES
(1, 'Fundamentos do JavaScript',      1, 1),
(2, 'Controle de Fluxo',              2, 1),
(3, 'Funções e Estruturas de Dados',  3, 1),
(4, 'Resolução de Problemas',         4, 1);

-- ════════════════════════════════════════════════════════════════════════════
-- SEÇÕES — Curso 2 (Desenvolvimento Web Básico)
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_sections (id, title, list_order, course_id) VALUES
(5, 'HTML',                    1, 2),
(6, 'CSS',                     2, 2),
(7, 'JavaScript no Navegador', 3, 2);

-- ════════════════════════════════════════════════════════════════════════════
-- LIÇÕES — Seção 1: Fundamentos do JavaScript
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_lessons (id, title, theory_content, list_order, section_id) VALUES
(1, 'Introdução à Lógica e ao JavaScript',
 'Lógica de programação é a habilidade de organizar instruções em uma sequência clara para resolver problemas. Em JavaScript, escrevemos comandos que o computador executa passo a passo.',
 1, 1),

(2, 'Variáveis e Tipos de Dados',
 'Variáveis guardam dados para uso posterior. Em JavaScript, os tipos mais comuns são string, number e boolean. Saber escolher o tipo certo ajuda a escrever código mais claro.',
 2, 1),

(3, 'Operadores Matemáticos e Comparação',
 'Operadores aritméticos fazem cálculos, como soma e multiplicação. Operadores de comparação verificam relações entre valores, como igualdade e diferença, retornando true ou false.',
 3, 1);

-- ════════════════════════════════════════════════════════════════════════════
-- LIÇÕES — Seção 2: Controle de Fluxo
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_lessons (id, title, theory_content, list_order, section_id) VALUES
(4, 'Estruturas Condicionais',
 'Estruturas condicionais permitem que o programa escolha caminhos diferentes com base em condições. Isso é essencial para validar dados e reagir a entradas do usuário.',
 1, 2),

(5, 'Operadores Lógicos',
 'Operadores lógicos ajudam a combinar ou inverter condições. Eles são muito usados em validações mais complexas, como verificar idade e status ao mesmo tempo.',
 2, 2),

(6, 'Laços de Repetição',
 'Laços de repetição executam um bloco de código várias vezes. Eles evitam repetição manual e são úteis para percorrer listas ou repetir ações até uma condição ser atendida.',
 3, 2);

-- ════════════════════════════════════════════════════════════════════════════
-- LIÇÕES — Seção 3: Funções e Estruturas de Dados
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_lessons (id, title, theory_content, list_order, section_id) VALUES
(7, 'Funções',
 'Funções agrupam instruções para executar uma tarefa específica. Elas tornam o código mais reutilizável, limpo e fácil de manter.',
 1, 3),

(8, 'Arrays',
 'Arrays permitem guardar múltiplos valores em uma única variável. São muito usados para listas de itens, dados de usuários, produtos e resultados de buscas.',
 2, 3),

(9, 'Objetos',
 'Objetos armazenam dados em pares de chave e valor. São ideais para representar entidades como usuário, produto, aula ou exercício.',
 3, 3);

-- ════════════════════════════════════════════════════════════════════════════
-- LIÇÕES — Seção 4: Resolução de Problemas
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_lessons (id, title, theory_content, list_order, section_id) VALUES
(10, 'Resolução de Problemas',
 'Resolver problemas exige entender a entrada, o processamento e a saída. O foco não é só escrever código, mas pensar de forma estruturada antes de implementar.',
 1, 4);

-- ════════════════════════════════════════════════════════════════════════════
-- LIÇÕES — Seção 5: HTML
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_lessons (id, title, theory_content, list_order, section_id) VALUES
(11, 'Introdução ao Desenvolvimento Web',
 'No desenvolvimento web, HTML estrutura o conteúdo, CSS estiliza a aparência e JavaScript adiciona comportamento. Juntas, essas tecnologias formam a base do front-end.',
 1, 5),

(12, 'Estrutura Básica do HTML',
 'Um documento HTML possui uma estrutura padrão com elementos como doctype, html, head e body. Essa base organiza o conteúdo e informa ao navegador como interpretar a página.',
 2, 5),

(13, 'Textos e Elementos Semânticos',
 'Tags semânticas dão significado ao conteúdo, ajudando na acessibilidade e organização da página. Exemplos incluem header, main, section e footer.',
 3, 5),

(14, 'Links e Imagens',
 'Links conectam páginas e recursos. Imagens enriquecem a interface. Ambos são essenciais para criar experiências web navegáveis e visuais.',
 4, 5),

(15, 'Listas e Tabelas',
 'Listas são úteis para itens relacionados, enquanto tabelas organizam dados em linhas e colunas. Saber usar essas estruturas melhora a clareza do conteúdo.',
 5, 5);

-- ════════════════════════════════════════════════════════════════════════════
-- LIÇÕES — Seção 6: CSS
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_lessons (id, title, theory_content, list_order, section_id) VALUES
(16, 'Fundamentos do CSS',
 'CSS controla cores, tamanhos, espaçamentos e layout. Ele separa a apresentação da estrutura, permitindo páginas mais bonitas e organizadas.',
 1, 6),

(17, 'Seletores e Classes',
 'Seletores CSS permitem escolher quais elementos serão estilizados. Classes são reutilizáveis e ajudam a manter consistência visual na interface.',
 2, 6),

(18, 'Box Model e Espaçamentos',
 'Todo elemento HTML pode ser visto como uma caixa. O Box Model define como conteúdo, espaçamento interno, borda e margem ocupam espaço na página.',
 3, 6);

-- ════════════════════════════════════════════════════════════════════════════
-- LIÇÕES — Seção 7: JavaScript no Navegador
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_lessons (id, title, theory_content, list_order, section_id) VALUES
(19, 'Introdução ao JavaScript no HTML',
 'JavaScript pode ser incluído em páginas HTML para responder a eventos, alterar conteúdo e criar interatividade. Ele atua sobre os elementos da página em tempo real.',
 1, 7),

(20, 'Eventos e Interatividade',
 'Eventos são ações como clique, digitação ou envio de formulário. Com JavaScript, podemos capturar esses eventos e executar respostas dinâmicas na interface.',
 2, 7);

-- ════════════════════════════════════════════════════════════════════════════
-- EXERCÍCIOS E OPÇÕES — Lição 1: Introdução à Lógica e ao JavaScript
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_exercises (id, question, correct_answer, lesson_id) VALUES
(1,  'Qual é o principal objetivo da lógica de programação?', 1, 1),
(2,  'JavaScript é usado para:', 1, 1),
(3,  'O que é um algoritmo?', 1, 1);

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(1, 'Criar imagens para sites'),
(1, 'Organizar instruções para resolver problemas'),
(1, 'Instalar programas no computador'),
(1, 'Aumentar a velocidade da internet'),
(2, 'Criar planilhas no Excel'),
(2, 'Controlar comportamento e lógica em aplicações web'),
(2, 'Substituir totalmente o HTML'),
(2, 'Montar hardware de computadores'),
(3, 'Um tipo de navegador'),
(3, 'Uma sequência de passos para resolver um problema'),
(3, 'Um banco de dados'),
(3, 'Um editor de imagens');

-- ════════════════════════════════════════════════════════════════════════════
-- EXERCÍCIOS E OPÇÕES — Lição 2: Variáveis e Tipos de Dados
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_exercises (id, question, correct_answer, lesson_id) VALUES
(4,  'Qual palavra pode ser usada para declarar uma variável em JavaScript?', 1, 2),
(5,  'Qual dos valores abaixo é do tipo string?', 2, 2),
(6,  'Qual tipo representa verdadeiro ou falso?', 2, 2);

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(4, 'create'),
(4, 'var'),
(4, 'value'),
(4, 'define'),
(5, '25'),
(5, 'true'),
(5, '"Olá mundo"'),
(5, 'null'),
(6, 'number'),
(6, 'string'),
(6, 'boolean'),
(6, 'array');

-- ════════════════════════════════════════════════════════════════════════════
-- EXERCÍCIOS E OPÇÕES — Lição 3: Operadores Matemáticos e Comparação
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_exercises (id, question, correct_answer, lesson_id) VALUES
(7,  'Qual operador é usado para soma em JavaScript?', 0, 3),
(8,  'O resultado de 10 > 3 é:', 2, 3),
(9,  'Qual operador verifica igualdade estrita em JavaScript?', 2, 3);

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(7, '+'),
(7, '-'),
(7, '*'),
(7, '/'),
(8, 'false'),
(8, '0'),
(8, 'true'),
(8, '"true"'),
(9, '='),
(9, '=='),
(9, '==='),
(9, '!=');

-- ════════════════════════════════════════════════════════════════════════════
-- EXERCÍCIOS E OPÇÕES — Lição 4: Estruturas Condicionais
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_exercises (id, question, correct_answer, lesson_id) VALUES
(10, 'Qual estrutura é usada para tomar decisões no código?', 0, 4),
(11, 'Se uma condição for falsa, qual bloco pode ser executado?', 2, 4),
(12, 'Qual palavra permite testar várias condições em sequência?', 0, 4);

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(10, 'if'),
(10, 'for'),
(10, 'function'),
(10, 'console'),
(11, 'break'),
(11, 'return'),
(11, 'else'),
(11, 'var'),
(12, 'else if'),
(12, 'switcher'),
(12, 'loop if'),
(12, 'do else');

-- ════════════════════════════════════════════════════════════════════════════
-- EXERCÍCIOS E OPÇÕES — Lição 5: Operadores Lógicos
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_exercises (id, question, correct_answer, lesson_id) VALUES
(13, 'Qual operador representa E lógico?', 1, 5),
(14, 'Qual operador representa OU lógico?', 1, 5),
(15, 'O operador ! faz o quê?', 2, 5);

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(13, '||'),
(13, '&&'),
(13, '!'),
(13, '=='),
(14, '&&'),
(14, '||'),
(14, '++'),
(14, '--'),
(15, 'Soma dois números'),
(15, 'Compara igualdade'),
(15, 'Inverte um valor lógico'),
(15, 'Cria uma variável');

-- ════════════════════════════════════════════════════════════════════════════
-- EXERCÍCIOS E OPÇÕES — Lição 6: Laços de Repetição
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_exercises (id, question, correct_answer, lesson_id) VALUES
(16, 'Qual estrutura é usada para repetir um bloco várias vezes?', 1, 6),
(17, 'Qual laço costuma ser usado quando sabemos a quantidade de repetições?', 2, 6),
(18, 'Qual laço depende de uma condição para continuar executando?', 2, 6);

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(16, 'if'),
(16, 'for'),
(16, 'const'),
(16, 'return'),
(17, 'if'),
(17, 'while'),
(17, 'for'),
(17, 'else'),
(18, 'for'),
(18, 'switch'),
(18, 'while'),
(18, 'case');

-- ════════════════════════════════════════════════════════════════════════════
-- EXERCÍCIOS E OPÇÕES — Lição 7: Funções
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_exercises (id, question, correct_answer, lesson_id) VALUES
(19, 'Para que servem as funções?', 1, 7),
(20, 'Qual palavra é usada para declarar uma função tradicional?', 1, 7),
(21, 'O que uma função pode receber?', 2, 7);

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(19, 'Para mudar a cor do navegador'),
(19, 'Para agrupar código reutilizável'),
(19, 'Para criar tabelas HTML'),
(19, 'Para instalar bibliotecas'),
(20, 'method'),
(20, 'function'),
(20, 'func'),
(20, 'def'),
(21, 'Somente strings'),
(21, 'Somente números'),
(21, 'Parâmetros'),
(21, 'Somente booleanos');

-- ════════════════════════════════════════════════════════════════════════════
-- EXERCÍCIOS E OPÇÕES — Lição 8: Arrays
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_exercises (id, question, correct_answer, lesson_id) VALUES
(22, 'Qual estrutura é usada para armazenar vários valores em sequência?', 1, 8),
(23, 'Qual símbolo representa um array em JavaScript?', 2, 8),
(24, 'Em um array, o primeiro índice é:', 1, 8);

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(22, 'boolean'),
(22, 'array'),
(22, 'if'),
(22, 'function'),
(23, '{}'),
(23, '()'),
(23, '[]'),
(23, '<>'),
(24, '1'),
(24, '0'),
(24, '-1'),
(24, '10');

-- ════════════════════════════════════════════════════════════════════════════
-- EXERCÍCIOS E OPÇÕES — Lição 9: Objetos
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_exercises (id, question, correct_answer, lesson_id) VALUES
(25, 'Objetos em JavaScript armazenam dados em:', 1, 9),
(26, 'Qual símbolo representa um objeto literal?', 2, 9),
(27, 'Qual estrutura representa melhor um aluno com nome e idade?', 2, 9);

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(25, 'Linhas e colunas'),
(25, 'Chaves e valores'),
(25, 'Somente listas'),
(25, 'Somente números'),
(26, '[]'),
(26, '()'),
(26, '{}'),
(26, '<>'),
(27, 'Uma string'),
(27, 'Um número'),
(27, 'Um objeto'),
(27, 'Um operador');

-- ════════════════════════════════════════════════════════════════════════════
-- EXERCÍCIOS E OPÇÕES — Lição 10: Resolução de Problemas
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_exercises (id, question, correct_answer, lesson_id) VALUES
(28, 'Antes de programar, o mais importante é:', 1, 10),
(29, 'Um problema computacional normalmente envolve:', 0, 10),
(30, 'Qual habilidade melhora a construção de algoritmos?', 1, 10);

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(28, 'Escolher a cor do editor'),
(28, 'Entender o problema a ser resolvido'),
(28, 'Criar muitas variáveis sem planejar'),
(28, 'Usar bibliotecas avançadas'),
(29, 'Entrada, processamento e saída'),
(29, 'HTML, CSS e imagem'),
(29, 'Mouse, teclado e tela'),
(29, 'Internet, cabo e roteador'),
(30, 'Memorizar cores'),
(30, 'Pensamento lógico'),
(30, 'Desenhar interfaces'),
(30, 'Formatar textos');

-- ════════════════════════════════════════════════════════════════════════════
-- EXERCÍCIOS E OPÇÕES — Lição 11: Introdução ao Desenvolvimento Web
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_exercises (id, question, correct_answer, lesson_id) VALUES
(31, 'Qual tecnologia é usada para estruturar o conteúdo da página?', 2, 11),
(32, 'Qual tecnologia é usada para estilizar a página?', 1, 11),
(33, 'Qual tecnologia adiciona interatividade à página?', 0, 11);

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(31, 'CSS'),
(31, 'JavaScript'),
(31, 'HTML'),
(31, 'SQL'),
(32, 'HTML'),
(32, 'CSS'),
(32, 'Node.js'),
(32, 'Java'),
(33, 'JavaScript'),
(33, 'HTML'),
(33, 'CSS'),
(33, 'PNG');

-- ════════════════════════════════════════════════════════════════════════════
-- EXERCÍCIOS E OPÇÕES — Lição 12: Estrutura Básica do HTML
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_exercises (id, question, correct_answer, lesson_id) VALUES
(34, 'Qual tag contém o conteúdo visível da página?', 2, 12),
(35, 'Qual tag define o título exibido na aba do navegador?', 2, 12),
(36, 'Qual elemento indica ao navegador que o documento é HTML5?', 1, 12);

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(34, '<head>'),
(34, '<meta>'),
(34, '<body>'),
(34, '<title>'),
(35, '<body>'),
(35, '<footer>'),
(35, '<title>'),
(35, '<main>'),
(36, '<html>'),
(36, '<!DOCTYPE html>'),
(36, '<script>'),
(36, '<section>');

-- ════════════════════════════════════════════════════════════════════════════
-- EXERCÍCIOS E OPÇÕES — Lição 13: Textos e Elementos Semânticos
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_exercises (id, question, correct_answer, lesson_id) VALUES
(37, 'Qual tag é usada para criar um parágrafo?', 0, 13),
(38, 'Qual tag representa o conteúdo principal da página?', 0, 13),
(39, 'Qual tag é normalmente usada para o topo da página?', 1, 13);

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(37, '<p>'),
(37, '<h1>'),
(37, '<span>'),
(37, '<div>'),
(38, '<main>'),
(38, '<aside>'),
(38, '<br>'),
(38, '<b>'),
(39, '<footer>'),
(39, '<header>'),
(39, '<article>'),
(39, '<strong>');

-- ════════════════════════════════════════════════════════════════════════════
-- EXERCÍCIOS E OPÇÕES — Lição 14: Links e Imagens
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_exercises (id, question, correct_answer, lesson_id) VALUES
(40, 'Qual tag é usada para criar um link?', 1, 14),
(41, 'Qual atributo da tag <a> define o destino do link?', 1, 14),
(42, 'Qual atributo da tag <img> define o caminho da imagem?', 1, 14);

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(40, '<img>'),
(40, '<a>'),
(40, '<link>'),
(40, '<navlink>'),
(41, 'src'),
(41, 'href'),
(41, 'alt'),
(41, 'class'),
(42, 'href'),
(42, 'src'),
(42, 'alt'),
(42, 'title');

-- ════════════════════════════════════════════════════════════════════════════
-- EXERCÍCIOS E OPÇÕES — Lição 15: Listas e Tabelas
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_exercises (id, question, correct_answer, lesson_id) VALUES
(43, 'Qual tag cria uma lista não ordenada?', 1, 15),
(44, 'Qual tag representa um item de lista?', 2, 15),
(45, 'Qual tag representa uma linha em uma tabela?', 0, 15);

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(43, '<ol>'),
(43, '<ul>'),
(43, '<li>'),
(43, '<table>'),
(44, '<list>'),
(44, '<item>'),
(44, '<li>'),
(44, '<td>'),
(45, '<tr>'),
(45, '<td>'),
(45, '<th>'),
(45, '<table-row>');

-- ════════════════════════════════════════════════════════════════════════════
-- EXERCÍCIOS E OPÇÕES — Lição 16: Fundamentos do CSS
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_exercises (id, question, correct_answer, lesson_id) VALUES
(46, 'Qual linguagem é usada para estilizar páginas web?', 1, 16),
(47, 'Qual propriedade CSS altera a cor do texto?', 2, 16),
(48, 'Qual propriedade CSS altera a cor de fundo?', 1, 16);

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(46, 'HTML'),
(46, 'CSS'),
(46, 'JavaScript'),
(46, 'JSON'),
(47, 'background'),
(47, 'font-size'),
(47, 'color'),
(47, 'border'),
(48, 'text-color'),
(48, 'background-color'),
(48, 'font-color'),
(48, 'color-fill');

-- ════════════════════════════════════════════════════════════════════════════
-- EXERCÍCIOS E OPÇÕES — Lição 17: Seletores e Classes
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_exercises (id, question, correct_answer, lesson_id) VALUES
(49, 'Como selecionamos uma classe no CSS?', 1, 17),
(50, 'Como selecionamos um id no CSS?', 1, 17),
(51, 'Qual opção representa um seletor de tag?', 0, 17);

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(49, '#minha-classe'),
(49, '.minha-classe'),
(49, 'minha-classe'),
(49, '*minha-classe'),
(50, '.meu-id'),
(50, '#meu-id'),
(50, '@meu-id'),
(50, '&meu-id'),
(51, 'p'),
(51, '.p'),
(51, '#p'),
(51, '@p');

-- ════════════════════════════════════════════════════════════════════════════
-- EXERCÍCIOS E OPÇÕES — Lição 18: Box Model e Espaçamentos
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_exercises (id, question, correct_answer, lesson_id) VALUES
(52, 'Qual propriedade define o espaçamento interno de um elemento?', 1, 18),
(53, 'Qual propriedade define o espaçamento externo de um elemento?', 1, 18),
(54, 'No Box Model, a borda fica entre:', 1, 18);

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(52, 'margin'),
(52, 'padding'),
(52, 'border'),
(52, 'width'),
(53, 'padding'),
(53, 'margin'),
(53, 'font-size'),
(53, 'display'),
(54, 'margin e padding'),
(54, 'padding e content'),
(54, 'content e width'),
(54, 'font-size e color');

-- ════════════════════════════════════════════════════════════════════════════
-- EXERCÍCIOS E OPÇÕES — Lição 19: Introdução ao JavaScript no HTML
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_exercises (id, question, correct_answer, lesson_id) VALUES
(55, 'Qual tag é usada para inserir JavaScript no HTML?', 1, 19),
(56, 'JavaScript no navegador pode ser usado para:', 1, 19),
(57, 'Onde um script pode ser colocado em uma página HTML?', 2, 19);

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(55, '<style>'),
(55, '<script>'),
(55, '<js>'),
(55, '<code>'),
(56, 'Estilizar sozinho toda a página'),
(56, 'Modificar comportamento e conteúdo da interface'),
(56, 'Substituir o HTML completamente'),
(56, 'Criar banco de dados local relacional'),
(57, 'Apenas fora do arquivo HTML'),
(57, 'Somente dentro de tabelas'),
(57, 'No head ou antes do fechamento do body'),
(57, 'Somente dentro do title');

-- ════════════════════════════════════════════════════════════════════════════
-- EXERCÍCIOS E OPÇÕES — Lição 20: Eventos e Interatividade
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_exercises (id, question, correct_answer, lesson_id) VALUES
(58, 'Qual evento ocorre quando o usuário clica em um elemento?', 1, 20),
(59, 'Eventos em páginas web servem para:', 1, 20),
(60, 'JavaScript pode ser usado para responder a eventos e:', 0, 20);

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(58, 'hover'),
(58, 'click'),
(58, 'changeColor'),
(58, 'submitNow'),
(59, 'Apenas mudar o tamanho da fonte'),
(59, 'Detectar interações do usuário'),
(59, 'Criar banco de dados'),
(59, 'Instalar plugins automaticamente'),
(60, 'Alterar elementos da interface'),
(60, 'Trocar o navegador do usuário'),
(60, 'Formatar o disco rígido'),
(60, 'Aumentar a velocidade da RAM');

-- ════════════════════════════════════════════════════════════════════════════
-- RESET DE SEQUENCES
-- ════════════════════════════════════════════════════════════════════════════

SELECT setval('tb_courses_id_seq',   (SELECT MAX(id) FROM tb_courses));
SELECT setval('tb_sections_id_seq',  (SELECT MAX(id) FROM tb_sections));
SELECT setval('tb_lessons_id_seq',   (SELECT MAX(id) FROM tb_lessons));
SELECT setval('tb_exercises_id_seq', (SELECT MAX(id) FROM tb_exercises));
