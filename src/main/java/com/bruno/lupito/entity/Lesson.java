package com.bruno.lupito.entity;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "tb_lessons")
public class Lesson {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;
    private String theoryContent;
    private String codeExample;
    private String codeLanguage;
    private Integer listOrder;

    @ManyToOne
    @JoinColumn(name = "section_id")
    private Section section;

    @OneToMany(mappedBy = "lesson", cascade = CascadeType.ALL)
    private List<Exercise> exercises = new ArrayList<>();

    public Lesson() {
    }

    public Lesson(Long id, String title, String theoryContent, Integer listOrder, Section section) {
        this.id = id;
        this.title = title;
        this.theoryContent = theoryContent;
        this.listOrder = listOrder;
        this.section = section;
    }
}
