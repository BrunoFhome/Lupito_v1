package com.bruno.lupito.services;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bruno.lupito.dto.CourseDTO;
import com.bruno.lupito.dto.ExerciseDTO;
import com.bruno.lupito.dto.LessonDTO;
import com.bruno.lupito.dto.SectionDTO;
import com.bruno.lupito.entity.Course;
import com.bruno.lupito.entity.Exercise;
import com.bruno.lupito.entity.Lesson;
import com.bruno.lupito.entity.Section;
import com.bruno.lupito.repository.CourseRepository;
import com.bruno.lupito.repository.ExerciseRepository;
import com.bruno.lupito.repository.LessonRepository;
import com.bruno.lupito.repository.SectionRepository;

@Service
public class LearningPathService {

    @Autowired
    private CourseRepository courseRepository;

    @Autowired
    private SectionRepository sectionRepository;

    @Autowired
    private LessonRepository lessonRepository;

    @Autowired
    private ExerciseRepository exerciseRepository;

    @Transactional(readOnly = true)
    public List<CourseDTO> findAllCourses() {
        List<Course> list = courseRepository.findAll();
        return list.stream().map(x -> new CourseDTO(x)).collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public CourseDTO findCourseById(Long id) {
        Course course = courseRepository.findById(id).orElseThrow(() -> new RuntimeException("Course not found"));
        return new CourseDTO(course);
    }

    @Transactional(readOnly = true)
    public List<SectionDTO> findSectionsByCourse(Long courseId) {
        List<Section> list = sectionRepository.findByCourseIdOrderByListOrderAsc(courseId);
        return list.stream().map(x -> new SectionDTO(x)).collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public List<LessonDTO> findLessonsBySection(Long sectionId) {
        List<Lesson> list = lessonRepository.findBySectionIdOrderByListOrderAsc(sectionId);
        return list.stream().map(x -> new LessonDTO(x)).collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public LessonDTO findLessonById(Long lessonId) {
        Lesson lesson = lessonRepository.findById(lessonId)
                .orElseThrow(() -> new RuntimeException("Lesson not found"));
        return new LessonDTO(lesson);
    }

    @Transactional(readOnly = true)
    public List<ExerciseDTO> findExercisesByLesson(Long lessonId) {
        List<Exercise> list = exerciseRepository.findByLessonId(lessonId);
        return list.stream().map(x -> new ExerciseDTO(x)).collect(Collectors.toList());
    }
}
