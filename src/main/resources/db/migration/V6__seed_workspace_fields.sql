-- ================================================
-- Trilha 1: Lógica de Programação (Python)
-- ================================================

-- Lição 1: Introdução
UPDATE tb_kanban_templates SET
    challenge_instructions = 'Bem-vindo ao seu primeiro desafio de programação!

Objetivo:
- Exiba a mensagem "Olá, mundo!" no console.
- Em seguida, exiba o seu nome usando a função print().

Exemplo de saída esperada:
  Olá, mundo!
  Meu nome é Ana',
    starter_code = '# Desafio: Introdução à programação
# Exiba "Olá, mundo!" e depois o seu nome

print("Olá, mundo!")
# Escreva a próxima linha aqui
'
WHERE lesson_id = 1;

-- Lição 2: Variáveis
UPDATE tb_kanban_templates SET
    challenge_instructions = 'Desafio: Variáveis

Objetivo:
- Crie uma variável chamada "nome" com o seu nome.
- Crie uma variável chamada "idade" com a sua idade.
- Exiba as duas variáveis usando print().

Exemplo de saída esperada:
  Nome: Ana
  Idade: 20',
    starter_code = '# Desafio: Variáveis
# Crie as variáveis e exiba seus valores

nome = "Ana"
idade = 20

print("Nome:", nome)
# Complete o restante abaixo
'
WHERE lesson_id = 2;

-- Lição 3: Tipos de Dados
UPDATE tb_kanban_templates SET
    challenge_instructions = 'Desafio: Tipos de Dados

Objetivo:
- Crie uma variável de cada tipo: int, float, str e bool.
- Exiba o tipo de cada variável usando a função type().

Exemplo de saída esperada:
  <class ''int''>
  <class ''float''>
  <class ''str''>
  <class ''bool''>',
    starter_code = '# Desafio: Tipos de Dados
# Crie uma variável de cada tipo

numero_inteiro = 10
numero_decimal = 3.14
texto = "Programação"
verdadeiro = True

print(type(numero_inteiro))
# Continue exibindo os outros tipos
'
WHERE lesson_id = 3;

-- Lição 4: Condicionais
UPDATE tb_kanban_templates SET
    challenge_instructions = 'Desafio: Condicionais

Objetivo:
- Crie uma variável "nota" com um valor entre 0 e 10.
- Use if/elif/else para verificar:
  * nota >= 7: "Aprovado"
  * nota >= 5: "Recuperação"
  * caso contrário: "Reprovado"

Exemplo de saída esperada (nota = 8):
  Aprovado',
    starter_code = '# Desafio: Condicionais
# Verifique a situação do aluno com base na nota

nota = 8

if nota >= 7:
    print("Aprovado")
# Complete com elif e else
'
WHERE lesson_id = 4;

-- Lição 5: Laços
UPDATE tb_kanban_templates SET
    challenge_instructions = 'Desafio: Laços de Repetição

Objetivo:
- Use um laço for para exibir os números de 1 a 5.
- Em seguida, use um laço while para fazer a contagem regressiva de 5 até 1.

Exemplo de saída esperada:
  1 2 3 4 5
  5 4 3 2 1',
    starter_code = '# Desafio: Laços de Repetição

# Laço for: números de 1 a 5
for i in range(1, 6):
    print(i, end=" ")

print()  # quebra de linha

# Laço while: contagem regressiva
contador = 5
# Complete o laço while aqui
'
WHERE lesson_id = 5;

-- Lição 6: Funções
UPDATE tb_kanban_templates SET
    challenge_instructions = 'Desafio: Funções

Objetivo:
- Crie uma função chamada "saudacao" que receba um nome como parâmetro.
- A função deve retornar a mensagem "Olá, [nome]!".
- Chame a função e exiba o resultado.

Exemplo de saída esperada:
  Olá, Carlos!',
    starter_code = '# Desafio: Funções
# Crie e chame a função saudacao

def saudacao(nome):
    # Complete a função
    pass

resultado = saudacao("Carlos")
print(resultado)
'
WHERE lesson_id = 6;

-- Lição 7: Arrays (Listas)
UPDATE tb_kanban_templates SET
    challenge_instructions = 'Desafio: Listas (Arrays)

