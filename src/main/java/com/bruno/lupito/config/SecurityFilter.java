package com.bruno.lupito.config;

import java.io.IOException;

import org.apache.logging.log4j.util.Strings;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class SecurityFilter extends OncePerRequestFilter{
	
	private final TokenConfig tokenConfig;
	
	public SecurityFilter(TokenConfig tokenConfig) {
		this.tokenConfig = tokenConfig;
	}

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		String authHeader = request.getHeader("Authorization");
		if (Strings.isNotEmpty(authHeader) && authHeader.startsWith("Bearer ")) {
			String token = authHeader.substring("Bearer ".length());
			tokenConfig.validateToken(token).ifPresent(userData ->
				SecurityContextHolder.getContext().setAuthentication(
					new UsernamePasswordAuthenticationToken(userData, null, null)
				)
			);
		}
		filterChain.doFilter(request, response);
	}
}
