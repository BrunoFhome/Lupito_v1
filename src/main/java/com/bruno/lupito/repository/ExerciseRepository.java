package com.bruno.lupito.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import com.bruno.lupito.entity.Exercise;

public interface ExerciseRepository extends JpaRepository<Exercise, Long> {
    List<Exercise> findByLessonId(Long lessonId);
}
