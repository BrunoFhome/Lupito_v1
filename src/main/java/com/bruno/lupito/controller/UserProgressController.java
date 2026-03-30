package com.bruno.lupito.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bruno.lupito.config.JWTUserData;
import com.bruno.lupito.dto.UserProgressDTO;
import com.bruno.lupito.services.UserProgressService;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;

@RestController
@RequestMapping(value = "/api/progress")
@Validated
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
            @RequestParam @NotNull(message = "courseId é obrigatório") Long courseId,
            @RequestParam @Min(value = 1, message = "currentSectionOrder deve ser >= 1") Integer currentSectionOrder,
            @RequestParam @Min(value = 1, message = "currentLessonOrder deve ser >= 1") Integer currentLessonOrder,
            Authentication auth) {
        JWTUserData userData = (JWTUserData) auth.getPrincipal();
        UserProgressDTO dto = service.completeLesson(userData.userId(), courseId, currentSectionOrder, currentLessonOrder);
        return ResponseEntity.ok().body(dto);
    }
}
