package com.bruno.lupito.services;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bruno.lupito.dto.KanbanTaskDTO;
import com.bruno.lupito.entity.KanbanTask;
import com.bruno.lupito.entity.KanbanTemplate;
import com.bruno.lupito.entity.User;
import com.bruno.lupito.controller.exception.AcessoNegadoException;
import com.bruno.lupito.controller.exception.RecursoNaoEncontradoException;
import com.bruno.lupito.repository.KanbanTaskRepository;
import com.bruno.lupito.repository.KanbanTemplateRepository;
import com.bruno.lupito.repository.UserRepository;

@Service
public class KanbanService {

    @Autowired
    private KanbanTaskRepository taskRepository;

    @Autowired
    private KanbanTemplateRepository templateRepository;

    @Autowired
    private UserRepository userRepository;

    @Transactional
    public void syncTasksForUser(User user) {
        Integer progress = user.getLearningProgress() != null ? user.getLearningProgress() : 0;
        
        List<KanbanTemplate> templates = templateRepository.findAll();
        for (KanbanTemplate template : templates) {
            Long lessonId = template.getLesson().getId();
            if (lessonId <= progress) {
                if (!taskRepository.existsByUserIdAndLessonId(user.getId(), lessonId)) {
                    KanbanTask newTask = new KanbanTask();
                    newTask.setUser(user);
                    newTask.setLesson(template.getLesson());
                    newTask.setTitle(template.getTitle());
                    newTask.setDescription(template.getDescription());
                    newTask.setPriority(template.getPriority());
                    newTask.setAssignee("Você");
                    newTask.setStatus("todo");
                    newTask.setChallengeInstructions(template.getChallengeInstructions());
                    newTask.setStarterCode(template.getStarterCode());
                    newTask.setLanguage(template.getLanguage() != null ? template.getLanguage() : "javascript");
                    newTask.setExpectedOutput(template.getExpectedOutput());
                    taskRepository.save(newTask);
                } else if (template.getExpectedOutput() != null) {
                    // Propaga expectedOutput para tarefas existentes que ainda não têm o campo preenchido
                    taskRepository.findByUserIdAndLessonId(user.getId(), lessonId).ifPresent(existing -> {
                        if (existing.getExpectedOutput() == null) {
                            existing.setExpectedOutput(template.getExpectedOutput());
                            taskRepository.save(existing);
                        }
                    });
                }
            }
        }
    }

    @Transactional
    public List<KanbanTaskDTO> getTasksForUser(Long userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RecursoNaoEncontradoException("Usuário não encontrado"));
        syncTasksForUser(user);
 
        return taskRepository.findByUserId(userId).stream()
                .map(KanbanTaskDTO::new)
                .collect(Collectors.toList());
    }

    @Transactional
    public void unlockTaskForLesson(Long userId, Long lessonId) {
        
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RecursoNaoEncontradoException("Usuário não encontrado"));
        syncTasksForUser(user);
    }

    @Transactional
    public KanbanTaskDTO updateTaskStatus(Long taskId, String newStatus, Long userId) {
        KanbanTask task = taskRepository.findById(taskId)
                .orElseThrow(() -> new RecursoNaoEncontradoException("Tarefa não encontrada"));
        if (!task.getUser().getId().equals(userId)) {
            throw new AcessoNegadoException("Você não tem permissão para alterar esta tarefa");
        }
        task.setStatus(newStatus);
        task = taskRepository.save(task);
        return new KanbanTaskDTO(task);
    }

    @Transactional
    public KanbanTaskDTO updateTaskPriority(Long taskId, String newPriority, Long userId) {
        KanbanTask task = taskRepository.findById(taskId)
                .orElseThrow(() -> new RecursoNaoEncontradoException("Tarefa não encontrada"));
        if (!task.getUser().getId().equals(userId)) {
            throw new AcessoNegadoException("Você não tem permissão para alterar esta tarefa");
        }
        task.setPriority(newPriority);
        task = taskRepository.save(task);
        return new KanbanTaskDTO(task);
    }

    @Transactional
    public void saveUserCode(Long taskId, String code, Long userId) {
        KanbanTask task = taskRepository.findByIdAndUserId(taskId, userId)
                .orElseThrow(() -> new RecursoNaoEncontradoException("Tarefa não encontrada ou acesso não permitido"));
        task.setUserCode(code);
        taskRepository.save(task);
    }
}

