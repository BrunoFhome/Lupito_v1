package com.bruno.lupito.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bruno.lupito.config.TokenConfig;
import com.bruno.lupito.dto.request.ForgotPasswordRequest;
import com.bruno.lupito.dto.request.LoginRequest;
import com.bruno.lupito.dto.request.RegisterUserRequest;
import com.bruno.lupito.dto.request.ResetPasswordRequest;
import com.bruno.lupito.dto.response.LoginResponse;
import com.bruno.lupito.dto.response.RegisterUserResponse;
import com.bruno.lupito.entity.User;
import com.bruno.lupito.repository.UserRepository;
import com.bruno.lupito.services.EmailVerificationService;
import com.bruno.lupito.services.PasswordResetService;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/auth")
public class AuthController {

	private final UserRepository userRepository;
	private final PasswordEncoder passwordEncoder;
	private final AuthenticationManager authenticationManager;
	private final TokenConfig tokenConfig;
	private final PasswordResetService passwordResetService;
	private final EmailVerificationService emailVerificationService;

	public AuthController(UserRepository userRepository, PasswordEncoder passwordEncoder,
			AuthenticationManager authenticationManager, TokenConfig tokenConfig,
			PasswordResetService passwordResetService, EmailVerificationService emailVerificationService) {
		this.userRepository = userRepository;
		this.passwordEncoder = passwordEncoder;
		this.authenticationManager = authenticationManager;
		this.tokenConfig = tokenConfig;
		this.passwordResetService = passwordResetService;
		this.emailVerificationService = emailVerificationService;
	}
	
	@PostMapping("/login")
	public ResponseEntity<LoginResponse> login(@Valid @RequestBody LoginRequest request){
		
		UsernamePasswordAuthenticationToken userAndPassword = new UsernamePasswordAuthenticationToken(request.email(), request.password());
		Authentication authentication = authenticationManager.authenticate(userAndPassword);
		
		User user = (User) authentication.getPrincipal();
		String token = tokenConfig.generateToken(user);
		return ResponseEntity.ok(new LoginResponse(token));
	}
	
	@PostMapping("/register")
	public ResponseEntity<RegisterUserResponse> register(@Valid @RequestBody RegisterUserRequest request){
		User newUser = new User();
		newUser.setPassword(passwordEncoder.encode(request.password()));
		newUser.setEmail(request.email());
		newUser.setName(request.name());
		newUser.setCity(request.city());
		newUser.setState(request.state());
		newUser.setEmailVerified(false);

		userRepository.save(newUser);
		emailVerificationService.sendVerificationEmail(newUser);

		return ResponseEntity.status(HttpStatus.CREATED).body(new RegisterUserResponse(newUser.getName(), newUser.getEmail()));
	}

	@GetMapping("/verify-email")
	public ResponseEntity<Void> verifyEmail(@RequestParam String token) {
		emailVerificationService.verifyEmail(token);
		return ResponseEntity.ok().build();
	}

	@PostMapping("/resend-verification")
	public ResponseEntity<Void> resendVerification(@RequestBody ForgotPasswordRequest request) {
		emailVerificationService.resendVerification(request.email());
		return ResponseEntity.ok().build();
	}

	@PostMapping("/forgot-password")
	public ResponseEntity<Void> forgotPassword(@Valid @RequestBody ForgotPasswordRequest request) {
		passwordResetService.sendResetEmail(request.email());
		// Sempre retorna 200 para não revelar se o email existe
		return ResponseEntity.ok().build();
	}

	@PostMapping("/reset-password")
	public ResponseEntity<Void> resetPassword(@Valid @RequestBody ResetPasswordRequest request) {
		passwordResetService.resetPassword(request.token(), request.newPassword());
		return ResponseEntity.ok().build();
	}

}
