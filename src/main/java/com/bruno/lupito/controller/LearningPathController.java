package com.bruno.lupito.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bruno.lupito.dto.CourseDTO;
import com.bruno.lupito.dto.ExerciseDTO;
import com.bruno.lupito.dto.LessonDTO;
import com.bruno.lupito.dto.SectionDTO;
import com.bruno.lupito.services.LearningPathService;

@RestController
@RequestMapping(value = "/api/learning-path")
public class LearningPathController {

    @Autowired
    private LearningPathService service;

    @GetMapping(value = "/courses")
    public ResponseEntity<List<CourseDTO>> findAllCourses() {
        List<CourseDTO> list = service.findAllCourses();
        return ResponseEntity.ok().body(list);
    }

    @GetMapping(value = "/courses/{id}")
    public ResponseEntity<CourseDTO> findCourseById(@PathVariable Long id) {
        CourseDTO dto = service.findCourseById(id);
        return ResponseEntity.ok().body(dto);
    }

    @GetMapping(value = "/courses/{courseId}/sections")
    public ResponseEntity<List<SectionDTO>> findSectionsByCourse(@PathVariable Long courseId) {
        List<SectionDTO> list = service.findSectionsByCourse(courseId);
        return ResponseEntity.ok().body(list);
    }

    @GetMapping(value = "/sections/{sectionId}/lessons")
    public ResponseEntity<List<LessonDTO>> findLessonsBySection(@PathVariable Long sectionId) {
        List<LessonDTO> list = service.findLessonsBySection(sectionId);
        return ResponseEntity.ok().body(list);
    }

    @GetMapping(value = "/lessons/{lessonId}/exercises")
    public ResponseEntity<List<ExerciseDTO>> findExercisesByLesson(@PathVariable Long lessonId) {
        List<ExerciseDTO> list = service.findExercisesByLesson(lessonId);
        return ResponseEntity.ok().body(list);
    }
}
