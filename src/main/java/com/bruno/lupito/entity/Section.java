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
@Table(name = "tb_sections")
public class Section {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;
    private Integer listOrder;

    @ManyToOne
    @JoinColumn(name = "course_id")
    private Course course;

    @OneToMany(mappedBy = "section", cascade = CascadeType.ALL)
    private List<Lesson> lessons = new ArrayList<>();

    public Section() {
    }

    public Section(Long id, String title, Integer listOrder, Course course) {
        this.id = id;
        this.title = title;
        this.listOrder = listOrder;
        this.course = course;
    }
}
