package com.bruno.lupito.services;

import java.time.LocalDateTime;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bruno.lupito.entity.User;
import com.bruno.lupito.repository.EmailVerificationTokenRepository;
import com.bruno.lupito.repository.UserRepository;

@Service
public class UserCleanupService {

    private static final Logger log = LoggerFactory.getLogger(UserCleanupService.class);

    private final UserRepository userRepository;
    private final EmailVerificationTokenRepository emailVerificationTokenRepository;

    @Value("${app.cleanup.unverified-user-expiry-days:7}")
    private int expiryDays;

    public UserCleanupService(UserRepository userRepository,
                              EmailVerificationTokenRepository emailVerificationTokenRepository) {
        this.userRepository = userRepository;
        this.emailVerificationTokenRepository = emailVerificationTokenRepository;
    }

    @Scheduled(cron = "0 0 2 * * *")
    @Transactional
    public void deleteUnverifiedUsers() {
        LocalDateTime cutoff = LocalDateTime.now().minusDays(expiryDays);
        List<User> expired = userRepository.findByEmailVerifiedFalseAndCreatedAtBefore(cutoff);

        for (User user : expired) {
            emailVerificationTokenRepository.deleteByUserId(user.getId());
            userRepository.delete(user);
            log.info("Usuário não verificado deletado: {} (criado em {})", user.getEmail(), user.getCreatedAt());
        }

        if (!expired.isEmpty()) {
            log.info("Limpeza concluída: {} usuário(s) não verificado(s) removido(s).", expired.size());
        }
    }
}
