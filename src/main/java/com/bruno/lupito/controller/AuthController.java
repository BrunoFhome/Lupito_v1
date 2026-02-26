package com.bruno.lupito.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bruno.lupito.config.TokenConfig;
import com.bruno.lupito.dto.request.LoginRequest;
import com.bruno.lupito.dto.request.RegisterUserRequest;
import com.bruno.lupito.dto.response.LoginResponse;
import com.bruno.lupito.dto.response.RegisterUserResponse;
import com.bruno.lupito.entity.User;
import com.bruno.lupito.repository.UserRepository;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/auth")
public class AuthController {

	private final UserRepository userRepository;
	private final PasswordEncoder passwordEncoder;
	private final AuthenticationManager authenticationManager;
	private final TokenConfig tokenConfig;
	
	public AuthController(UserRepository userRepository, PasswordEncoder passwordEncoder, AuthenticationManager authenticationManager, TokenConfig tokenConfig) {
		this.userRepository = userRepository;
		this.passwordEncoder = passwordEncoder;
		this.authenticationManager = authenticationManager;
		this.tokenConfig = tokenConfig;
	}
	
	@PostMapping("/login")
	public ResponseEntity<LoginResponse> login(@Valid @RequestBody LoginRequest request){
		
		UsernamePasswordAuthenticationToken userAndPassword = new UsernamePasswordAuthenticationToken(request.email(), request.password());
		Authentication authentication = authenticationManager.authenticate(userAndPassword);
		
		User user = (User) authentication.getPrincipal();
		String token = tokenConfig.generateToken(user);
		return ResponseEntity.ok(new LoginResponse(token));
	}
	
	public ResponseEntity<RegisterUserResponse> register(@Valid @RequestBody RegisterUserRequest request){
		User newUser = new User();
		newUser.setPassword(passwordEncoder.encode(request.password()));
		newUser.setEmail(request.email());
		newUser.setName(request.name());
		
		userRepository.save(newUser);
		
		return ResponseEntity.status(HttpStatus.CREATED).body(new RegisterUserResponse(newUser.getName(), newUser.getEmail()));
	}
	
}
