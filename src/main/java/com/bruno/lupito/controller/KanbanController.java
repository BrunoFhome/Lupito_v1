package com.bruno.lupito.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import com.bruno.lupito.config.JWTUserData;
import com.bruno.lupito.dto.KanbanTaskDTO;
import com.bruno.lupito.dto.request.SaveCodeRequest;
import com.bruno.lupito.services.KanbanService;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;

@CrossOrigin(origins = "http://localhost:4200", allowCredentials = "true")
@RestController
@RequestMapping("/api/kanban")
@Validated
public class KanbanController {

    @Autowired
    private KanbanService kanbanService;

    @GetMapping("/tasks")
    public ResponseEntity<List<KanbanTaskDTO>> getTasks(Authentication auth) {
        JWTUserData userData = (JWTUserData) auth.getPrincipal();
        return ResponseEntity.ok(kanbanService.getTasksForUser(userData.userId()));
    }

    @PostMapping("/tasks/unlock/{lessonId}")
    public ResponseEntity<Void> unlockTask(@PathVariable Long lessonId, Authentication auth) {
        JWTUserData userData = (JWTUserData) auth.getPrincipal();
        kanbanService.unlockTaskForLesson(userData.userId(), lessonId);
        return ResponseEntity.ok().build();
    }

    @PutMapping("/tasks/{taskId}/status")
    public ResponseEntity<KanbanTaskDTO> updateTaskStatus(
            @PathVariable Long taskId,
            @RequestParam @NotBlank(message = "O status não pode estar vazio") String status,
            Authentication auth) {
        JWTUserData userData = (JWTUserData) auth.getPrincipal();
        return ResponseEntity.ok(kanbanService.updateTaskStatus(taskId, status, userData.userId()));
    }

    @PutMapping("/tasks/{taskId}/priority")
    public ResponseEntity<KanbanTaskDTO> updateTaskPriority(
            @PathVariable Long taskId,
            @RequestParam @NotBlank(message = "A prioridade não pode estar vazia") String priority,
            Authentication auth) {
        JWTUserData userData = (JWTUserData) auth.getPrincipal();
        return ResponseEntity.ok(kanbanService.updateTaskPriority(taskId, priority, userData.userId()));
    }

    @PutMapping("/tasks/{taskId}/code")
    public ResponseEntity<Void> saveCode(
            @PathVariable Long taskId,
            @Valid @RequestBody SaveCodeRequest body,
            Authentication auth) {
        JWTUserData userData = (JWTUserData) auth.getPrincipal();
        kanbanService.saveUserCode(taskId, body.code(), userData.userId());
        return ResponseEntity.ok().build();
    }
}
