package com.bruno.lupito.services;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bruno.lupito.controller.exception.RecursoNaoEncontradoException;
import com.bruno.lupito.dto.ActivityDayDTO;
import com.bruno.lupito.dto.UserDTO;
import com.bruno.lupito.entity.StudyActivity;
import com.bruno.lupito.entity.User;
import com.bruno.lupito.repository.StudyActivityRepository;
import com.bruno.lupito.repository.UserRepository;

import jakarta.persistence.EntityNotFoundException;

@Service
public class UserService {
	
	@Autowired
	UserRepository repository;

	@Autowired
	StudyActivityRepository studyActivityRepository;
	
	@Transactional(readOnly = true)
	public UserDTO findById(Long id) {
		User user = repository.findById(id).orElseThrow(() -> new RecursoNaoEncontradoException("Usuário não encontrado"));
		return new UserDTO(user);
	}
	
	@Transactional
	public UserDTO update(UserDTO dto, Long id) {
		
		try {
			User entity = repository.getReferenceById(id);
			copyDtoToEntity(dto, entity);
			entity = repository.save(entity);
			return new UserDTO(entity);
		} catch (EntityNotFoundException e) {
			throw new RecursoNaoEncontradoException("Usuário não encontrado");
		}
		
		
	}
	
	@Transactional
	public void delete(Long id) {
		if (!repository.existsById(id)) {
			throw new RecursoNaoEncontradoException("Usuário não encontrado");
		}
			repository.deleteById(id);
	}
	

	@Transactional(readOnly = true)
	public List<ActivityDayDTO> getActivity(Long userId, int days) {
		LocalDate end   = LocalDate.now();
		LocalDate start = end.minusDays(days - 1);

		Map<LocalDate, Integer> map = studyActivityRepository
			.findByUserIdAndStudyDateBetween(userId, start, end)
			.stream()
			.collect(Collectors.toMap(StudyActivity::getStudyDate, StudyActivity::getLessonsDone));

		return start.datesUntil(end.plusDays(1))
			.map(date -> new ActivityDayDTO(date.toString(), map.getOrDefault(date, 0)))
			.collect(Collectors.toList());
	}

	private void copyDtoToEntity(UserDTO dto, User user) {
		user.setName(dto.getName());
		user.setEmail(dto.getEmail());
		user.setBio(dto.getBio());
		user.setCity(dto.getCity());
		user.setState(dto.getState());
		user.setGithubUrl(dto.getGithubUrl());
		user.setLinkedinUrl(dto.getLinkedinUrl());
                if (dto.getLearningProgress() != null) {
                        user.setLearningProgress(dto.getLearningProgress());
                } else if (user.getLearningProgress() == null) {
                        user.setLearningProgress(0);
                }
	}

}
