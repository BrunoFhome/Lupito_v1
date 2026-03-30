package com.bruno.lupito.dto;

import com.bruno.lupito.entity.User;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public class UserDTO {

	private Long id;

	@NotBlank(message = "Nome é obrigatório")
	@Size(min = 2, max = 100, message = "Nome deve ter entre 2 e 100 caracteres")
	private String name;

	@NotBlank(message = "Email é obrigatório")
	@Email(message = "Email inválido")
	private String email;

	private String password;
	private String bio;
        private Integer learningProgress;
        private Integer currentStreak;
        private String city;
        private String state;


	public UserDTO() {
	}


	public UserDTO(Long id, String name, String email, String password, String bio, Integer learningProgress) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.bio = bio;
                this.learningProgress = learningProgress;
	}



	public UserDTO(User entity) {
		id = entity.getId();
		name = entity.getName();
		email = entity.getEmail();
		bio = entity.getBio();
                learningProgress = entity.getLearningProgress();
                currentStreak = entity.getCurrentStreak() != null ? entity.getCurrentStreak() : 0;
                city = entity.getCity();
                state = entity.getState();
	}



	public Long getId() {
		return id;
	}



	public void setId(Long id) {
		this.id = id;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}

	public String getBio() {
		return bio;
	}

	public void setBio(String bio) {
		this.bio = bio;
        }

        public Integer getLearningProgress() {
                return learningProgress;
        }

        public void setLearningProgress(Integer learningProgress) {
                this.learningProgress = learningProgress;
        }

        public Integer getCurrentStreak() {
                return currentStreak;
        }

        public void setCurrentStreak(Integer currentStreak) {
                this.currentStreak = currentStreak;
        }

        public String getCity() {
                return city;
        }

        public void setCity(String city) {
                this.city = city;
        }

        public String getState() {
                return state;
        }

        public void setState(String state) {
                this.state = state;
        }

}
