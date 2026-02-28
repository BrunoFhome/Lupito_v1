package com.bruno.lupito.services;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bruno.lupito.entity.Course;
import com.bruno.lupito.entity.Exercise;
import com.bruno.lupito.entity.Lesson;
import com.bruno.lupito.entity.Section;
import com.bruno.lupito.repository.CourseRepository;

@Service
public class DatabaseSeederService implements CommandLineRunner {

    @Autowired
    private CourseRepository courseRepository;

    @Override
    @Transactional
    public void run(String... args) throws Exception {
        if (courseRepository.count() == 0) {
            seedDatabase();
        }
    }

    private void seedDatabase() {
        // Course 1
        Course course1 = new Course(null, "Programing logic with JavaScript",
                "Learn the fundamentals of programming logic using JS.");
        seedSectionsForCourse(course1);

        // Course 2
        Course course2 = new Course(null, "HTML CSS and Javascript",
                "Master frontend web development with HTML, CSS, and JS.");
        seedSectionsForCourse(course2);

        courseRepository.saveAll(Arrays.asList(course1, course2));
        System.out.println("Database seeded with Learning Path initial data.");
    }

    private void seedSectionsForCourse(Course course) {
        for (int s = 1; s <= 8; s++) {
            Section section = new Section(null, "Section " + s + " - " + course.getTitle(), s, course);
            seedLessonsForSection(section);
            course.getSections().add(section);
        }
    }

    private void seedLessonsForSection(Section section) {
        for (int l = 1; l <= 3; l++) {
            Lesson lesson = new Lesson(null, "Lesson " + l + " - " + section.getTitle(),
                    "This is the theory content for lesson " + l + ".", l, section);
            seedExerciseForLesson(lesson);
            section.getLessons().add(lesson);
        }
    }

    private void seedExerciseForLesson(Lesson lesson) {
        List<String> options = Arrays.asList("Option A", "Option B", "Option C", "Option D");
        Exercise exercise = new Exercise(null, "What is the correct answer for " + lesson.getTitle() + "?", options, 0,
                lesson);
        lesson.getExercises().add(exercise);
    }
}
