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
public class StudentController extends  BaseController {
    @Autowired
    private StudentService studentService;
    @Autowired
    private ClassService classService;

    @GetMapping("/findAll")
    public @ResponseBody List<Student> findAll(Integer classId, String belonging){
        List<Student> list = new ArrayList<Student>();
        if (classId == null){
            list= studentService.findAll(belonging);
        }
        else {
            list= studentService.findStudentByClassId(classId, belonging);
        }

        return list;
    }

    @PostMapping("/distribute")
    public String distribute(String classType, String type, @RequestParam(value = "studentType") List<String> studentType, String belonging, Model model){
        studentService.distribute(classType,studentType, belonging, type);
        this.saveOperaRecord("班级","分班",belonging);
        return "redirect:/showClass?belonging="+belonging;
    }

    @PostMapping("/updateStudent")
    public String updateStudent(Integer id, String className, String belonging){
        studentService.updateStudent(id, className, belonging);
        this.saveOperaRecord("班级","编辑班级学生信息",belonging);
        return "redirect:/showStudent?belonging="+belonging;
    }

    @GetMapping("/showStudents")
    public String showStudents(Integer page, String belonging, Model model){
        if (page == null || page.intValue() == 0){
            page = 1;
        }
        Page<Student> students = studentService.findAll(belonging,page-1);
        model.addAttribute("students",students.getContent());
        model.addAttribute("total", students.getTotalElements());
        model.addAttribute("totalPages", students.getTotalPages());
        model.addAttribute("currentPage", students.getNumber()+1);
        model.addAttribute("belonging", belonging);
        return "roster";
    }

    @GetMapping("/showStudent")
    public String findStudentByClassId(Integer classId, Integer page, Model model, String belonging){
        if (page == null || page.intValue() == 0){
            page = 1;
        }
        Page<Student> students = studentService.findStudentByClassId(classId, belonging, page-1);
        model.addAttribute("students", students.getContent());
        model.addAttribute("totalPages", students.getTotalPages());
        model.addAttribute("currentPage", students.getNumber()+1);
        Class c = classService.findClass(classId);
        List<Class> classes = classService.findAll(belonging);
        model.addAttribute("classes", classes);
        model.addAttribute("c", c);
        model.addAttribute("belonging", belonging);
        return "showStudent";
    }

    @GetMapping("/deleteAll")
    public String deleteAll(String belonging){
        studentService.deleteAll(belonging);
        this.saveOperaRecord("班级","清空班级学生名单",belonging);
        return "redirect:/showStudents?belonging="+belonging;
    }

    @PostMapping("/findOneStudent")
    public @ResponseBody Student findById(Integer id){
        return studentService.findById(id);
    }

    @GetMapping("/showQualityStudents")
    public String showQualityStudents(Integer page, String belonging, Model model){
        if (page == null || page.intValue() == 0){
            page = 1;
        }
        Page<Student> students = studentService.findAllQualityStudents(belonging, page - 1);
        model.addAttribute("students", students.getContent());
        model.addAttribute("totalPages", students.getTotalPages());
        model.addAttribute("currentPage", students.getNumber()+1);
        model.addAttribute("belonging", belonging);
        return "qualityStudents";
    }

    @PostMapping("/addQualityStudent")
    public @ResponseBody String addQualityStudent(Student student, String user, String belonging){
        Student s = studentService.addQualityStudent(student);
        if (s == null){
            this.saveOperaRecord("优质生源","添加优质生源",belonging,"添加未成功");
            return "该生未报考我校";
        }
        else {
            return "添加成功";
        }
    }

    @GetMapping("/main")
    public String toMain(){
        return "main";
    }
}
