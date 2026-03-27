-- ════════════════════════════════════════════════════════════════════════════
-- TRILHA HTML+CSS — SEÇÕES (15 módulos, IDs 13–27)
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_sections (id, title, list_order, course_id) VALUES
(13, 'Introdução ao HTML',              1,  2),
(14, 'Estrutura Base do Documento',     2,  2),
(15, 'Textos e Títulos',                3,  2),
(16, 'Links e Imagens',                 4,  2),
(17, 'Listas e Botões',                 5,  2),
(18, 'Divs e HTML Semântico',           6,  2),
(19, 'Classes e IDs',                   7,  2),
(20, 'Introdução ao CSS',               8,  2),
(21, 'Sintaxe e Formas de Aplicar CSS', 9,  2),
(22, 'Background, Bordas e Cores',      10, 2),
(23, 'Width, Height, Margin e Padding', 11, 2),
(24, 'Box Model',                       12, 2),
(25, 'Fontes e Ícones',                 13, 2),
(26, 'Listas e Tabelas com CSS',        14, 2),
(27, 'Alinhamento e Layout',            15, 2);

-- ════════════════════════════════════════════════════════════════════════════
-- TRILHA HTML+CSS — LIÇÕES (IDs 37–81, 3 por seção)
-- ════════════════════════════════════════════════════════════════════════════

-- ── Seção 13: Introdução ao HTML ─────────────────────────────────────────────
INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(37, 'O que é HTML',
$t$<p>HTML significa <strong>HyperText Markup Language</strong> — linguagem de marcação de hipertexto.</p>
<p>Não é uma linguagem de programação: ela usa <strong>tags</strong> para estruturar o conteúdo de uma página web (textos, imagens, links, vídeos etc.).</p>
<p>Tags são palavras entre <code>&lt; &gt;</code>. A maioria abre e fecha: <code>&lt;p&gt;texto&lt;/p&gt;</code>.</p>$t$,
$code$<!-- Exemplo de tags HTML básicas -->
<h1>Isto é um título</h1>
<p>Isto é um parágrafo de texto.</p>
<a href="#">Isto é um link</a>
<img src="imagem.jpg" alt="Uma imagem">

<!-- As tags descrevem o significado do conteúdo -->
<!-- <h1> = título principal, <p> = parágrafo -->$code$,
'html', 1, 13),

(38, 'Como o navegador lê HTML',
$t$<p>Quando você abre uma página web, o navegador baixa o arquivo HTML e o <strong>interpreta de cima para baixo</strong>.</p>
<p>Cada tag diz ao navegador o que fazer com aquele conteúdo: exibir como título, parágrafo, imagem, etc.</p>
<p>O resultado visual que você vê na tela é chamado de <strong>renderização</strong> da página.</p>$t$,
$code$<!-- O navegador lê e renderiza este arquivo HTML -->
<!DOCTYPE html>
<html>
<head>
  <title>Minha Primeira Página</title>
</head>
<body>
  <h1>Olá, Mundo!</h1>
  <p>O navegador leu esta tag e exibiu como parágrafo.</p>
</body>
</html>$code$,
'html', 2, 13),

(39, 'Ferramentas para escrever HTML',
$t$<p>Para escrever HTML você precisa de um <strong>editor de código</strong> e um <strong>navegador</strong>.</p>
<p>O editor mais recomendado é o <strong>VS Code</strong> (gratuito). Extensões úteis: <em>Live Server</em> (atualiza o navegador automaticamente) e <em>HTML Snippets</em>.</p>
<p>Arquivos HTML têm a extensão <code>.html</code> (ex: <code>index.html</code>). Para ver o resultado, abra o arquivo no navegador.</p>$t$,
$code$<!-- Salve este conteúdo como index.html e abra no navegador -->
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <title>Meu Primeiro Arquivo</title>
</head>
<body>
  <h1>Funciona!</h1>
  <p>Meu primeiro arquivo HTML está aberto no navegador.</p>
</body>
</html>$code$,
'html', 3, 13);

-- ── Seção 14: Estrutura Base do Documento ────────────────────────────────────
INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(40, 'DOCTYPE e a tag html',
$t$<p>Todo arquivo HTML começa com <code>&lt;!DOCTYPE html&gt;</code>. Isso diz ao navegador: "este é um documento HTML5".</p>
<p>A tag <code>&lt;html&gt;</code> envolve todo o conteúdo da página. O atributo <code>lang</code> indica o idioma principal (ex: <code>lang="pt-BR"</code>).</p>$t$,
$code$<!DOCTYPE html>
<html lang="pt-BR">
  <!-- Todo o conteúdo da página vai aqui dentro -->
</html>

<!-- DOCTYPE não é uma tag HTML, é uma declaração -->
<!-- lang="pt-BR" ajuda leitores de tela e buscadores -->$code$,
'html', 1, 14),

(41, 'head e suas tags',
$t$<p>A tag <code>&lt;head&gt;</code> contém informações <strong>sobre</strong> a página — não conteúdo visível.</p>
<p>Tags comuns dentro do <code>&lt;head&gt;</code>:</p>
<ul>
  <li><code>&lt;title&gt;</code> — título da aba do navegador</li>
  <li><code>&lt;meta charset="UTF-8"&gt;</code> — codificação (suporta acentos)</li>
  <li><code>&lt;meta name="viewport" ...&gt;</code> — responsividade mobile</li>
  <li><code>&lt;link rel="stylesheet" href="style.css"&gt;</code> — conecta CSS</li>
</ul>$t$,
$code$<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Título que aparece na aba</title>
  <link rel="stylesheet" href="style.css">
</head>$code$,
'html', 2, 14),

(42, 'body',
$t$<p>A tag <code>&lt;body&gt;</code> contém <strong>todo o conteúdo visível</strong> da página: textos, imagens, vídeos, links, botões, formulários, etc.</p>
<p>Tudo que o usuário vê e interage fica dentro do <code>&lt;body&gt;</code>.</p>$t$,
$code$<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <title>Estrutura Base</title>
</head>
<body>
  <!-- Aqui vai o conteúdo visível -->
  <h1>Bem-vindo!</h1>
  <p>Este é o conteúdo da página.</p>
  <img src="logo.png" alt="Logo">
</body>
</html>$code$,
'html', 3, 14);

-- ── Seção 15: Textos e Títulos ────────────────────────────────────────────────
INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(43, 'Tags h1 a h6',
$t$<p>O HTML tem seis níveis de títulos: <code>&lt;h1&gt;</code> ao <code>&lt;h6&gt;</code>.</p>
<p><code>&lt;h1&gt;</code> é o mais importante e geralmente usado apenas <strong>uma vez</strong> por página (o título principal). <code>&lt;h6&gt;</code> é o menos importante.</p>
<p>Use os títulos em ordem hierárquica — eles ajudam leitores de tela e mecanismos de busca a entender a estrutura.</p>$t$,
$code$<h1>Título Principal (h1)</h1>
<h2>Subtítulo (h2)</h2>
<h3>Seção (h3)</h3>
<h4>Subseção (h4)</h4>
<h5>Menor destaque (h5)</h5>
<h6>Menor de todos (h6)</h6>

<!-- h1 aparece maior, h6 menor -->
<!-- Evite pular níveis: h1 → h3 sem h2 -->$code$,
'html', 1, 15),

(44, 'Parágrafo e quebra de linha',
$t$<p>A tag <code>&lt;p&gt;</code> cria um parágrafo de texto. O navegador adiciona espaçamento automático acima e abaixo.</p>
<p>Para quebrar a linha dentro de um parágrafo sem criar um novo, use <code>&lt;br&gt;</code> (essa tag não tem fechamento).</p>$t$,
$code$<p>Este é um parágrafo normal. O navegador
agrupa todo o texto independente de como você
quebrou as linhas no código.</p>

<p>Este é um segundo parágrafo. Há espaço
entre os dois automaticamente.</p>

<p>Primeira linha.<br>
Segunda linha após o br.<br>
Terceira linha.</p>$code$,
'html', 2, 15),

(45, 'Formatação de texto',
$t$<p>O HTML tem tags para formatar o texto com <strong>significado semântico</strong>:</p>
<ul>
  <li><code>&lt;strong&gt;</code> — texto importante (negrito)</li>
  <li><code>&lt;em&gt;</code> — ênfase (itálico)</li>
  <li><code>&lt;mark&gt;</code> — texto marcado/destacado</li>
  <li><code>&lt;small&gt;</code> — texto menor</li>
  <li><code>&lt;del&gt;</code> — texto deletado (riscado)</li>
  <li><code>&lt;code&gt;</code> — código inline</li>
</ul>$t$,
$code$<p>Este texto é <strong>muito importante</strong>.</p>
<p>Este texto está <em>em itálico</em>.</p>
<p>Este texto está <mark>destacado em amarelo</mark>.</p>
<p><small>Texto menor, como avisos legais.</small></p>
<p>Preço: <del>R$ 99,00</del> R$ 49,00</p>
<p>Use o comando <code>console.log()</code> para depurar.</p>$code$,
'html', 3, 15);

