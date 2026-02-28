package com.bruno.lupito.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.bruno.lupito.entity.Course;

public interface CourseRepository extends JpaRepository<Course, Long> {
}
