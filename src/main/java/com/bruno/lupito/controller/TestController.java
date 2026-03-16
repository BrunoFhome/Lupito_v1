package com.bruno.lupito.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.beans.factory.annotation.Autowired;
import com.bruno.lupito.repository.KanbanTemplateRepository;
import java.util.List;

@RestController
public class TestController {
    @Autowired
    KanbanTemplateRepository repo;

    @GetMapping("/test-templates")
    public List<?> get() {
        return repo.findAll();
    }
}
