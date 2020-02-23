package com.jmu.demo.controller;

import com.jmu.demo.entity.Class;
import com.jmu.demo.entity.Student;
import com.jmu.demo.service.ClassService;
import com.jmu.demo.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class StudentController {
    @Autowired
    private StudentService studentService;
    @Autowired
    private ClassService classService;

    @GetMapping("/findAll")
    public @ResponseBody List<Student> findAll(){
        List<Student> list = studentService.findAll();
        return list;
    }

    @PostMapping("/distribute")
    public String distribute(String classType, @RequestParam(value = "studentType") List<String> studentType){
        studentService.distribute(classType,studentType);
        return "redirect:/devideClass";
    }

    @PostMapping("/updateStudent")
    public void updateStudent(Student student){
        studentService.updateStudent(student);
    }

    @GetMapping("/showStudents")
    public String showStudents(Model model){
        List<Student> students = studentService.findAll();
        model.addAttribute("students",students);
        return "roster";
    }

    @GetMapping("/showStudent")
    public String findStudentByClassId(Integer classId, Model model){
        List<Student> students = studentService.findStudentByClassId(classId);
        model.addAttribute("students", students);
        Class c = classService.findClass(classId);
        model.addAttribute("c", c);
        return "showStudent";
    }

}
