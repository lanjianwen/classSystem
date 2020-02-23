package com.jmu.demo.controller;

import com.jmu.demo.entity.User;
import com.jmu.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @PostMapping("/login")
    public String login(String username, String password, Model model){
        User user = userService.findUser(username);
        String message = "";
        String url = "roster";
        if (!user.getPassword().equals(password)){
            message = "账号或密码错误";
            url = "index";
        }
        else if (user == null){
            message = "账号不存在";
            url = "index";
        }
        model.addAttribute("message", message);
        return url;
    }

}
