package com.bruno.lupito.services;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bruno.lupito.dto.UserProgressDTO;
import com.bruno.lupito.entity.Course;
import com.bruno.lupito.entity.User;
import com.bruno.lupito.entity.UserProgress;
import com.bruno.lupito.repository.CourseRepository;
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

        // We assume 3 lessons per section
        if (currentLessonOrder < 3) {
            progress.setCurrentLessonOrder(currentLessonOrder + 1);
        } else {
            progress.setCurrentSectionOrder(currentSectionOrder + 1);
            progress.setCurrentLessonOrder(1);
        }

        progress = userProgressRepository.save(progress);
        return new UserProgressDTO(progress);
    }
}
