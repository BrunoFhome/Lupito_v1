# Lupito — Backend

API REST do sistema Lupito, uma plataforma de aprendizado com trilhas interativas, quadro Kanban e workspace de código.

---

## Tecnologias

| Tecnologia | Versão | Finalidade |
|---|---|---|
| Java | 25 | Linguagem principal |
| Spring Boot | 4.0.3 | Framework da aplicação |
| Spring Security | — | Autenticação e autorização |
| Spring Data JPA | — | ORM e acesso ao banco |
| Hibernate | — | Implementação JPA |
| PostgreSQL | — | Banco de dados relacional |
| Flyway | — | Versionamento de migrações do banco |
| JWT (Auth0) | 4.4.0 | Tokens de autenticação stateless |
| Spring Mail | — | Envio de e-mail (reset de senha) |
| Lombok | — | Redução de boilerplate |
| Maven | — | Gerenciador de dependências e build |

---

## Pré-requisitos

- Java 25+
- Maven 3.8+
- PostgreSQL 14+ rodando localmente
- Conta Gmail com **Senha de App** configurada (para envio de e-mail)

---

## Configuração

### 1. Banco de dados

Crie o banco no PostgreSQL:

```sql
CREATE DATABASE lupitov1;
```

O Flyway aplicará as migrações automaticamente na primeira inicialização.

### 2. Variáveis de ambiente

O arquivo principal é `src/main/resources/application.properties`. As credenciais sensíveis devem ficar em `application-local.properties` (ignorado pelo Git):

```properties
# application-local.properties
spring.mail.username=seu-email@gmail.com
spring.mail.password=sua-senha-de-app-gmail
```

> Para gerar uma Senha de App Gmail: `Minha Conta Google → Segurança → Verificação em duas etapas → Senhas de app`

### 3. JWT Secret

Em produção, defina a variável de ambiente `JWT_SECRET` com um segredo forte:

```bash
export JWT_SECRET=sua-chave-secreta-forte-aqui
```

Em desenvolvimento, o valor padrão `lupito-dev-secret-change-in-production` é usado automaticamente.

### 4. Configurações principais (`application.properties`)

```properties
server.port=8081

spring.datasource.url=jdbc:postgresql://localhost:5432/lupitov1
spring.datasource.username=postgres
spring.datasource.password=sua-senha

app.frontend.url=http://localhost:4200
```

---

## Executando

```bash
# Compilar e iniciar
mvn spring-boot:run

# Apenas compilar
mvn clean install
```

A API ficará disponível em: `http://localhost:8081`

---

## Estrutura do Projeto

```
src/main/java/com/bruno/lupito/
├── config/           # Segurança, CORS, JWT, filtros
│   ├── SecurityConfig.java
│   ├── SecurityFilter.java
│   ├── TokenConfig.java
│   ├── AuthConfig.java
│   ├── CorsConfig.java
│   └── JWTUserData.java
│
├── controller/       # Endpoints da API REST
│   ├── AuthController.java
│   ├── UserController.java
│   ├── LearningPathController.java
│   ├── KanbanController.java
│   ├── UserProgressController.java
│   └── GlobalExceptionHandler.java
│
├── services/         # Regras de negócio
│   ├── UserService.java
│   ├── LearningPathService.java
│   ├── KanbanService.java
│   ├── UserProgressService.java
│   └── PasswordResetService.java
│
├── repository/       # Acesso ao banco (Spring Data JPA)
│   ├── UserRepository.java
│   ├── CourseRepository.java
│   ├── SectionRepository.java
│   ├── LessonRepository.java
│   ├── ExerciseRepository.java
│   ├── KanbanTemplateRepository.java
│   ├── KanbanTaskRepository.java
│   ├── UserProgressRepository.java
│   └── PasswordResetTokenRepository.java
│
├── entity/           # Entidades JPA (mapeamento O/R)
│   ├── User.java
│   ├── Course.java
│   ├── Section.java
│   ├── Lesson.java
│   ├── Exercise.java
│   ├── KanbanTemplate.java
│   ├── KanbanTask.java
│   ├── UserProgress.java
│   └── PasswordResetToken.java
│
└── dto/              # Objetos de transferência de dados
    ├── UserDTO.java
    ├── CourseDTO.java
    ├── SectionDTO.java
    ├── LessonDTO.java
    ├── ExerciseDTO.java
    ├── KanbanTaskDTO.java
    ├── UserProgressDTO.java
    ├── request/      # Payloads de entrada
    │   ├── LoginRequest.java
    │   ├── RegisterUserRequest.java
    │   ├── ForgotPasswordRequest.java
    │   └── ResetPasswordRequest.java
    └── response/     # Payloads de saída
        ├── LoginResponse.java
        └── RegisterUserResponse.java
```

---

## Migrações do Banco (Flyway)

As migrações ficam em `src/main/resources/db/migration/`:

| Arquivo | Conteúdo |
|---|---|
| `V1__create_schema.sql` | Criação de todas as tabelas |
| `V2__seed_learning_content.sql` | 2 cursos, 7 seções, 20 lições, 60 exercícios |
| `V3__seed_kanban_templates.sql` | 20 templates de Kanban com desafios de código |

Para recriar o banco do zero, basta dropar o banco, recriar e reiniciar a aplicação.

---

## Principais Endpoints

### Autenticação
| Método | Rota | Descrição |
|---|---|---|
| POST | `/auth/login` | Login — retorna token JWT |
| POST | `/auth/register` | Cadastro de novo usuário |
| POST | `/auth/forgot-password` | Solicita redefinição de senha |
| POST | `/auth/reset-password` | Redefine a senha com token |

### Usuário
| Método | Rota | Descrição |
|---|---|---|
| GET | `/user/profile` | Dados do usuário autenticado |
| PUT | `/user/profile` | Atualiza perfil do usuário |

### Trilha de Aprendizado
| Método | Rota | Descrição |
|---|---|---|
| GET | `/learning/courses` | Lista todos os cursos |
| GET | `/learning/course/{id}` | Detalhes de um curso com seções e lições |
| GET | `/learning/lesson/{id}` | Detalhes de uma lição com exercícios |

### Progresso
| Método | Rota | Descrição |
|---|---|---|
| GET | `/progress/{courseId}` | Progresso do usuário em um curso |
| POST | `/progress/advance` | Avança para a próxima lição |

### Kanban
| Método | Rota | Descrição |
|---|---|---|
| GET | `/kanban/tasks` | Lista tarefas do usuário |
| POST | `/kanban/tasks` | Cria nova tarefa |
| PUT | `/kanban/tasks/{id}` | Atualiza tarefa (status, código, etc.) |
| DELETE | `/kanban/tasks/{id}` | Remove tarefa |

> Todos os endpoints (exceto `/auth/*`) exigem o header `Authorization: Bearer <token>`.

---

## Segurança

- Autenticação **stateless** via JWT — nenhuma sessão é armazenada no servidor
- Senhas armazenadas com hash **BCrypt**
- CORS configurado para aceitar requisições de `http://localhost:4200`
- Reset de senha via token com expiração enviado por e-mail
