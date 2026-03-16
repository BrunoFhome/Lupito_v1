package com.bruno.lupito.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.bruno.lupito.entity.KanbanTemplate;
import java.util.Optional;

@Repository
public interface KanbanTemplateRepository extends JpaRepository<KanbanTemplate, Long> {
    Optional<KanbanTemplate> findByLessonId(Long lessonId);
}
