package com.bruno.lupito.entity;

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
@Table(name = "tb_user_progress")
public class UserProgress {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "course_id")
    private Course course;

    private Integer currentSectionOrder;
    private Integer currentLessonOrder;

    public UserProgress() {
    }

    public UserProgress(Long id, User user, Course course, Integer currentSectionOrder, Integer currentLessonOrder) {
        this.id = id;
        this.user = user;
        this.course = course;
        this.currentSectionOrder = currentSectionOrder;
        this.currentLessonOrder = currentLessonOrder;
    }
}
