package com.bruno.lupito.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import com.bruno.lupito.entity.Lesson;

public interface LessonRepository extends JpaRepository<Lesson, Long> {
    List<Lesson> findBySectionIdOrderByListOrderAsc(Long sectionId);
}
