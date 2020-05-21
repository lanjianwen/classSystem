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
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class ClassController extends  BaseController {
    @Autowired
    private ClassService classService;
    @Autowired
    private StudentService studentService;

    @PostMapping("/editClass")
    public String editClass(Integer typeNum,
                            @RequestParam(name = "className")List<String> classTypeName,
                            @RequestParam(name = "num") List<Integer> num,
                            @RequestParam(name = "maxNum") List<Integer> maxNum,
                            String belonging){
        classService.editClass(typeNum,classTypeName,num,maxNum,belonging);
        this.saveOperaRecord("班级","创建班级",belonging);
        return "redirect:/devideClass?belonging="+belonging;
    }

    @GetMapping("/devideClass")
    public String findClassType(String belonging, Model model){
        List<Class> classes = classService.findClassType(belonging);
        model.addAttribute("classes", classes);
        List<Student> students = studentService.findStudentType();
        model.addAttribute("students", students);
        model.addAttribute("belonging", belonging);
        return belonging + "/devideClass";
    }

    @GetMapping("/showClass")
    public String showClass(String belonging, Model model){
        classService.updateClass(belonging);
        List<Class> classes = classService.findAll(belonging);
        model.addAttribute("classes", classes);
        model.addAttribute("belonging", belonging);
        return belonging + "/showClass";
    }

    @GetMapping("/findClassByClassType")
    public String findClassByClassType(String classType, String belonging, Model model){
        List<Class> classes = classService.findClassByClassType("实验", belonging);
        model.addAttribute("classes", classes);
        return "redirect:/showClass?belonging="+belonging;
    }

    @GetMapping("/deleteClass")
    public @ResponseBody String deleteAll(String belonging){
        classService.deleteAll(belonging);
        this.saveOperaRecord("班级","清空班级列表",belonging);
        return "1";
    }

    @GetMapping("/addClass")
    public String editClass(String belonging, Model model){
        model.addAttribute("belonging", belonging);
        return belonging + "/editClass";
    }

}
