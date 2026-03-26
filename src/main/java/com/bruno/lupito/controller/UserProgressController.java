package com.bruno.lupito.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bruno.lupito.config.JWTUserData;
import com.bruno.lupito.dto.UserProgressDTO;
import com.bruno.lupito.services.UserProgressService;

@RestController
@RequestMapping(value = "/api/progress")
public class UserProgressController {

    @Autowired
    private UserProgressService service;

    @GetMapping(value = "/{courseId}")
    public ResponseEntity<UserProgressDTO> getUserProgress(
            @PathVariable Long courseId,
            Authentication auth) {
        JWTUserData userData = (JWTUserData) auth.getPrincipal();
        UserProgressDTO dto = service.getUserProgress(userData.userId(), courseId)
                .orElseGet(() -> new UserProgressDTO(null, userData.userId(), courseId, 1, 1));
        return ResponseEntity.ok(dto);
    }

    @PostMapping(value = "/complete-lesson")
    public ResponseEntity<UserProgressDTO> completeLesson(
            @RequestParam Long courseId,
            @RequestParam Integer currentSectionOrder,
            @RequestParam Integer currentLessonOrder,
            Authentication auth) {
        JWTUserData userData = (JWTUserData) auth.getPrincipal();
        UserProgressDTO dto = service.completeLesson(userData.userId(), courseId, currentSectionOrder, currentLessonOrder);
        return ResponseEntity.ok().body(dto);
    }
}
