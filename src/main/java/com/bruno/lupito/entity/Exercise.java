package com.bruno.lupito.entity;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.CollectionTable;
import jakarta.persistence.Column;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "tb_exercises")
public class Exercise {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String question;

    @Column(name = "type", length = 30)
    private String type = "multiple-choice";

    @ElementCollection
    @CollectionTable(name = "tb_exercises_options", joinColumns = @JoinColumn(name = "exercise_id"))
    @Column(name = "options")
    private List<String> options = new ArrayList<>();

    private Integer correctAnswer;

    @ManyToOne
    @JoinColumn(name = "lesson_id")
    private Lesson lesson;

    public Exercise() {
    }

    public Exercise(Long id, String question, List<String> options, Integer correctAnswer, Lesson lesson) {
        this.id = id;
        this.question = question;
        this.options = options;
        this.correctAnswer = correctAnswer;
        this.lesson = lesson;
    }
}