Objetivo:
- Crie uma lista com 5 frutas.
- Exiba a lista completa.
- Adicione uma nova fruta à lista.
- Exiba o total de itens na lista.

Exemplo de saída esperada:
  [''maçã'', ''banana'', ''laranja'', ''uva'', ''pera'']
  Após adicionar: 6 frutas',
    starter_code = '# Desafio: Listas
# Crie e manipule uma lista de frutas

frutas = ["maçã", "banana", "laranja", "uva", "pera"]
print(frutas)

# Adicione "manga" à lista
frutas.append("manga")

# Exiba o total de frutas
print("Após adicionar:", len(frutas), "frutas")
'
WHERE lesson_id = 7;

-- Lição 8: Objetos (Dicionários)
UPDATE tb_kanban_templates SET
    challenge_instructions = 'Desafio: Dicionários (Objetos)

Objetivo:
- Crie um dicionário chamado "pessoa" com as chaves: nome, idade, cidade.
- Exiba cada valor separadamente.
- Adicione uma nova chave "profissao" ao dicionário.

Exemplo de saída esperada:
  Nome: João
  Idade: 25
  Cidade: São Paulo
  Profissão: Desenvolvedor',
    starter_code = '# Desafio: Dicionários
# Crie e manipule um dicionário

pessoa = {
    "nome": "João",
    "idade": 25,
    "cidade": "São Paulo"
}

print("Nome:", pessoa["nome"])
# Continue exibindo os outros campos

# Adicione a chave "profissao"
'
WHERE lesson_id = 8;

-- Lição 9: Eventos (Simulação com input/funções)
UPDATE tb_kanban_templates SET
    challenge_instructions = 'Desafio: Simulando Eventos

Objetivo:
- Crie uma função "ao_clicar" que exibe "Botão clicado!".
- Crie uma função "ao_passar_mouse" que exibe "Mouse sobre o elemento!".
- Chame as duas funções para simular os eventos.

Exemplo de saída esperada:
  Botão clicado!
  Mouse sobre o elemento!',
    starter_code = '# Desafio: Simulando Eventos com Funções

def ao_clicar():
    print("Botão clicado!")

def ao_passar_mouse():
    # Complete a função
    pass

# Chame as funções para simular os eventos
ao_clicar()
ao_passar_mouse()
'
WHERE lesson_id = 9;

-- Lição 10: Projeto Final (Lógica)
UPDATE tb_kanban_templates SET
    challenge_instructions = 'Desafio: Mini Projeto - Calculadora

Objetivo:
- Crie uma função "calcular" que receba dois números e uma operação (+, -, *, /).
- A função deve retornar o resultado da operação.
- Teste com pelo menos 3 operações diferentes.

Exemplo de saída esperada:
  10 + 5 = 15
  10 - 5 = 5
  10 * 5 = 50',
    starter_code = '# Desafio: Mini Projeto - Calculadora

def calcular(a, b, operacao):
    if operacao == "+":
        return a + b
    elif operacao == "-":
        return a - b
    # Complete com * e /

# Teste a calculadora
print("10 + 5 =", calcular(10, 5, "+"))
print("10 - 5 =", calcular(10, 5, "-"))
# Adicione mais testes
'
WHERE lesson_id = 10;

-- ================================================
-- Trilha 2: Desenvolvimento Web Básico (HTML/CSS/JS)
-- ================================================

-- Lição 11: HTML Básico
UPDATE tb_kanban_templates SET
    challenge_instructions = 'Desafio: HTML Básico

Objetivo:
- Crie a estrutura básica de uma página HTML.
- Adicione um título na aba do navegador (<title>).
- Adicione um cabeçalho (<h1>) com seu nome.
- Adicione um parágrafo (<p>) de apresentação.

Dica: Toda página HTML começa com <!DOCTYPE html>',
    starter_code = '<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Minha Primeira Página</title>
</head>
<body>
    <h1>Olá, eu sou Ana!</h1>
    <!-- Adicione um parágrafo de apresentação abaixo -->

</body>
</html>
'
WHERE lesson_id = 11;

-- Lição 12: Tags Textuais
UPDATE tb_kanban_templates SET
    challenge_instructions = 'Desafio: Tags Textuais

