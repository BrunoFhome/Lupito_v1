package com.bruno.lupito.services;

import java.time.LocalDateTime;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bruno.lupito.controller.exception.RequisicaoInvalidaException;
import com.bruno.lupito.entity.PasswordResetToken;
import com.bruno.lupito.entity.User;
import com.bruno.lupito.repository.PasswordResetTokenRepository;
import com.bruno.lupito.repository.UserRepository;

@Service
public class PasswordResetService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordResetTokenRepository tokenRepository;

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Value("${app.frontend.url:http://localhost:4200}")
    private String frontendUrl;

    @Value("${spring.mail.username}")
    private String fromEmail;

    @Transactional
    public void sendResetEmail(String email) {
        User user = userRepository.findByEmail(email)
                .orElse(null);

        // Não revelar se o email existe ou não (segurança)
        if (user == null) return;

        // Invalidar tokens anteriores do usuário
        tokenRepository.deleteByUserId(user.getId());

        String token = UUID.randomUUID().toString();
        PasswordResetToken resetToken = new PasswordResetToken(
                token, user, LocalDateTime.now().plusHours(1)
        );
        tokenRepository.save(resetToken);

        String resetLink = frontendUrl + "/reset-password?token=" + token;

        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(fromEmail);
        message.setTo(email);
        message.setSubject("Lupito — Recuperação de senha");
        message.setText(
                "Olá, " + user.getName() + "!\n\n" +
                "Recebemos uma solicitação para redefinir sua senha.\n\n" +
                "Clique no link abaixo para criar uma nova senha (válido por 1 hora):\n" +
                resetLink + "\n\n" +
                "Se você não solicitou isso, ignore este email.\n\n" +
                "Equipe Lupito"
        );
        mailSender.send(message);
    }

    @Transactional
    public void resetPassword(String token, String newPassword) {
        PasswordResetToken resetToken = tokenRepository.findByToken(token)
                .orElseThrow(() -> new RequisicaoInvalidaException("Token inválido"));

        if (resetToken.isExpired()) {
            throw new RequisicaoInvalidaException("Token expirado");
        }
        if (resetToken.isUsed()) {
            throw new RequisicaoInvalidaException("Token já utilizado");
        }

        User user = resetToken.getUser();
        user.setPassword(passwordEncoder.encode(newPassword));
        userRepository.save(user);

        resetToken.setUsed(true);
        tokenRepository.save(resetToken);
    }
}
