package com.jmu.demo.controller;

import com.jmu.demo.entity.User;
import com.jmu.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @PostMapping("/login")
    public String login(String username, String password, Model model, HttpSession session){
        User user = userService.findUser(username);
        String message = "";
        String url = "redirect:/showStudents";
        if (user == null){
            message = "账号不存在";
            url = "login";
        }
        else if (!user.getPassword().equals(password)){
            message = "账号或密码错误";
            url = "login";
        }
        else {
            session.setAttribute("user", username);
        }
        model.addAttribute("message", message);
        return url;
    }

    @GetMapping("/test")
    public String test(){
        return "dashboard";
    }

}
