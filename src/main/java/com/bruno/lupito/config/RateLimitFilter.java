package com.bruno.lupito.config;

import java.io.IOException;
import java.time.Instant;
import java.util.ArrayDeque;
import java.util.Deque;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Filtro de rate limiting por IP para endpoints sensíveis de autenticação.
 * Usa sliding window em memória — sem dependências externas.
 */
@Component
public class RateLimitFilter extends OncePerRequestFilter {

    private static final Logger log = LoggerFactory.getLogger(RateLimitFilter.class);

    @Value("${app.rate-limit.window-seconds:60}")
    private int windowSeconds;

    @Value("${app.rate-limit.login.max-requests:5}")
    private int loginMax;

    @Value("${app.rate-limit.email.max-requests:3}")
    private int emailMax;

    @Value("${app.rate-limit.register.max-requests:5}")
    private int registerMax;

    // "ip:endpoint" -> timestamps das requisições na janela atual
    private final ConcurrentHashMap<String, Deque<Long>> requestLog = new ConcurrentHashMap<>();

    @Override
    protected boolean shouldNotFilter(HttpServletRequest request) {
        String path = request.getRequestURI();
        String method = request.getMethod();
        return !("POST".equalsIgnoreCase(method) && (
            path.equals("/auth/login") ||
            path.equals("/auth/register") ||
            path.equals("/auth/forgot-password") ||
            path.equals("/auth/resend-verification")
        ));
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response,
                                    FilterChain filterChain) throws ServletException, IOException {

        String ip = resolveClientIp(request);
        String path = request.getRequestURI();
        int limit = resolveLimit(path);

        String key = ip + ":" + path;
        long now = Instant.now().toEpochMilli();
        long windowMs = windowSeconds * 1000L;

        Deque<Long> timestamps = requestLog.computeIfAbsent(key, k -> new ArrayDeque<>());

        int count;
        synchronized (timestamps) {
            // Remove entradas fora da janela
            while (!timestamps.isEmpty() && now - timestamps.peekFirst() > windowMs) {
                timestamps.pollFirst();
            }
            count = timestamps.size();
            if (count < limit) {
                timestamps.addLast(now);
            }
        }

        if (count >= limit) {
            log.warn("Rate limit atingido: ip={} endpoint={} count={}", ip, path, count);
            response.setStatus(HttpStatus.TOO_MANY_REQUESTS.value());
            response.setContentType(MediaType.APPLICATION_JSON_VALUE);
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(
                "{\"status\":429,\"erro\":\"Muitas requisições\",\"mensagem\":\"Limite de tentativas atingido. Aguarde " + windowSeconds + " segundos e tente novamente.\",\"timestamp\":\"" + Instant.now() + "\"}"
            );
            return;
        }

        filterChain.doFilter(request, response);
    }

    private int resolveLimit(String path) {
        return switch (path) {
            case "/auth/login"    -> loginMax;
            case "/auth/register" -> registerMax;
            default               -> emailMax;  // forgot-password, resend-verification
        };
    }

    private String resolveClientIp(HttpServletRequest request) {
        // Suporte a proxy reverso (Nginx, load balancer)
        String forwarded = request.getHeader("X-Forwarded-For");
        if (forwarded != null && !forwarded.isBlank()) {
            return forwarded.split(",")[0].trim();
        }
        return request.getRemoteAddr();
    }

    /**
     * Remove entradas expiradas do mapa a cada 5 minutos para evitar acúmulo de memória.
     */
    @Scheduled(fixedRate = 300_000)
    public void limparEntradasExpiradas() {
        long agora = Instant.now().toEpochMilli();
        long windowMs = windowSeconds * 1000L;
        int removidas = 0;

        for (Map.Entry<String, Deque<Long>> entry : requestLog.entrySet()) {
            Deque<Long> deque = entry.getValue();
            synchronized (deque) {
                while (!deque.isEmpty() && agora - deque.peekFirst() > windowMs) {
                    deque.pollFirst();
                }
                if (deque.isEmpty()) {
                    requestLog.remove(entry.getKey());
                    removidas++;
                }
            }
        }

        if (removidas > 0) {
            log.debug("Rate limit: {} entradas expiradas removidas do cache.", removidas);
        }
    }
}
