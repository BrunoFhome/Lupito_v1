package com.bruno.lupito.dto;

import com.bruno.lupito.entity.UserProgress;

public class UserProgressDTO {
    private Long id;
    private Long userId;
    private Long courseId;
    private Integer currentSectionOrder;
    private Integer currentLessonOrder;

    public UserProgressDTO() {
    }

    public UserProgressDTO(Long id, Long userId, Long courseId, Integer currentSectionOrder,
            Integer currentLessonOrder) {
        this.id = id;
        this.userId = userId;
        this.courseId = courseId;
        this.currentSectionOrder = currentSectionOrder;
        this.currentLessonOrder = currentLessonOrder;
    }

    public UserProgressDTO(UserProgress entity) {
        this.id = entity.getId();
        this.userId = entity.getUser() != null ? entity.getUser().getId() : null;
        this.courseId = entity.getCourse() != null ? entity.getCourse().getId() : null;
        this.currentSectionOrder = entity.getCurrentSectionOrder();
        this.currentLessonOrder = entity.getCurrentLessonOrder();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getCourseId() {
        return courseId;
    }

    public void setCourseId(Long courseId) {
        this.courseId = courseId;
    }

    public Integer getCurrentSectionOrder() {
        return currentSectionOrder;
    }

    public void setCurrentSectionOrder(Integer currentSectionOrder) {
        this.currentSectionOrder = currentSectionOrder;
    }

    public Integer getCurrentLessonOrder() {
        return currentLessonOrder;
    }

    public void setCurrentLessonOrder(Integer currentLessonOrder) {
        this.currentLessonOrder = currentLessonOrder;
    }
}
