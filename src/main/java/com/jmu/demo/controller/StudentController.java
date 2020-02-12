package com.jmu.demo.controller;

import com.jmu.demo.entity.Student;
import com.jmu.demo.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class StudentController {
    @Autowired
    private StudentService studentService;

    @GetMapping("/findAll")
    public @ResponseBody List<Student> findAll(){
        List<Student> list = studentService.findAll();
        return list;
    }

    @PostMapping("/distribute")
    public void distribute(Integer classType, @RequestParam(value = "studentType") List<Integer> studentType){
        studentService.distribute(classType,studentType);
    }

    @PostMapping("/updateStudent")
    public void updateStudent(Student student){
        studentService.updateStudent(student);
    }

}
