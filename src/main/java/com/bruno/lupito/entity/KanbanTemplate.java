package com.bruno.lupito.entity;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "tb_kanban_templates")
public class KanbanTemplate {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;
    private String description;
    private String priority;

    @jakarta.persistence.Column(name = "challenge_instructions", columnDefinition = "TEXT")
    private String challengeInstructions;

    @jakarta.persistence.Column(name = "starter_code", columnDefinition = "TEXT")
    private String starterCode;

    @jakarta.persistence.Column(name = "language", length = 20)
    private String language = "javascript";

    @ManyToOne
    @JoinColumn(name = "lesson_id")
    private Lesson lesson;

    public KanbanTemplate() {}

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public String getPriority() { return priority; }
    public void setPriority(String priority) { this.priority = priority; }
    public Lesson getLesson() { return lesson; }
    public void setLesson(Lesson lesson) { this.lesson = lesson; }

    public String getChallengeInstructions() { return challengeInstructions; }
    public void setChallengeInstructions(String challengeInstructions) { this.challengeInstructions = challengeInstructions; }

    public String getStarterCode() { return starterCode; }
    public void setStarterCode(String starterCode) { this.starterCode = starterCode; }

    public String getLanguage() { return language; }
    public void setLanguage(String language) { this.language = language; }
}
