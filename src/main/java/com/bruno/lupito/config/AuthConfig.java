package com.bruno.lupito.config;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.bruno.lupito.repository.UserRepository;

@Service
public class AuthConfig implements UserDetailsService {

	private final UserRepository userRepository;
	
	public AuthConfig(UserRepository userRepository) {
		this.userRepository = userRepository;
	}
	
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		return userRepository.findUserByEmail(username)
				.orElseThrow(() -> new UsernameNotFoundException("Usuarios nao encontrado com username: " + username));
	}

}
