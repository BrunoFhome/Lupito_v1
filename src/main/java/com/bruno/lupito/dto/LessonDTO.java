package com.bruno.lupito.dto;

import com.bruno.lupito.entity.Lesson;

public class LessonDTO {
    private Long id;
    private String title;
    private String theoryContent;
    private String codeExample;
    private String codeLanguage;
    private Integer listOrder;
    private Long sectionId;

    public LessonDTO() {
    }

    public LessonDTO(Long id, String title, String theoryContent, Integer listOrder, Long sectionId) {
        this.id = id;
        this.title = title;
        this.theoryContent = theoryContent;
        this.listOrder = listOrder;
        this.sectionId = sectionId;
    }

    public LessonDTO(Lesson entity) {
        this.id = entity.getId();
        this.title = entity.getTitle();
        this.theoryContent = entity.getTheoryContent();
        this.codeExample = entity.getCodeExample();
        this.codeLanguage = entity.getCodeLanguage();
        this.listOrder = entity.getListOrder();
        this.sectionId = entity.getSection() != null ? entity.getSection().getId() : null;
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

    public String getTheoryContent() {
        return theoryContent;
    }

    public void setTheoryContent(String theoryContent) {
        this.theoryContent = theoryContent;
    }

    public String getCodeExample() {
        return codeExample;
    }

    public void setCodeExample(String codeExample) {
        this.codeExample = codeExample;
    }

    public String getCodeLanguage() {
        return codeLanguage;
    }

    public void setCodeLanguage(String codeLanguage) {
        this.codeLanguage = codeLanguage;
    }

    public Integer getListOrder() {
        return listOrder;
    }

    public void setListOrder(Integer listOrder) {
        this.listOrder = listOrder;
    }

    public Long getSectionId() {
        return sectionId;
    }

    public void setSectionId(Long sectionId) {
        this.sectionId = sectionId;
    }
}
