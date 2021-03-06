package com.jmu.demo.controller;

import com.jmu.demo.entity.User;
import com.jmu.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Controller
public class UserController extends  BaseController {
    @Autowired
    private UserService userService;

//    @PostMapping("/login")
//    public String login(String username, String password, Model model, HttpSession session){
//        User user = userService.findByUsername(username);
//        String message = "";
//        String url = "redirect:/showStudents";
//        if (user == null){
//            message = "账号不存在";
//            url = "login";
//        }
//        else if (!user.getPassword().equals(password)){
//            message = "账号或密码错误";
//            url = "login";
//        }
//        else {
//            session.setAttribute("user", username);
//        }
//        model.addAttribute("message", message);
//        return url;
//    }

    @PostMapping("/addUser")
    public @ResponseBody String addUser(@Valid User user, BindingResult bindingResult, String roleName, Model model){
        if (bindingResult.hasErrors()){
            return bindingResult.getFieldError().getDefaultMessage();
        }
        String msg = userService.addUser(user, roleName);
        return "添加成功";
    }

    @GetMapping("/findAllUsers")
    public String findAllUsers(Model model){
        List<User> users = userService.findAllUser();
        model.addAttribute("users", users);
        return "user";
    }

    @PostMapping("/updateUser")
    public String updateUser(User user, String roleName){
        userService.updateUser(user, roleName);
        return "redirect:/findAllUsers";
    }

    @PostMapping("/deleteUser/{id}")
    @ResponseBody
    public String deleteUser(@PathVariable("id") Integer id){
       userService.deleteUser(id);
        return "删除成功";
    }

    @GetMapping({"/login", "/"})
    public String toLogin(){

        return "login";
    }

    @GetMapping("/index")
    public String toIndex(){
        return "index";
    }

    @PostMapping("/updatePassword")
    public @ResponseBody String updatePassword(User user, String lastPassword){
        if (user.getPassword().equals(lastPassword) && user.getPassword() != null && lastPassword != null){
            userService.updatePassword(user);
            return "修改成功";
        }
        return "两次密码不一致";
    }
}
