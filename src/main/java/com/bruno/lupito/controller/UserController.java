package com.bruno.lupito.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.CrossOrigin;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.bruno.lupito.config.JWTUserData;
import com.bruno.lupito.controller.exception.AcessoNegadoException;
import com.bruno.lupito.dto.ActivityDayDTO;
import com.bruno.lupito.dto.UserDTO;
import com.bruno.lupito.services.UserService;
import jakarta.validation.Valid;

@RestController
@CrossOrigin(origins = "http://localhost:4200")
@RequestMapping("/users")
public class UserController {

	@Autowired
	UserService service;

	private Long getAuthenticatedUserId() {
		JWTUserData userData = (JWTUserData) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return userData.userId();
	}

	private void verificarPropriedade(Long id) {
		if (!id.equals(getAuthenticatedUserId())) {
			throw new AcessoNegadoException("Você não tem permissão para acessar os dados deste usuário.");
		}
	}

	@GetMapping(value = "/{id}")
	public ResponseEntity<UserDTO> findById(@PathVariable Long id) {
		verificarPropriedade(id);
		UserDTO dto = service.findById(id);
		return ResponseEntity.ok(dto);
	}

	@PutMapping(value = "/{id}")
	public ResponseEntity<UserDTO> update(@PathVariable Long id, @Valid @RequestBody UserDTO dto) {
		verificarPropriedade(id);
		dto = service.update(dto, id);
		return ResponseEntity.ok(dto);
	}

	@DeleteMapping(value = "/{id}")
	public ResponseEntity<Void> delete(@PathVariable Long id) {
		verificarPropriedade(id);
		service.delete(id);
		return ResponseEntity.noContent().build();
	}

	@GetMapping(value = "/{id}/activity")
	public ResponseEntity<List<ActivityDayDTO>> getActivity(
			@PathVariable Long id,
			@RequestParam(defaultValue = "30") int days) {
		verificarPropriedade(id);
		return ResponseEntity.ok(service.getActivity(id, days));
	}

}