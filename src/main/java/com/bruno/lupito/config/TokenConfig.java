package com.bruno.lupito.config;

import java.time.Instant;

import org.springframework.stereotype.Component;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.bruno.lupito.entity.User;

@Component
public class TokenConfig {

	private String secret = "secret";
	
	
	public String generateToken(User user) {
		
		Algorithm algorithm = Algorithm.HMAC256(secret);
		
		return JWT.create()
				.withClaim("userId", user.getId())
				.withSubject(user.getEmail())
				.withExpiresAt(Instant.now().plusSeconds(86400))
				.withIssuedAt(Instant.now())
				.sign(algorithm);

	}
		
}
