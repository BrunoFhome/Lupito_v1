package com.bruno.lupito.dto;

import com.bruno.lupito.entity.Section;

public class SectionDTO {
    private Long id;
    private String title;
    private Integer listOrder;
    private Long courseId;

    public SectionDTO() {
    }

    public SectionDTO(Long id, String title, Integer listOrder, Long courseId) {
        this.id = id;
        this.title = title;
        this.listOrder = listOrder;
        this.courseId = courseId;
    }

    public SectionDTO(Section entity) {
        this.id = entity.getId();
        this.title = entity.getTitle();
        this.listOrder = entity.getListOrder();
        this.courseId = entity.getCourse() != null ? entity.getCourse().getId() : null;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getListOrder() {
        return listOrder;
    }

    public void setListOrder(Integer listOrder) {
        this.listOrder = listOrder;
    }

    public Long getCourseId() {
        return courseId;
    }

    public void setCourseId(Long courseId) {
        this.courseId = courseId;
    }
}