Objetivo:
- Use as tags de formatação de texto:
  * <strong> para texto em negrito
  * <em> para texto em itálico
  * <u> para texto sublinhado
  * <br> para quebra de linha
- Crie um parágrafo usando pelo menos 3 dessas tags.',
    starter_code = '<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Tags Textuais</title>
</head>
<body>
    <p>
        Este texto está em <strong>negrito</strong>.<br>
        <!-- Adicione texto em itálico e sublinhado -->
    </p>
</body>
</html>
'
WHERE lesson_id = 12;

-- Lição 13: Estruturação
UPDATE tb_kanban_templates SET
    challenge_instructions = 'Desafio: Estruturação HTML

Objetivo:
- Crie uma página com a estrutura semântica correta:
  * <header> com um título
  * <nav> com 3 links de navegação
  * <main> com um parágrafo de conteúdo
  * <footer> com seu nome

Dica: Use tags semânticas para melhorar a acessibilidade.',
    starter_code = '<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Estrutura Semântica</title>
</head>
<body>
    <header>
        <h1>Meu Site</h1>
    </header>
    <nav>
        <!-- Adicione 3 links de navegação com <a> -->
    </nav>
    <main>
        <!-- Adicione um parágrafo de conteúdo -->
    </main>
    <footer>
        <!-- Adicione seu nome -->
    </footer>
</body>
</html>
'
WHERE lesson_id = 13;

-- Lição 14: CSS Básico
UPDATE tb_kanban_templates SET
    challenge_instructions = 'Desafio: CSS Básico

Objetivo:
- Estilize um parágrafo usando CSS interno (<style>):
  * Cor do texto: azul
  * Tamanho da fonte: 18px
  * Alinhamento: centralizado
  * Cor de fundo da página: #f0f0f0',
    starter_code = '<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>CSS Básico</title>
    <style>
        body {
            background-color: #f0f0f0;
        }
        p {
            color: blue;
            /* Adicione font-size e text-align */
        }
    </style>
</head>
<body>
    <p>Este parágrafo está estilizado com CSS!</p>
</body>
</html>
'
WHERE lesson_id = 14;

-- Lição 15: Box Model
UPDATE tb_kanban_templates SET
    challenge_instructions = 'Desafio: Box Model

Objetivo:
- Crie uma <div> e estilize-a usando o Box Model:
  * width: 200px, height: 100px
  * padding: 20px
  * border: 2px solid #333
  * margin: 30px auto (para centralizar)
  * background-color: #4CAF50 com color: white

Observe como cada propriedade afeta o espaço do elemento.',
    starter_code = '<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Box Model</title>
    <style>
        .caixa {
            width: 200px;
            height: 100px;
            background-color: #4CAF50;
            color: white;
            /* Adicione padding, border e margin */
        }
    </style>
</head>
<body>
    <div class="caixa">Eu sou uma caixa!</div>
</body>
</html>
'
WHERE lesson_id = 15;

-- Lição 16: Flexbox
UPDATE tb_kanban_templates SET
    challenge_instructions = 'Desafio: Flexbox

