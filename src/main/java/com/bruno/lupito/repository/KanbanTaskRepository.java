package com.bruno.lupito.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.bruno.lupito.entity.KanbanTask;
import java.util.List;
import java.util.Optional;

@Repository
public interface KanbanTaskRepository extends JpaRepository<KanbanTask, Long> {
    List<KanbanTask> findByUserId(Long userId);
    boolean existsByUserIdAndLessonId(Long userId, Long lessonId);
    Optional<KanbanTask> findByIdAndUserId(Long id, Long userId);
}
