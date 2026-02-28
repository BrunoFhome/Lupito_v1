package com.bruno.lupito.repository;

import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import com.bruno.lupito.entity.UserProgress;

public interface UserProgressRepository extends JpaRepository<UserProgress, Long> {
    Optional<UserProgress> findByUserIdAndCourseId(Long userId, Long courseId);
}
