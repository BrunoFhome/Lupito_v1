package com.bruno.lupito.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bruno.lupito.dto.UserProgressDTO;
import com.bruno.lupito.services.UserProgressService;

@RestController
@RequestMapping(value = "/api/progress")
public class UserProgressController {

    @Autowired
    private UserProgressService service;

    // Ideally, the userId comes from the authenticated Principal (JWT).
    // Passing it as a param for simplicity until security context is fully
    // utilized.
    @GetMapping(value = "/{courseId}")
    public ResponseEntity<UserProgressDTO> getUserProgress(
            @RequestParam Long userId,
            @PathVariable Long courseId) {
        UserProgressDTO dto = service.getUserProgress(userId, courseId);
        return ResponseEntity.ok().body(dto);
    }

    @PostMapping(value = "/complete-lesson")
    public ResponseEntity<UserProgressDTO> completeLesson(
            @RequestParam Long userId,
            @RequestParam Long courseId,
            @RequestParam Integer currentSectionOrder,
            @RequestParam Integer currentLessonOrder) {
        UserProgressDTO dto = service.completeLesson(userId, courseId, currentSectionOrder, currentLessonOrder);
        return ResponseEntity.ok().body(dto);
    }
}
