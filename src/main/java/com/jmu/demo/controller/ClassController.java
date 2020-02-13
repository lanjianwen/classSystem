package com.jmu.demo.controller;

import com.jmu.demo.entity.Class;
import com.jmu.demo.entity.Student;
import com.jmu.demo.service.ClassService;
import com.jmu.demo.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class ClassController {
    @Autowired
    private ClassService classService;
    @Autowired
    private StudentService studentService;

    @PostMapping("/editClass")
    public String editClass(Integer typeNum, @RequestParam(name = "className")List<String> classTypeName,
                            @RequestParam(name = "num") List<Integer> num, @RequestParam(name = "maxNum") List<Integer> maxNum){
        classService.editClass(typeNum,classTypeName,num,maxNum);
        return "";
    }

    @GetMapping("/devideClass")
    public String findClassType(Model model){
        List<Class> classes = classService.findClassType();
        model.addAttribute("classes", classes);
        List<Student> students = studentService.findStudentType();
        model.addAttribute("students", students);
        return "devideClass";
    }
}
