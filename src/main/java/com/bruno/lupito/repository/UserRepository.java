package com.bruno.lupito.repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.security.core.userdetails.UserDetails;

import com.bruno.lupito.entity.User;

public interface UserRepository extends JpaRepository<User, Long>{

	Optional<UserDetails> findUserByEmail(String username);

	Optional<User> findByEmail(String email);

	List<User> findByEmailVerifiedFalseAndCreatedAtBefore(LocalDateTime cutoff);

}
