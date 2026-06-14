package com.bruno.lupito.controller.exception;

import java.util.stream.Collectors;

import org.springframework.dao.DataIntegrityViolationException;

import jakarta.validation.ConstraintViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.web.HttpMediaTypeNotSupportedException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;

@RestControllerAdvice
public class GlobalExceptionHandler {

    //  Exceções de domínio personalizadas 

    @ExceptionHandler(RecursoNaoEncontradoException.class)
    public ResponseEntity<ErroResposta> handleRecursoNaoEncontrado(RecursoNaoEncontradoException ex) {
        return ResponseEntity.status(HttpStatus.NOT_FOUND)
                .body(new ErroResposta(404, "Recurso não encontrado", ex.getMessage()));
    }

    @ExceptionHandler(AcessoNegadoException.class)
    public ResponseEntity<ErroResposta> handleAcessoNegado(AcessoNegadoException ex) {
        return ResponseEntity.status(HttpStatus.FORBIDDEN)
                .body(new ErroResposta(403, "Acesso negado", ex.getMessage()));
    }

    @ExceptionHandler(RequisicaoInvalidaException.class)
    public ResponseEntity<ErroResposta> handleRequisicaoInvalida(RequisicaoInvalidaException ex) {
        return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                .body(new ErroResposta(400, "Requisição inválida", ex.getMessage()));
    }

    @ExceptionHandler(ConflitoDeDadosException.class)
    public ResponseEntity<ErroResposta> handleConflito(ConflitoDeDadosException ex) {
        return ResponseEntity.status(HttpStatus.CONFLICT)
                .body(new ErroResposta(409, "Conflito de dados", ex.getMessage()));
    }

    @ExceptionHandler(TokenInvalidoException.class)
    public ResponseEntity<ErroResposta> handleTokenInvalido(TokenInvalidoException ex) {
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                .body(new ErroResposta(401, "Token inválido", ex.getMessage()));
    }

    //  Autenticação e autorização (Spring Security)

    @ExceptionHandler({ BadCredentialsException.class, InternalAuthenticationServiceException.class })
    public ResponseEntity<ErroResposta> handleCredenciaisInvalidas(RuntimeException ex) {
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                .body(new ErroResposta(401, "Não autorizado", "E-mail ou senha incorretos."));
    }

    @ExceptionHandler(DisabledException.class)
    public ResponseEntity<ErroResposta> handleContaDesativada(DisabledException ex) {
        return ResponseEntity.status(HttpStatus.FORBIDDEN)
                .body(new ErroResposta(403, "E-mail não verificado",
                        "Verifique seu e-mail para ativar sua conta."));
    }

    @ExceptionHandler(AuthenticationException.class)
    public ResponseEntity<ErroResposta> handleAutenticacao(AuthenticationException ex) {
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                .body(new ErroResposta(401, "Não autenticado", "Sessão expirada ou token inválido. Faça login novamente."));
    }

    @ExceptionHandler(AccessDeniedException.class)
    public ResponseEntity<ErroResposta> handleAcessoNegadoSpringSecurity(AccessDeniedException ex) {
        return ResponseEntity.status(HttpStatus.FORBIDDEN)
                .body(new ErroResposta(403, "Acesso negado", "Você não tem permissão para realizar esta ação."));
    }

    // Validação de campos (@Valid / @Validated)

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<ErroResposta> handleValidacaoCampos(MethodArgumentNotValidException ex) {
        String campos = ex.getBindingResult().getFieldErrors().stream()
                .map(err -> err.getField() + ": " + err.getDefaultMessage())
                .collect(Collectors.joining("; "));
        return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                .body(new ErroResposta(400, "Dados inválidos", campos));
    }

    @ExceptionHandler(ConstraintViolationException.class)
    public ResponseEntity<ErroResposta> handleConstraintViolation(ConstraintViolationException ex) {
        String campos = ex.getConstraintViolations().stream()
                .map(cv -> {
                    String path = cv.getPropertyPath().toString();
                    String param = path.contains(".") ? path.substring(path.lastIndexOf('.') + 1) : path;
                    return param + ": " + cv.getMessage();
                })
                .collect(Collectors.joining("; "));
        return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                .body(new ErroResposta(400, "Dados inválidos", campos));
    }

    @ExceptionHandler(MissingServletRequestParameterException.class)
    public ResponseEntity<ErroResposta> handleParametroAusente(MissingServletRequestParameterException ex) {
        return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                .body(new ErroResposta(400, "Parâmetro ausente",
                        "O parâmetro '" + ex.getParameterName() + "' é obrigatório."));
    }

    @ExceptionHandler(MethodArgumentTypeMismatchException.class)
    public ResponseEntity<ErroResposta> handleTipoInvalido(MethodArgumentTypeMismatchException ex) {
        String tipo = ex.getRequiredType() != null ? ex.getRequiredType().getSimpleName() : "desconhecido";
        return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                .body(new ErroResposta(400, "Tipo de parâmetro inválido",
                        "Valor inválido para '" + ex.getName() + "'. Tipo esperado: " + tipo + "."));
    }

    // Erros de protocolo HTTP 

    @ExceptionHandler(HttpMessageNotReadableException.class)
    public ResponseEntity<ErroResposta> handleCorpoInvalido(HttpMessageNotReadableException ex) {
        return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                .body(new ErroResposta(400, "Corpo da requisição inválido",
                        "O corpo da requisição está ausente ou com formato inválido."));
    }

    @ExceptionHandler(HttpRequestMethodNotSupportedException.class)
    public ResponseEntity<ErroResposta> handleMetodoNaoSuportado(HttpRequestMethodNotSupportedException ex) {
        return ResponseEntity.status(HttpStatus.METHOD_NOT_ALLOWED)
                .body(new ErroResposta(405, "Método não suportado",
                        "O método '" + ex.getMethod() + "' não é suportado para esta rota."));
    }

    @ExceptionHandler(HttpMediaTypeNotSupportedException.class)
    public ResponseEntity<ErroResposta> handleTipoMidiaInvalido(HttpMediaTypeNotSupportedException ex) {
        return ResponseEntity.status(HttpStatus.UNSUPPORTED_MEDIA_TYPE)
                .body(new ErroResposta(415, "Tipo de conteúdo não suportado",
                        "Use 'application/json' no cabeçalho Content-Type."));
    }

    // Erros de banco de dados

    @ExceptionHandler(DataIntegrityViolationException.class)
    public ResponseEntity<ErroResposta> handleViolacaoIntegridade(DataIntegrityViolationException ex) {
        String mensagem = "Este registro já existe ou viola uma restrição de dados.";
        if (ex.getMessage() != null && ex.getMessage().contains("email")) {
            mensagem = "Este e-mail já está cadastrado.";
        }
        return ResponseEntity.status(HttpStatus.CONFLICT)
                .body(new ErroResposta(409, "Conflito de dados", mensagem));
    }

    // Fallback genérico

    @ExceptionHandler(Exception.class)
    public ResponseEntity<ErroResposta> handleErroGenerico(Exception ex) {
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body(new ErroResposta(500, "Erro interno do servidor",
                        "Ocorreu um erro inesperado. Tente novamente mais tarde."));
    }
}
