package com.jmu.demo.controller;

import com.jmu.demo.entity.Role;
import com.jmu.demo.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import java.util.List;

@Controller
public class RoleController {
    @Autowired
    private RoleService roleService;

    @GetMapping("/findAllRoles")
    public  String findAllRoles(Model model){
        List<Role> roles = roleService.findAllRoles();
        model.addAttribute("roles", roles);
        return "role";
    }

    @GetMapping("/getAllRoles")
    @ResponseBody
    public List<Role> getAllRoles(){
        List<Role> roles = roleService.findAllRoles();
        return roles;
    }
}
