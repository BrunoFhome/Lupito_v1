package com.bruno.lupito.config;

import java.time.Instant;
import java.util.Optional;

import org.springframework.stereotype.Component;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.bruno.lupito.entity.User;

@Component
public class TokenConfig {

	private String secret = "secret";
	
	
	public String generateToken(User user) {
		
		try {
			Algorithm algorithm = Algorithm.HMAC256(secret);
			
			return JWT.create()
					.withIssuer("Lupito")
					.withClaim("userId", user.getId())
					.withSubject(user.getName()) // Using Name as Subject might differ from Email used elsewhere? Usually Subject is username/email
					// Wait, let's keep it consistent. Start with Email as Subject if that's what we want.
					// Original code: .withSubject(user.getEmail())
					.withSubject(user.getEmail())
					.withExpiresAt(Instant.now().plusSeconds(86400))
					.withIssuedAt(Instant.now())
					.sign(algorithm);
		} catch (Exception e) {
			throw new RuntimeException("Error while authenticating");
		}
	}


	public Optional<JWTUserData> validateToken(String token) {
		
		try {

			Algorithm algorithm = Algorithm.HMAC256(secret);
			
			DecodedJWT decode = JWT.require(algorithm)
					.withIssuer("Lupito")
					.build().verify(token);
			
			return Optional.of(JWTUserData.builder()
					.userId(decode.getClaim("userId").asLong())
					.email(decode.getSubject())
					.build());
			
		} catch (JWTVerificationException e) {
			// e.printStackTrace(); // Helpful for debugging
			return Optional.empty();
		}
		
	}
		
}