Objetivo:
- Crie um container com 3 caixas coloridas usando Flexbox:
  * Container: display flex, justify-content center, gap 10px
  * Cada caixa: 80px x 80px com cor diferente
  * As caixas devem ficar alinhadas horizontalmente no centro.',
    starter_code = '<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Flexbox</title>
    <style>
        .container {
            display: flex;
            justify-content: center;
            gap: 10px;
            padding: 20px;
        }
        .caixa {
            width: 80px;
            height: 80px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="caixa" style="background-color: #e74c3c;"></div>
        <!-- Adicione mais 2 caixas com cores diferentes -->
    </div>
</body>
</html>
'
WHERE lesson_id = 16;

-- Lição 17: Grid
UPDATE tb_kanban_templates SET
    challenge_instructions = 'Desafio: CSS Grid

Objetivo:
- Crie um layout de grade com 3 colunas e 2 linhas:
  * Container: display grid, 3 colunas iguais (1fr each), gap 10px
  * Preencha com 6 células numeradas de 1 a 6
  * Cada célula com background #3498db, cor branca e padding 20px.',
    starter_code = '<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>CSS Grid</title>
    <style>
        .grid {
            display: grid;
            grid-template-columns: 1fr 1fr 1fr;
            gap: 10px;
            padding: 20px;
        }
        .celula {
            background-color: #3498db;
            color: white;
            padding: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="grid">
        <div class="celula">1</div>
        <div class="celula">2</div>
        <!-- Adicione as células 3, 4, 5 e 6 -->
    </div>
</body>
</html>
'
WHERE lesson_id = 17;

-- Lição 18: JS na Web
UPDATE tb_kanban_templates SET
    challenge_instructions = 'Desafio: JavaScript na Web

Objetivo:
- Crie um botão que, ao ser clicado, exiba um alerta com "Olá, JavaScript!".
- Em seguida, adicione um segundo botão que mude a cor do título para vermelho.

Dica: Use document.getElementById() para selecionar elementos.',
    starter_code = '<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>JS na Web</title>
</head>
<body>
    <h1 id="titulo">Título da Página</h1>
    <button onclick="mostrarAlerta()">Clique aqui</button>
    <button onclick="mudarCor()">Mudar cor do título</button>

    <script>
        function mostrarAlerta() {
            alert("Olá, JavaScript!");
        }

        function mudarCor() {
            // Selecione o elemento com id "titulo" e mude sua cor para vermelho
        }
    </script>
</body>
</html>
'
WHERE lesson_id = 18;

-- Lição 19: Manipulação DOM
UPDATE tb_kanban_templates SET
    challenge_instructions = 'Desafio: Manipulação do DOM

Objetivo:
- Crie uma lista (<ul>) com 3 itens.
- Adicione um botão "Adicionar Item" que insere um novo <li> na lista via JavaScript.
- Adicione um botão "Limpar Lista" que remove todos os itens.

Dica: Use document.createElement() e appendChild().',
    starter_code = '<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Manipulação DOM</title>
</head>
<body>
    <ul id="minha-lista">
        <li>Item 1</li>
        <li>Item 2</li>
        <li>Item 3</li>
    </ul>
    <button onclick="adicionarItem()">Adicionar Item</button>
    <button onclick="limparLista()">Limpar Lista</button>

    <script>
        let contador = 4;

        function adicionarItem() {
            const lista = document.getElementById("minha-lista");
            const novoItem = document.createElement("li");
            novoItem.textContent = "Item " + contador;
            lista.appendChild(novoItem);
            contador++;
        }

        function limparLista() {
            // Complete: remova todos os filhos da lista
        }
    </script>
</body>
</html>
'
WHERE lesson_id = 19;

-- Lição 20: Projeto Final Web
UPDATE tb_kanban_templates SET
    challenge_instructions = 'Desafio: Projeto Final - Cartão de Perfil

Objetivo:
- Crie um cartão de perfil completo usando HTML, CSS e JavaScript:
  * Um cartão centralizado na tela (use Flexbox no body)
  * Foto/avatar representado por um círculo colorido com iniciais
  * Nome, profissão e uma breve bio
  * Um botão "Seguir" que ao ser clicado muda o texto para "Seguindo ✓"
  * Estilo visual agradável com sombra e bordas arredondadas

Este é o projeto final da trilha de Desenvolvimento Web Básico!',
    starter_code = '<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Projeto Final - Cartão de Perfil</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: #f0f2f5;
            font-family: Arial, sans-serif;
        }
        .cartao {
            background: white;
            border-radius: 12px;
            padding: 30px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            width: 280px;
        }
        .avatar {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            background-color: #3498db;
            color: white;
            font-size: 2rem;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 15px;
        }
        .btn-seguir {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 10px 30px;
            border-radius: 20px;
            cursor: pointer;
            font-size: 1rem;
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <div class="cartao">
        <div class="avatar">AN</div>
        <h2>Ana Silva</h2>
        <p style="color: #666;">Desenvolvedora Front-end</p>
        <p>Apaixonada por criar interfaces bonitas e acessíveis.</p>
        <button class="btn-seguir" id="btn" onclick="seguir()">Seguir</button>
    </div>

    <script>
        function seguir() {
            const btn = document.getElementById("btn");
            btn.textContent = "Seguindo ✓";
            btn.style.backgroundColor = "#2ecc71";
            btn.disabled = true;
        }
    </script>
</body>
</html>
'
WHERE lesson_id = 20;
