-- ════════════════════════════════════════════════════════════════════════════
-- V5: Expande Trilhas 2 e 3 para 10 modulos x 3 aulas cada
-- Remove as 2 secoes antigas de cada trilha e substitui por 10 modulos
-- ════════════════════════════════════════════════════════════════════════════

-- ── Limpeza dos dados antigos ────────────────────────────────────────────────

-- tb_kanban_tasks.lesson_id tem ON DELETE CASCADE, entao sera deletado em cascata com tb_lessons
DELETE FROM tb_kanban_templates WHERE id BETWEEN 11 AND 14;

DELETE FROM tb_exercises_options
WHERE exercise_id IN (SELECT id FROM tb_exercises WHERE lesson_id BETWEEN 31 AND 40);

DELETE FROM tb_exercises WHERE lesson_id BETWEEN 31 AND 40;

DELETE FROM tb_lessons WHERE id BETWEEN 31 AND 40;

DELETE FROM tb_sections WHERE id BETWEEN 11 AND 14;

-- ════════════════════════════════════════════════════════════════════════════
-- SECOES — Trilha 2 (11-20) e Trilha 3 (21-30)
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_sections (id, title, list_order, course_id) VALUES
(11, 'Introducao ao HTML',    1,  2),
(12, 'Links e Imagens',       2,  2),
(13, 'Listas e Tabelas',      3,  2),
(14, 'Formularios',           4,  2),
(15, 'HTML Semantico',        5,  2),
(16, 'Introducao ao CSS',     6,  2),
(17, 'Box Model',             7,  2),
(18, 'Flexbox',               8,  2),
(19, 'CSS Grid',              9,  2),
(20, 'Responsividade',        10, 2),
(21, 'O DOM',                 1,  3),
(22, 'Estilos e Classes',     2,  3),
(23, 'Eventos',               3,  3),
(24, 'Criando Elementos',     4,  3),
(25, 'Formularios com JS',    5,  3),
(26, 'localStorage',          6,  3),
(27, 'Timers',                7,  3),
(28, 'Fetch API',             8,  3),
(29, 'Async e Await',         9,  3),
(30, 'Projeto Final',         10, 3);

-- ════════════════════════════════════════════════════════════════════════════
-- TRILHA 2 — MODULO 1: Introducao ao HTML (section 11, lessons 31-33)
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(31,
 'O que e HTML',
 '<p><strong>HTML</strong> (HyperText Markup Language) e a linguagem que estrutura o conteudo das paginas web. Ela usa <strong>tags</strong> para marcar o significado de cada parte.</p>
<p>Todo documento HTML tem uma estrutura obrigatoria:</p>
<ul>
  <li><code>&lt;!DOCTYPE html&gt;</code> — diz ao navegador que e um documento HTML5</li>
  <li><code>&lt;html&gt;</code> — elemento raiz que envolve tudo</li>
  <li><code>&lt;head&gt;</code> — configuracoes da pagina (nao aparece na tela)</li>
  <li><code>&lt;body&gt;</code> — tudo que o usuario ve na tela</li>
</ul>
<p>As tags geralmente abrem <code>&lt;tag&gt;</code> e fecham <code>&lt;/tag&gt;</code>.</p>',
 $code$<!DOCTYPE html>
<html lang="pt-BR">
  <head>
    <meta charset="UTF-8">
    <title>Minha Primeira Pagina</title>
  </head>
  <body>
    <h1>Ola, mundo!</h1>
    <p>Esta e minha primeira pagina HTML.</p>
  </body>
</html>$code$,
 'html', 1, 11),

(32,
 'Tags de Texto',
 '<p>HTML tem tags especificas para cada tipo de conteudo textual. Isso e chamado de <strong>semantica</strong> — cada tag tem um significado.</p>
<ul>
  <li><code>&lt;h1&gt;</code> a <code>&lt;h6&gt;</code> — titulos (h1 e o mais importante)</li>
  <li><code>&lt;p&gt;</code> — paragrafo de texto</li>
  <li><code>&lt;strong&gt;</code> — negrito com significado importante</li>
  <li><code>&lt;em&gt;</code> — italico com enfase</li>
  <li><code>&lt;br&gt;</code> — quebra de linha (tag sem fechamento)</li>
  <li><code>&lt;hr&gt;</code> — linha horizontal separadora</li>
</ul>
<p>Use h1 apenas uma vez por pagina — e o titulo principal.</p>',
 $code$<!DOCTYPE html>
<html lang="pt-BR">
<body>

  <h1>Titulo Principal</h1>
  <h2>Subtitulo da Secao</h2>
  <h3>Topico menor</h3>

  <p>Este e um paragrafo normal de texto.</p>

  <p>
    Voce pode usar <strong>negrito</strong> para destacar algo importante
    e <em>italico</em> para dar enfase.
  </p>

  <p>Primeira linha.<br>Segunda linha no mesmo paragrafo.</p>

  <hr>

  <p>Novo bloco de conteudo apos a linha.</p>

</body>
</html>$code$,
 'html', 2, 11),

(33,
 'Atributos HTML',
 '<p><strong>Atributos</strong> fornecem informacoes extras sobre uma tag. Eles ficam dentro da tag de abertura no formato <code>nome="valor"</code>.</p>
<p>Atributos mais usados:</p>
<ul>
  <li><code>id</code> — identificador unico do elemento (nao repetir na pagina)</li>
  <li><code>class</code> — grupo ao qual o elemento pertence (pode repetir)</li>
  <li><code>style</code> — aplica CSS diretamente no elemento</li>
  <li><code>title</code> — dica que aparece ao passar o mouse</li>
  <li><code>lang</code> — idioma do elemento</li>
</ul>
<p>O atributo <code>id</code> e usado para identificar elementos com JavaScript ou CSS.</p>',
 $code$<!DOCTYPE html>
<html lang="pt-BR">
<body>

  <!-- id identifica um elemento unico -->
  <h1 id="titulo-principal">Bem-vindo</h1>

  <!-- class agrupa elementos com o mesmo estilo -->
  <p class="destaque">Este paragrafo e destacado.</p>
  <p class="destaque">Este tambem usa a mesma classe.</p>

  <!-- style aplica CSS diretamente -->
  <p style="color: blue; font-size: 18px;">Texto azul e maior.</p>

  <!-- title aparece como tooltip -->
  <p title="Informacao extra">Passe o mouse aqui.</p>

</body>
</html>$code$,
 'html', 3, 11);

-- ════════════════════════════════════════════════════════════════════════════
-- TRILHA 2 — MODULO 2: Links e Imagens (section 12, lessons 34-36)
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(34,
 'Links com a tag a',
 '<p>A tag <code>&lt;a&gt;</code> cria <strong>links</strong> (hiperlinks) que conectam paginas e recursos. O atributo obrigatorio e <code>href</code> (hypertext reference).</p>
<ul>
  <li><code>href="https://..."</code> — link externo (URL completa)</li>
  <li><code>href="pagina.html"</code> — link interno (arquivo local)</li>
  <li><code>href="#secao"</code> — ancora para elemento na mesma pagina</li>
  <li><code>target="_blank"</code> — abre em nova aba</li>
  <li><code>href="mailto:email@..."</code> — abre cliente de e-mail</li>
</ul>',
 $code$<!DOCTYPE html>
<html lang="pt-BR">
<body>

  <!-- Link externo — abre na mesma aba -->
  <a href="https://developer.mozilla.org">Documentacao MDN</a>

  <!-- Link externo — abre em nova aba -->
  <a href="https://github.com" target="_blank">GitHub</a>

  <!-- Ancora — leva ate um elemento com id="contato" na mesma pagina -->
  <a href="#contato">Ir para Contato</a>

  <!-- Link de e-mail -->
  <a href="mailto:voce@email.com">Enviar e-mail</a>

  <h2 id="contato">Contato</h2>
  <p>Secao de contato.</p>

</body>
</html>$code$,
 'html', 1, 12),

(35,
 'Imagens com a tag img',
 '<p>A tag <code>&lt;img&gt;</code> insere imagens. E uma tag <strong>auto-fechante</strong> (sem tag de fechamento).</p>
<ul>
  <li><code>src</code> — caminho ou URL da imagem (obrigatorio)</li>
  <li><code>alt</code> — texto alternativo para leitores de tela e SEO (obrigatorio)</li>
  <li><code>width</code> e <code>height</code> — dimensoes em pixels</li>
</ul>
<p>O atributo <code>alt</code> e essencial para <strong>acessibilidade</strong>: e lido por leitores de tela para pessoas com deficiencia visual.</p>
<p>Caminhos: use <code>./imagens/foto.jpg</code> para arquivos locais ou URLs completas para imagens da web.</p>',
 $code$<!DOCTYPE html>
<html lang="pt-BR">
<body>

  <!-- Imagem local com alt descritivo -->
  <img src="./foto.jpg" alt="Foto de perfil do autor" width="200">

  <!-- Imagem da web -->
  <img
    src="https://via.placeholder.com/300x200"
    alt="Imagem de exemplo 300x200"
    width="300"
    height="200"
  >

  <!-- Imagem dentro de um link — clicar na imagem abre o link -->
  <a href="https://google.com" target="_blank">
    <img src="logo.png" alt="Logo da empresa">
  </a>

</body>
</html>$code$,
 'html', 2, 12),

(36,
 'Div e Span — containers',
 '<p>Quando nenhuma tag semantica se encaixa, usamos containers genericos:</p>
<ul>
  <li><code>&lt;div&gt;</code> — container <strong>de bloco</strong>: ocupa a linha inteira, usado para agrupar secoes</li>
  <li><code>&lt;span&gt;</code> — container <strong>inline</strong>: fica junto ao texto, usado para estilizar partes de um texto</li>
</ul>
<p>Sozinhos nao tem visual. A utilidade e poder aplicar <code>id</code>, <code>class</code> e estilos CSS a grupos de elementos.</p>',
 $code$<!DOCTYPE html>
<html lang="pt-BR">
<body>

  <!-- div agrupa um bloco de conteudo -->
  <div class="card">
    <h2>Produto: Teclado</h2>
    <p>Preco: <span style="color: green; font-weight: bold;">R$ 199,90</span></p>
    <p>Status: <span style="color: orange;">Em estoque</span></p>
  </div>

  <div class="card">
    <h2>Produto: Mouse</h2>
    <p>Preco: <span style="color: green; font-weight: bold;">R$ 89,90</span></p>
    <p>Status: <span style="color: red;">Esgotado</span></p>
  </div>

</body>
</html>$code$,
 'html', 3, 12);

-- ════════════════════════════════════════════════════════════════════════════
-- TRILHA 2 — MODULO 3: Listas e Tabelas (section 13, lessons 37-39)
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(37,
 'Listas Nao Ordenadas',
 '<p>Uma <strong>lista nao ordenada</strong> exibe itens com marcadores (bolinhas). E ideal para listas onde a ordem nao importa.</p>
<ul>
  <li><code>&lt;ul&gt;</code> — cria a lista (unordered list)</li>
  <li><code>&lt;li&gt;</code> — cada item da lista (list item)</li>
</ul>
<p>Listas podem ser <strong>aninhadas</strong>: basta colocar uma <code>&lt;ul&gt;</code> dentro de um <code>&lt;li&gt;</code>.</p>
<p>O estilo dos marcadores pode ser alterado com CSS usando a propriedade <code>list-style-type</code>.</p>',
 $code$<!DOCTYPE html>
<html lang="pt-BR">
<body>

  <h2>Habilidades</h2>
  <ul>
    <li>HTML</li>
    <li>CSS</li>
    <li>JavaScript</li>
  </ul>

  <!-- Lista aninhada -->
  <h2>Tecnologias Web</h2>
  <ul>
    <li>Frontend
      <ul>
        <li>HTML</li>
        <li>CSS</li>
        <li>JavaScript</li>
      </ul>
    </li>
    <li>Backend
      <ul>
        <li>Node.js</li>
        <li>Python</li>
      </ul>
    </li>
  </ul>

</body>
</html>$code$,
 'html', 1, 13),

(38,
 'Listas Ordenadas',
 '<p>Uma <strong>lista ordenada</strong> numera os itens automaticamente. E ideal para passos, rankings e sequencias.</p>
<ul>
  <li><code>&lt;ol&gt;</code> — cria a lista numerada (ordered list)</li>
  <li><code>&lt;li&gt;</code> — cada item</li>
  <li><code>type="A"</code> — letras maiusculas (A, B, C...)</li>
  <li><code>type="a"</code> — letras minusculas (a, b, c...)</li>
  <li><code>type="I"</code> — numerais romanos (I, II, III...)</li>
  <li><code>start="5"</code> — comeca a contagem em outro numero</li>
</ul>',
 $code$<!DOCTYPE html>
<html lang="pt-BR">
<body>

  <h2>Passos para criar uma pagina web</h2>
  <ol>
    <li>Crie um arquivo .html</li>
    <li>Adicione a estrutura basica HTML</li>
    <li>Escreva o conteudo no body</li>
    <li>Abra o arquivo no navegador</li>
  </ol>

  <!-- Lista com letras -->
  <h2>Opcoes do menu</h2>
  <ol type="A">
    <li>Perfil</li>
    <li>Configuracoes</li>
    <li>Sair</li>
  </ol>

  <!-- Comecando do 3 -->
  <ol start="3">
    <li>Terceiro item</li>
    <li>Quarto item</li>
  </ol>

</body>
</html>$code$,
 'html', 2, 13),

(39,
 'Tabelas HTML',
 '<p><strong>Tabelas</strong> organizam dados em linhas e colunas. Use-as apenas para dados tabulares, nao para layout de pagina.</p>
<ul>
  <li><code>&lt;table&gt;</code> — inicia a tabela</li>
  <li><code>&lt;thead&gt;</code> — secao de cabecalho (opcional, mas boa pratica)</li>
  <li><code>&lt;tbody&gt;</code> — corpo da tabela</li>
  <li><code>&lt;tr&gt;</code> — linha (table row)</li>
  <li><code>&lt;th&gt;</code> — celula de cabecalho (negrito e centralizado por padrao)</li>
  <li><code>&lt;td&gt;</code> — celula de dados</li>
</ul>',
 $code$<!DOCTYPE html>
<html lang="pt-BR">
<body>

  <table border="1">
    <thead>
      <tr>
        <th>Nome</th>
        <th>Nota 1</th>
        <th>Nota 2</th>
        <th>Media</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>Ana</td>
        <td>8.0</td>
        <td>9.0</td>
        <td>8.5</td>
      </tr>
      <tr>
        <td>Bruno</td>
        <td>6.0</td>
        <td>7.5</td>
        <td>6.75</td>
      </tr>
      <tr>
        <td>Carla</td>
        <td>9.5</td>
        <td>10.0</td>
        <td>9.75</td>
      </tr>
    </tbody>
  </table>

</body>
</html>$code$,
 'html', 3, 13);

-- ════════════════════════════════════════════════════════════════════════════
-- TRILHA 2 — MODULO 4: Formularios (section 14, lessons 40-42)
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(40,
 'A tag form e Inputs de Texto',
 '<p><strong>Formularios</strong> coletam dados do usuario. A tag <code>&lt;form&gt;</code> agrupa todos os campos.</p>
<ul>
  <li><code>&lt;input type="text"&gt;</code> — campo de texto simples</li>
  <li><code>placeholder</code> — texto de dica dentro do campo</li>
  <li><code>name</code> — nome do campo (enviado ao servidor)</li>
  <li><code>&lt;label&gt;</code> — rotulo do campo; conecte ao input com <code>for</code> e <code>id</code></li>
  <li><code>required</code> — torna o campo obrigatorio</li>
</ul>
<p>Sempre use <code>&lt;label&gt;</code> com seus campos para melhorar a acessibilidade.</p>',
 $code$<!DOCTYPE html>
<html lang="pt-BR">
<body>

  <form>
    <!-- label conectado ao input pelo for/id -->
    <label for="nome">Seu nome:</label>
    <input type="text" id="nome" name="nome" placeholder="Ex: Ana Silva" required>

    <br><br>

    <label for="email">Seu e-mail:</label>
    <input type="email" id="email" name="email" placeholder="voce@email.com" required>

    <br><br>

    <label for="senha">Senha:</label>
    <input type="password" id="senha" name="senha" placeholder="Minimo 8 caracteres">
  </form>

</body>
</html>$code$,
 'html', 1, 14),

(41,
 'Tipos de Input',
 '<p>A tag <code>&lt;input&gt;</code> tem varios tipos conforme o dado esperado:</p>
<ul>
  <li><code>type="number"</code> — apenas numeros, com <code>min</code> e <code>max</code></li>
  <li><code>type="date"</code> — seletor de data</li>
  <li><code>type="checkbox"</code> — caixa de selecao independente</li>
  <li><code>type="radio"</code> — opcao unica de um grupo (mesmo <code>name</code>)</li>
  <li><code>type="range"</code> — controle deslizante</li>
</ul>
<p>Para radio buttons, todos os do mesmo grupo devem ter o mesmo <code>name</code>.</p>',
 $code$<!DOCTYPE html>
<html lang="pt-BR">
<body>
  <form>

    <label for="idade">Idade:</label>
    <input type="number" id="idade" name="idade" min="0" max="120">

    <br><br>

    <label for="nascimento">Data de nascimento:</label>
    <input type="date" id="nascimento" name="nascimento">

    <br><br>

    <p>Interesses:</p>
    <input type="checkbox" id="html" name="interesse" value="html">
    <label for="html">HTML</label>
    <input type="checkbox" id="css" name="interesse" value="css">
    <label for="css">CSS</label>

    <br><br>

    <p>Nivel:</p>
    <input type="radio" id="iniciante" name="nivel" value="iniciante">
    <label for="iniciante">Iniciante</label>
    <input type="radio" id="avancado" name="nivel" value="avancado">
    <label for="avancado">Avancado</label>

  </form>
</body>
</html>$code$,
 'html', 2, 14),

