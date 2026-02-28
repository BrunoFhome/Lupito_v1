package com.bruno.lupito.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import com.bruno.lupito.entity.Section;

public interface SectionRepository extends JpaRepository<Section, Long> {
    List<Section> findByCourseIdOrderByListOrderAsc(Long courseId);
}
