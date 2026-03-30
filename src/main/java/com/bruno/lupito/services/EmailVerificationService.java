package com.bruno.lupito.services;

import java.time.LocalDateTime;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bruno.lupito.controller.exception.RequisicaoInvalidaException;
import com.bruno.lupito.entity.EmailVerificationToken;
import com.bruno.lupito.entity.User;
import com.bruno.lupito.repository.EmailVerificationTokenRepository;
import com.bruno.lupito.repository.UserRepository;

@Service
public class EmailVerificationService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private EmailVerificationTokenRepository tokenRepository;

    @Autowired
    private JavaMailSender mailSender;

    @Value("${app.frontend.url:http://localhost:4200}")
    private String frontendUrl;

    @Value("${spring.mail.username}")
    private String fromEmail;

    @Transactional
    public void sendVerificationEmail(User user) {
        // Invalida tokens anteriores do usuário
        tokenRepository.deleteByUserId(user.getId());

        String token = UUID.randomUUID().toString();
        EmailVerificationToken verificationToken = new EmailVerificationToken(
                token, user, LocalDateTime.now().plusHours(24)
        );
        tokenRepository.save(verificationToken);

        String verificationLink = frontendUrl + "/verify-email?token=" + token;

        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(fromEmail);
        message.setTo(user.getEmail());
        message.setSubject("Lupito — Verifique seu e-mail");
        message.setText(
                "Olá, " + user.getName() + "!\n\n" +
                "Obrigado por se cadastrar na plataforma Lupito.\n\n" +
                "Clique no link abaixo para verificar seu e-mail e ativar sua conta (válido por 24 horas):\n" +
                verificationLink + "\n\n" +
                "Se você não criou uma conta, ignore este e-mail.\n\n" +
                "Equipe Lupito"
        );
        mailSender.send(message);
    }

    @Transactional
    public void verifyEmail(String token) {
        EmailVerificationToken verificationToken = tokenRepository.findByToken(token)
                .orElseThrow(() -> new RequisicaoInvalidaException("Token de verificação inválido."));

        if (verificationToken.isUsed()) {
            throw new RequisicaoInvalidaException("Este link de verificação já foi utilizado.");
        }

        if (verificationToken.isExpired()) {
            throw new RequisicaoInvalidaException("Link de verificação expirado. Solicite um novo.");
        }

        User user = verificationToken.getUser();
        user.setEmailVerified(true);
        userRepository.save(user);

        verificationToken.setUsed(true);
        tokenRepository.save(verificationToken);
    }

    @Transactional
    public void resendVerification(String email) {
        User user = userRepository.findByEmail(email).orElse(null);

        // Não revelar se o e-mail existe
        if (user == null) return;

        if (user.isEmailVerified()) {
            throw new RequisicaoInvalidaException("Este e-mail já foi verificado.");
        }

        sendVerificationEmail(user);
    }
}