(42,
 'Select, Textarea e Submit',
 '<p>Outros elementos de formulario importantes:</p>
<ul>
  <li><code>&lt;select&gt;</code> — lista suspensa de opcoes</li>
  <li><code>&lt;option&gt;</code> — cada opcao dentro do select</li>
  <li><code>&lt;textarea&gt;</code> — campo de texto multilinha</li>
  <li><code>&lt;button type="submit"&gt;</code> — envia o formulario</li>
  <li><code>&lt;button type="reset"&gt;</code> — limpa todos os campos</li>
</ul>
<p>O atributo <code>value</code> em <code>&lt;option&gt;</code> e o que e enviado ao servidor; o texto entre as tags e o que o usuario ve.</p>',
 $code$<!DOCTYPE html>
<html lang="pt-BR">
<body>
  <form>

    <label for="estado">Estado:</label>
    <select id="estado" name="estado">
      <option value="">-- Selecione --</option>
      <option value="SP">Sao Paulo</option>
      <option value="RJ">Rio de Janeiro</option>
      <option value="MG">Minas Gerais</option>
    </select>

    <br><br>

    <label for="mensagem">Mensagem:</label><br>
    <textarea id="mensagem" name="mensagem" rows="4" cols="40"
              placeholder="Escreva sua mensagem aqui..."></textarea>

    <br><br>

    <button type="submit">Enviar</button>
    <button type="reset">Limpar</button>

  </form>
</body>
</html>$code$,
 'html', 3, 14);

-- ════════════════════════════════════════════════════════════════════════════
-- TRILHA 2 — MODULO 5: HTML Semantico (section 15, lessons 43-45)
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(43,
 'header, nav, main e footer',
 '<p>HTML5 trouxe tags <strong>semanticas</strong> que descrevem o papel de cada secao da pagina. Isso melhora acessibilidade e SEO.</p>
<ul>
  <li><code>&lt;header&gt;</code> — cabecalho da pagina ou de uma secao</li>
  <li><code>&lt;nav&gt;</code> — menu de navegacao com links</li>
  <li><code>&lt;main&gt;</code> — conteudo principal (use apenas um por pagina)</li>
  <li><code>&lt;footer&gt;</code> — rodape da pagina ou secao</li>
</ul>
<p>Usar <code>&lt;div&gt;</code> para tudo funciona visualmente, mas o navegador e mecanismos de busca nao entendem o papel de cada parte.</p>',
 $code$<!DOCTYPE html>
<html lang="pt-BR">
<body>

  <header>
    <h1>Meu Blog de Tecnologia</h1>
    <nav>
      <a href="#inicio">Inicio</a> |
      <a href="#artigos">Artigos</a> |
      <a href="#contato">Contato</a>
    </nav>
  </header>

  <main>
    <h2 id="inicio">Bem-vindo!</h2>
    <p>Aqui voce encontra artigos sobre programacao web.</p>
  </main>

  <footer>
    <p>2024 - Meu Blog. Todos os direitos reservados.</p>
    <p><a href="mailto:blog@email.com">blog@email.com</a></p>
  </footer>

</body>
</html>$code$,
 'html', 1, 15),

(44,
 'article, section e aside',
 '<p>Para organizar o conteudo interno da pagina, use:</p>
<ul>
  <li><code>&lt;section&gt;</code> — secao tematica com titulo proprio (ex: "Noticias", "Servicos")</li>
  <li><code>&lt;article&gt;</code> — conteudo independente e reutilizavel (ex: post de blog, noticia)</li>
  <li><code>&lt;aside&gt;</code> — conteudo lateral ou complementar (ex: sidebar, propaganda, curiosidades)</li>
</ul>
<p>Regra pratica: um <code>&lt;article&gt;</code> faz sentido sozinho fora da pagina? Se sim, use article. E uma parte de um todo? Use section.</p>',
 $code$<!DOCTYPE html>
<html lang="pt-BR">
<body>

  <main>
    <section id="artigos">
      <h2>Ultimos Artigos</h2>

      <article>
        <h3>Como aprender HTML em 30 dias</h3>
        <p>Publicado em 10/01/2024</p>
        <p>Neste artigo, compartilho um plano de estudos...</p>
      </article>

      <article>
        <h3>CSS Grid vs Flexbox</h3>
        <p>Publicado em 05/01/2024</p>
        <p>Quando usar cada um? Veja a comparacao completa...</p>
      </article>
    </section>

    <aside>
      <h3>Sobre o autor</h3>
      <p>Desenvolvedor web com 5 anos de experiencia.</p>
      <h3>Links uteis</h3>
      <ul>
        <li><a href="#">MDN Web Docs</a></li>
        <li><a href="#">CSS-Tricks</a></li>
      </ul>
    </aside>
  </main>

</body>
</html>$code$,
 'html', 2, 15),

(45,
 'Boas Praticas de HTML',
 '<p>Escrever HTML correto e importante para acessibilidade, SEO e manutencao. Siga estas boas praticas:</p>
<ul>
  <li><strong>Sempre use alt em imagens</strong> — leitores de tela dependem disso</li>
  <li><strong>Conecte labels a inputs</strong> — use for/id para que o clique na label ative o campo</li>
  <li><strong>Indente o codigo</strong> — 2 ou 4 espacos por nivel deixa o codigo legivel</li>
  <li><strong>Use tags semanticas</strong> — h1 para titulo principal, nav para menus, etc.</li>
  <li><strong>Declare o charset</strong> — <code>&lt;meta charset="UTF-8"&gt;</code> evita problemas com acentos</li>
  <li><strong>Declare o viewport</strong> — necessario para o site funcionar bem no celular</li>
</ul>',
 $code$<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <!-- Obrigatorio: define o conjunto de caracteres -->
  <meta charset="UTF-8">

  <!-- Obrigatorio para responsividade mobile -->
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Titulo aparece na aba do navegador e no Google -->
  <title>Pagina com Boas Praticas</title>
</head>
<body>

  <header>
    <h1>Titulo Principal da Pagina</h1>
    <nav>
      <a href="#conteudo">Ir ao conteudo</a>
    </nav>
  </header>

  <main id="conteudo">
    <h2>Formulario de Contato</h2>
    <form>
      <label for="nome">Nome completo:</label>
      <input type="text" id="nome" name="nome" required>

      <img src="logo.png" alt="Logo da empresa">
    </form>
  </main>

</body>
</html>$code$,
 'html', 3, 15);

-- ════════════════════════════════════════════════════════════════════════════
-- TRILHA 2 — MODULO 6: Introducao ao CSS (section 16, lessons 46-48)
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(46,
 'O que e CSS e como aplicar',
 '<p><strong>CSS</strong> (Cascading Style Sheets) controla a <strong>aparencia visual</strong> do HTML. Com CSS voce define cores, fontes, tamanhos, espacamentos e muito mais.</p>
<p>Ha tres formas de aplicar CSS:</p>
<ul>
  <li><strong>Externo</strong> (recomendado) — arquivo .css separado, ligado via <code>&lt;link&gt;</code> no head</li>
  <li><strong>Interno</strong> — bloco <code>&lt;style&gt;</code> dentro do head</li>
  <li><strong>Inline</strong> — atributo <code>style=""</code> diretamente na tag (evite)</li>
</ul>
<p>A sintaxe CSS e: <code>seletor { propriedade: valor; }</code></p>',
 $code$<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <title>Introducao ao CSS</title>

  <!-- CSS interno (no head) -->
  <style>
    body {
      background-color: #f0f4f8;
      font-family: Arial, sans-serif;
    }

    h1 {
      color: #1a73e8;
    }

    p {
      color: #333;
      font-size: 16px;
    }
  </style>
</head>
<body>

  <h1>Titulo Estilizado</h1>
  <p>Este paragrafo usa o estilo definido no head.</p>

  <!-- CSS inline (evite em projetos reais) -->
  <p style="color: red;">Este paragrafo tem estilo inline.</p>

</body>
</html>$code$,
 'html', 1, 16),

(47,
 'Seletores CSS',
 '<p>Um <strong>seletor</strong> define QUAIS elementos HTML o estilo vai afetar.</p>
<ul>
  <li><code>p { }</code> — seleciona todas as tags <code>&lt;p&gt;</code></li>
  <li><code>.destaque { }</code> — seleciona elementos com class="destaque"</li>
  <li><code>#titulo { }</code> — seleciona o elemento com id="titulo"</li>
  <li><code>div p { }</code> — seleciona &lt;p&gt; dentro de &lt;div&gt; (descendente)</li>
  <li><code>h1, h2 { }</code> — seleciona h1 E h2 ao mesmo tempo</li>
</ul>
<p>Especificidade: id bate classe, classe bate tag. Use classes para reutilizar estilos.</p>',
 $code$<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <style>
    /* Seletor de tag — afeta todos os paragrafos */
    p {
      line-height: 1.6;
    }

    /* Seletor de classe — afeta qualquer elemento com class="card" */
    .card {
      background: white;
      border: 1px solid #ddd;
      padding: 16px;
      margin: 8px 0;
    }

    /* Seletor de id — afeta apenas o elemento com id="titulo" */
    #titulo {
      color: #1a73e8;
      text-align: center;
    }

    /* Multiplos seletores */
    h2, h3 {
      color: #333;
    }
  </style>
</head>
<body>

  <h1 id="titulo">Titulo Principal</h1>
  <div class="card">
    <h2>Card 1</h2>
    <p>Conteudo do card.</p>
  </div>
  <div class="card">
    <h2>Card 2</h2>
    <p>Outro card com o mesmo estilo.</p>
  </div>

</body>
</html>$code$,
 'html', 2, 16),