-- ── Seção 16: Links e Imagens ─────────────────────────────────────────────────
INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(46, 'Tag a e seus atributos',
$t$<p>A tag <code>&lt;a&gt;</code> cria um link (âncora). O atributo <code>href</code> define o destino.</p>
<ul>
  <li><code>href="https://site.com"</code> — link externo</li>
  <li><code>href="pagina.html"</code> — link para outra página</li>
  <li><code>href="#secao"</code> — link para seção da mesma página</li>
  <li><code>target="_blank"</code> — abre em nova aba</li>
</ul>$t$,
$code$<!-- Link externo -->
<a href="https://www.google.com">Ir para o Google</a>

<!-- Link para outra página do site -->
<a href="contato.html">Página de Contato</a>

<!-- Abre em nova aba -->
<a href="https://github.com" target="_blank">GitHub</a>

<!-- Link para seção na mesma página -->
<a href="#sobre">Ir para Sobre</a>
<section id="sobre">...</section>$code$,
'html', 1, 16),

(47, 'Tag img',
$t$<p>A tag <code>&lt;img&gt;</code> exibe uma imagem. É uma tag <strong>sem fechamento</strong>.</p>
<p>Atributos obrigatórios:</p>
<ul>
  <li><code>src</code> — caminho ou URL da imagem</li>
  <li><code>alt</code> — texto alternativo (para acessibilidade e quando a imagem não carrega)</li>
</ul>
<p>O atributo <code>alt</code> é muito importante — leitores de tela o usam para descrever a imagem.</p>$t$,
$code$<!-- Imagem da mesma pasta -->
<img src="foto.jpg" alt="Foto de perfil">

<!-- Imagem de URL externa -->
<img src="https://via.placeholder.com/300" alt="Imagem de exemplo">

<!-- Com largura e altura definidas -->
<img src="logo.png" alt="Logo da empresa" width="200" height="100">

<!-- alt vazio para imagens decorativas -->
<img src="decorativo.png" alt="">$code$,
'html', 2, 16),

(48, 'Links com imagens',
$t$<p>Para criar um link clicável em uma imagem, basta colocar a tag <code>&lt;img&gt;</code> dentro de uma tag <code>&lt;a&gt;</code>.</p>
<p>Isso é muito usado em logos, banners e botões com ícones.</p>$t$,
$code$<!-- Imagem clicável que leva ao Google -->
<a href="https://www.google.com" target="_blank">
  <img src="logo-google.png" alt="Google">
</a>

<!-- Banner clicável -->
<a href="oferta.html">
  <img src="banner-promo.jpg" alt="Promoção especial — 50% off">
</a>

<!-- Logo clicável que volta para a home -->
<a href="index.html">
  <img src="logo.png" alt="Voltar para o início">
</a>$code$,
'html', 3, 16);

-- ── Seção 17: Listas e Botões ─────────────────────────────────────────────────
INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(49, 'Lista não ordenada',
$t$<p>A tag <code>&lt;ul&gt;</code> (<em>unordered list</em>) cria uma lista com marcadores (bullets).</p>
<p>Cada item da lista usa a tag <code>&lt;li&gt;</code> (<em>list item</em>).</p>
<p>Use listas não ordenadas quando a <strong>ordem dos itens não importa</strong>: ingredientes, características, opções de menu, etc.</p>$t$,
$code$<ul>
  <li>HTML</li>
  <li>CSS</li>
  <li>JavaScript</li>
</ul>

<!-- Lista de ingredientes -->
<ul>
  <li>2 xícaras de farinha</li>
  <li>1 xícara de açúcar</li>
  <li>3 ovos</li>
  <li>1 colher de manteiga</li>
</ul>$code$,
'html', 1, 17),

(50, 'Lista ordenada',
$t$<p>A tag <code>&lt;ol&gt;</code> (<em>ordered list</em>) cria uma lista numerada automaticamente.</p>
<p>Use listas ordenadas quando a <strong>ordem importa</strong>: passos de um tutorial, ranking, instruções, etc.</p>
<p>O atributo <code>start</code> permite começar a numeração de um valor diferente de 1.</p>$t$,
$code$<ol>
  <li>Crie o arquivo index.html</li>
  <li>Escreva a estrutura base</li>
  <li>Adicione o conteúdo</li>
  <li>Abra no navegador</li>
</ol>

<!-- Começando do número 5 -->
<ol start="5">
  <li>Quinto item</li>
  <li>Sexto item</li>
</ol>$code$,
'html', 2, 17),

(51, 'Botão e input',
$t$<p>A tag <code>&lt;button&gt;</code> cria um botão clicável. O texto entre as tags aparece no botão.</p>
<p>A tag <code>&lt;input&gt;</code> cria campos de entrada. O atributo <code>type</code> define o tipo:</p>
<ul>
  <li><code>type="text"</code> — campo de texto</li>
  <li><code>type="email"</code> — campo de e-mail</li>
  <li><code>type="password"</code> — senha (oculta o texto)</li>
  <li><code>type="number"</code> — campo numérico</li>
</ul>$t$,
$code$<!-- Botões -->
<button>Clique aqui</button>
<button type="submit">Enviar</button>
<button type="button" disabled>Desativado</button>

<!-- Campos de entrada -->
<input type="text" placeholder="Seu nome">
<input type="email" placeholder="seu@email.com">
<input type="password" placeholder="Senha">
<input type="number" min="1" max="100">$code$,
'html', 3, 17);

-- ── Seção 18: Divs e HTML Semântico ──────────────────────────────────────────
INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(52, 'A tag div',
$t$<p>A tag <code>&lt;div&gt;</code> é um contêiner genérico, sem significado semântico. Serve para <strong>agrupar e organizar</strong> outros elementos.</p>
<p>É muito usada com CSS para criar layouts, cards, seções de conteúdo, etc.</p>
<p>Por padrão, a <code>&lt;div&gt;</code> ocupa toda a largura disponível (é um elemento de bloco).</p>$t$,
$code$<!-- Div como card -->
<div class="card">
  <img src="foto.jpg" alt="Perfil">
  <h2>Ana Silva</h2>
  <p>Desenvolvedora Web</p>
  <button>Ver perfil</button>
</div>

<!-- Div como coluna -->
<div class="coluna">
  <h3>Coluna 1</h3>
  <p>Conteúdo da coluna...</p>
</div>$code$,
'html', 1, 18),

(53, 'header, main, footer',
$t$<p>O HTML5 introduziu tags <strong>semânticas</strong> que descrevem o papel do conteúdo na página:</p>
<ul>
  <li><code>&lt;header&gt;</code> — cabeçalho (logo, navegação, título)</li>
  <li><code>&lt;main&gt;</code> — conteúdo principal da página</li>
  <li><code>&lt;footer&gt;</code> — rodapé (copyright, links, contato)</li>
</ul>
<p>Usar semântica melhora acessibilidade, SEO e a legibilidade do código.</p>$t$,
$code$<!DOCTYPE html>
<html>
<body>
  <header>
    <img src="logo.png" alt="Logo">
    <nav>...</nav>
  </header>

  <main>
    <h1>Bem-vindo ao site</h1>
    <p>Conteúdo principal aqui...</p>
  </main>

  <footer>
    <p>&copy; 2024 Meu Site</p>
  </footer>
</body>
</html>$code$,
'html', 2, 18),

(54, 'section, article, nav',
$t$<p>Mais tags semânticas do HTML5:</p>
<ul>
  <li><code>&lt;section&gt;</code> — agrupa conteúdo relacionado com um tema</li>
  <li><code>&lt;article&gt;</code> — conteúdo independente (post de blog, notícia)</li>
  <li><code>&lt;nav&gt;</code> — bloco de navegação com links</li>
  <li><code>&lt;aside&gt;</code> — conteúdo lateral (barra lateral)</li>
</ul>$t$,
$code$<main>
  <section id="sobre">
    <h2>Sobre Nós</h2>
    <p>Somos uma empresa de tecnologia...</p>
  </section>

  <section id="blog">
    <article>
      <h2>Post: Introdução ao HTML</h2>
      <p>HTML é a base da web...</p>
    </article>
    <article>
      <h2>Post: CSS Flexbox</h2>
      <p>Flexbox facilita layouts...</p>
    </article>
  </section>
</main>

<nav>
  <a href="#sobre">Sobre</a>
  <a href="#blog">Blog</a>
</nav>$code$,
'html', 3, 18);

