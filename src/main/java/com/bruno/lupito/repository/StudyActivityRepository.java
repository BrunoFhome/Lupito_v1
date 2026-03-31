package com.bruno.lupito.repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bruno.lupito.entity.StudyActivity;

public interface StudyActivityRepository extends JpaRepository<StudyActivity, Long> {

    List<StudyActivity> findByUserIdAndStudyDateBetween(Long userId, LocalDate from, LocalDate to);

    Optional<StudyActivity> findByUserIdAndStudyDate(Long userId, LocalDate date);
}
