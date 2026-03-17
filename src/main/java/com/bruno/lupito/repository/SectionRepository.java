package com.bruno.lupito.repository;

import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import com.bruno.lupito.entity.Section;

public interface SectionRepository extends JpaRepository<Section, Long> {
    List<Section> findByCourseIdOrderByListOrderAsc(Long courseId);
    Optional<Section> findByCourseIdAndListOrder(Long courseId, Integer listOrder);
}
