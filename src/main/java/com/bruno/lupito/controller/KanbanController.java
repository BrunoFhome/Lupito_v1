package com.bruno.lupito.controller;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import com.bruno.lupito.config.JWTUserData;
import com.bruno.lupito.dto.KanbanTaskDTO;
import com.bruno.lupito.services.KanbanService;

@CrossOrigin(origins = "http://localhost:4200", allowCredentials = "true")
@RestController
@RequestMapping("/api/kanban")
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
    public ResponseEntity<KanbanTaskDTO> updateTaskStatus(@PathVariable Long taskId, @RequestParam String status, Authentication auth) {
        JWTUserData userData = (JWTUserData) auth.getPrincipal();
        return ResponseEntity.ok(kanbanService.updateTaskStatus(taskId, status, userData.userId()));
    }

    @PutMapping("/tasks/{taskId}/code")
    public ResponseEntity<Void> saveCode(@PathVariable Long taskId, @RequestBody Map<String, String> body, Authentication auth) {
        JWTUserData userData = (JWTUserData) auth.getPrincipal();
        kanbanService.saveUserCode(taskId, body.get("code"), userData.userId());
        return ResponseEntity.ok().build();
    }
}
