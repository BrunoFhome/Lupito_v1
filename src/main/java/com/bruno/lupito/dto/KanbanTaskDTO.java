package com.bruno.lupito.dto;

import com.bruno.lupito.entity.KanbanTask;

public class KanbanTaskDTO {
    private Long id;
    private String title;
    private String description;
    private String priority;
    private String assignee;
    private String status;
    private String challengeInstructions;
    private String starterCode;
    private String userCode;
    private String language;

    public KanbanTaskDTO() {}

    public KanbanTaskDTO(KanbanTask entity) {
        this.id = entity.getId();
        this.title = entity.getTitle();
        this.description = entity.getDescription();
        this.priority = entity.getPriority();
        this.assignee = entity.getAssignee();
        this.status = entity.getStatus();
        this.challengeInstructions = entity.getChallengeInstructions();
        this.starterCode = entity.getStarterCode();
        this.userCode = entity.getUserCode();
        this.language = entity.getLanguage();
    }

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getPriority() { return priority; }
    public void setPriority(String priority) { this.priority = priority; }

    public String getAssignee() { return assignee; }
    public void setAssignee(String assignee) { this.assignee = assignee; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getChallengeInstructions() { return challengeInstructions; }
    public void setChallengeInstructions(String challengeInstructions) { this.challengeInstructions = challengeInstructions; }

    public String getStarterCode() { return starterCode; }
    public void setStarterCode(String starterCode) { this.starterCode = starterCode; }

    public String getUserCode() { return userCode; }
    public void setUserCode(String userCode) { this.userCode = userCode; }

    public String getLanguage() { return language; }
    public void setLanguage(String language) { this.language = language; }
}
