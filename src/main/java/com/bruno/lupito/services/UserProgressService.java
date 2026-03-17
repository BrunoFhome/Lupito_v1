package com.bruno.lupito.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bruno.lupito.dto.UserProgressDTO;
import com.bruno.lupito.entity.Course;
import com.bruno.lupito.entity.Lesson;
import com.bruno.lupito.entity.Section;
import com.bruno.lupito.entity.User;
import com.bruno.lupito.entity.UserProgress;
import com.bruno.lupito.repository.CourseRepository;
import com.bruno.lupito.repository.LessonRepository;
import com.bruno.lupito.repository.SectionRepository;
import com.bruno.lupito.repository.UserProgressRepository;
import com.bruno.lupito.repository.UserRepository;

import java.util.NoSuchElementException;

@Service
public class UserProgressService {

    @Autowired
    private UserProgressRepository userProgressRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private CourseRepository courseRepository;

    @Autowired
    private SectionRepository sectionRepository;

    @Autowired
    private LessonRepository lessonRepository;

    @Transactional
    public Optional<UserProgressDTO> getUserProgress(Long userId, Long courseId) {
        return userProgressRepository.findByUserIdAndCourseId(userId, courseId)
                .map(UserProgressDTO::new);
    }

    @Transactional
    public UserProgressDTO completeLesson(Long userId, Long courseId, Integer currentSectionOrder,
            Integer currentLessonOrder) {

        UserProgress progress = userProgressRepository.findByUserIdAndCourseId(userId, courseId)
                .orElseGet(() -> {
                    User user = userRepository.findById(userId)
                            .orElseThrow(() -> new NoSuchElementException("User not found"));
                    Course course = courseRepository.findById(courseId)
                            .orElseThrow(() -> new NoSuchElementException("Course not found"));
                    return userProgressRepository.save(new UserProgress(null, user, course, 1, 1));
                });

        // Find the current section to get the real lesson count
        Section currentSection = sectionRepository
                .findByCourseIdAndListOrder(courseId, currentSectionOrder)
                .orElseThrow(() -> new NoSuchElementException("Section not found"));

        List<Lesson> lessonsInSection = lessonRepository.findBySectionIdOrderByListOrderAsc(currentSection.getId());
        int maxLessonOrder = lessonsInSection.stream()
                .mapToInt(Lesson::getListOrder)
                .max()
                .orElse(1);

        if (currentLessonOrder < maxLessonOrder) {
            // Advance to next lesson in the same section
            progress.setCurrentLessonOrder(currentLessonOrder + 1);
        } else {
            // Advance to the next section, reset lesson to first
            List<Section> sections = sectionRepository.findByCourseIdOrderByListOrderAsc(courseId);
            int maxSectionOrder = sections.stream()
                    .mapToInt(Section::getListOrder)
                    .max()
                    .orElse(1);

            if (currentSectionOrder < maxSectionOrder) {
                progress.setCurrentSectionOrder(currentSectionOrder + 1);
                progress.setCurrentLessonOrder(1);
            } else {
                // Last lesson of last section: advance past the end to signal full completion.
                // Frontend check is "listOrder < currentLessonOrder", so maxLessonOrder + 1
                // causes all lessons in this section to be marked as completed.
                progress.setCurrentLessonOrder(maxLessonOrder + 1);
            }
        }

        progress = userProgressRepository.save(progress);
        return new UserProgressDTO(progress);
    }
}