-- ── Seção 19: Classes e IDs ───────────────────────────────────────────────────
INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(55, 'Atributo class',
$t$<p>O atributo <code>class</code> permite <strong>identificar e estilizar</strong> elementos HTML.</p>
<p>Vários elementos podem ter a mesma classe. Um elemento pode ter múltiplas classes separadas por espaço.</p>
<p>No CSS, selecionamos a classe com um ponto: <code>.nome-da-classe</code></p>$t$,
$code$<!-- Vários elementos com a mesma classe -->
<p class="destaque">Parágrafo em destaque</p>
<p class="destaque">Outro parágrafo em destaque</p>
<p>Parágrafo normal</p>

<!-- Um elemento com múltiplas classes -->
<div class="card destaque grande">
  Conteúdo do card
</div>

<style>
  .destaque { color: red; }
  .grande { font-size: 20px; }
</style>$code$,
'html', 1, 19),

(56, 'Atributo id',
$t$<p>O atributo <code>id</code> identifica um elemento de forma <strong>única</strong> na página — cada ID deve aparecer apenas uma vez.</p>
<p>No CSS, selecionamos o ID com <code>#</code>: <code>#meu-id</code>.</p>
<p>No JavaScript, usamos <code>getElementById("meu-id")</code> para encontrá-lo.</p>$t$,
$code$<!-- Cada ID é único na página -->
<header id="topo">
  <h1>Meu Site</h1>
</header>

<main id="conteudo">
  <p>Conteúdo principal</p>
</main>

<footer id="rodape">
  <p>Rodapé</p>
</footer>

<style>
  #topo { background: navy; color: white; }
  #rodape { background: gray; }
</style>$code$,
'html', 2, 19),

(57, 'Diferença e boas práticas',
$t$<p>Resumo das diferenças:</p>
<ul>
  <li><code>class</code> → reutilizável em vários elementos → CSS usa <code>.classe</code></li>
  <li><code>id</code> → único por página → CSS usa <code>#id</code> → JS usa <code>getElementById</code></li>
</ul>
<p>Boas práticas:</p>
<ul>
  <li>Use classes para estilização (CSS)</li>
  <li>Use IDs para identificar elementos únicos e para o JavaScript</li>
  <li>Nomes em lowercase com hífens: <code>meu-card</code>, <code>btn-primario</code></li>
</ul>$t$,
$code$<!-- BOA PRÁTICA -->

<!-- class para estilo (repetível) -->
<button class="btn-primario">Salvar</button>
<button class="btn-primario">Confirmar</button>

<!-- id para JavaScript (único) -->
<form id="form-cadastro">
  <input type="text" id="campo-nome" placeholder="Nome">
  <button class="btn-primario" type="submit">Enviar</button>
</form>

<style>
  .btn-primario { background: blue; color: white; }
</style>$code$,
'html', 3, 19);

-- ── Seção 20: Introdução ao CSS ───────────────────────────────────────────────
INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(58, 'O que é CSS',
$t$<p>CSS significa <strong>Cascading Style Sheets</strong> (Folhas de Estilo em Cascata). É a linguagem que define a <strong>aparência visual</strong> das páginas HTML.</p>
<p>Com CSS você controla: cores, fontes, tamanhos, espaçamentos, posicionamento, animações e muito mais.</p>
<p>Sem CSS, as páginas web seriam apenas texto sem formatação — como um documento de bloco de notas.</p>$t$,
$code$/* Sem CSS */
/* <h1>Título</h1>  →  texto simples maior */

/* Com CSS */
h1 {
  color: #2196F3;       /* cor azul */
  font-size: 36px;      /* tamanho da fonte */
  text-align: center;   /* centralizado */
  font-family: Arial;   /* fonte */
}

p {
  color: #555;
  line-height: 1.6;  /* espaçamento entre linhas */
}$code$,
'css', 1, 20),

(59, 'A regra CSS',
$t$<p>Uma regra CSS tem dois componentes:</p>
<ul>
  <li><strong>Seletor</strong> — define quais elementos serão estilizados</li>
  <li><strong>Declarações</strong> — dentro de <code>{ }</code>, cada uma com <code>propriedade: valor;</code></li>
</ul>
<pre><code>seletor {
  propriedade: valor;
  propriedade: valor;
}</code></pre>$t$,
$code$/* Regra CSS básica */
p {
  color: red;
  font-size: 16px;
}

/* Múltiplos seletores */
h1, h2, h3 {
  font-family: Arial, sans-serif;
  color: #333;
}

/* A anatomia:
   p        → seletor (todos os <p>)
   color    → propriedade
   red      → valor
   ;        → fim da declaração
*/
$code$,
'css', 2, 20),

(60, 'Primeiras propriedades',
$t$<p>As propriedades CSS mais usadas para começar:</p>
<ul>
  <li><code>color</code> — cor do texto</li>
  <li><code>background-color</code> — cor de fundo</li>
  <li><code>font-size</code> — tamanho da fonte (em px, em, rem)</li>
  <li><code>font-weight</code> — espessura (bold, normal, 700)</li>
  <li><code>text-align</code> — alinhamento (left, center, right)</li>
</ul>$t$,
$code$h1 {
  color: #e63946;
  text-align: center;
  font-size: 32px;
  font-weight: bold;
}

p {
  color: #457b9d;
  font-size: 16px;
  font-weight: normal;
}

body {
  background-color: #f1faee;
}$code$,
'css', 3, 20);

-- ── Seção 21: Sintaxe e Formas de Aplicar CSS ────────────────────────────────
INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(61, 'Inline, interno e externo',
$t$<p>Existem três formas de aplicar CSS a uma página HTML:</p>
<ul>
  <li><strong>Inline</strong>: <code>style=""</code> diretamente na tag — evite, dificulta manutenção</li>
  <li><strong>Interno</strong>: tag <code>&lt;style&gt;</code> no <code>&lt;head&gt;</code> — útil para páginas únicas</li>
  <li><strong>Externo</strong>: arquivo <code>.css</code> separado, vinculado com <code>&lt;link&gt;</code> — <strong>recomendado</strong></li>
</ul>$t$,
$code$<!-- INLINE (evite) -->
<p style="color: red; font-size: 16px;">Texto vermelho</p>

<!-- INTERNO (no head) -->
<head>
  <style>
    p { color: blue; }
  </style>
</head>

<!-- EXTERNO (melhor opção) -->
<head>
  <link rel="stylesheet" href="style.css">
</head>

/* style.css */
p {
  color: green;
  font-size: 16px;
}$code$,
'html', 1, 21),

(62, 'Seletores básicos',
$t$<p>Os seletores definem quais elementos a regra CSS afeta:</p>
<ul>
  <li><strong>Tag</strong>: <code>p { }</code> — todos os parágrafos</li>
  <li><strong>Classe</strong>: <code>.destaque { }</code> — elementos com <code>class="destaque"</code></li>
  <li><strong>ID</strong>: <code>#titulo { }</code> — o elemento com <code>id="titulo"</code></li>
  <li><strong>Universal</strong>: <code>* { }</code> — todos os elementos</li>
  <li><strong>Descendente</strong>: <code>div p { }</code> — parágrafos dentro de divs</li>
</ul>$t$,
$code$/* Seletor de tag */
h1 { color: navy; }

/* Seletor de classe */
.destaque { background-color: yellow; }

/* Seletor de ID */
#logo { width: 150px; }

/* Seletor universal (use com cuidado) */
* { box-sizing: border-box; }

/* Seletor descendente */
nav a { color: white; text-decoration: none; }

/* Múltiplos seletores */
h1, h2, h3 { font-family: Georgia, serif; }$code$,
'css', 2, 21),

(63, 'A cascata',
$t$<p>"Cascata" significa que quando múltiplas regras se aplicam ao mesmo elemento, o CSS segue uma ordem de prioridade:</p>
<ol>
  <li><strong>Especificidade</strong>: ID > classe > tag</li>
  <li><strong>Ordem</strong>: a última regra declarada vence (em empate de especificidade)</li>
  <li><strong>!important</strong>: sobrescreve tudo (evite usar)</li>
</ol>$t$,
$code$/* Regra geral para todos os p */
p {
  color: black;
  font-size: 14px;
}

/* Classe tem mais prioridade que tag */
.especial {
  color: blue;    /* vence a regra de tag */
}

/* ID tem mais prioridade que classe */
#unico {
  color: red;     /* vence a regra de classe */
}

