package com.bruno.lupito.services;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bruno.lupito.dto.UserProgressDTO;
import com.bruno.lupito.entity.Course;
import com.bruno.lupito.entity.Lesson;
import com.bruno.lupito.entity.Section;
import com.bruno.lupito.entity.StudyActivity;
import com.bruno.lupito.entity.User;
import com.bruno.lupito.entity.UserProgress;
import com.bruno.lupito.repository.CourseRepository;
import com.bruno.lupito.repository.LessonRepository;
import com.bruno.lupito.repository.SectionRepository;
import com.bruno.lupito.repository.StudyActivityRepository;
import com.bruno.lupito.repository.UserProgressRepository;
import com.bruno.lupito.controller.exception.RecursoNaoEncontradoException;
import com.bruno.lupito.repository.UserRepository;

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

    @Autowired
    private StudyActivityRepository studyActivityRepository;

    @Transactional
    public Optional<UserProgressDTO> getUserProgress(Long userId, Long courseId) {
        return userProgressRepository.findByUserIdAndCourseId(userId, courseId)
                .map(UserProgressDTO::new);
    }

    @Transactional
    public UserProgressDTO completeLesson(Long userId, Long courseId, Integer currentSectionOrder,
            Integer currentLessonOrder) {

        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RecursoNaoEncontradoException("Usuário não encontrado"));

        UserProgress progress = userProgressRepository.findByUserIdAndCourseId(userId, courseId)
                .orElseGet(() -> {
                    Course course = courseRepository.findById(courseId)
                            .orElseThrow(() -> new RecursoNaoEncontradoException("Curso não encontrado"));
                    return userProgressRepository.save(new UserProgress(null, user, course, 1, 1));
                });

        // Find the current section to get the real lesson count
        Section currentSection = sectionRepository
                .findByCourseIdAndListOrder(courseId, currentSectionOrder)
                .orElseThrow(() -> new RecursoNaoEncontradoException("Seção não encontrada"));

        List<Lesson> lessonsInSection = lessonRepository.findBySectionIdOrderByListOrderAsc(currentSection.getId());
        int maxLessonOrder = lessonsInSection.stream()
                .mapToInt(Lesson::getListOrder)
                .max()
                .orElse(1);

        if (currentLessonOrder < maxLessonOrder) {
            // avança para a próxima aula dentro da mesma seção
            progress.setCurrentLessonOrder(currentLessonOrder + 1);
        } else {
            // avança para a próxima seção
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

        // Update streak for the user
        updateStreak(user);

        return new UserProgressDTO(progress);
    }

    private void updateStreak(User user) {
        LocalDate today = LocalDate.now();
        LocalDate lastStudy = user.getLastStudyDate();

        if (lastStudy == null) {
            user.setCurrentStreak(1);
        } else if (lastStudy.isEqual(today)) {
            // Already studied today — no change
        } else if (lastStudy.isEqual(today.minusDays(1))) {
            user.setCurrentStreak((user.getCurrentStreak() != null ? user.getCurrentStreak() : 0) + 1);
        } else {
            user.setCurrentStreak(1);
        }

        user.setLastStudyDate(today);
        userRepository.save(user);

        // Registra ou incrementa atividade do dia
        studyActivityRepository.findByUserIdAndStudyDate(user.getId(), today)
            .ifPresentOrElse(
                activity -> {
                    activity.setLessonsDone(activity.getLessonsDone() + 1);
                    studyActivityRepository.save(activity);
                },
                () -> {
                    StudyActivity newActivity = new StudyActivity();
                    newActivity.setUser(user);
                    newActivity.setStudyDate(today);
                    newActivity.setLessonsDone(1);
                    studyActivityRepository.save(newActivity);
                }
            );
    }
}