(48,
 'Cores e Tipografia',
 '<p>CSS oferece muitas propriedades para controlar texto e cores:</p>
<ul>
  <li><code>color</code> — cor do texto</li>
  <li><code>background-color</code> — cor de fundo</li>
  <li><code>font-family</code> — familia de fonte</li>
  <li><code>font-size</code> — tamanho da fonte (px, em, rem)</li>
  <li><code>font-weight</code> — espessura (normal, bold, 100-900)</li>
  <li><code>text-align</code> — alinhamento (left, center, right)</li>
  <li><code>text-decoration</code> — decoracao (underline, none)</li>
</ul>
<p>Cores podem ser escritas como nome (<code>red</code>), hex (<code>#ff0000</code>) ou rgb (<code>rgb(255,0,0)</code>).</p>',
 $code$<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <style>
    body {
      font-family: 'Segoe UI', Arial, sans-serif;
      background-color: #f9f9f9;
      color: #333;
    }

    h1 {
      color: #0d47a1;
      font-size: 32px;
      font-weight: bold;
      text-align: center;
    }

    .subtitulo {
      color: #555;
      font-size: 18px;
      font-weight: normal;
      text-align: center;
    }

    .destaque {
      color: #e53935;
      font-weight: bold;
    }

    a {
      color: #1a73e8;
      text-decoration: none;
    }

    a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
  <h1>Tipografia com CSS</h1>
  <p class="subtitulo">Aprenda a estilizar texto profissionalmente</p>
  <p>O CSS permite um <span class="destaque">controle total</span> da aparencia do texto.</p>
  <p><a href="#">Clique aqui</a> para saber mais.</p>
</body>
</html>$code$,
 'html', 3, 16);

-- ════════════════════════════════════════════════════════════════════════════
-- TRILHA 2 — MODULO 7: Box Model (section 17, lessons 49-51)
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(49,
 'O que e o Box Model',
 '<p>Todo elemento HTML e tratado pelo CSS como uma <strong>caixa retangular</strong> com quatro camadas, de dentro para fora:</p>
<ul>
  <li><strong>Content</strong> — o conteudo real (texto, imagem)</li>
  <li><strong>Padding</strong> — espacamento interno entre o conteudo e a borda</li>
  <li><strong>Border</strong> — a borda ao redor do padding</li>
  <li><strong>Margin</strong> — espacamento externo entre este elemento e os outros</li>
</ul>
<p>Entender o Box Model e fundamental para posicionar e dimensionar elementos corretamente.</p>',
 $code$<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <style>
    .caixa {
      /* Conteudo */
      width: 200px;
      height: 80px;

      /* Padding: espaco interno */
      padding: 20px;

      /* Border: borda */
      border: 3px solid #1a73e8;

      /* Margin: espaco externo */
      margin: 30px;

      background-color: #e3f2fd;
    }
  </style>
</head>
<body>

  <div class="caixa">
    Eu sou o conteudo
  </div>

  <div class="caixa">
    Segundo elemento com as mesmas regras
  </div>

</body>
</html>$code$,
 'html', 1, 17),

(50,
 'Margin e Padding',
 '<p>Padding e margin aceitam valores de formas diferentes:</p>
<ul>
  <li><code>padding: 20px</code> — igual em todos os lados</li>
  <li><code>padding: 10px 20px</code> — vertical | horizontal</li>
  <li><code>padding: 10px 20px 15px 5px</code> — top | right | bottom | left</li>
  <li><code>padding-top</code>, <code>padding-right</code>, etc. — lado a lado</li>
</ul>
<p>O mesmo funciona para <code>margin</code>. O valor especial <code>margin: 0 auto</code> centraliza um elemento de bloco horizontalmente.</p>',
 $code$<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <style>
    .container {
      width: 600px;
      margin: 0 auto; /* centraliza */
      background: #f5f5f5;
      padding: 20px;
    }

    .card {
      background: white;
      border: 1px solid #ddd;

      /* padding diferente por lado */
      padding-top: 16px;
      padding-right: 24px;
      padding-bottom: 16px;
      padding-left: 24px;

      /* margem inferior para separar cards */
      margin-bottom: 16px;
    }

    h2 {
      margin: 0 0 8px 0; /* top right bottom left */
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="card">
      <h2>Card 1</h2>
      <p>Conteudo com padding e margem controlados.</p>
    </div>
    <div class="card">
      <h2>Card 2</h2>
      <p>Separado do card acima pela margin-bottom.</p>
    </div>
  </div>
</body>
</html>$code$,
 'html', 2, 17),

(51,
 'Border e box-sizing',
 '<p>A propriedade <code>border</code> define a borda. Sintaxe: <code>border: espessura estilo cor</code>.</p>
<ul>
  <li>Estilos: <code>solid</code>, <code>dashed</code>, <code>dotted</code>, <code>double</code></li>
  <li><code>border-radius</code> — arredonda os cantos</li>
</ul>
<p>Problema classico: se um elemento tem <code>width: 200px</code> e <code>padding: 20px</code>, ele fica com 240px de largura total. A solucao e <code>box-sizing: border-box</code> — o padding e border sao incluidos no width declarado.</p>',
 $code$<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <style>
    /* Boa pratica: aplicar box-sizing a tudo */
    * {
      box-sizing: border-box;
    }

    .botao {
      width: 160px;
      padding: 12px 24px;
      border: 2px solid #1a73e8;
      border-radius: 8px;
      background-color: #1a73e8;
      color: white;
      font-size: 16px;
      cursor: pointer;
      margin: 8px;
    }

    .botao-outline {
      background-color: transparent;
      color: #1a73e8;
    }

    .botao-pill {
      border-radius: 50px; /* borda bem arredondada */
    }
  </style>
</head>
<body>
  <button class="botao">Salvar</button>
  <button class="botao botao-outline">Cancelar</button>
  <button class="botao botao-pill">Pill Button</button>
</body>
</html>$code$,
 'html', 3, 17);

-- ════════════════════════════════════════════════════════════════════════════
-- TRILHA 2 — MODULO 8: Flexbox (section 18, lessons 52-54)
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(52,
 'Display Flex e flex-direction',
 '<p><strong>Flexbox</strong> e um sistema de layout CSS para organizar elementos em uma linha ou coluna de forma flexivel e responsiva.</p>
<p>Para ativar: aplique <code>display: flex</code> ao <strong>container pai</strong>. Os filhos diretos viram <strong>flex items</strong>.</p>
<ul>
  <li><code>flex-direction: row</code> (padrao) — itens em linha (horizontal)</li>
  <li><code>flex-direction: column</code> — itens em coluna (vertical)</li>
  <li><code>flex-direction: row-reverse</code> — linha invertida</li>
  <li><code>flex-direction: column-reverse</code> — coluna invertida</li>
</ul>',
 $code$<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <style>
    .container {
      display: flex;
      flex-direction: row; /* padrao */
      background: #e3f2fd;
      padding: 16px;
      gap: 8px;
    }

    .container.coluna {
      flex-direction: column;
    }

    .item {
      background: #1a73e8;
      color: white;
      padding: 16px 24px;
      border-radius: 6px;
      font-weight: bold;
    }
  </style>
</head>
<body>

  <p><strong>flex-direction: row</strong></p>
  <div class="container">
    <div class="item">1</div>
    <div class="item">2</div>
    <div class="item">3</div>
  </div>

  <br>

  <p><strong>flex-direction: column</strong></p>
  <div class="container coluna">
    <div class="item">1</div>
    <div class="item">2</div>
    <div class="item">3</div>
  </div>

</body>
</html>$code$,
 'html', 1, 18),

(53,
 'justify-content e align-items',
 '<p>Com Flexbox, voce controla o alinhamento dos itens em dois eixos:</p>
<ul>
  <li><code>justify-content</code> — alinha no <strong>eixo principal</strong> (horizontal se row, vertical se column)</li>
  <li><code>align-items</code> — alinha no <strong>eixo cruzado</strong> (perpendicular ao principal)</li>
</ul>
<p>Valores de <code>justify-content</code>: <code>flex-start</code>, <code>flex-end</code>, <code>center</code>, <code>space-between</code>, <code>space-around</code>, <code>space-evenly</code>.</p>
<p>Valores de <code>align-items</code>: <code>flex-start</code>, <code>flex-end</code>, <code>center</code>, <code>stretch</code> (padrao).</p>',
 $code$<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <style>
    * { box-sizing: border-box; }

    .nav {
      display: flex;
      justify-content: space-between;
      align-items: center;
      background: #1a237e;
      padding: 0 24px;
      height: 60px;
    }

    .logo { color: white; font-size: 20px; font-weight: bold; }

    .nav-links { display: flex; gap: 24px; }
    .nav-links a { color: white; text-decoration: none; }

    .hero {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 200px;
      background: #e8eaf6;
    }

    .hero-text { text-align: center; }
  </style>
</head>
<body>
  <nav class="nav">
    <span class="logo">MeuSite</span>
    <div class="nav-links">
      <a href="#">Inicio</a>
      <a href="#">Sobre</a>
      <a href="#">Contato</a>
    </div>
  </nav>

  <div class="hero">
    <div class="hero-text">
      <h1>Bem-vindo</h1>
      <p>Conteudo centralizado com Flexbox</p>
    </div>
  </div>
</body>
</html>$code$,
 'html', 2, 18),

(54,
 'flex-wrap e gap',
 '<p>Por padrao, os flex items ficam em uma unica linha e podem encolher. Para permitir quebra de linha:</p>
<ul>
  <li><code>flex-wrap: wrap</code> — itens quebram para a proxima linha quando nao cabem</li>
  <li><code>gap: 16px</code> — espacamento entre os itens (atalho para row-gap e column-gap)</li>
  <li><code>flex: 1</code> — item cresce para preencher o espaco disponivel</li>
  <li><code>flex-basis: 200px</code> — tamanho base do item antes de crescer/encolher</li>
</ul>',
 $code$<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <style>
    * { box-sizing: border-box; }

    .galeria {
      display: flex;
      flex-wrap: wrap;
      gap: 16px;
      padding: 16px;
      background: #f5f5f5;
    }

    .foto {
      flex-basis: 200px;
      flex-grow: 1;
      background: #1a73e8;
      color: white;
      height: 120px;
      display: flex;
      align-items: center;
      justify-content: center;
      border-radius: 8px;
      font-size: 14px;
    }
  </style>
</head>
<body>
  <div class="galeria">
    <div class="foto">Foto 1</div>
    <div class="foto">Foto 2</div>
    <div class="foto">Foto 3</div>
    <div class="foto">Foto 4</div>
    <div class="foto">Foto 5</div>
    <div class="foto">Foto 6</div>
  </div>
</body>
</html>$code$,
 'html', 3, 18);

-- ════════════════════════════════════════════════════════════════════════════
-- TRILHA 2 — MODULO 9: CSS Grid (section 19, lessons 55-57)
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(55,
 'O que e CSS Grid',
 '<p><strong>CSS Grid</strong> e o sistema de layout mais poderoso do CSS. Permite criar layouts em duas dimensoes: linhas E colunas ao mesmo tempo.</p>
<p>Para ativar: aplique <code>display: grid</code> ao container pai.</p>
<ul>
  <li><code>grid-template-columns</code> — define o numero e tamanho das colunas</li>
  <li><code>grid-template-rows</code> — define o numero e tamanho das linhas</li>
  <li><code>fr</code> — unidade fracionaria que divide o espaco disponivel</li>
  <li><code>repeat(3, 1fr)</code> — atalho para repetir uma definicao</li>
</ul>',
 $code$<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <style>
    * { box-sizing: border-box; }

    .grid {
      display: grid;
      /* 3 colunas de tamanho igual */
      grid-template-columns: 1fr 1fr 1fr;
      gap: 16px;
      padding: 16px;
    }

    /* Equivalente com repeat: */
    /* grid-template-columns: repeat(3, 1fr); */

    .item {
      background: #1a73e8;
      color: white;
      padding: 24px;
      text-align: center;
      border-radius: 8px;
      font-weight: bold;
    }
  </style>
</head>
<body>
  <div class="grid">
    <div class="item">1</div>
    <div class="item">2</div>
    <div class="item">3</div>
    <div class="item">4</div>
    <div class="item">5</div>
    <div class="item">6</div>
  </div>
</body>
</html>$code$,
 'html', 1, 19),

(56,
 'grid-template-columns e linhas',
 '<p>O Grid e muito flexivel na definicao de colunas e linhas:</p>
<ul>
  <li><code>1fr 2fr</code> — coluna 1 com 1 parte, coluna 2 com 2 partes</li>
  <li><code>200px 1fr</code> — coluna fixa de 200px + coluna que ocupa o restante</li>
  <li><code>repeat(auto-fit, minmax(200px, 1fr))</code> — grade responsiva automatica</li>
  <li><code>grid-template-rows: 80px 1fr 60px</code> — define alturas das linhas</li>
</ul>',
 $code$<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <style>
    * { box-sizing: border-box; }

    /* Layout de pagina classico com Grid */
    .pagina {
      display: grid;
      grid-template-columns: 240px 1fr;
      grid-template-rows: 60px 1fr 50px;
      gap: 8px;
      height: 100vh;
      padding: 8px;
    }

    .header  { grid-column: 1 / 3; background: #1a237e; color: white; padding: 16px; }
    .sidebar { background: #e8eaf6; padding: 16px; }
    .main    { background: #f5f5f5; padding: 16px; }
    .footer  { grid-column: 1 / 3; background: #333; color: white; padding: 12px; }
  </style>
</head>
<body>
  <div class="pagina">
    <header class="header">Cabecalho</header>
    <aside class="sidebar">Menu lateral</aside>
    <main class="main">Conteudo principal</main>
    <footer class="footer">Rodape</footer>
  </div>
</body>
</html>$code$,
 'html', 2, 19),

(57,
 'gap e posicionamento no Grid',
 '<p>Cada item do Grid pode ocupar mais de uma celula:</p>
<ul>
  <li><code>grid-column: 1 / 3</code> — ocupa da coluna 1 ate a 3 (2 colunas)</li>
  <li><code>grid-column: span 2</code> — ocupa 2 colunas a partir da posicao atual</li>
  <li><code>grid-row: span 2</code> — ocupa 2 linhas</li>
  <li><code>gap: 16px</code> — espacamento entre celulas (row-gap e column-gap)</li>
</ul>
<p>Isso permite criar layouts de revista (magazine layouts) onde alguns elementos sao maiores.</p>',
 $code$<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <style>
    * { box-sizing: border-box; }

    .dashboard {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 16px;
      padding: 16px;
    }

    .card {
      background: white;
      border: 1px solid #ddd;
      border-radius: 8px;
      padding: 20px;
      text-align: center;
    }

    /* Este card ocupa 2 colunas */
    .card-largo { grid-column: span 2; background: #e3f2fd; }

    /* Este card ocupa 2 linhas */
    .card-alto  { grid-row: span 2; background: #e8f5e9; }
  </style>
</head>
<body>
  <div class="dashboard">
    <div class="card card-largo">Grafico Grande (span 2)</div>
    <div class="card card-alto">Menu (span 2 rows)</div>
    <div class="card">Vendas</div>
    <div class="card">Usuarios</div>
    <div class="card">Pedidos</div>
    <div class="card">Receita</div>
  </div>
</body>
</html>$code$,
 'html', 3, 19);

-- ════════════════════════════════════════════════════════════════════════════
-- TRILHA 2 — MODULO 10: Responsividade (section 20, lessons 58-60)
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(58,
 'Design Responsivo e Viewport',
 '<p><strong>Design responsivo</strong> significa que o site se adapta a qualquer tamanho de tela — celular, tablet ou desktop.</p>
<p>O primeiro passo e declarar o viewport no head:</p>
<pre><code>&lt;meta name="viewport" content="width=device-width, initial-scale=1.0"&gt;</code></pre>
<p>Sem isso, o celular mostra a pagina com zoom out (miniaturizada). Com isso, a pagina ocupa a largura real da tela.</p>
<ul>
  <li><strong>Mobile-first</strong>: escreva o CSS para celular primeiro, depois adapte para telas maiores</li>
  <li>Use unidades flexiveis como <code>%</code>, <code>em</code>, <code>rem</code> ao inves de pixels fixos</li>
</ul>',
 $code$<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <!-- Essencial para responsividade -->
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Site Responsivo</title>
  <style>
    * { box-sizing: border-box; margin: 0; padding: 0; }

    body {
      font-family: Arial, sans-serif;
      padding: 16px;
    }

    .container {
      /* max-width impede o conteudo de ficar muito largo em telas grandes */
      max-width: 1200px;
      margin: 0 auto;
      padding: 0 16px;
    }

    img {
      /* Imagem nunca ultrapassa o container */
      max-width: 100%;
      height: auto;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>Pagina Responsiva</h1>
    <p>Este conteudo se adapta a qualquer tela.</p>
  </div>
</body>
</html>$code$,
 'html', 1, 20),

(59,
 'Media Queries',
 '<p><strong>Media Queries</strong> aplicam estilos CSS apenas quando certas condicoes sao verdadeiras (largura, orientacao, etc.).</p>
<p>Sintaxe:</p>
<pre><code>@media (max-width: 768px) {
  /* Estilos para telas ate 768px */
}</code></pre>
<ul>
  <li><code>max-width</code> — aplica ate aquela largura (estilo para menores)</li>
  <li><code>min-width</code> — aplica a partir daquela largura (estilo para maiores)</li>
</ul>
<p>Breakpoints comuns: 576px (celular), 768px (tablet), 992px (desktop), 1200px (tela grande).</p>',
 $code$<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    * { box-sizing: border-box; }

    .cards {
      display: flex;
      flex-wrap: wrap;
      gap: 16px;
      padding: 16px;
    }

    .card {
      flex: 1;
      min-width: 280px;
      background: #e3f2fd;
      border-radius: 8px;
      padding: 20px;
    }

    /* Em telas pequenas: cada card ocupa 100% */
    @media (max-width: 600px) {
      .card {
        min-width: 100%;
      }

      h1 {
        font-size: 20px;
        text-align: center;
      }
    }

    /* Em telas medias: 2 cards por linha */
    @media (min-width: 601px) and (max-width: 900px) {
      .card { min-width: calc(50% - 8px); }
    }
  </style>
</head>
<body>
  <h1>Layout Responsivo com Media Queries</h1>
  <div class="cards">
    <div class="card"><h3>Card 1</h3><p>Conteudo aqui.</p></div>
    <div class="card"><h3>Card 2</h3><p>Conteudo aqui.</p></div>
    <div class="card"><h3>Card 3</h3><p>Conteudo aqui.</p></div>
  </div>
</body>
</html>$code$,
 'html', 2, 20),

(60,
 'Unidades Relativas',
 '<p>Usar unidades fixas como <code>px</code> dificulta a responsividade. Prefira unidades relativas:</p>
<ul>
  <li><code>%</code> — relativo ao elemento pai</li>
  <li><code>em</code> — relativo ao tamanho da fonte do elemento pai</li>
  <li><code>rem</code> — relativo ao tamanho da fonte do elemento raiz (html); mais previsivel</li>
  <li><code>vw</code> — 1% da largura da viewport (janela do navegador)</li>
  <li><code>vh</code> — 1% da altura da viewport</li>
</ul>
<p>Regra geral: use <code>rem</code> para fontes, <code>%</code> e <code>rem</code> para espacamentos, <code>vw/vh</code> para secoes de tela cheia.</p>',
 $code$<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    /* 1rem = 16px (padrao do navegador) */
    html { font-size: 16px; }

    body { font-family: Arial, sans-serif; margin: 0; }

    .hero {
      height: 50vh;         /* metade da altura da janela */
      display: flex;
      align-items: center;
      justify-content: center;
      background: #1a237e;
      color: white;
    }

    .hero h1 {
      font-size: 3rem;      /* 3 * 16px = 48px */
    }

    .secao {
      padding: 2rem;        /* 32px */
      max-width: 60rem;     /* 960px */
      margin: 0 auto;
    }

    .coluna {
      width: 48%;           /* quase metade do pai */
      display: inline-block;
    }
  </style>
</head>
<body>
  <div class="hero">
    <h1>Secao Hero (50vh)</h1>
  </div>
  <div class="secao">
    <div class="coluna"><p>Coluna esquerda (48%)</p></div>
    <div class="coluna"><p>Coluna direita (48%)</p></div>
  </div>
</body>
</html>$code$,
 'html', 3, 20);

-- ════════════════════════════════════════════════════════════════════════════
-- TRILHA 3 — MODULO 1: O DOM (section 21, lessons 61-63)
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(61,
 'O que e o DOM',
 '<p>O <strong>DOM</strong> (Document Object Model) e a representacao em arvore de todos os elementos de uma pagina HTML. Com JavaScript, voce pode acessar e modificar qualquer elemento.</p>
<ul>
  <li>O navegador le o HTML e cria o DOM automaticamente</li>
  <li><code>document</code> e o objeto raiz — representa a pagina inteira</li>
  <li>Cada tag HTML vira um <strong>node</strong> (no) na arvore</li>
  <li>Voce pode ler, criar, alterar e remover qualquer no</li>
</ul>
<p>O DOM e a ponte entre HTML e JavaScript — e o que torna as paginas interativas.</p>',
 $code$// O objeto 'document' representa a pagina HTML inteira

// Acessa o elemento <title> da pagina
console.log(document.title);

// Acessa o elemento <body>
console.log(document.body);

// Acessa todos os paragrafos da pagina
var paragrafos = document.querySelectorAll('p');
console.log('Paragrafos encontrados:', paragrafos.length);

// Acessa o elemento com id="titulo"
var titulo = document.getElementById('titulo');
console.log(titulo);$code$,
 'javascript', 1, 21),

(62,
 'Selecionando Elementos',
 '<p>Para trabalhar com um elemento HTML no JavaScript, voce precisa primeiro <strong>seleciona-lo</strong>. Ha varios metodos:</p>
<ul>
  <li><code>document.getElementById(''id'')</code> — busca por id (retorna um elemento)</li>
  <li><code>document.querySelector(''seletor'')</code> — busca pelo primeiro elemento que casa com o seletor CSS</li>
  <li><code>document.querySelectorAll(''seletor'')</code> — busca todos os elementos (retorna NodeList)</li>
  <li><code>document.getElementsByClassName(''classe'')</code> — busca por classe</li>
</ul>
<p>O mais usado hoje e <code>querySelector</code> — aceita qualquer seletor CSS.</p>',
 $code$// Seleciona pelo id
var titulo = document.getElementById('titulo');

// Seleciona o primeiro elemento com class="card"
var primeiroCard = document.querySelector('.card');

// Seleciona todos os elementos <li>
var itens = document.querySelectorAll('li');

// Itera sobre todos os itens
itens.forEach(function(item) {
  console.log(item.textContent);
});

// Seleciona input pelo atributo
var campoNome = document.querySelector('input[name="nome"]');$code$,
 'javascript', 2, 21),

(63,
 'Modificando Conteudo',
 '<p>Depois de selecionar um elemento, voce pode <strong>ler e alterar</strong> seu conteudo:</p>
<ul>
  <li><code>elemento.textContent</code> — texto puro (sem HTML)</li>
  <li><code>elemento.innerHTML</code> — conteudo HTML interno</li>
  <li><code>elemento.value</code> — valor de inputs e textareas</li>
</ul>
<p>Para alterar, basta atribuir um novo valor: <code>elemento.textContent = "novo texto"</code>.</p>
<p>Prefira <code>textContent</code> para texto simples — e mais seguro pois nao interpreta HTML.</p>',
 $code$// Lendo conteudo
var titulo = document.getElementById('titulo');
console.log(titulo.textContent); // "Titulo Original"

// Alterando texto
titulo.textContent = 'Titulo Modificado pelo JS!';

// Alterando HTML interno
var lista = document.getElementById('lista');
lista.innerHTML = '<li>Item 1</li><li>Item 2</li><li>Item 3</li>';

// Lendo valor de um input
var input = document.getElementById('nome');
var valorDigitado = input.value;
console.log('Digitado:', valorDigitado);

// Alterando valor de um input
input.value = 'Valor preenchido via JS';$code$,
 'javascript', 3, 21);

-- ════════════════════════════════════════════════════════════════════════════
-- TRILHA 3 — MODULO 2: Estilos e Classes (section 22, lessons 64-66)
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(64,
 'Alterando Estilos com JS',
 '<p>Voce pode alterar o CSS de um elemento diretamente pelo JavaScript usando <code>elemento.style</code>.</p>
<ul>
  <li>Cada propriedade CSS vira uma propriedade do objeto <code>style</code></li>
  <li>Propriedades com hifen viram camelCase: <code>background-color</code> → <code>backgroundColor</code></li>
  <li>O valor sempre e uma string: <code>elemento.style.fontSize = "20px"</code></li>
</ul>
<p>Essa abordagem e util para mudancas dinamicas pontuais. Para mudancas maiores, prefira adicionar/remover classes CSS.</p>',
 $code$var caixa = document.getElementById('caixa');

// Alterando propriedades de estilo
caixa.style.backgroundColor = '#1a73e8';
caixa.style.color = 'white';
caixa.style.padding = '20px';
caixa.style.borderRadius = '8px';
caixa.style.fontSize = '18px';

// Lendo um estilo inline
console.log(caixa.style.backgroundColor); // "rgb(26, 115, 232)"

// Removendo um estilo inline (volta ao CSS da folha de estilos)
caixa.style.backgroundColor = '';$code$,
 'javascript', 1, 22),

(65,
 'classList — add, remove, toggle',
 '<p>A forma mais organizada de alterar a aparencia com JS e adicionar ou remover <strong>classes CSS</strong>. O objeto <code>classList</code> oferece metodos para isso:</p>
<ul>
  <li><code>classList.add(''classe'')</code> — adiciona uma classe</li>
  <li><code>classList.remove(''classe'')</code> — remove uma classe</li>
  <li><code>classList.toggle(''classe'')</code> — adiciona se nao tiver, remove se tiver</li>
  <li><code>classList.contains(''classe'')</code> — retorna true/false</li>
</ul>
<p>Assim o CSS fica no arquivo .css e o JS so controla quais classes estao ativas.</p>',
 $code$var botao = document.getElementById('botao');
var caixa = document.getElementById('caixa');

// Adiciona a classe "ativo"
caixa.classList.add('ativo');

// Remove a classe "oculto"
caixa.classList.remove('oculto');

// Toggle: alterna a classe "destacado" a cada chamada
botao.addEventListener('click', function() {
  caixa.classList.toggle('destacado');

  // Verifica se a classe esta presente
  if (caixa.classList.contains('destacado')) {
    botao.textContent = 'Remover destaque';
  } else {
    botao.textContent = 'Adicionar destaque';
  }
});$code$,
 'javascript', 2, 22),

(66,
 'Atributos com JS',
 '<p>Alem de estilos e classes, voce pode ler e alterar qualquer <strong>atributo HTML</strong> via JavaScript:</p>
<ul>
  <li><code>getAttribute(''nome'')</code> — le o valor de um atributo</li>
  <li><code>setAttribute(''nome'', ''valor'')</code> — define ou altera um atributo</li>
  <li><code>removeAttribute(''nome'')</code> — remove o atributo</li>
  <li><code>hasAttribute(''nome'')</code> — verifica se o atributo existe</li>
</ul>
<p>Tambem e possivel acessar atributos comuns diretamente como propriedades: <code>img.src</code>, <code>a.href</code>, <code>input.disabled</code>.</p>',
 $code$var imagem = document.getElementById('foto');
var link = document.getElementById('link');
var botao = document.getElementById('btn');

// Lendo atributos
console.log(imagem.getAttribute('src'));  // "./foto.jpg"
console.log(imagem.getAttribute('alt'));  // "Descricao"

// Alterando atributo src da imagem
imagem.setAttribute('src', './nova-foto.jpg');
imagem.setAttribute('alt', 'Nova descricao');

// Propriedades diretas (mais pratico)
link.href = 'https://google.com';

// Desabilitando e habilitando um botao
botao.disabled = true;   // desabilita
botao.disabled = false;  // habilita$code$,
 'javascript', 3, 22);

-- ════════════════════════════════════════════════════════════════════════════
-- TRILHA 3 — MODULO 3: Eventos (section 23, lessons 67-69)
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(67,
 'addEventListener',
 '<p><strong>Eventos</strong> sao acoes do usuario ou do navegador: clicar, digitar, mover o mouse, etc. Para reagir a um evento, use <code>addEventListener</code>:</p>
<pre><code>elemento.addEventListener(''evento'', funcao)</code></pre>
<ul>
  <li>O primeiro argumento e o nome do evento (string)</li>
  <li>O segundo e a funcao que sera executada quando o evento ocorrer</li>
  <li>A funcao recebe um objeto <code>event</code> com detalhes do que aconteceu</li>
</ul>
<p>Voce pode adicionar multiplos listeners ao mesmo elemento sem conflito.</p>',
 $code$var botao = document.getElementById('meu-botao');

// Adiciona um listener de clique
botao.addEventListener('click', function(event) {
  console.log('Botao clicado!');
  console.log('Elemento clicado:', event.target);
});

// Listener de passar o mouse
botao.addEventListener('mouseenter', function() {
  botao.style.backgroundColor = '#005f6b';
});

botao.addEventListener('mouseleave', function() {
  botao.style.backgroundColor = '';
});

// Multiplos listeners no mesmo elemento — ambos funcionam
botao.addEventListener('click', function() {
  console.log('Segundo listener tambem executou!');
});$code$,
 'javascript', 1, 23),

(68,
 'Eventos de Teclado e Mouse',
 '<p>Alem do clique, ha muitos outros eventos uteis:</p>
<ul>
  <li><code>keydown</code> — tecla pressionada</li>
  <li><code>keyup</code> — tecla solta</li>
  <li><code>input</code> — valor do input mudou (mais reativo que change)</li>
  <li><code>change</code> — valor confirmado (ao sair do campo)</li>
  <li><code>mousemove</code> — mouse se moveu</li>
  <li><code>dblclick</code> — duplo clique</li>
</ul>
<p>O objeto <code>event</code> tem propriedades uteis: <code>event.key</code> (tecla pressionada), <code>event.target</code> (elemento que disparou), <code>event.clientX/Y</code> (posicao do mouse).</p>',
 $code$var campo = document.getElementById('busca');
var resultado = document.getElementById('resultado');

// Dispara a cada tecla digitada
campo.addEventListener('input', function(event) {
  var texto = event.target.value;
  resultado.textContent = 'Voce digitou: ' + texto;
});

// Detecta tecla especifica
campo.addEventListener('keydown', function(event) {
  if (event.key === 'Enter') {
    console.log('Pesquisar por:', campo.value);
  }
  if (event.key === 'Escape') {
    campo.value = '';
  }
});$code$,
 'javascript', 2, 23),

(69,
 'Delegacao de Eventos',
 '<p><strong>Delegacao de eventos</strong> e uma tecnica em que voce coloca o listener no elemento <strong>pai</strong> para capturar eventos dos filhos. Isso e eficiente quando ha muitos elementos ou quando eles sao criados dinamicamente.</p>
<p>O objeto <code>event.target</code> informa qual elemento filho disparou o evento.</p>
<ul>
  <li>Menos listeners = melhor performance</li>
  <li>Funciona para elementos adicionados depois (dinamicos)</li>
  <li>Use <code>event.target.matches(''seletor'')</code> para filtrar</li>
</ul>',
 $code$var lista = document.getElementById('lista');

// UM listener na lista captura cliques em qualquer <li>
lista.addEventListener('click', function(event) {

  // Verifica se o clique foi em um <li>
  if (event.target.matches('li')) {
    var itemClicado = event.target;
    itemClicado.classList.toggle('selecionado');
    console.log('Item:', itemClicado.textContent);
  }

  // Verifica se foi em um botao de remover
  if (event.target.matches('.btn-remover')) {
    var itemPai = event.target.parentElement;
    itemPai.remove();
  }
});$code$,
 'javascript', 3, 23);

-- ════════════════════════════════════════════════════════════════════════════
-- TRILHA 3 — MODULO 4: Criando Elementos (section 24, lessons 70-72)
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(70,
 'createElement e appendChild',
 '<p>Voce pode criar novos elementos HTML do zero via JavaScript e inseri-los na pagina:</p>
<ul>
  <li><code>document.createElement(''tag'')</code> — cria um novo elemento (ainda nao esta na pagina)</li>
  <li><code>pai.appendChild(filho)</code> — insere o elemento no final do pai</li>
  <li><code>pai.prepend(filho)</code> — insere no inicio do pai</li>
  <li><code>referencia.before(elemento)</code> — insere antes do elemento de referencia</li>
  <li><code>referencia.after(elemento)</code> — insere depois</li>
</ul>',
 $code$// Cria um novo <li>
var novoItem = document.createElement('li');

// Define o texto
novoItem.textContent = 'Novo item da lista';

// Adiciona uma classe
novoItem.classList.add('item-lista');

// Insere no final da lista
var lista = document.getElementById('minha-lista');
lista.appendChild(novoItem);

// Criando um card completo
var card = document.createElement('div');
card.classList.add('card');

var titulo = document.createElement('h3');
titulo.textContent = 'Novo Card';

card.appendChild(titulo);
document.getElementById('container').appendChild(card);$code$,
 'javascript', 1, 24),

(71,
 'innerHTML vs createElement',
 '<p>Ha duas formas de inserir conteudo HTML via JS:</p>
<ul>
  <li><strong>innerHTML</strong> — substitui todo o conteudo interno com uma string HTML. Pratico, mas pode apagar elementos existentes e e vulneravel a XSS se usar dados do usuario.</li>
  <li><strong>createElement</strong> — cria elementos de forma programatica. Mais verboso, porem seguro e preserva listeners ja adicionados.</li>
</ul>
<p>Regra: use <code>innerHTML</code> para conteudo estatico conhecido. Use <code>createElement</code> quando o conteudo vier de dados do usuario ou precisar de eventos.</p>',
 $code$var container = document.getElementById('container');

// innerHTML — simples, mas substitui tudo
container.innerHTML = '<h2>Titulo</h2><p>Paragrafo.</p>';

// Problema: isso apaga TUDO que estava dentro
// Melhor para adicionar ao final:
container.innerHTML += '<p>Novo paragrafo adicionado.</p>';

// createElement — mais seguro para dados do usuario
var nomePeloUsuario = 'Texto do usuario'; // nao pode injetar HTML
var p = document.createElement('p');
p.textContent = nomePeloUsuario; // textContent escapa HTML automaticamente
container.appendChild(p);$code$,
 'javascript', 2, 24),

(72,
 'Removendo e Clonando Elementos',
 '<p>Alem de criar, voce pode <strong>remover</strong> e <strong>clonar</strong> elementos:</p>
<ul>
  <li><code>elemento.remove()</code> — remove o elemento do DOM</li>
  <li><code>pai.removeChild(filho)</code> — forma mais antiga de remover</li>
  <li><code>elemento.cloneNode(true)</code> — cria uma copia profunda (com todos os filhos)</li>
  <li><code>elemento.replaceWith(novo)</code> — substitui o elemento por outro</li>
</ul>
<p>O <code>remove()</code> e o mais simples e moderno para remover um elemento.</p>',
 $code$// Removendo um elemento
var card = document.getElementById('card-1');
card.remove(); // remove direto

// Removendo via pai (forma antiga)
var lista = document.getElementById('lista');
var primeiroItem = lista.firstElementChild;
lista.removeChild(primeiroItem);

// Clonando um elemento
var modelo = document.getElementById('card-modelo');
var copia = modelo.cloneNode(true); // true = copia profunda (com filhos)

// Altera a copia antes de inserir
copia.id = 'card-novo';
copia.querySelector('h3').textContent = 'Card Copiado';

document.getElementById('container').appendChild(copia);$code$,
 'javascript', 3, 24);

-- ════════════════════════════════════════════════════════════════════════════
-- TRILHA 3 — MODULO 5: Formularios com JS (section 25, lessons 73-75)
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(73,
 'Lendo Valores do Formulario',
 '<p>Com JavaScript voce pode ler os valores dos campos de um formulario em tempo real ou ao enviar.</p>
<ul>
  <li><code>input.value</code> — valor de text, number, email, password</li>
  <li><code>input.checked</code> — true/false para checkbox e radio</li>
  <li><code>select.value</code> — opcao selecionada no select</li>
  <li><code>textarea.value</code> — texto da textarea</li>
</ul>
<p>Combine com o evento <code>input</code> para ler em tempo real, ou com o evento <code>submit</code> para ler ao enviar.</p>',
 $code$var form = document.getElementById('meu-form');

form.addEventListener('submit', function(event) {
  // Previne o recarregamento da pagina
  event.preventDefault();

  // Le cada campo pelo id
  var nome = document.getElementById('nome').value;
  var email = document.getElementById('email').value;
  var aceita = document.getElementById('termos').checked;
  var estado = document.getElementById('estado').value;

  console.log('Nome:', nome);
  console.log('Email:', email);
  console.log('Aceitou termos:', aceita);
  console.log('Estado:', estado);
});$code$,
 'javascript', 1, 25),

(74,
 'Validando Formulario com JS',
 '<p>Alem do atributo HTML <code>required</code>, voce pode criar <strong>validacoes personalizadas</strong> em JavaScript antes de enviar o formulario.</p>
<ul>
  <li>Use <code>event.preventDefault()</code> para bloquear o envio se houver erros</li>
  <li>Exiba mensagens de erro dinamicamente com <code>textContent</code> ou <code>innerHTML</code></li>
  <li>Verifique comprimento com <code>valor.length</code></li>
  <li>Use <code>includes(''@'')</code> para validar e-mail simples</li>
</ul>',
 $code$var form = document.getElementById('cadastro');
var erroNome = document.getElementById('erro-nome');
var erroEmail = document.getElementById('erro-email');

form.addEventListener('submit', function(event) {
  event.preventDefault();
  var valido = true;

  var nome = document.getElementById('nome').value.trim();
  if (nome.length < 3) {
    erroNome.textContent = 'Nome deve ter ao menos 3 caracteres.';
    valido = false;
  } else {
    erroNome.textContent = '';
  }

  var email = document.getElementById('email').value;
  if (!email.includes('@')) {
    erroEmail.textContent = 'Digite um e-mail valido.';
    valido = false;
  } else {
    erroEmail.textContent = '';
  }

  if (valido) {
    console.log('Formulario valido! Enviando...');
  }
});$code$,
 'javascript', 2, 25),

(75,
 'Prevenindo Comportamento Padrao',
 '<p>Alguns elementos HTML tem comportamentos padrao que voce pode precisar cancelar:</p>
<ul>
  <li><code>form submit</code> — recarrega a pagina por padrao</li>
  <li><code>a href</code> — navega para outro endereco</li>
  <li><code>contextmenu</code> — abre o menu de contexto do navegador</li>
</ul>
<p>Use <code>event.preventDefault()</code> para cancelar o comportamento padrao e assumir o controle via JavaScript.</p>
<p>Importante: nao abuse — use so quando realmente necessario, pois o comportamento padrao geralmente e o esperado pelo usuario.</p>',
 $code$// 1. Formulario: evitar recarregamento da pagina
var form = document.getElementById('form');
form.addEventListener('submit', function(event) {
  event.preventDefault(); // cancela o recarregamento
  console.log('Processando com JS...');
});

// 2. Link: evitar navegacao ao clicar
var link = document.getElementById('meu-link');
link.addEventListener('click', function(event) {
  event.preventDefault();
  // Faz outra coisa em vez de navegar
  document.getElementById('conteudo').classList.toggle('visivel');
});

// 3. Tecla Enter nao submete o form
document.getElementById('campo').addEventListener('keydown', function(e) {
  if (e.key === 'Enter') e.preventDefault();
});$code$,
 'javascript', 3, 25);

-- ════════════════════════════════════════════════════════════════════════════
-- TRILHA 3 — MODULO 6: localStorage (section 26, lessons 76-78)
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(76,
 'O que e o localStorage',
 '<p>O <strong>localStorage</strong> permite salvar dados no navegador do usuario de forma persistente — os dados ficam mesmo ao fechar e reabrir o navegador.</p>
<ul>
  <li>Capacidade: ~5MB por dominio</li>
  <li>Os dados sao strings (texto)</li>
  <li>Acessivel via <code>window.localStorage</code> ou apenas <code>localStorage</code></li>
  <li>Cada site tem seu proprio localStorage isolado</li>
</ul>
<p>Diferente do <strong>sessionStorage</strong>, que perde os dados ao fechar a aba.</p>
<p>Nunca salve senhas ou dados sensiveis no localStorage — qualquer JS da pagina pode ler.</p>',
 $code$// Salvando um dado
localStorage.setItem('nome', 'Bruno');
localStorage.setItem('tema', 'escuro');

// Lendo um dado
var nome = localStorage.getItem('nome');
console.log(nome); // "Bruno"

// Lendo dado que nao existe (retorna null)
var inexistente = localStorage.getItem('xyz');
console.log(inexistente); // null

// Removendo um item
localStorage.removeItem('tema');

// Removendo TODOS os dados do site (use com cuidado!)
// localStorage.clear();

// Verificando quantos itens existem
console.log('Total de itens:', localStorage.length);$code$,
 'javascript', 1, 26),

(77,
 'Salvando e Lendo Dados',
 '<p>Na pratica, o localStorage e muito usado para salvar <strong>preferencias do usuario</strong> e pequenas configuracoes.</p>
<ul>
  <li>Use <code>setItem</code> para salvar e <code>getItem</code> para ler</li>
  <li>Ao carregar a pagina, verifique se ha dados salvos e aplique-os</li>
  <li>Se <code>getItem</code> retornar <code>null</code>, o item nao existe — defina um valor padrao</li>
</ul>',
 $code$// Salva o tema escolhido
function salvarTema(tema) {
  localStorage.setItem('tema-preferido', tema);
  aplicarTema(tema);
}

// Aplica o tema na pagina
function aplicarTema(tema) {
  if (tema === 'escuro') {
    document.body.classList.add('tema-escuro');
  } else {
    document.body.classList.remove('tema-escuro');
  }
}

// Ao carregar a pagina, aplica o tema salvo
var temaSalvo = localStorage.getItem('tema-preferido');
if (temaSalvo !== null) {
  aplicarTema(temaSalvo);
} else {
  aplicarTema('claro'); // valor padrao
}

// Botao para trocar tema
document.getElementById('btn-tema').addEventListener('click', function() {
  var atual = localStorage.getItem('tema-preferido') || 'claro';
  salvarTema(atual === 'claro' ? 'escuro' : 'claro');
});$code$,
 'javascript', 2, 26),

(78,
 'JSON no localStorage',
 '<p>O localStorage so aceita strings. Para salvar <strong>objetos e arrays</strong>, use JSON:</p>
<ul>
  <li><code>JSON.stringify(objeto)</code> — converte objeto/array para string JSON</li>
  <li><code>JSON.parse(string)</code> — converte string JSON de volta para objeto/array</li>
</ul>
<p>Esse par <code>stringify + parse</code> e o padrao para trabalhar com dados complexos no localStorage.</p>',
 $code$// Salvando um objeto
var usuario = {
  nome: 'Ana',
  email: 'ana@email.com',
  pontos: 150
};

// Converte para string e salva
localStorage.setItem('usuario', JSON.stringify(usuario));

// Lendo e convertendo de volta para objeto
var dadosSalvos = localStorage.getItem('usuario');
if (dadosSalvos !== null) {
  var usuarioRecuperado = JSON.parse(dadosSalvos);
  console.log(usuarioRecuperado.nome);   // "Ana"
  console.log(usuarioRecuperado.pontos); // 150
}

// Salvando um array de tarefas
var tarefas = ['Estudar JS', 'Fazer exercicio', 'Ler livro'];
localStorage.setItem('tarefas', JSON.stringify(tarefas));

var tarefasSalvas = JSON.parse(localStorage.getItem('tarefas') || '[]');
console.log(tarefasSalvas.length); // 3$code$,
 'javascript', 3, 26);

-- ════════════════════════════════════════════════════════════════════════════
-- TRILHA 3 — MODULO 7: Timers (section 27, lessons 79-81)
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(79,
 'setTimeout — executar uma vez',
 '<p>O <code>setTimeout</code> agenda a execucao de uma funcao apos um <strong>tempo determinado</strong> (em milissegundos).</p>
<ul>
  <li>1000ms = 1 segundo</li>
  <li>A funcao e executada <strong>uma unica vez</strong></li>
  <li>Retorna um id numerico que pode ser usado para cancelar</li>
  <li>O JavaScript continua rodando normalmente enquanto espera</li>
</ul>
<p>Usos comuns: fechar um alerta automaticamente, atrasar uma animacao, debounce de busca.</p>',
 $code$// Executa uma funcao apos 2 segundos
setTimeout(function() {
  console.log('2 segundos se passaram!');
}, 2000);

// Exemplo pratico: fechar notificacao automaticamente
function mostrarNotificacao(mensagem) {
  var notif = document.getElementById('notificacao');
  notif.textContent = mensagem;
  notif.classList.add('visivel');

  // Fecha apos 3 segundos
  setTimeout(function() {
    notif.classList.remove('visivel');
  }, 3000);
}

mostrarNotificacao('Salvo com sucesso!');

console.log('Esta linha executa IMEDIATAMENTE, antes dos 2 segundos');$code$,
 'javascript', 1, 27),

(80,
 'setInterval — repetir em loop',
 '<p>O <code>setInterval</code> executa uma funcao <strong>repetidamente</strong> em um intervalo fixo de tempo.</p>
<ul>
  <li>A funcao e chamada a cada X milissegundos</li>
  <li>Continua repetindo ate ser cancelado com <code>clearInterval</code></li>
  <li>Retorna um id necessario para cancelar</li>
</ul>
<p>Usos comuns: relogio em tempo real, contagem regressiva, atualizacoes periodicas de dados.</p>',
 $code$// Executa a cada 1 segundo
var contador = 0;

var intervalo = setInterval(function() {
  contador++;
  document.getElementById('contador').textContent = contador;
  console.log('Tick:', contador);

  // Para apos 10 ticks
  if (contador >= 10) {
    clearInterval(intervalo);
    console.log('Intervalo encerrado!');
  }
}, 1000);

// Relogio em tempo real
setInterval(function() {
  var agora = new Date();
  var horas = agora.getHours().toString().padStart(2, '0');
  var minutos = agora.getMinutes().toString().padStart(2, '0');
  var segundos = agora.getSeconds().toString().padStart(2, '0');
  document.getElementById('relogio').textContent = horas + ':' + minutos + ':' + segundos;
}, 1000);$code$,
 'javascript', 2, 27),

(81,
 'clearTimeout e clearInterval',
 '<p>Para cancelar um timer antes de ele executar, use as funcoes <code>clear</code> correspondentes:</p>
<ul>
  <li><code>clearTimeout(id)</code> — cancela um setTimeout ainda pendente</li>
  <li><code>clearInterval(id)</code> — para um setInterval em andamento</li>
</ul>
<p>Sempre salve o id retornado quando precisar cancelar depois. Esquecer de limpar intervalos e uma causa comum de <strong>memory leaks</strong> em aplicacoes web.</p>',
 $code$// Botao que cancela o timer se clicado a tempo
var idTimer = setTimeout(function() {
  alert('Tempo esgotado! Sessao encerrada.');
}, 5000);

document.getElementById('btn-cancelar').addEventListener('click', function() {
  clearTimeout(idTimer);
  console.log('Timer cancelado!');
});

// Intervalo com controle de play/pause
var idIntervalo = null;

document.getElementById('btn-iniciar').addEventListener('click', function() {
  if (idIntervalo === null) {
    idIntervalo = setInterval(function() {
      console.log('tick');
    }, 1000);
  }
});

document.getElementById('btn-parar').addEventListener('click', function() {
  clearInterval(idIntervalo);
  idIntervalo = null; // reseta o id
});$code$,
 'javascript', 3, 27);

-- ════════════════════════════════════════════════════════════════════════════
-- TRILHA 3 — MODULO 8: Fetch API (section 28, lessons 82-84)
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(82,
 'O que e a Fetch API',
 '<p>A <strong>Fetch API</strong> permite fazer requisicoes HTTP para servidores e APIs externas diretamente do navegador, sem recarregar a pagina.</p>
<ul>
  <li><code>fetch(url)</code> — inicia uma requisicao GET para a URL</li>
  <li>Retorna uma <strong>Promise</strong> — nao bloqueia o navegador</li>
  <li><code>.then(response => response.json())</code> — converte a resposta para objeto JS</li>
  <li><code>.then(dados => ...)</code> — usa os dados recebidos</li>
</ul>
<p>Por ser assincrono, a pagina continua funcionando enquanto aguarda a resposta do servidor.</p>',
 $code$// Busca dados de uma API publica
fetch('https://jsonplaceholder.typicode.com/users/1')
  .then(function(response) {
    // Verifica se a resposta foi bem-sucedida
    console.log('Status:', response.status);   // 200
    console.log('OK?', response.ok);           // true

    // Converte o corpo da resposta para JSON
    return response.json();
  })
  .then(function(dados) {
    // Aqui temos o objeto JavaScript com os dados
    console.log('Nome:', dados.name);
    console.log('Email:', dados.email);
  });

console.log('Esta linha executa ANTES do fetch terminar!');$code$,
 'javascript', 1, 28),

(83,
 'Exibindo Dados da API na Pagina',
 '<p>Na pratica, os dados buscados com <code>fetch</code> sao usados para <strong>preencher a pagina dinamicamente</strong>.</p>
<p>Fluxo tipico:</p>
<ol>
  <li>Mostrar um indicador de carregamento</li>
  <li>Buscar os dados com fetch</li>
  <li>Processar os dados no <code>.then()</code></li>
  <li>Criar elementos HTML com os dados e inserir na pagina</li>
  <li>Esconder o indicador de carregamento</li>
</ol>',
 $code$var lista = document.getElementById('lista-usuarios');
var loading = document.getElementById('loading');

// Mostra o loading
loading.style.display = 'block';

fetch('https://jsonplaceholder.typicode.com/users')
  .then(function(response) {
    return response.json();
  })
  .then(function(usuarios) {
    // Esconde o loading
    loading.style.display = 'none';

    // Cria um item de lista para cada usuario
    usuarios.forEach(function(usuario) {
      var li = document.createElement('li');
      li.textContent = usuario.name + ' — ' + usuario.email;
      lista.appendChild(li);
    });
  });$code$,
 'javascript', 2, 28),

(84,
 'Tratando Erros no Fetch',
 '<p>Requisicoes podem falhar (sem internet, servidor fora do ar, URL errada). Sempre trate os erros:</p>
<ul>
  <li><code>.catch(function(erro) {...})</code> — captura erros de rede</li>
  <li>Verifique <code>response.ok</code> — mesmo um status 404 ou 500 entra no <code>.then()</code></li>
  <li>Lance um erro manual se <code>response.ok === false</code> para cair no <code>.catch()</code></li>
</ul>
<p>Uma boa pratica e sempre ter um <code>.catch()</code> em toda cadeia de fetch.</p>',
 $code$function buscarPost(id) {
  fetch('https://jsonplaceholder.typicode.com/posts/' + id)
    .then(function(response) {
      // response.ok e false para status 400-599
      if (!response.ok) {
        throw new Error('Erro ' + response.status + ': recurso nao encontrado');
      }
      return response.json();
    })
    .then(function(post) {
      document.getElementById('titulo').textContent = post.title;
      document.getElementById('corpo').textContent = post.body;
    })
    .catch(function(erro) {
      console.error('Falha na requisicao:', erro.message);
      document.getElementById('erro').textContent = 'Nao foi possivel carregar o post.';
    });
}

buscarPost(1);$code$,
 'javascript', 3, 28);

-- ════════════════════════════════════════════════════════════════════════════
-- TRILHA 3 — MODULO 9: Async e Await (section 29, lessons 85-87)
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(85,
 'O que sao Promises',
 '<p>Uma <strong>Promise</strong> representa um valor que ainda nao esta disponivel, mas estara no futuro (ou pode falhar). E o mecanismo por tras do <code>fetch</code>.</p>
<ul>
  <li>Uma Promise pode estar <strong>pendente</strong>, <strong>resolvida</strong> (sucesso) ou <strong>rejeitada</strong> (erro)</li>
  <li><code>.then()</code> — executa quando resolvida</li>
  <li><code>.catch()</code> — executa quando rejeitada</li>
  <li><code>.finally()</code> — executa sempre, independente do resultado</li>
</ul>
<p>O encadeamento de <code>.then().then().catch()</code> e chamado de <strong>promise chain</strong>.</p>',
 $code$// Uma Promise simples que resolve apos 1 segundo
var minhaPromise = new Promise(function(resolve, reject) {
  setTimeout(function() {
    var sucesso = true;
    if (sucesso) {
      resolve('Dados carregados!');
    } else {
      reject(new Error('Algo deu errado'));
    }
  }, 1000);
});

minhaPromise
  .then(function(resultado) {
    console.log('Sucesso:', resultado); // "Dados carregados!"
  })
  .catch(function(erro) {
    console.error('Erro:', erro.message);
  })
  .finally(function() {
    console.log('Sempre executa — esconde o loading aqui');
  });$code$,
 'javascript', 1, 29),

(86,
 'async e await',
 '<p><code>async/await</code> e uma sintaxe moderna que torna o codigo assincrono <strong>mais facil de ler</strong>, parecendo codigo sincrono:</p>
<ul>
  <li><code>async function nome() {}</code> — declara uma funcao assincrona (sempre retorna Promise)</li>
  <li><code>await expressao</code> — pausa a funcao ate a Promise resolver (so dentro de async)</li>
  <li>Use <code>try/catch</code> para tratar erros em vez de <code>.catch()</code></li>
</ul>
<p>Async/await nao e mais rapido que <code>.then()</code> — e apenas uma sintaxe mais legivel.</p>',
 $code$// Equivalente async/await do fetch com .then()
async function buscarUsuario(id) {
  // await pausa aqui ate o fetch terminar
  var response = await fetch('https://jsonplaceholder.typicode.com/users/' + id);

  // await converte response para JSON
  var usuario = await response.json();

  return usuario;
}

// Chamando uma funcao async
async function exibir() {
  try {
    var usuario = await buscarUsuario(1);
    console.log('Nome:', usuario.name);
  } catch (erro) {
    console.error('Erro:', erro.message);
  }
}

exibir();$code$,
 'javascript', 2, 29),

(87,
 'async/await com Fetch na Pratica',
 '<p>Com <code>async/await</code>, o codigo de busca de dados fica limpo e facil de entender. Veja o padrao completo recomendado:</p>
<ul>
  <li>Declare a funcao como <code>async</code></li>
  <li>Use <code>await</code> em cada operacao assincrona</li>
  <li>Verifique <code>response.ok</code> e lance erro se necessario</li>
  <li>Envolva em <code>try/catch/finally</code> para tratamento completo</li>
</ul>',
 $code$async function carregarPosts() {
  var loading = document.getElementById('loading');
  var container = document.getElementById('posts');

  try {
    loading.style.display = 'block';

    var response = await fetch('https://jsonplaceholder.typicode.com/posts?_limit=5');

    if (!response.ok) {
      throw new Error('Erro ao buscar posts: ' + response.status);
    }

    var posts = await response.json();

    posts.forEach(function(post) {
      var div = document.createElement('div');
      div.classList.add('post-card');

      var h3 = document.createElement('h3');
      h3.textContent = post.title;

      var p = document.createElement('p');
      p.textContent = post.body;

      div.appendChild(h3);
      div.appendChild(p);
      container.appendChild(div);
    });

  } catch (erro) {
    console.error(erro.message);
    container.textContent = 'Erro ao carregar posts.';
  } finally {
    loading.style.display = 'none';
  }
}

carregarPosts();$code$,
 'javascript', 3, 29);

-- ════════════════════════════════════════════════════════════════════════════
-- TRILHA 3 — MODULO 10: Projeto Final (section 30, lessons 88-90)
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_lessons (id, title, theory_content, code_example, code_language, list_order, section_id) VALUES
(88,
 'Projeto: Lista de Tarefas — HTML',
 '<p>Voce chegou ao modulo final! Vamos construir uma <strong>lista de tarefas (To-Do List)</strong> completa usando tudo que aprendeu nas trilhas anteriores.</p>
<p>O projeto tera:</p>
<ul>
  <li>Campo para digitar e adicionar tarefas</li>
  <li>Lista de tarefas com opcao de marcar como concluida</li>
  <li>Botao para remover tarefas</li>
  <li>Persistencia com localStorage (tarefas ficam ao recarregar)</li>
</ul>
<p>Nesta aula, construimos a estrutura HTML e o estilo CSS do projeto.</p>',
 $code$<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Lista de Tarefas</title>
  <style>
    * { box-sizing: border-box; margin: 0; padding: 0; }
    body { font-family: Arial, sans-serif; background: #f0f4f8; padding: 40px 16px; }
    .app { max-width: 500px; margin: 0 auto; }
    h1 { color: #1a237e; text-align: center; margin-bottom: 24px; }
    .input-area { display: flex; gap: 8px; margin-bottom: 16px; }
    .input-area input { flex: 1; padding: 12px; border: 2px solid #ddd; border-radius: 8px; font-size: 16px; }
    .input-area button { padding: 12px 20px; background: #1a73e8; color: white; border: none; border-radius: 8px; cursor: pointer; font-size: 16px; }
    .tarefa { display: flex; align-items: center; gap: 12px; background: white; padding: 14px; border-radius: 8px; margin-bottom: 8px; border: 1px solid #eee; }
    .tarefa.concluida span { text-decoration: line-through; color: #999; }
    .tarefa button { margin-left: auto; background: #e53935; color: white; border: none; padding: 6px 12px; border-radius: 6px; cursor: pointer; }
  </style>
</head>
<body>
  <div class="app">
    <h1>Minhas Tarefas</h1>
    <div class="input-area">
      <input type="text" id="input-tarefa" placeholder="Digite uma tarefa...">
      <button id="btn-adicionar">Adicionar</button>
    </div>
    <div id="lista-tarefas"></div>
  </div>
  <script src="app.js"></script>
</body>
</html>$code$,
 'html', 1, 30),

(89,
 'Projeto: Lista de Tarefas — JavaScript',
 '<p>Agora implementamos a <strong>logica JavaScript</strong> do projeto: adicionar, concluir, remover e persistir tarefas com localStorage.</p>
<p>Conceitos aplicados nesta aula:</p>
<ul>
  <li>DOM: createElement, appendChild, remove</li>
  <li>Eventos: click, keydown</li>
  <li>localStorage com JSON</li>
  <li>Funcoes para organizar o codigo</li>
</ul>',
 $code$var lista = document.getElementById('lista-tarefas');
var input = document.getElementById('input-tarefa');
var btnAdicionar = document.getElementById('btn-adicionar');

// Carrega tarefas salvas ao iniciar
var tarefas = JSON.parse(localStorage.getItem('tarefas') || '[]');
tarefas.forEach(function(t) { renderizarTarefa(t); });

function salvar() {
  localStorage.setItem('tarefas', JSON.stringify(tarefas));
}

function renderizarTarefa(tarefa) {
  var div = document.createElement('div');
  div.classList.add('tarefa');
  if (tarefa.concluida) div.classList.add('concluida');
  div.dataset.id = tarefa.id;

  var checkbox = document.createElement('input');
  checkbox.type = 'checkbox';
  checkbox.checked = tarefa.concluida;
  checkbox.addEventListener('change', function() {
    tarefa.concluida = checkbox.checked;
    div.classList.toggle('concluida', tarefa.concluida);
    salvar();
  });

  var span = document.createElement('span');
  span.textContent = tarefa.texto;

  var btn = document.createElement('button');
  btn.textContent = 'Remover';
  btn.addEventListener('click', function() {
    tarefas = tarefas.filter(function(t) { return t.id !== tarefa.id; });
    div.remove();
    salvar();
  });

  div.appendChild(checkbox);
  div.appendChild(span);
  div.appendChild(btn);
  lista.appendChild(div);
}

function adicionarTarefa() {
  var texto = input.value.trim();
  if (!texto) return;
  var tarefa = { id: Date.now(), texto: texto, concluida: false };
  tarefas.push(tarefa);
  renderizarTarefa(tarefa);
  salvar();
  input.value = '';
}

btnAdicionar.addEventListener('click', adicionarTarefa);
input.addEventListener('keydown', function(e) {
  if (e.key === 'Enter') adicionarTarefa();
});$code$,
 'javascript', 2, 30),

(90,
 'Projeto: Lista de Tarefas — Conclusao',
 '<p>Parabens! Voce concluiu a trilha de JavaScript no Navegador. Nesta ultima aula, adicionamos <strong>melhorias finais</strong> ao projeto:</p>
<ul>
  <li>Contador de tarefas pendentes</li>
  <li>Botao para limpar tarefas concluidas</li>
  <li>Mensagem quando a lista esta vazia</li>
</ul>
<p>Voce agora sabe criar paginas web completas com HTML, CSS e JavaScript. Os proximos passos sao aprender um framework como React ou Angular, e explorar Node.js para o backend.</p>',
 $code$// Melhorias adicionadas ao projeto de tarefas

// Atualiza o contador de pendentes
function atualizarContador() {
  var pendentes = tarefas.filter(function(t) { return !t.concluida; }).length;
  var contador = document.getElementById('contador');
  if (contador) {
    contador.textContent = pendentes + ' tarefa(s) pendente(s)';
  }
  mostrarMensagemVazia();
}

// Exibe mensagem se a lista estiver vazia
function mostrarMensagemVazia() {
  var vazia = document.getElementById('lista-vazia');
  if (vazia) {
    vazia.style.display = tarefas.length === 0 ? 'block' : 'none';
  }
}

// Limpa todas as tarefas concluidas
document.getElementById('btn-limpar').addEventListener('click', function() {
  tarefas = tarefas.filter(function(t) { return !t.concluida; });
  localStorage.setItem('tarefas', JSON.stringify(tarefas));

  // Remove os elementos concluidos do DOM
  document.querySelectorAll('.tarefa.concluida').forEach(function(el) {
    el.remove();
  });

  atualizarContador();
});$code$,
 'javascript', 3, 30);

-- ════════════════════════════════════════════════════════════════════════════
-- EXERCICIOS — 1 por licao (licoes 31-90)
-- ════════════════════════════════════════════════════════════════════════════

INSERT INTO tb_exercises (id, question, correct_answer, lesson_id) VALUES
-- Trilha 2: HTML e CSS
(31, 'Qual tag HTML contem o conteudo visivel da pagina?',                              2, 31),
(32, 'Qual tag deixa o texto em negrito com significado de importancia?',               1, 32),
(33, 'Qual atributo identifica um elemento de forma UNICA na pagina?',                 1, 33),
(34, 'Qual atributo da tag <a> define o destino do link?',                             1, 34),
(35, 'Qual atributo e obrigatorio em <img> para acessibilidade?',                      2, 35),
(36, 'Qual e a diferenca entre <div> e <span>?',                                       2, 36),
(37, 'Qual combinacao de tags cria uma lista com marcadores?',                         1, 37),
(38, 'O que o atributo type="A" faz em uma <ol>?',                                    3, 38),
(39, 'Qual tag representa uma linha de dados em uma tabela HTML?',                     2, 39),
(40, 'Qual atributo HTML torna um campo de formulario obrigatorio?',                   1, 40),
(41, 'Qual type de <input> cria botoes de selecao exclusiva (um ou outro)?',           2, 41),
(42, 'Qual tag cria uma lista suspensa de opcoes?',                                    3, 42),
(43, 'Qual tag semantica representa o conteudo principal da pagina?',                  1, 43),
(44, 'Qual tag e usada para conteudo independente e reutilizavel, como post de blog?', 2, 44),
(45, 'Qual meta tag e essencial para o site funcionar bem em celulares?',              3, 45),
(46, 'Qual e a sintaxe correta de uma regra CSS?',                                     1, 46),
(47, 'Como selecionamos todos os elementos com class="destaque" no CSS?',              2, 47),
(48, 'Qual propriedade CSS define a cor do texto?',                                    2, 48),
(49, 'Da camada mais interna para a mais externa, qual e a ordem do Box Model?',       2, 49),
(50, 'O que margin: 0 auto faz em um elemento de bloco?',                              1, 50),
(51, 'O que box-sizing: border-box faz?',                                              2, 51),
(52, 'Qual propriedade CSS ativa o Flexbox em um container?',                          2, 52),
(53, 'Qual propriedade alinha os itens no eixo principal do Flexbox?',                 1, 53),
(54, 'Qual propriedade permite que os flex items quebrem para a proxima linha?',       3, 54),
(55, 'Qual propriedade define as colunas de um CSS Grid?',                             2, 55),
(56, 'O que repeat(3, 1fr) significa no CSS Grid?',                                   2, 56),
(57, 'O que grid-column: span 2 faz com um item do Grid?',                            2, 57),
(58, 'Qual e o primeiro passo para garantir responsividade mobile?',                   2, 58),
(59, 'O que @media (max-width: 768px) faz?',                                          1, 59),
(60, 'A unidade rem e relativa a qual elemento?',                                      3, 60),
-- Trilha 3: JavaScript no Navegador
(61, 'O que e o DOM em desenvolvimento web?',                                          2, 61),
(62, 'Qual metodo seleciona o PRIMEIRO elemento que corresponde a um seletor CSS?',    1, 62),
(63, 'Qual propriedade define texto sem interpretar HTML, protegendo contra injecao?', 2, 63),
(64, 'Como se escreve a propriedade background-color em JavaScript?',                  3, 64),
(65, 'Qual metodo de classList ADICIONA a classe se nao existir e REMOVE se existir?', 2, 65),
(66, 'Qual metodo le o valor de um atributo HTML de um elemento?',                     1, 66),
(67, 'Qual e o segundo argumento de addEventListener?',                                2, 67),
(68, 'Qual evento dispara a cada caractere digitado em um input?',                     1, 68),
(69, 'O que event.target representa em um evento?',                                    3, 69),
(70, 'Qual metodo insere um elemento filho no FINAL do elemento pai?',                 2, 70),
(71, 'Por que usar textContent e mais seguro que innerHTML para dados do usuario?',    1, 71),
(72, 'Qual e a forma mais moderna de remover um elemento do DOM?',                     2, 72),
(73, 'Qual propriedade JavaScript verifica se um checkbox esta marcado?',              1, 73),
(74, 'O que event.preventDefault() faz no evento submit de um formulario?',           2, 74),
(75, 'Em qual situacao event.preventDefault() e aplicado em um link?',                 2, 75),
(76, 'Por quanto tempo os dados no localStorage persistem?',                           3, 76),
(77, 'O que localStorage.getItem("chave") retorna se a chave nao existir?',           2, 77),
(78, 'Qual metodo converte um objeto JavaScript para string JSON?',                    1, 78),
(79, 'O setTimeout executa a funcao…',                                                 1, 79),
(80, 'O que diferencia setInterval de setTimeout?',                                    2, 80),
(81, 'O que clearInterval(id) faz?',                                                   2, 81),
(82, 'O que fetch(url) retorna?',                                                      2, 82),
(83, 'O que response.json() faz com a resposta do fetch?',                             3, 83),
(84, 'Quando o .catch() e acionado em uma cadeia fetch?',                              1, 84),
(85, 'Quais sao os tres estados possiveis de uma Promise?',                            2, 85),
(86, 'Onde se pode usar a palavra-chave await?',                                       1, 86),
(87, 'Qual estrutura substitui o .catch() quando usamos async/await?',                 2, 87),
(88, 'Qual tag HTML cria um menu suspenso de opcoes?',                                 3, 88),
(89, 'Qual metodo converte um array JavaScript para string JSON para salvar no localStorage?', 2, 89),
(90, 'O que localStorage.clear() faz?',                                                3, 90);

-- ════════════════════════════════════════════════════════════════════════════
-- OPCOES DOS EXERCICIOS (4 opcoes por exercicio, licoes 31-90)
-- ════════════════════════════════════════════════════════════════════════════

-- Ex 31: <body>
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(31, '<head>'), (31, '<html>'), (31, '<body>'), (31, '<title>');

-- Ex 32: <strong>
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(32, '<b>'), (32, '<strong>'), (32, '<em>'), (32, '<i>');

-- Ex 33: id
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(33, 'class'), (33, 'id'), (33, 'style'), (33, 'title');

-- Ex 34: href
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(34, 'src'), (34, 'href'), (34, 'link'), (34, 'url');

-- Ex 35: alt
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(35, 'src'), (35, 'width'), (35, 'alt'), (35, 'title');

-- Ex 36: div e bloco, span e inline
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(36, 'div e inline, span e de bloco'),
(36, 'sao identicos, apenas nomes diferentes'),
(36, 'div e de bloco, span e inline'),
(36, 'div so serve para agrupar imagens');

-- Ex 37: <ul> e <li>
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(37, '<ol> e <li>'), (37, '<ul> e <li>'), (37, '<list> e <item>'), (37, '<ul> e <bullet>');

-- Ex 38: type="A" usa letras maiusculas
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(38, 'Deixa os itens em negrito'),
(38, 'Numera com algarismos romanos'),
(38, 'Ordena os itens alfabeticamente'),
(38, 'Usa letras maiusculas no lugar de numeros');

-- Ex 39: <tr>
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(39, '<td>'), (39, '<th>'), (39, '<tr>'), (39, '<table>');

-- Ex 40: required
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(40, 'mandatory'), (40, 'required'), (40, 'validate'), (40, 'obligatory');

-- Ex 41: radio
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(41, 'checkbox'), (41, 'select'), (41, 'radio'), (41, 'toggle');

-- Ex 42: <select>
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(42, '<input type="list">'), (42, '<dropdown>'), (42, '<options>'), (42, '<select>');

-- Ex 43: <main>
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(43, '<content>'), (43, '<main>'), (43, '<article>'), (43, '<body>');

-- Ex 44: <article>
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(44, '<section>'), (44, '<aside>'), (44, '<article>'), (44, '<div>');

-- Ex 45: viewport meta tag
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(45, '<meta charset="UTF-8">'),
(45, '<meta name="description">'),
(45, '<meta name="author">'),
(45, '<meta name="viewport">');

-- Ex 46: seletor { propriedade: valor; }
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(46, 'seletor { propriedade = valor }'),
(46, 'seletor { propriedade: valor; }'),
(46, 'seletor [ propriedade: valor ]'),
(46, 'seletor ( propriedade, valor )');

-- Ex 47: .destaque {}
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(47, 'destaque {}'), (47, '#destaque {}'), (47, '.destaque {}'), (47, '*destaque {}');

-- Ex 48: color
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(48, 'text-color'), (48, 'font-color'), (48, 'color'), (48, 'foreground');

-- Ex 49: content, padding, border, margin
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(49, 'margin, border, padding, content'),
(49, 'padding, content, border, margin'),
(49, 'content, padding, border, margin'),
(49, 'border, padding, content, margin');

-- Ex 50: centraliza horizontalmente
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(50, 'Remove todas as margens do elemento'),
(50, 'Centraliza o elemento horizontalmente'),
(50, 'Aplica margem automatica em cima e embaixo'),
(50, 'Faz o elemento ocupar 100% da largura');

-- Ex 51: inclui padding e border no width
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(51, 'Remove a borda do elemento'),
(51, 'Arredonda os cantos da borda'),
(51, 'Inclui padding e border no width declarado'),
(51, 'Adiciona margem automatica ao elemento');

-- Ex 52: display: flex
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(52, 'flex: 1'), (52, 'flex-direction: row'), (52, 'display: flex'), (52, 'position: flex');

-- Ex 53: justify-content
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(53, 'align-items'), (53, 'justify-content'), (53, 'flex-direction'), (53, 'align-content');

-- Ex 54: flex-wrap: wrap
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(54, 'flex-overflow: wrap'), (54, 'flex-direction: wrap'), (54, 'overflow: wrap'), (54, 'flex-wrap: wrap');

-- Ex 55: grid-template-columns
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(55, 'grid-columns'), (55, 'column-template'), (55, 'grid-template-columns'), (55, 'columns');

-- Ex 56: 3 colunas de tamanho igual
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(56, 'Repete o conteudo das celulas 3 vezes'),
(56, 'Cria 3 linhas de tamanho igual'),
(56, 'Cria 3 colunas de tamanhos iguais'),
(56, 'Define 3 areas nomeadas no grid');

-- Ex 57: item ocupa 2 colunas
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(57, 'Move o item para a coluna 2'),
(57, 'Oculta o item apos 2 colunas'),
(57, 'Faz o item ocupar 2 colunas'),
(57, 'Cria 2 copias do item');

-- Ex 58: meta tag viewport
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(58, 'Usar apenas pixels para todas as medidas'),
(58, 'Adicionar display: flex em todos os elementos'),
(58, 'Declarar a meta tag viewport no head'),
(58, 'Usar imagens pequenas e comprimidas');

-- Ex 59: aplica em telas ate 768px
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(59, 'Aplica os estilos apenas em telas maiores que 768px'),
(59, 'Aplica os estilos em telas ate 768px de largura'),
(59, 'Bloqueia o acesso em telas menores que 768px'),
(59, 'Define a largura maxima do site como 768px');

-- Ex 60: relativo ao elemento raiz (html)
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(60, 'Ao elemento pai direto'),
(60, 'A largura da viewport (tela)'),
(60, 'Ao tamanho da fonte do proprio elemento'),
(60, 'Ao tamanho da fonte do elemento raiz (html)');

-- Ex 61: representacao em arvore dos elementos HTML
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(61, 'Uma linguagem de programacao especifica do navegador'),
(61, 'Um banco de dados interno do navegador'),
(61, 'A representacao em arvore dos elementos HTML da pagina'),
(61, 'Um servidor local de arquivos estaticos');

-- Ex 62: querySelector
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(62, 'getElementById()'), (62, 'querySelector()'), (62, 'getElementsByClassName()'), (62, 'querySelectorAll()');

-- Ex 63: textContent
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(63, 'innerHTML'), (63, 'value'), (63, 'textContent'), (63, 'outerHTML');

-- Ex 64: backgroundColor
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(64, 'background-color'), (64, 'bgColor'), (64, 'background_color'), (64, 'backgroundColor');

-- Ex 65: classList.toggle
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(65, 'classList.add()'), (65, 'classList.swap()'), (65, 'classList.toggle()'), (65, 'classList.update()');

-- Ex 66: getAttribute
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(66, 'element.readAttribute()'), (66, 'element.getAttribute()'), (66, 'element.getProperty()'), (66, 'element.attr()');

-- Ex 67: a funcao que sera executada
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(67, 'O nome do evento (string)'),
(67, 'O elemento alvo do evento'),
(67, 'A funcao que sera executada quando o evento ocorrer'),
(67, 'O numero de vezes para executar');

-- Ex 68: input
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(68, 'change'), (68, 'input'), (68, 'blur'), (68, 'focus');

-- Ex 69: elemento que disparou o evento
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(69, 'O elemento pai onde o listener foi registrado'),
(69, 'A janela do navegador'),
(69, 'O objeto do evento capturado'),
(69, 'O elemento especifico que disparou o evento');

-- Ex 70: appendChild
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(70, 'prepend()'), (70, 'insertBefore()'), (70, 'appendChild()'), (70, 'addChild()');

-- Ex 71: textContent nao interpreta HTML
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(71, 'textContent renderiza o resultado mais rapido'),
(71, 'textContent nao interpreta HTML, evitando injecao de codigo'),
(71, 'innerHTML nao funciona em todos os navegadores'),
(71, 'textContent suporta mais tipos de elementos');

-- Ex 72: element.remove()
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(72, 'element.delete()'), (72, 'element.destroy()'), (72, 'element.remove()'), (72, 'parent.deleteChild(element)');

-- Ex 73: input.checked
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(73, 'input.value'), (73, 'input.checked'), (73, 'input.selected'), (73, 'input.marked');

-- Ex 74: impede o recarregamento
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(74, 'Envia o formulario para o servidor normalmente'),
(74, 'Limpa todos os campos do formulario'),
(74, 'Impede o recarregamento da pagina ao enviar'),
(74, 'Valida os campos automaticamente');

-- Ex 75: para executar JS em vez de navegar
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(75, 'Para mudar a cor do link ao clicar'),
(75, 'Para abrir o link em uma nova aba'),
(75, 'Para executar JavaScript em vez de navegar para o href'),
(75, 'Para desabilitar o link permanentemente');

-- Ex 76: ate serem explicitamente removidos
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(76, 'Ate fechar a aba do navegador'),
(76, 'Por no maximo 24 horas'),
(76, 'Ate fechar o navegador completamente'),
(76, 'Ate serem explicitamente removidos');

-- Ex 77: null
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(77, 'undefined'), (77, 'false'), (77, 'null'), (77, '0');

-- Ex 78: JSON.stringify
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(78, 'JSON.parse()'), (78, 'JSON.stringify()'), (78, 'JSON.convert()'), (78, 'JSON.encode()');

-- Ex 79: uma unica vez apos o tempo
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(79, 'Repetidamente ate ser cancelado com clearTimeout'),
(79, 'Uma unica vez apos o tempo definido'),
(79, 'Imediatamente em segundo plano'),
(79, 'Apenas quando o usuario interagir com a pagina');

-- Ex 80: setInterval repete, setTimeout executa uma vez
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(80, 'setInterval e mais preciso que setTimeout'),
(80, 'setTimeout repete, setInterval executa uma vez'),
(80, 'setInterval repete em intervalos fixos, setTimeout executa uma vez'),
(80, 'Nao ha diferenca entre os dois');

-- Ex 81: para definitivamente o intervalo
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(81, 'Pausa o intervalo temporariamente'),
(81, 'Reinicia o intervalo do zero'),
(81, 'Para definitivamente o intervalo com aquele id'),
(81, 'Apaga o id da memoria do navegador');

-- Ex 82: uma Promise
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(82, 'Os dados da URL diretamente como objeto'),
(82, 'Um objeto Response sincrono'),
(82, 'Uma Promise'),
(82, 'Um callback para processar a resposta');

-- Ex 83: converte para objeto JavaScript
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(83, 'Converte o objeto JavaScript para string JSON'),
(83, 'Verifica se a resposta e JSON valido'),
(83, 'Exibe o JSON formatado no console'),
(83, 'Converte o corpo da resposta para um objeto JavaScript');

-- Ex 84: erro de rede ou rejeicao da Promise
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(84, 'Quando o servidor retorna status 404'),
(84, 'Quando ocorre um erro de rede ou a Promise e rejeitada'),
(84, 'Quando response.ok e true'),
(84, 'Sempre depois de cada .then()');

-- Ex 85: pending, fulfilled, rejected
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(85, 'loading, success, error'),
(85, 'waiting, done, failed'),
(85, 'pending, fulfilled, rejected'),
(85, 'inactive, active, resolved');

-- Ex 86: apenas dentro de funcoes async
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(86, 'Em qualquer funcao JavaScript'),
(86, 'Apenas em funcoes declaradas com async'),
(86, 'Apenas dentro de blocos .then()'),
(86, 'Apenas no escopo global do arquivo');

-- Ex 87: try/catch
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(87, 'if/else'), (87, 'finally'), (87, 'try/catch'), (87, 'switch/case');

-- Ex 88: <select>
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(88, '<input type="list">'), (88, '<menu>'), (88, '<datalist>'), (88, '<select>');

-- Ex 89: JSON.stringify
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(89, 'JSON.parse()'), (89, 'array.toString()'), (89, 'JSON.stringify()'), (89, 'JSON.serialize()');

-- Ex 90: remove todos os dados do site
INSERT INTO tb_exercises_options (exercise_id, options) VALUES
(90, 'Remove apenas o item mais antigo armazenado'),
(90, 'Apaga apenas itens com data de expiracao'),
(90, 'Limpa os dados apenas da aba atual'),
(90, 'Remove todos os dados armazenados do site');

-- ════════════════════════════════════════════════════════════════════════════
-- KANBAN TEMPLATES — Trilha 2 (11-20) e Trilha 3 (21-30)
-- Vinculados a ultima aula de cada modulo
-- ════════════════════════════════════════════════════════════════════════════

-- Trilha 2 — Modulo 1: Introducao ao HTML (lesson 33)
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(11,
 'Desafio: Minha Primeira Pagina',
 'Crie uma pagina HTML completa com estrutura basica e conteudo de texto.',
 'Alta',
 33,
 'html',
 'Crie uma pagina HTML completa que contenha: (1) estrutura basica com DOCTYPE, html, head e body; (2) titulo na aba do navegador; (3) pelo menos um h1 e dois paragrafos; (4) use as tags strong e em para destacar partes do texto; (5) adicione um comentario HTML explicando a estrutura.',
$code$<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <title>Minha Pagina</title>
</head>
<body>

  <!-- Adicione seu conteudo aqui -->
  <h1>Titulo Principal</h1>

  <p>Primeiro paragrafo...</p>

</body>
</html>$code$);

-- Trilha 2 — Modulo 2: Links e Imagens (lesson 36)
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(12,
 'Desafio: Cartao de Perfil',
 'Crie um cartao de perfil HTML com imagem, links e containers div/span.',
 'Alta',
 36,
 'html',
 'Crie um cartao de perfil que contenha: (1) uma imagem com src e alt; (2) seu nome em um h2; (3) uma descricao curta em paragrafo; (4) pelo menos 2 links (um externo com target="_blank" e um de email); (5) use div para agrupar o cartao e span para destacar palavras no texto.',
$code$<!DOCTYPE html>
<html lang="pt-BR">
<body>

  <div class="cartao">

    <img src="https://via.placeholder.com/100" alt="Foto de perfil">

    <h2>Seu Nome</h2>
    <p>Desenvolvedor <span>web</span> iniciante.</p>

    <!-- Adicione os links aqui -->

  </div>

</body>
</html>$code$);

-- Trilha 2 — Modulo 3: Listas e Tabelas (lesson 39)
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(13,
 'Desafio: Cardapio com Lista e Tabela',
 'Crie um cardapio usando listas e uma tabela HTML.',
 'Alta',
 39,
 'html',
 'Crie um cardapio que tenha: (1) uma lista nao ordenada com pelo menos 4 pratos disponíveis; (2) uma lista ordenada com 3 passos para fazer o pedido; (3) uma tabela com colunas: Prato, Preco, Calorias; com pelo menos 3 linhas de dados; (4) use thead e tbody na tabela.',
$code$<!DOCTYPE html>
<html lang="pt-BR">
<body>

  <h1>Cardapio do Restaurante</h1>

  <h2>Pratos Disponiveis</h2>
  <ul>
    <li><!-- adicione pratos --></li>
  </ul>

  <h2>Como Fazer seu Pedido</h2>
  <ol>
    <li><!-- adicione passos --></li>
  </ol>

  <h2>Tabela de Precos</h2>
  <table border="1">
    <thead>
      <tr>
        <th>Prato</th>
        <th>Preco</th>
        <th>Calorias</th>
      </tr>
    </thead>
    <tbody>
      <!-- adicione linhas aqui -->
    </tbody>
  </table>

</body>
</html>$code$);

-- Trilha 2 — Modulo 4: Formularios (lesson 42)
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(14,
 'Desafio: Formulario de Cadastro',
 'Crie um formulario de cadastro completo com diferentes tipos de input.',
 'Alta',
 42,
 'html',
 'Crie um formulario de cadastro com: (1) campos nome (text, required), email (email), senha (password) e data de nascimento (date); (2) um grupo de radio buttons para genero; (3) pelo menos 2 checkboxes para interesses; (4) um select com 3 estados brasileiros; (5) um textarea para "Sobre mim"; (6) botoes de enviar e limpar. Conecte todas as labels aos inputs com for/id.',
$code$<!DOCTYPE html>
<html lang="pt-BR">
<body>

  <h1>Cadastro</h1>

  <form>

    <label for="nome">Nome:</label>
    <input type="text" id="nome" name="nome" required>
    <br><br>

    <!-- Adicione os demais campos aqui -->

    <button type="submit">Cadastrar</button>
    <button type="reset">Limpar</button>

  </form>

</body>
</html>$code$);

-- Trilha 2 — Modulo 5: HTML Semantico (lesson 45)
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(15,
 'Desafio: Pagina de Blog Semantica',
 'Construa um layout de blog usando apenas tags semanticas do HTML5.',
 'Alta',
 45,
 'html',
 'Crie uma pagina de blog semantica com: (1) header com h1 e nav contendo 3 links; (2) main com 2 articles, cada um com h2, data de publicacao e paragrafo; (3) aside com secao "Sobre o autor" e lista de links uteis; (4) footer com copyright. Nao use div onde uma tag semantica se encaixa melhor.',
$code$<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Meu Blog</title>
</head>
<body>

  <header>
    <!-- cabecalho e nav -->
  </header>

  <main>
    <!-- articles -->
  </main>

  <aside>
    <!-- conteudo lateral -->
  </aside>

  <footer>
    <!-- rodape -->
  </footer>

</body>
</html>$code$);

-- Trilha 2 — Modulo 6: Introducao ao CSS (lesson 48)
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(16,
 'Desafio: Cartao Estilizado com CSS',
 'Aplique CSS para transformar um HTML simples em um cartao visualmente atraente.',
 'Alta',
 48,
 'html',
 'Partindo do HTML fornecido, adicione CSS interno (na tag style) para: (1) definir fonte e cor de fundo do body; (2) estilizar o .card com fundo branco, borda, border-radius e sombra (box-shadow); (3) colorir o h2 com uma cor de destaque; (4) estilizar o .preco com cor verde e font-weight bold; (5) estilizar o .tag com cor de fundo e texto de cor diferente.',
$code$<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <style>
    /* Adicione seus estilos aqui */

    body {
      font-family: Arial, sans-serif;
      background-color: #f0f4f8;
    }

    .card {
      /* estilize o cartao */
    }

  </style>
</head>
<body>

  <div class="card">
    <h2>Curso de HTML e CSS</h2>
    <span class="tag">Iniciante</span>
    <p>Aprenda a criar paginas web profissionais do zero.</p>
    <p class="preco">R$ 49,90</p>
  </div>

</body>
</html>$code$);

-- Trilha 2 — Modulo 7: Box Model (lesson 51)
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(17,
 'Desafio: Layout com Box Model',
 'Controle espacamentos e bordas usando margin, padding e border.',
 'Media',
 51,
 'html',
 'Usando box-sizing: border-box, crie: (1) um .container com largura maxima de 600px centralizado com margin: 0 auto; (2) 3 .card dentro do container, cada um com padding de 20px, border solida e margin-bottom de 16px; (3) um botao dentro de cada card com padding, border-radius e background colorido; (4) adicione border-radius nos cards para arredondar os cantos.',
$code$<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: Arial, sans-serif;
      background: #f5f5f5;
      padding: 24px;
    }

    .container {
      /* max-width, margin: 0 auto */
    }

    .card {
      /* padding, border, margin-bottom, border-radius */
      background: white;
    }

    .btn {
      /* padding, border-radius, background */
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="card">
      <h3>Card 1</h3>
      <p>Conteudo do card com padding adequado.</p>
      <button class="btn">Saiba mais</button>
    </div>
    <!-- adicione mais 2 cards -->
  </div>
</body>
</html>$code$);

-- Trilha 2 — Modulo 8: Flexbox (lesson 54)
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(18,
 'Desafio: Navbar e Galeria com Flexbox',
 'Use Flexbox para criar uma barra de navegacao e uma galeria responsiva.',
 'Alta',
 54,
 'html',
 'Com Flexbox, construa: (1) uma .navbar com display flex, justify-content: space-between e align-items: center, contendo logo a esquerda e 3 links a direita; (2) uma .galeria com flex-wrap: wrap e gap, contendo 6 .foto-card que tem flex-basis de 200px e flex-grow: 1; (3) aplique cores e estilos para deixar visualmente apresentavel.',
$code$<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <style>
    * { box-sizing: border-box; margin: 0; padding: 0; }

    body { font-family: Arial, sans-serif; }

    .navbar {
      display: flex;
      /* justify-content e align-items */
      background: #1a237e;
      padding: 0 24px;
      height: 60px;
    }

    .logo { color: white; font-size: 20px; font-weight: bold; }
    .nav-links { display: flex; gap: 24px; }
    .nav-links a { color: white; text-decoration: none; }

    .galeria {
      display: flex;
      /* flex-wrap e gap */
      padding: 24px;
    }

    .foto-card {
      /* flex-basis e flex-grow */
      background: #e3f2fd;
      height: 150px;
      border-radius: 8px;
      display: flex;
      align-items: center;
      justify-content: center;
    }
  </style>
</head>
<body>
  <nav class="navbar">
    <span class="logo">MeuSite</span>
    <div class="nav-links">
      <a href="#">Inicio</a>
      <a href="#">Sobre</a>
      <a href="#">Contato</a>
    </div>
  </nav>

  <div class="galeria">
    <div class="foto-card">Foto 1</div>
    <div class="foto-card">Foto 2</div>
    <div class="foto-card">Foto 3</div>
    <div class="foto-card">Foto 4</div>
    <div class="foto-card">Foto 5</div>
    <div class="foto-card">Foto 6</div>
  </div>
</body>
</html>$code$);

-- Trilha 2 — Modulo 9: CSS Grid (lesson 57)
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(19,
 'Desafio: Layout de Dashboard com Grid',
 'Crie um layout de painel administrativo usando CSS Grid.',
 'Alta',
 57,
 'html',
 'Com CSS Grid, construa um dashboard com: (1) header que ocupa as 3 colunas (grid-column: 1/4); (2) sidebar na esquerda (1 coluna); (3) area principal no centro (2 colunas); (4) 4 cards de estatisticas usando repeat(4, 1fr); (5) footer que ocupa todas as colunas. Use gap para espacamento e cores para diferenciar as areas.',
$code$<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <style>
    * { box-sizing: border-box; margin: 0; padding: 0; }

    body { font-family: Arial, sans-serif; background: #f0f4f8; }

    .dashboard {
      display: grid;
      grid-template-columns: 220px 1fr;
      grid-template-rows: 60px 1fr 50px;
      gap: 8px;
      min-height: 100vh;
      padding: 8px;
    }

    .header  { grid-column: 1 / 3; background: #1a237e; color: white; padding: 16px; }
    .sidebar { background: #e8eaf6; padding: 16px; }
    .main    { padding: 16px; }
    .footer  { grid-column: 1 / 3; background: #333; color: white; padding: 12px; }

    /* Area de cards de estatisticas dentro do main */
    .stats {
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      gap: 12px;
      margin-bottom: 16px;
    }

    .stat-card {
      background: white;
      padding: 16px;
      border-radius: 8px;
      text-align: center;
    }
  </style>
</head>
<body>
  <div class="dashboard">
    <header class="header">Dashboard</header>
    <aside class="sidebar">
      <h3>Menu</h3>
      <!-- adicione links de menu -->
    </aside>
    <main class="main">
      <div class="stats">
        <div class="stat-card"><h4>Usuarios</h4><p>1.240</p></div>
        <div class="stat-card"><h4>Vendas</h4><p>340</p></div>
        <div class="stat-card"><h4>Receita</h4><p>R$ 12k</p></div>
        <div class="stat-card"><h4>Tarefas</h4><p>28</p></div>
      </div>
      <!-- adicione mais conteudo -->
    </main>
    <footer class="footer">2024 - Meu Dashboard</footer>
  </div>
</body>
</html>$code$);

-- Trilha 2 — Modulo 10: Responsividade (lesson 60)
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(20,
 'Desafio: Pagina Totalmente Responsiva',
 'Crie uma landing page que funcione bem em celular, tablet e desktop.',
 'Alta',
 60,
 'html',
 'Crie uma landing page responsiva com: (1) meta tag viewport; (2) navbar com logo e links que empilham em telas pequenas; (3) secao hero com texto centralizado e altura de 50vh; (4) 3 cards de servicos que ficam em coluna no celular e em linha no desktop (media query min-width: 768px); (5) use rem para fontes e % ou rem para espacamentos.',
$code$<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Landing Page Responsiva</title>
  <style>
    * { box-sizing: border-box; margin: 0; padding: 0; }
    body { font-family: Arial, sans-serif; }

    .hero {
      height: 50vh;
      background: #1a237e;
      color: white;
      display: flex;
      align-items: center;
      justify-content: center;
      text-align: center;
      padding: 1rem;
    }

    .hero h1 { font-size: 2rem; }

    .servicos {
      display: flex;
      flex-direction: column; /* celular: coluna */
      gap: 1rem;
      padding: 2rem;
      max-width: 1100px;
      margin: 0 auto;
    }

    .card {
      background: #f5f5f5;
      padding: 1.5rem;
      border-radius: 8px;
    }

    /* Desktop */
    @media (min-width: 768px) {
      .servicos {
        flex-direction: row; /* desktop: linha */
      }
    }
  </style>
</head>
<body>

  <div class="hero">
    <div>
      <h1>Bem-vindo a Minha Empresa</h1>
      <p>Solucoes web profissionais</p>
    </div>
  </div>

  <section class="servicos">
    <div class="card"><h3>Web Design</h3><p>Sites modernos e responsivos.</p></div>
    <div class="card"><h3>Desenvolvimento</h3><p>Aplicacoes web robustas.</p></div>
    <div class="card"><h3>Consultoria</h3><p>Orientacao tecnica especializada.</p></div>
  </section>

</body>
</html>$code$);

-- Trilha 3 — Modulo 1: O DOM (lesson 63)
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(21,
 'Desafio: Manipulando o DOM',
 'Selecione e modifique elementos HTML usando JavaScript.',
 'Alta',
 63,
 'javascript',
 'Complete o codigo para: (1) selecionar o elemento com id "titulo" e alterar seu texto para "DOM Dominado!"; (2) selecionar todos os <li> e exibir seu texto no console; (3) alterar o textContent do primeiro paragrafo; (4) usar querySelector para selecionar o elemento com class "destaque" e mudar seu innerHTML.',
$code$// Desafio — Manipulando o DOM

// 1. Selecione e altere o titulo
var titulo = document.getElementById('titulo');
// titulo.textContent = ...

// 2. Selecione todos os itens de lista e exiba no console
var itens = document.querySelectorAll('li');
itens.forEach(function(item) {
  // console.log(...)
});

// 3. Altere o primeiro paragrafo
var paragrafo = document.querySelector('p');
// paragrafo.textContent = ...

// 4. Selecione o elemento com class "destaque"
var destaque = document.querySelector('.destaque');
// destaque.innerHTML = ...$code$);

-- Trilha 3 — Modulo 2: Estilos e Classes (lesson 66)
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(22,
 'Desafio: Tema Claro e Escuro',
 'Implemente um alternador de tema claro/escuro usando classList.',
 'Alta',
 66,
 'javascript',
 'Complete o codigo para criar um alternador de tema: (1) ao clicar no botao, adicione/remova a classe "tema-escuro" do body usando classList.toggle; (2) atualize o texto do botao para "Modo Claro" ou "Modo Escuro" conforme o tema ativo (use classList.contains); (3) salve o tema no localStorage e aplique-o ao carregar a pagina.',
$code$// Desafio — Tema Claro e Escuro
var btn = document.getElementById('btn-tema');
var body = document.body;

// Aplica o tema salvo ao carregar
var temaSalvo = localStorage.getItem('tema');
if (temaSalvo === 'escuro') {
  // aplique a classe tema-escuro
}

btn.addEventListener('click', function() {
  // 1. Alterne a classe tema-escuro no body
  body.classList.toggle('tema-escuro');

  // 2. Atualize o texto do botao
  if (body.classList.contains('tema-escuro')) {
    btn.textContent = 'Modo Claro';
    localStorage.setItem('tema', 'escuro');
  } else {
    btn.textContent = 'Modo Escuro';
    // salve o tema no localStorage
  }
});$code$);

-- Trilha 3 — Modulo 3: Eventos (lesson 69)
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(23,
 'Desafio: Galeria Interativa',
 'Adicione eventos de clique para criar uma galeria interativa.',
 'Media',
 69,
 'javascript',
 'Complete o codigo para: (1) ao clicar em uma .miniatura, exibir a imagem ampliada no elemento #foto-principal alterando seu src e alt; (2) destacar a miniatura clicada adicionando a classe "ativa" e removendo das outras (use querySelectorAll e forEach); (3) ao pressionar Escape, remover a classe "ativa" de todas as miniaturas.',
$code$// Desafio — Galeria Interativa
var fotoPrincipal = document.getElementById('foto-principal');
var miniaturas = document.querySelectorAll('.miniatura');

miniaturas.forEach(function(miniatura) {
  miniatura.addEventListener('click', function() {

    // 1. Exibe a imagem ampliada
    // fotoPrincipal.src = ...
    // fotoPrincipal.alt = ...

    // 2. Destaca a miniatura ativa
    miniaturas.forEach(function(m) {
      m.classList.remove('ativa');
    });
    // miniatura.classList.add(...)
  });
});

// 3. Pressionar Escape remove o destaque
document.addEventListener('keydown', function(e) {
  if (e.key === 'Escape') {
    // remova a classe ativa de todas
  }
});$code$);

-- Trilha 3 — Modulo 4: Criando Elementos (lesson 72)
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(24,
 'Desafio: Lista Dinamica',
 'Crie, adicione e remova itens de uma lista dinamicamente.',
 'Alta',
 72,
 'javascript',
 'Complete a lista dinamica para: (1) ao clicar em "Adicionar", criar um novo <li> com o texto do input e um botao "Remover"; (2) ao clicar em "Remover", remover o <li> correspondente do DOM; (3) limpar o input apos adicionar; (4) nao adicionar se o campo estiver vazio; (5) use createElement, textContent e appendChild.',
$code$// Desafio — Lista Dinamica
var input = document.getElementById('novo-item');
var btnAdicionar = document.getElementById('btn-adicionar');
var lista = document.getElementById('lista');

btnAdicionar.addEventListener('click', function() {
  var texto = input.value.trim();

  // 1. Valida se nao esta vazio
  if (!texto) return;

  // 2. Cria o <li>
  var li = document.createElement('li');
  li.textContent = texto;

  // 3. Cria o botao Remover
  var btnRemover = document.createElement('button');
  btnRemover.textContent = 'Remover';
  btnRemover.addEventListener('click', function() {
    // remova o li do DOM
  });

  // 4. Monta e insere na lista
  li.appendChild(btnRemover);
  lista.appendChild(li);

  // 5. Limpa o input
  // input.value = ...
});$code$);

-- Trilha 3 — Modulo 5: Formularios com JS (lesson 75)
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(25,
 'Desafio: Formulario com Validacao',
 'Valide um formulario de cadastro antes de enviar os dados.',
 'Alta',
 75,
 'javascript',
 'Complete a validacao do formulario: (1) impeca o recarregamento da pagina; (2) valide o nome (minimo 3 caracteres); (3) valide o email (deve conter @); (4) valide a senha (minimo 6 caracteres); (5) exiba mensagens de erro em vermelho abaixo de cada campo incorreto; (6) limpe as mensagens de erro dos campos corretos; (7) exiba "Cadastro realizado!" apenas se tudo for valido.',
$code$// Desafio — Formulario com Validacao
var form = document.getElementById('form-cadastro');

form.addEventListener('submit', function(event) {
  // 1. Impeca o recarregamento
  event.preventDefault();

  var valido = true;

  // 2. Valida nome
  var nome = document.getElementById('nome').value.trim();
  var erroNome = document.getElementById('erro-nome');
  if (nome.length < 3) {
    erroNome.textContent = 'Nome deve ter ao menos 3 caracteres.';
    valido = false;
  } else {
    erroNome.textContent = '';
  }

  // 3. Valide o email
  // var email = ...
  // if (!email.includes('@')) { ... }

  // 4. Valide a senha
  // var senha = ...
  // if (senha.length < 6) { ... }

  // 5. Se tudo valido
  if (valido) {
    document.getElementById('mensagem').textContent = 'Cadastro realizado!';
  }
});$code$);

-- Trilha 3 — Modulo 6: localStorage (lesson 78)
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(26,
 'Desafio: Anotacoes Persistentes',
 'Crie um bloco de anotacoes que salva e recupera dados do localStorage.',
 'Alta',
 78,
 'javascript',
 'Complete o bloco de anotacoes: (1) ao digitar na textarea, salve o texto no localStorage em tempo real (evento input); (2) ao carregar a pagina, recupere e exiba o texto salvo na textarea; (3) ao clicar em "Limpar", remova o item do localStorage e limpe a textarea; (4) exiba quantos caracteres foram digitados abaixo da textarea.',
$code$// Desafio — Anotacoes Persistentes
var textarea = document.getElementById('anotacoes');
var btnLimpar = document.getElementById('btn-limpar');
var contador = document.getElementById('contador-chars');

// 1. Recupera o texto salvo ao carregar
var textoSalvo = localStorage.getItem('anotacoes');
if (textoSalvo !== null) {
  textarea.value = textoSalvo;
}

// 2. Salva em tempo real e atualiza contador
textarea.addEventListener('input', function() {
  localStorage.setItem('anotacoes', textarea.value);
  // contador.textContent = textarea.value.length + ' caracteres';
});

// 3. Limpa tudo
btnLimpar.addEventListener('click', function() {
  // localStorage.removeItem(...)
  // textarea.value = ...
  // contador.textContent = ...
});$code$);

-- Trilha 3 — Modulo 7: Timers (lesson 81)
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(27,
 'Desafio: Cronometro',
 'Implemente um cronometro com start, stop e reset usando timers.',
 'Alta',
 81,
 'javascript',
 'Complete o cronometro: (1) ao clicar em "Iniciar", inicie um setInterval que incrementa os segundos a cada 1000ms e exibe no formato MM:SS; (2) ao clicar em "Parar", use clearInterval para parar o timer; (3) ao clicar em "Resetar", pare o timer, zere os segundos e atualize o display; (4) desabilite o botao Iniciar enquanto o timer estiver rodando.',
$code$// Desafio — Cronometro
var display = document.getElementById('display');
var btnIniciar = document.getElementById('btn-iniciar');
var btnParar = document.getElementById('btn-parar');
var btnResetar = document.getElementById('btn-resetar');

var segundos = 0;
var idTimer = null;

function formatarTempo(s) {
  var minutos = Math.floor(s / 60);
  var segs = s % 60;
  return minutos.toString().padStart(2, '0') + ':' + segs.toString().padStart(2, '0');
}

btnIniciar.addEventListener('click', function() {
  if (idTimer !== null) return; // ja esta rodando
  idTimer = setInterval(function() {
    segundos++;
    display.textContent = formatarTempo(segundos);
  }, 1000);
  btnIniciar.disabled = true;
});

btnParar.addEventListener('click', function() {
  // clearInterval e redefina idTimer como null
});

btnResetar.addEventListener('click', function() {
  // pare, zere e atualize o display
});$code$);

-- Trilha 3 — Modulo 8: Fetch API (lesson 84)
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(28,
 'Desafio: Buscador de Usuarios',
 'Consuma uma API publica para buscar e exibir dados de usuarios.',
 'Alta',
 84,
 'javascript',
 'Complete o buscador: (1) ao clicar em "Buscar", faca um fetch para https://jsonplaceholder.typicode.com/users/{id} onde id e o valor digitado; (2) se response.ok for false, exiba uma mensagem de erro; (3) exiba nome, email e telefone do usuario encontrado; (4) mostre um indicador de carregamento durante o fetch e esconda apos receber a resposta; (5) trate erros de rede no .catch().',
$code$// Desafio — Buscador de Usuarios
var inputId = document.getElementById('input-id');
var btnBuscar = document.getElementById('btn-buscar');
var resultado = document.getElementById('resultado');
var loading = document.getElementById('loading');

btnBuscar.addEventListener('click', function() {
  var id = inputId.value;
  if (!id) return;

  loading.style.display = 'block';
  resultado.innerHTML = '';

  fetch('https://jsonplaceholder.typicode.com/users/' + id)
    .then(function(response) {
      if (!response.ok) {
        throw new Error('Usuario ' + id + ' nao encontrado.');
      }
      return response.json();
    })
    .then(function(usuario) {
      loading.style.display = 'none';
      // exiba nome, email e telefone
      resultado.innerHTML =
        '<p><strong>' + usuario.name + '</strong></p>' +
        '<p>Email: ' + usuario.email + '</p>';
        // adicione o telefone
    })
    .catch(function(erro) {
      loading.style.display = 'none';
      resultado.textContent = 'Erro: ' + erro.message;
    });
});$code$);

-- Trilha 3 — Modulo 9: Async e Await (lesson 87)
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(29,
 'Desafio: Feed de Posts com Async/Await',
 'Reescreva o fetch com async/await e exiba posts de uma API.',
 'Alta',
 87,
 'javascript',
 'Reescreva a funcao carregarPosts usando async/await: (1) declare a funcao como async; (2) use await para esperar o fetch e o response.json(); (3) verifique response.ok e lance um Error se necessario; (4) crie um div para cada post com titulo e corpo; (5) use try/catch/finally para tratar erros e esconder o loading. Busque de https://jsonplaceholder.typicode.com/posts?_limit=5.',
$code$// Desafio — Feed de Posts com Async/Await
var container = document.getElementById('posts');
var loading = document.getElementById('loading');

async function carregarPosts() {
  try {
    loading.style.display = 'block';

    // 1. Faca o fetch com await
    var response = await fetch('https://jsonplaceholder.typicode.com/posts?_limit=5');

    // 2. Verifique response.ok
    if (!response.ok) {
      throw new Error('Erro ' + response.status);
    }

    // 3. Converta para JSON com await
    var posts = await response.json();

    // 4. Crie um card para cada post
    posts.forEach(function(post) {
      var div = document.createElement('div');
      // adicione titulo e corpo
      container.appendChild(div);
    });

  } catch (erro) {
    container.textContent = 'Falha ao carregar: ' + erro.message;
  } finally {
    // 5. Esconda o loading
  }
}

carregarPosts();$code$);

-- Trilha 3 — Modulo 10: Projeto Final (lesson 90)
INSERT INTO tb_kanban_templates (id, title, description, priority, lesson_id, language, challenge_instructions, starter_code) VALUES
(30,
 'Desafio Final: App de Citacoes',
 'Construa um app completo que busca citacoes de uma API e permite favoritar.',
 'Alta',
 90,
 'javascript',
 'Construa um app de citacoes: (1) ao clicar em "Nova Citacao", busque uma citacao aleatoria da API https://dummyjson.com/quotes/random com async/await; (2) exiba o texto e o autor da citacao; (3) ao clicar em "Favoritar", salve a citacao no localStorage (array de favoritos); (4) exiba os favoritos em uma lista; (5) permita remover favoritos individualmente. Use localStorage com JSON.stringify/parse.',
$code$// Desafio Final — App de Citacoes
var textoCitacao = document.getElementById('citacao-texto');
var autorCitacao = document.getElementById('citacao-autor');
var btnNova = document.getElementById('btn-nova');
var btnFavoritar = document.getElementById('btn-favoritar');
var listaFavoritos = document.getElementById('lista-favoritos');

var citacaoAtual = null;
var favoritos = JSON.parse(localStorage.getItem('favoritos') || '[]');

// Exibe os favoritos salvos
function renderizarFavoritos() {
  listaFavoritos.innerHTML = '';
  favoritos.forEach(function(cit, index) {
    var li = document.createElement('li');
    li.textContent = '"' + cit.quote + '" — ' + cit.author;
    var btnRemover = document.createElement('button');
    btnRemover.textContent = 'x';
    btnRemover.addEventListener('click', function() {
      favoritos.splice(index, 1);
      localStorage.setItem('favoritos', JSON.stringify(favoritos));
      renderizarFavoritos();
    });
    li.appendChild(btnRemover);
    listaFavoritos.appendChild(li);
  });
}

renderizarFavoritos();

// Busca nova citacao
btnNova.addEventListener('click', async function() {
  try {
    var response = await fetch('https://dummyjson.com/quotes/random');
    citacaoAtual = await response.json();
    textoCitacao.textContent = '"' + citacaoAtual.quote + '"';
    autorCitacao.textContent = '— ' + citacaoAtual.author;
  } catch (erro) {
    textoCitacao.textContent = 'Erro ao carregar citacao.';
  }
});

// Favorita a citacao atual
btnFavoritar.addEventListener('click', function() {
  if (!citacaoAtual) return;
  favoritos.push(citacaoAtual);
  localStorage.setItem('favoritos', JSON.stringify(favoritos));
  renderizarFavoritos();
});$code$);

-- ════════════════════════════════════════════════════════════════════════════
-- ATUALIZA SEQUENCES
-- ════════════════════════════════════════════════════════════════════════════

SELECT setval('tb_sections_id_seq',         30, true);
SELECT setval('tb_lessons_id_seq',           90, true);
SELECT setval('tb_exercises_id_seq',         90, true);
SELECT setval('tb_kanban_templates_id_seq',  30, true);