/* Última regra vence em empate */
p { color: green; }
p { color: purple; }  /* este vence */
$code$,
'css', 3, 21);

-- ── Seção 22: Background, Bordas e Cores ─────────────────────────────────────
INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(64, 'Cores (hex e rgb)',
$t$<p>No CSS, cores podem ser definidas de várias formas:</p>
<ul>
  <li><strong>Nome</strong>: <code>red</code>, <code>blue</code>, <code>green</code></li>
  <li><strong>Hexadecimal</strong>: <code>#ff0000</code> (vermelho), <code>#0000ff</code> (azul)</li>
  <li><strong>RGB</strong>: <code>rgb(255, 0, 0)</code> — valores de 0 a 255</li>
  <li><strong>RGBA</strong>: <code>rgba(255, 0, 0, 0.5)</code> — com transparência (0 a 1)</li>
</ul>$t$,
$code$/* Cores por nome */
h1 { color: red; }
p  { color: navy; }

/* Cores hexadecimais */
.titulo { color: #e63946; }   /* vermelho */
.fundo  { color: #1d3557; }   /* azul escuro */

/* Cores RGB */
.card { color: rgb(70, 130, 180); }  /* steel blue */

/* RGBA com transparência */
.overlay {
  background-color: rgba(0, 0, 0, 0.5); /* preto 50% */
}$code$,
'css', 1, 22),

(65, 'background',
$t$<p>A propriedade <code>background-color</code> define a cor de fundo. A propriedade <code>background-image</code> define uma imagem de fundo.</p>
<p>A propriedade abreviada <code>background</code> aceita vários valores de uma vez.</p>$t$,
$code$/* Cor de fundo */
body {
  background-color: #f8f9fa;
}

.card {
  background-color: white;
}

/* Imagem de fundo */
.hero {
  background-image: url("banner.jpg");
  background-size: cover;       /* cobre todo o elemento */
  background-position: center;  /* centraliza */
  background-repeat: no-repeat; /* não repete */
}

/* Forma abreviada */
.banner {
  background: #1d3557 url("img.jpg") center/cover no-repeat;
}$code$,
'css', 2, 22),

(66, 'border',
$t$<p>A propriedade <code>border</code> cria uma borda ao redor do elemento.</p>
<p>O valor tem três partes: <code>espessura estilo cor</code></p>
<ul>
  <li><code>border: 1px solid #333</code></li>
  <li>Estilos: <code>solid</code>, <code>dashed</code>, <code>dotted</code>, <code>none</code></li>
</ul>
<p><code>border-radius</code> arredonda os cantos.</p>$t$,
$code$.caixa {
  border: 2px solid #333;   /* sólida preta */
}

.dashed {
  border: 1px dashed red;   /* tracejada vermelha */
}

.card {
  border: 1px solid #ddd;
  border-radius: 8px;       /* cantos arredondados */
}

/* Borda apenas em um lado */
.separador {
  border-bottom: 2px solid #eee;
}

/* Botão com borda arredondada */
.btn {
  border: 2px solid blue;
  border-radius: 20px;      /* pílula */
}$code$,
'css', 3, 22);

-- ── Seção 23: Width, Height, Margin e Padding ────────────────────────────────
INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(67, 'width e height',
$t$<p><code>width</code> define a largura e <code>height</code> a altura de um elemento.</p>
<p>Podem ser definidos em:</p>
<ul>
  <li><code>px</code> — valor fixo em pixels</li>
  <li><code>%</code> — porcentagem do elemento pai</li>
  <li><code>vw</code> / <code>vh</code> — porcentagem da viewport (tela)</li>
</ul>
<p><code>max-width</code> limita a largura máxima, muito útil para responsividade.</p>$t$,
$code$.caixa {
  width: 300px;
  height: 150px;
  background-color: lightblue;
}

/* 100% da largura do pai */
.full {
  width: 100%;
}

/* Tela cheia */
.hero {
  width: 100vw;
  height: 100vh;
}

/* Limitar largura para responsividade */
.container {
  width: 100%;
  max-width: 1200px;
}$code$,
'css', 1, 23),

(68, 'margin',
$t$<p><code>margin</code> define o espaço <strong>externo</strong> ao redor do elemento — o espaço entre ele e os outros elementos.</p>
<p>Pode ser aplicada em todos os lados de uma vez ou individualmente:</p>
<ul>
  <li><code>margin: 20px</code> — todos os lados</li>
  <li><code>margin: 10px 20px</code> — cima/baixo e esquerda/direita</li>
  <li><code>margin-top / margin-bottom / margin-left / margin-right</code></li>
</ul>$t$,
$code$.bloco {
  margin: 20px;          /* todos os lados: 20px */
}

.bloco2 {
  margin: 10px 30px;     /* cima/baixo: 10px, lados: 30px */
}

.bloco3 {
  margin: 10px 20px 30px 40px; /* topo direita baixo esquerda */
}

/* Centralizar horizontalmente */
.centrado {
  width: 600px;
  margin: 0 auto;  /* auto nos lados centraliza! */
}

/* Apenas uma direção */
h1 { margin-bottom: 24px; }$code$,
'css', 2, 23),

(69, 'padding',
$t$<p><code>padding</code> define o espaço <strong>interno</strong> entre o conteúdo do elemento e sua borda.</p>
<p>Funciona da mesma forma que <code>margin</code>: todos os lados ou individualmente.</p>
<p>A diferença principal: padding afeta o fundo do elemento (fica dentro da borda), margin não.</p>$t$,
$code$.card {
  padding: 20px;         /* espaço interno em todos os lados */
  background: white;
  border: 1px solid #ddd;
}

.btn {
  padding: 10px 24px;    /* cima/baixo: 10px, lados: 24px */
  background: blue;
  color: white;
}

/* Individualmente */
.caixa {
  padding-top: 40px;
  padding-bottom: 40px;
  padding-left: 20px;
  padding-right: 20px;
}$code$,
'css', 3, 23);

-- ── Seção 24: Box Model ───────────────────────────────────────────────────────
INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(70, 'O que é Box Model',
$t$<p>Todo elemento HTML é uma "caixa" composta por quatro camadas (de dentro para fora):</p>
<ol>
  <li><strong>Content</strong> — o conteúdo (texto, imagem)</li>
  <li><strong>Padding</strong> — espaço interno entre conteúdo e borda</li>
  <li><strong>Border</strong> — a borda ao redor</li>
  <li><strong>Margin</strong> — espaço externo, separando dos outros elementos</li>
</ol>
<p>Entender o box model é fundamental para criar layouts corretos.</p>$t$,
$code$/* Visualizando o box model */
.caixa {
  /* Content */
  width: 200px;
  height: 100px;

  /* Padding (interno) */
  padding: 20px;

  /* Border */
  border: 3px solid black;

  /* Margin (externo) */
  margin: 30px;

  background-color: lightblue;
}

/* Largura total padrão:
   200 + 20+20 (padding) + 3+3 (border) = 246px */
$code$,
'css', 1, 24),

(71, 'box-sizing',
$t$<p>Por padrão, <code>width</code> conta apenas o conteúdo. Padding e border são somados <strong>por fora</strong>, aumentando o tamanho real.</p>
<p>Com <code>box-sizing: border-box</code>, o <code>width</code> passa a incluir padding e border. O tamanho fica <strong>exatamente</strong> o que você definiu.</p>
<p>Por isso, a maioria dos projetos começa com <code>* { box-sizing: border-box; }</code>.</p>$t$,
$code$/* Padrão: content-box */
.caixa-padrao {
  width: 200px;
  padding: 20px;
  border: 3px solid black;
  /* Largura real: 200 + 40 + 6 = 246px! */
}

/* Com border-box */
.caixa-border {
  box-sizing: border-box;
  width: 200px;
  padding: 20px;
  border: 3px solid black;
  /* Largura real: exatamente 200px */
}

/* Aplicar globalmente (boa prática) */
* {
  box-sizing: border-box;
}$code$,
'css', 2, 24),

(72, 'Calculando tamanhos',
$t$<p>Com <code>box-sizing: content-box</code> (padrão):</p>
<p>Largura total = width + padding-left + padding-right + border-left + border-right</p>
<p>Com <code>box-sizing: border-box</code>:</p>
<p>Largura total = width (padding e border já estão inclusos)</p>
<p>Use o DevTools do navegador (F12 → aba Elements) para visualizar o box model de qualquer elemento.</p>$t$,
$code$/* Exemplo prático */
.container {
  width: 800px;
  padding: 0 16px;
  box-sizing: border-box;
  /* Área útil para conteúdo: 800 - 32 = 768px */
}

.coluna {
  width: 50%;       /* metade do container */
  padding: 16px;
  box-sizing: border-box;
  /* Sempre 50% da largura, independente do padding */
}

/* Com DevTools (F12):
   - Clique em um elemento
   - Veja o diagrama do box model */
$code$,
'css', 3, 24);

-- ── Seção 25: Fontes e Ícones ─────────────────────────────────────────────────
INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(73, 'font-family',
$t$<p>A propriedade <code>font-family</code> define a fonte do texto. Sempre indique uma <strong>fonte genérica de fallback</strong> ao final:</p>
<ul>
  <li><code>serif</code> — fontes com serifa (Times New Roman)</li>
  <li><code>sans-serif</code> — sem serifa (Arial, Helvetica)</li>
  <li><code>monospace</code> — espaçamento fixo (Courier, ideal para código)</li>
</ul>$t$,
$code$body {
  font-family: Arial, Helvetica, sans-serif;
}

h1 {
  font-family: Georgia, "Times New Roman", serif;
}

code {
  font-family: "Courier New", Courier, monospace;
}

/* Se o nome da fonte tem espaço, use aspas */
p {
  font-family: "Open Sans", sans-serif;
}$code$,
'css', 1, 25),

(74, 'Google Fonts',
$t$<p>O <strong>Google Fonts</strong> oferece centenas de fontes gratuitas para usar em qualquer projeto.</p>
<p>Para usar:</p>
<ol>
  <li>Acesse <code>fonts.google.com</code></li>
  <li>Escolha uma fonte e clique em "Get font"</li>
  <li>Copie a tag <code>&lt;link&gt;</code> e cole no seu <code>&lt;head&gt;</code></li>
  <li>Use o <code>font-family</code> no CSS</li>
</ol>$t$,
$code$<!-- No HTML, dentro do <head> -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">

/* No CSS */
body {
  font-family: "Roboto", sans-serif;
}

h1 {
  font-weight: 700;  /* negrito */
}

p {
  font-weight: 400;  /* normal */
}$code$,
'html', 2, 25),

(75, 'Ícones com emoji e unicode',
$t$<p>A maneira mais simples de adicionar ícones a uma página é usar <strong>emojis</strong> diretamente no HTML ou CSS.</p>
<p>Emojis são suportados por todos os navegadores modernos e não precisam de bibliotecas externas.</p>
<p>Para ícones profissionais, bibliotecas como <strong>Font Awesome</strong> oferecem milhares de ícones vetoriais via CSS.</p>$t$,
$code$<!-- Emojis diretamente no HTML -->
<button>🚀 Lançar</button>
<p>✅ Tarefa concluída</p>
<p>⚠️ Atenção: verifique os dados</p>
<p>📁 Arquivos &nbsp; 📄 Documentos</p>

<!-- Unicode no CSS (para ::before / ::after) -->
<style>
  .sucesso::before {
    content: "✓ ";
    color: green;
  }
  .erro::before {
    content: "✗ ";
    color: red;
  }
</style>

<p class="sucesso">Operação realizada</p>
<p class="erro">Algo deu errado</p>$code$,
'html', 3, 25);

-- ── Seção 26: Listas e Tabelas com CSS ───────────────────────────────────────
INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(76, 'Estilizar listas',
$t$<p>As listas HTML podem ser completamente personalizadas com CSS:</p>
<ul>
  <li><code>list-style-type</code> — tipo do marcador: <code>disc</code>, <code>circle</code>, <code>square</code>, <code>none</code></li>
  <li><code>list-style: none</code> — remove o marcador (muito usado em menus de navegação)</li>
</ul>$t$,
$code$/* Lista sem marcadores (comum em menus) */
nav ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

nav li {
  display: inline; /* itens na horizontal */
  margin-right: 16px;
}

/* Personalizar marcador */
ul.custom {
  list-style-type: square;
  padding-left: 20px;
}

/* Remover marcador e estilizar */
ul.cards {
  list-style: none;
}
ul.cards li {
  background: #f5f5f5;
  padding: 10px;
  margin-bottom: 8px;
  border-radius: 4px;
}$code$,
'css', 1, 26),

(77, 'Tabela HTML',
$t$<p>Tabelas organizam dados em linhas e colunas:</p>
<ul>
  <li><code>&lt;table&gt;</code> — a tabela</li>
  <li><code>&lt;thead&gt;</code> — cabeçalho da tabela</li>
  <li><code>&lt;tbody&gt;</code> — corpo da tabela</li>
  <li><code>&lt;tr&gt;</code> — linha (table row)</li>
  <li><code>&lt;th&gt;</code> — célula de cabeçalho (negrito e centralizada)</li>
  <li><code>&lt;td&gt;</code> — célula de dado</li>
</ul>$t$,
$code$<table>
  <thead>
    <tr>
      <th>Nome</th>
      <th>Idade</th>
      <th>Cidade</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Ana</td>
      <td>25</td>
      <td>São Paulo</td>
    </tr>
    <tr>
      <td>Bruno</td>
      <td>30</td>
      <td>Rio de Janeiro</td>
    </tr>
  </tbody>
</table>$code$,
'html', 2, 26),

(78, 'Estilizar tabela',
$t$<p>Por padrão, tabelas HTML não têm estilo — são difíceis de ler. Com CSS podemos:</p>
<ul>
  <li>Colapsar bordas duplas: <code>border-collapse: collapse</code></li>
  <li>Alternar cor das linhas com <code>:nth-child(even)</code></li>
  <li>Adicionar hover nas linhas</li>
</ul>$t$,
$code$table {
  width: 100%;
  border-collapse: collapse; /* une bordas duplas */
  font-family: Arial, sans-serif;
}

th, td {
  border: 1px solid #ddd;
  padding: 12px;
  text-align: left;
}

th {
  background-color: #2196F3;
  color: white;
}

/* Linhas alternadas */
tr:nth-child(even) {
  background-color: #f2f2f2;
}

/* Hover na linha */
tr:hover {
  background-color: #e3f2fd;
}$code$,
'css', 3, 26);

-- ── Seção 27: Alinhamento e Layout ───────────────────────────────────────────
INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(79, 'display block e inline',
$t$<p>A propriedade <code>display</code> controla como um elemento é exibido no fluxo da página:</p>
<ul>
  <li><strong>block</strong>: ocupa toda a largura disponível, começa em nova linha (div, p, h1)</li>
  <li><strong>inline</strong>: ocupa só o espaço do conteúdo, fica na mesma linha (span, a, strong)</li>
  <li><strong>inline-block</strong>: combina os dois — fica na linha, mas aceita width/height</li>
  <li><strong>none</strong>: esconde o elemento (não ocupa espaço)</li>
</ul>$t$,
$code$/* Por padrão: */
/* div → display: block  (linha inteira) */
/* span → display: inline (apenas o conteúdo) */

/* Transformar span em bloco */
span.destaque {
  display: block;
  width: 200px;
  height: 50px;
}

/* Menu horizontal com inline-block */
li {
  display: inline-block;
  margin: 0 8px;
}

/* Esconder elemento */
.hidden {
  display: none;
}$code$,
'css', 1, 27),

(80, 'Flexbox básico',
$t$<p><strong>Flexbox</strong> é um sistema de layout CSS que facilita organizar elementos em uma linha ou coluna.</p>
<p>Para ativar, aplique <code>display: flex</code> no elemento pai (container). Os filhos se tornam <em>flex items</em>.</p>
<p>Propriedades principais do container:</p>
<ul>
  <li><code>flex-direction</code>: <code>row</code> (linha) ou <code>column</code> (coluna)</li>
  <li><code>justify-content</code>: alinhamento no eixo principal</li>
  <li><code>align-items</code>: alinhamento no eixo cruzado</li>
  <li><code>gap</code>: espaço entre os itens</li>
</ul>$t$,
$code$.container {
  display: flex;
  flex-direction: row;         /* padrão: linha */
  justify-content: space-between; /* distribuir espaço */
  align-items: center;         /* centralizar verticalmente */
  gap: 16px;                   /* espaço entre itens */
}

/* Coluna */
.form {
  display: flex;
  flex-direction: column;
  gap: 12px;
}

/* Três colunas iguais */
.grid-3 {
  display: flex;
}
.grid-3 > div {
  flex: 1;  /* cada filho ocupa espaço igual */
}$code$,
'css', 2, 27),

(81, 'Centralizar elementos',
$t$<p>Centralizar é uma das tarefas mais comuns em CSS. Com Flexbox ficou bem simples:</p>
<ul>
  <li><code>justify-content: center</code> — centraliza horizontalmente</li>
  <li><code>align-items: center</code> — centraliza verticalmente</li>
  <li>Use ambos para centralizar total (horizontal + vertical)</li>
</ul>$t$,
$code$/* Centralizar horizontalmente com Flexbox */
.container {
  display: flex;
  justify-content: center;
}

/* Centralizar total (horizontal + vertical) */
.tela-cheia {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}

/* Centralizar texto */
h1 {
  text-align: center;
}

/* Centralizar bloco com margin auto */
.card {
  width: 400px;
  margin: 0 auto;
}$code$,
'css', 3, 27);

-- ════════════════════════════════════════════════════════════════════════════
-- TRILHA HTML+CSS — EXERCÍCIOS (IDs 37–81, 1 por aula)
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_exercises (id, question, correct_answer, lesson_id) VALUES
-- Seção 13
(37, 'O que é HTML?',                                                                2, 37),
(38, 'O que o navegador faz com um arquivo HTML?',                                   2, 38),
(39, 'Qual ferramenta é mais recomendada para escrever HTML?',                       2, 39),
-- Seção 14
(40, 'O que a declaração <!DOCTYPE html> indica ao navegador?',                      1, 40),
(41, 'Qual tag define o título que aparece na aba do navegador?',                    3, 41),
(42, 'Onde deve ficar todo o conteúdo visível de uma página HTML?',                  3, 42),
-- Seção 15
(43, 'Qual tag de título deve ser usada como título principal, geralmente única?',   2, 43),
(44, 'Qual tag HTML cria um parágrafo de texto?',                                    3, 44),
(45, 'Qual tag dá ênfase semântica ao texto, deixando-o em negrito?',               2, 45),
-- Seção 16
(46, 'Qual atributo da tag <a> define o destino do link?',                           1, 46),
(47, 'Qual atributo da tag <img> define o caminho ou URL da imagem?',                2, 47),
(48, 'Como criar um link que abre em uma nova aba do navegador?',                    2, 48),
-- Seção 17
(49, 'Qual tag HTML cria uma lista não ordenada (com marcadores)?',                  2, 49),
(50, 'Qual tag HTML cria uma lista ordenada (numerada)?',                            1, 50),
(51, 'Qual tag HTML representa um botão clicável?',                                  3, 51),
-- Seção 18
(52, 'Para que serve a tag <div>?',                                                  2, 52),
(53, 'Qual tag semântica representa o conteúdo principal da página?',               2, 53),
(54, 'Qual tag semântica é mais indicada para uma barra de navegação com links?',   3, 54),
-- Seção 19
(55, 'Como aplicamos uma classe a um elemento HTML?',                                2, 55),
(56, 'Quantos elementos podem ter o mesmo ID em uma página HTML?',                   3, 56),
(57, 'Qual é a principal diferença entre class e id?',                               2, 57),
-- Seção 20
(58, 'O que é CSS?',                                                                 2, 58),
(59, 'Uma regra CSS é composta por...',                                              1, 59),
(60, 'Qual propriedade CSS define a cor do texto de um elemento?',                   3, 60),
-- Seção 21
(61, 'Qual é a forma mais recomendada para aplicar CSS?',                            2, 61),
(62, 'Qual seletor CSS afeta todos os elementos <p> da página?',                     2, 62),
(63, 'O que significa "cascata" no CSS?',                                            1, 63),
-- Seção 22
(64, 'Como é representado o vermelho puro em hexadecimal?',                          2, 64),
(65, 'Qual propriedade CSS define a cor de fundo de um elemento?',                   3, 65),
(66, 'Qual propriedade CSS cria uma borda ao redor de um elemento?',                 3, 66),
-- Seção 23
(67, 'Qual propriedade CSS define a largura de um elemento?',                        2, 67),
(68, 'O que a propriedade margin faz?',                                              2, 68),
(69, 'O que a propriedade padding faz?',                                             2, 69),
-- Seção 24
(70, 'Qual é a ordem do box model, de fora para dentro?',                            3, 70),
(71, 'Com box-sizing: border-box, o que o width inclui?',                            2, 71),
(72, 'Sem border-box, um elemento com width: 200px e padding: 20px tem qual largura total?', 2, 72),
-- Seção 25
(73, 'Qual propriedade CSS define a família da fonte?',                              3, 73),
(74, 'Como usar fontes do Google Fonts em uma página HTML?',                         2, 74),
(75, 'Qual a forma mais simples de inserir ícones básicos no HTML sem bibliotecas?', 2, 75),
-- Seção 26
(76, 'Qual propriedade CSS remove os marcadores de uma lista?',                      2, 76),
(77, 'Qual tag HTML representa o cabeçalho de uma tabela?',                          1, 77),
(78, 'Qual propriedade CSS remove as bordas duplas de uma tabela?',                  2, 78),
-- Seção 27
(79, 'Qual é o display padrão de uma tag <div>?',                                    2, 79),
(80, 'O que o Flexbox facilita?',                                                    3, 80),
(81, 'Como centralizar itens horizontalmente num container flex?',                   3, 81);

-- ════════════════════════════════════════════════════════════════════════════
-- OPÇÕES DOS EXERCÍCIOS — HTML+CSS
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 37: O que é HTML
(37, 'Uma linguagem de programação como JavaScript'),
(37, 'Um banco de dados para guardar páginas'),
(37, 'Uma linguagem de marcação para estruturar páginas web'),
(37, 'Um servidor web para hospedar sites');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 38: navegador lê HTML
(38, 'Compila o arquivo como um programa executável'),
(38, 'Executa o HTML como script de servidor'),
(38, 'Interpreta as tags e renderiza o conteúdo na tela'),
(38, 'Armazena o arquivo em banco de dados');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 39: ferramenta para HTML
(39, 'Bloco de Notas do Windows'),
(39, 'Word ou Google Docs'),
(39, 'Um editor de código como o VS Code'),
(39, 'Qualquer aplicativo de texto serve igualmente');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 40: DOCTYPE
(40, 'Cria o título principal da página'),
(40, 'Indica ao navegador que o documento é HTML5'),
(40, 'Importa um arquivo CSS externo'),
(40, 'Abre o bloco de conteúdo visível');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 41: title no head
(41, '<h1>'),
(41, '<name>'),
(41, '<header>'),
(41, '<title>');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 42: conteúdo visível
(42, 'Dentro da tag <head>'),
(42, 'Fora de todas as tags'),
(42, 'Dentro da tag <html>'),
(42, 'Dentro da tag <body>');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 43: h1
(43, '<h6>'),
(43, '<title>'),
(43, '<h1>'),
(43, '<header>');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 44: parágrafo
(44, '<text>'),
(44, '<txt>'),
(44, '<span>'),
(44, '<p>');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 45: strong (negrito semântico)
(45, '<b>'),
(45, '<bold>'),
(45, '<strong>'),
(45, '<em>');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 46: href
(46, 'src'),
(46, 'href'),
(46, 'link'),
(46, 'url');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 47: src em img
(47, 'href'),
(47, 'path'),
(47, 'src'),
(47, 'image');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 48: abrir nova aba
(48, 'target="new"'),
(48, 'open="tab"'),
(48, 'target="_blank"'),
(48, 'href="_new"');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 49: ul
(49, '<ol>'),
(49, '<li>'),
(49, '<ul>'),
(49, '<list>');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 50: ol
(50, '<ul>'),
(50, '<ol>'),
(50, '<li>'),
(50, '<num>');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 51: button
(51, '<click>'),
(51, '<input>'),
(51, '<btn>'),
(51, '<button>');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 52: div
(52, 'Criar títulos e subtítulos'),
(52, 'Adicionar links externos'),
(52, 'Agrupar e organizar outros elementos HTML'),
(52, 'Criar tabelas de dados');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 53: main
(53, '<body>'),
(53, '<content>'),
(53, '<main>'),
(53, '<section>');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 54: nav
(54, '<menu>'),
(54, '<links>'),
(54, '<aside>'),
(54, '<nav>');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 55: class
(55, 'id="nome"'),
(55, 'style="nome"'),
(55, 'class="nome"'),
(55, 'name="nome"');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 56: id único
(56, 'Ilimitados, quantos quiser'),
(56, 'Até 3 elementos diferentes'),
(56, 'Dois elementos no máximo'),
(56, 'Apenas um elemento na página');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 57: class vs id
(57, 'class é só para CSS, id é só para JavaScript'),
(57, 'Não há diferença entre eles'),
(57, 'class pode ser reutilizada, id deve ser único na página'),
(57, 'id é para estilo, class é para estrutura');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 58: CSS
(58, 'Uma linguagem de programação com lógica e funções'),
(58, 'Uma linguagem de marcação como o HTML'),
(58, 'Uma linguagem de estilo para definir a aparência de páginas web'),
(58, 'Um banco de dados para guardar estilos');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 59: regra CSS
(59, 'Classe, ID e nome da tag'),
(59, 'Seletor, propriedade e valor'),
(59, 'Cor, fonte e tamanho'),
(59, 'HTML, CSS e JavaScript juntos');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 60: color
(60, 'font-color'),
(60, 'text-color'),
(60, 'font'),
(60, 'color');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 61: externo recomendado
(61, 'Inline com o atributo style=""'),
(61, 'Interno com a tag <style> no <head>'),
(61, 'Arquivo .css externo vinculado com <link>'),
(61, 'Escrito diretamente dentro do <body>');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 62: seletor p
(62, '.p'),
(62, '#p'),
(62, 'p'),
(62, '*p');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 63: cascata
(63, 'O CSS é lido de baixo para cima'),
(63, 'As regras são aplicadas por ordem de especificidade e posição'),
(63, 'As cores são aplicadas em gradiente automático'),
(63, 'O CSS só funciona em arquivos externos');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 64: #ff0000
(64, 'rgb(0, 0, 255)'),
(64, '#00ff00'),
(64, '#ff0000'),
(64, 'red()');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 65: background-color
(65, 'color'),
(65, 'fill'),
(65, 'bg-color'),
(65, 'background-color');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 66: border
(66, 'outline'),
(66, 'frame'),
(66, 'box'),
(66, 'border');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 67: width
(67, 'size'),
(67, 'length'),
(67, 'width'),
(67, 'horizontal');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 68: margin
(68, 'Espaço interno entre conteúdo e borda'),
(68, 'Define a espessura da borda'),
(68, 'Espaço externo ao redor do elemento'),
(68, 'Define o tamanho da fonte');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 69: padding
(69, 'Espaço externo entre elementos'),
(69, 'Define a cor de fundo'),
(69, 'Espaço interno entre o conteúdo e a borda'),
(69, 'Remove as bordas do elemento');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 70: ordem box model
(70, 'content > padding > margin > border'),
(70, 'border > margin > content > padding'),
(70, 'padding > content > border > margin'),
(70, 'margin > border > padding > content');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 71: border-box inclui
(71, 'Apenas o conteúdo'),
(71, 'Conteúdo mais margin'),
(71, 'Conteúdo, padding e border'),
(71, 'Conteúdo, padding, border e margin');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 72: 200 + 20+20 padding = 240
(72, '200px'),
(72, '220px'),
(72, '240px'),
(72, '180px');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 73: font-family
(73, 'font-type'),
(73, 'font-style'),
(73, 'font-name'),
(73, 'font-family');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 74: Google Fonts
(74, 'Instalar uma extensão no navegador'),
(74, 'Copiar os arquivos de fonte para a pasta do projeto'),
(74, 'Adicionar um <link> no <head> com a URL do Google Fonts'),
(74, 'Usar a regra @font no final do arquivo CSS');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 75: emoji no HTML
(75, 'Usando a tag <icon> do HTML5'),
(75, 'Apenas com imagens .png ou .svg'),
(75, 'Digitando ou colando o emoji diretamente no HTML'),
(75, 'Somente com JavaScript');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 76: list-style: none
(76, 'list-type: none'),
(76, 'bullet: remove'),
(76, 'list-style: none'),
(76, 'marker: hidden');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 77: thead
(77, 'th'),
(77, 'thead'),
(77, 'tr'),
(77, 'caption');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 78: border-collapse
(78, 'border: collapse'),
(78, 'table-border: single'),
(78, 'border-collapse: collapse'),
(78, 'borders: none');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 79: div é block
(79, 'inline'),
(79, 'flex'),
(79, 'block'),
(79, 'grid');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 80: flexbox
(80, 'Criar animações CSS automáticas'),
(80, 'Organizar elementos em grade bidimensional'),
(80, 'Definir cores de fundo automaticamente'),
(80, 'Alinhar e distribuir elementos em uma linha ou coluna');

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
-- Ex 81: justify-content center
(81, 'align-items: center no container'),
(81, 'text-align: center no filho'),
(81, 'margin: auto no filho'),
(81, 'justify-content: center no container');

-- ════════════════════════════════════════════════════════════════════════════
-- TRILHA HTML+CSS — TEMPLATES KANBAN (IDs 13–27)
-- language = 'web', expected_output = NULL
-- Vinculado à 3ª aula de cada módulo
-- Lessons: 39,42,45,48,51,54,57,60,63,66,69,72,75,78,81
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code, expected_output) VALUES
(13,
 'Desafio: Primeira Página HTML',
 'Crie uma página HTML completa com título e parágrafo.',
 'Baixa', 39, 'web',
 'Crie uma página HTML com: um título h1 com seu nome, um parágrafo descrevendo o que você está aprendendo e um link para qualquer site.',
$code$<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <title>Minha Primeira Página</title>
</head>
<body>
  <!-- Adicione um h1 com seu nome -->
  <!-- Adicione um parágrafo sobre o que está aprendendo -->
  <!-- Adicione um link para qualquer site -->
</body>
</html>
$code$,
 NULL);

INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code, expected_output) VALUES
(14,
 'Desafio: Estrutura Base',
 'Monte a estrutura completa de um documento HTML5.',
 'Baixa', 42, 'web',
 'Crie um documento HTML completo com DOCTYPE, html com lang, head (com charset, viewport e title), e body com um h1 e um parágrafo.',
$code$<!-- Complete a estrutura base abaixo -->
<!DOCTYPE html>
<html lang="">
<head>
  <meta charset="">
  <meta name="viewport" content="">
  <title></title>
</head>
<body>
  <!-- Adicione um h1 e um parágrafo aqui -->
</body>
</html>
$code$,
 NULL);

INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code, expected_output) VALUES
(15,
 'Desafio: Títulos e Formatação',
 'Use tags de texto e formatação corretamente.',
 'Baixa', 45, 'web',
 'Crie uma página com: h1, h2 e h3 com títulos de sua escolha; um parágrafo com texto em strong e em em; uma quebra de linha com br.',
$code$<!DOCTYPE html>
<html lang="pt-BR">
<head><meta charset="UTF-8"><title>Textos</title></head>
<body>
  <!-- h1, h2 e h3 -->

  <!-- Parágrafo com strong e em -->

  <!-- Duas linhas separadas por br -->

</body>
</html>
$code$,
 NULL);

INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code, expected_output) VALUES
(16,
 'Desafio: Links e Imagens',
 'Crie links e insira imagens na página.',
 'Baixa', 48, 'web',
 'Crie uma página com: um link para o Google que abre em nova aba; uma imagem (pode usar placeholder.com); uma imagem clicável que seja um link.',
$code$<!DOCTYPE html>
<html lang="pt-BR">
<head><meta charset="UTF-8"><title>Links e Imagens</title></head>
<body>
  <!-- Link para o Google, nova aba -->

  <!-- Imagem com src e alt -->

  <!-- Imagem clicável (a + img) -->

</body>
</html>
$code$,
 NULL);

INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code, expected_output) VALUES
(17,
 'Desafio: Listas e Formulário',
 'Crie listas e um formulário simples.',
 'Média', 51, 'web',
 'Crie uma página com: uma lista não ordenada com 3 itens; uma lista ordenada com 3 passos; um campo de texto e um botão.',
$code$<!DOCTYPE html>
<html lang="pt-BR">
<head><meta charset="UTF-8"><title>Listas</title></head>
<body>
  <!-- Lista não ordenada -->

  <!-- Lista ordenada -->

  <!-- Campo de texto e botão -->

</body>
</html>
$code$,
 NULL);

INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code, expected_output) VALUES
(18,
 'Desafio: HTML Semântico',
 'Estruture uma página usando tags semânticas.',
 'Média', 54, 'web',
 'Crie uma página com header (com nav e links), main (com duas sections), e footer.',
$code$<!DOCTYPE html>
<html lang="pt-BR">
<head><meta charset="UTF-8"><title>Semântico</title></head>
<body>
  <header>
    <nav>
      <!-- Adicione 3 links de navegação -->
    </nav>
  </header>

  <main>
    <!-- Adicione duas sections com h2 e parágrafo cada -->
  </main>

  <footer>
    <!-- Adicione um parágrafo de rodapé -->
  </footer>
</body>
</html>
$code$,
 NULL);

INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code, expected_output) VALUES
(19,
 'Desafio: Classes e IDs',
 'Aplique classes e IDs e estilize com CSS.',
 'Média', 57, 'web',
 'Crie uma página com 3 parágrafos: dois com a mesma classe "texto-azul" (cor azul) e um com id="especial" (cor vermelha e negrito).',
$code$<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <title>Classes e IDs</title>
  <style>
    /* Estile a classe .texto-azul */

    /* Estile o ID #especial */

  </style>
</head>
<body>
  <!-- 2 parágrafos com class="texto-azul" -->

  <!-- 1 parágrafo com id="especial" -->

</body>
</html>
$code$,
 NULL);

INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code, expected_output) VALUES
(20,
 'Desafio: Primeiros Estilos CSS',
 'Aplique color, font-size e background-color.',
 'Média', 60, 'web',
 'Estilize a página: body com fundo #f0f4f8; h1 com cor #e63946 e tamanho 36px; p com cor #457b9d e tamanho 16px.',
$code$<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <title>Primeiros Estilos</title>
  <style>
    body {
      /* fundo: #f0f4f8 */
    }
    h1 {
      /* cor: #e63946, tamanho: 36px */
    }
    p {
      /* cor: #457b9d, tamanho: 16px */
    }
  </style>
</head>
<body>
  <h1>Título Estilizado</h1>
  <p>Parágrafo com cor e tamanho personalizados.</p>
</body>
</html>
$code$,
 NULL);

INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code, expected_output) VALUES
(21,
 'Desafio: Seletores CSS',
 'Use seletores de tag, classe e ID.',
 'Média', 63, 'web',
 'Crie estilos usando: seletor de tag para todos os p; seletor de classe .destaque para fundo amarelo; seletor de ID #titulo para cor azul.',
$code$<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <title>Seletores</title>
  <style>
    /* Seletor de tag: todos os parágrafos */
    p { }

    /* Seletor de classe: fundo amarelo */
    .destaque { }

    /* Seletor de ID: cor azul */
    #titulo { }
  </style>
</head>
<body>
  <h1 id="titulo">Título Azul</h1>
  <p>Parágrafo normal</p>
  <p class="destaque">Parágrafo destacado</p>
</body>
</html>
$code$,
 NULL);

INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code, expected_output) VALUES
(22,
 'Desafio: Cores e Bordas',
 'Aplique background, border e border-radius.',
 'Média', 66, 'web',
 'Crie um card com: fundo branco; borda 1px solid #ddd; border-radius 8px; padding 20px; e título e parágrafo dentro.',
$code$<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <title>Cores e Bordas</title>
  <style>
    body { background-color: #f0f0f0; padding: 40px; }
    .card {
      /* fundo branco, borda, border-radius, padding */
    }
  </style>
</head>
<body>
  <div class="card">
    <h2>Meu Card</h2>
    <p>Conteúdo do card com estilo.</p>
  </div>
</body>
</html>
$code$,
 NULL);

INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code, expected_output) VALUES
(23,
 'Desafio: Dimensões e Espaçamento',
 'Use width, height, margin e padding.',
 'Alta', 69, 'web',
 'Crie dois cards lado a lado: cada um com width 45%, padding 20px, margin 10px e fundo diferente.',
$code$<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <title>Dimensões</title>
  <style>
    .container { display: flex; }
    .card {
      /* width, padding, margin, fundo */
    }
    .card-1 { background-color: #bbdefb; }
    .card-2 { background-color: #c8e6c9; }
  </style>
</head>
<body>
  <div class="container">
    <div class="card card-1"><h3>Card 1</h3><p>Conteúdo...</p></div>
    <div class="card card-2"><h3>Card 2</h3><p>Conteúdo...</p></div>
  </div>
</body>
</html>
$code$,
 NULL);

INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code, expected_output) VALUES
(24,
 'Desafio: Box Model',
 'Aplique box-sizing e visualize o box model.',
 'Alta', 72, 'web',
 'Crie um elemento com width 300px, padding 20px, border 3px solid. Use box-sizing: border-box e compare com content-box (padrão).',
$code$<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <title>Box Model</title>
  <style>
    .content-box {
      width: 300px;
      padding: 20px;
      border: 3px solid navy;
      background: lightblue;
      margin-bottom: 20px;
      /* padrão: content-box — largura real > 300px */
    }
    .border-box {
      box-sizing: border-box;
      width: 300px;
      padding: 20px;
      border: 3px solid darkgreen;
      background: lightgreen;
      /* border-box — largura real = exatamente 300px */
    }
  </style>
</head>
<body>
  <div class="content-box">content-box (padrão)</div>
  <div class="border-box">border-box</div>
</body>
</html>
$code$,
 NULL);

INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code, expected_output) VALUES
(25,
 'Desafio: Fontes Customizadas',
 'Use uma fonte do Google Fonts na página.',
 'Alta', 75, 'web',
 'Importe a fonte "Roboto" do Google Fonts. Aplique-a no body com font-weight 400 para parágrafos e 700 para títulos. Adicione um emoji em algum elemento.',
$code$<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <title>Fontes</title>
  <!-- Adicione o link do Google Fonts aqui -->

  <style>
    body {
      /* Aplique a fonte Roboto */
    }
    h1 {
      /* font-weight 700 */
    }
    p {
      /* font-weight 400 */
    }
  </style>
</head>
<body>
  <h1>🚀 Título com Roboto Bold</h1>
  <p>Parágrafo com Roboto Regular.</p>
</body>
</html>
$code$,
 NULL);

INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code, expected_output) VALUES
(26,
 'Desafio: Tabela Estilizada',
 'Crie e estilize uma tabela HTML.',
 'Alta', 78, 'web',
 'Crie uma tabela com thead e tbody, pelo menos 3 colunas e 3 linhas de dados. Estilize com border-collapse, padding nas células, fundo diferente no cabeçalho e linhas alternadas.',
$code$<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <title>Tabela</title>
  <style>
    table { width: 100%; border-collapse: collapse; }
    th, td { border: 1px solid #ddd; padding: 12px; text-align: left; }
    th { /* fundo colorido */ }
    tr:nth-child(even) { /* fundo alternado */ }
    tr:hover { /* fundo no hover */ }
  </style>
</head>
<body>
  <table>
    <thead>
      <tr>
        <!-- 3 cabeçalhos -->
      </tr>
    </thead>
    <tbody>
      <!-- 3 linhas de dados -->
    </tbody>
  </table>
</body>
</html>
$code$,
 NULL);

INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code, expected_output) VALUES
(27,
 'Desafio: Layout com Flexbox',
 'Crie um layout centralizado usando Flexbox.',
 'Alta', 81, 'web',
 'Crie uma página com: header flexbox com logo à esquerda e nav à direita; seção central com 3 cards lado a lado usando flex e gap; footer centralizado.',
$code$<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <title>Flexbox Layout</title>
  <style>
    * { box-sizing: border-box; margin: 0; padding: 0; }
    body { font-family: Arial, sans-serif; }

    header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 16px 32px;
      background: #1d3557;
      color: white;
    }

    .cards {
      display: flex;
      gap: 16px;
      padding: 32px;
      /* Adicione justify-content */
    }

    .card {
      flex: 1;
      padding: 20px;
      border: 1px solid #ddd;
      border-radius: 8px;
    }

    footer {
      /* Centralize o conteúdo com flexbox */
      padding: 16px;
      background: #f0f0f0;
      text-align: center;
    }
  </style>
</head>
<body>
  <header>
    <span>🚀 MeuSite</span>
    <nav>
      <a href="#" style="color:white;margin-left:16px">Início</a>
      <a href="#" style="color:white;margin-left:16px">Sobre</a>
      <a href="#" style="color:white;margin-left:16px">Contato</a>
    </nav>
  </header>

  <div class="cards">
    <div class="card"><h3>Card 1</h3><p>Descrição do card 1</p></div>
    <div class="card"><h3>Card 2</h3><p>Descrição do card 2</p></div>
    <div class="card"><h3>Card 3</h3><p>Descrição do card 3</p></div>
  </div>

  <footer>
    <p>&copy; 2024 MeuSite</p>
  </footer>
</body>
</html>
$code$,
 NULL);

-- ════════════════════════════════════════════════════════════════════════════
-- Atualizar sequences após inserts com IDs explícitos
-- ════════════════════════════════════════════════════════════════════════════
SELECT setval('tb_sections_id_seq',         27, true);
SELECT setval('tb_lessons_id_seq',          81, true);
SELECT setval('tb_exercises_id_seq',        81, true);
SELECT setval('tb_kanban_templates_id_seq', 27, true);
