package com.jmu.demo.controller;

import com.jmu.demo.entity.Class;
import com.jmu.demo.entity.Student;
import com.jmu.demo.service.ClassService;
import com.jmu.demo.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
public class StudentController {
    @Autowired
    private StudentService studentService;
    @Autowired
    private ClassService classService;

    @GetMapping("/findAll")
    public @ResponseBody List<Student> findAll(Integer classId){
        List<Student> list = new ArrayList<Student>();
        if (classId == null){
            list= studentService.findAll();
        }
        else {
            list= studentService.findStudentByClassId(classId);
        }

        return list;
    }

    @PostMapping("/distribute")
    public String distribute(String classType, @RequestParam(value = "studentType") List<String> studentType, Model model){
        studentService.distribute(classType,studentType);
        return "redirect:/showClass";
    }

    @PostMapping("/updateStudent")
    public String updateStudent(Integer id, String className){
        studentService.updateStudent(id, className);
        return "redirect:/showStudent";
    }

    @GetMapping("/showStudents")
    public String showStudents(Integer page, Model model){
        if (page == null || page.intValue() == 0){
            page = 1;
        }
        Page<Student> students = studentService.findAll(page-1);
        model.addAttribute("students",students.getContent());
        model.addAttribute("total", students.getTotalElements());
        model.addAttribute("totalPages", students.getTotalPages());
        model.addAttribute("currentPage", students.getNumber()+1);
        return "roster";
    }

    @GetMapping("/showStudent")
    public String findStudentByClassId(Integer classId, Integer page, Model model){
        if (page == null || page.intValue() == 0){
            page = 1;
        }
        Page<Student> students = studentService.findStudentByClassId(classId, page-1);
        model.addAttribute("students", students.getContent());
        model.addAttribute("totalPages", students.getTotalPages());
        model.addAttribute("currentPage", students.getNumber()+1);
        Class c = classService.findClass(classId);
        List<Class> classes = classService.findAll();
        model.addAttribute("classes", classes);
        model.addAttribute("c", c);
        return "showStudent";
    }

    @GetMapping("/deleteAll")
    public String deleteAll(){
        studentService.deleteAll();
        return "redirect:/roster";
    }

    @PostMapping("/findOneStudent")
    public @ResponseBody Student findById(Integer id){
        return studentService.findById(id);
    }

    @GetMapping("/showQualityStudents")
    public String showQualityStudents(Integer page, Model model){
        if (page == null || page.intValue() == 0){
            page = 1;
        }
        Page<Student> students = studentService.findAllQualityStudents(page - 1);
        model.addAttribute("students", students.getContent());
        model.addAttribute("totalPages", students.getTotalPages());
        model.addAttribute("currentPage", students.getNumber()+1);
        return "/qualityStudents";
    }

    @PostMapping("/addQualityStudent")
    public @ResponseBody String addQualityStudent(Student student, String user){
        Student s = studentService.addQualityStudent(student);
        if (s == null){
            return "该生未报考我校";
        }
        else {
            return "添加成功";
        }
    }
}
