package com.bruno.lupito.dto;

import java.util.ArrayList;
import java.util.List;
import com.bruno.lupito.entity.Exercise;

public class ExerciseDTO {
    private Long id;
    private String question;
    private List<String> options = new ArrayList<>();
    private Integer correctAnswer;
    private Long lessonId;

    public ExerciseDTO() {
    }

    public ExerciseDTO(Long id, String question, List<String> options, Integer correctAnswer, Long lessonId) {
        this.id = id;
        this.question = question;
        this.options = options;
        this.correctAnswer = correctAnswer;
        this.lessonId = lessonId;
    }

    public ExerciseDTO(Exercise entity) {
        this.id = entity.getId();
        this.question = entity.getQuestion();
        if (entity.getOptions() != null) {
            this.options.addAll(entity.getOptions());
        }
        this.correctAnswer = entity.getCorrectAnswer();
        this.lessonId = entity.getLesson() != null ? entity.getLesson().getId() : null;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public List<String> getOptions() {
        return options;
    }

    public void setOptions(List<String> options) {
        this.options = options;
    }

    public Integer getCorrectAnswer() {
        return correctAnswer;
    }

    public void setCorrectAnswer(Integer correctAnswer) {
        this.correctAnswer = correctAnswer;
    }

    public Long getLessonId() {
        return lessonId;
    }

    public void setLessonId(Long lessonId) {
        this.lessonId = lessonId;
    }
}
