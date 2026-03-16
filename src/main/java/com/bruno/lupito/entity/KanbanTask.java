package com.bruno.lupito.entity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "tb_kanban_tasks")
public class KanbanTask {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;
    private String description;
    private String priority;
    private String assignee;
    private String status;

    @Column(name = "challenge_instructions", columnDefinition = "TEXT")
    private String challengeInstructions;

    @Column(name = "starter_code", columnDefinition = "TEXT")
    private String starterCode;

    @Column(name = "user_code", columnDefinition = "TEXT")
    private String userCode;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "lesson_id")
    private Lesson lesson;

    public KanbanTask() {}

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

    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }

    public Lesson getLesson() { return lesson; }
    public void setLesson(Lesson lesson) { this.lesson = lesson; }

    public String getChallengeInstructions() { return challengeInstructions; }
    public void setChallengeInstructions(String challengeInstructions) { this.challengeInstructions = challengeInstructions; }

    public String getStarterCode() { return starterCode; }
    public void setStarterCode(String starterCode) { this.starterCode = starterCode; }

    public String getUserCode() { return userCode; }
    public void setUserCode(String userCode) { this.userCode = userCode; }
}
