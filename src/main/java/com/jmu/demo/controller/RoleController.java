package com.jmu.demo.controller;

import com.jmu.demo.entity.Role;
import com.jmu.demo.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class RoleController extends  BaseController {
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

    @GetMapping("/findRoleById")
    public @ResponseBody Role findRoleById(Integer id){
        Role role = roleService.findById(id);
        return role;
    }

    @PostMapping("/addRole")
    public @ResponseBody String addRole(Role role, @RequestParam("permission") List<String> permission){
        roleService.addRole(role, permission);
        return "添加成功";
    }

    @PostMapping("/updateRole")
    public @ResponseBody String updateRole(Role role, @RequestParam("permission") List<String> permission){
        roleService.updateRole(role,permission);
        return "";
    }

    @PostMapping("/deleteRole/{id}")
    @ResponseBody
    public String deleteRole(@PathVariable("id") Integer id){
        try {
            roleService.deleteRole(id);
        } catch (Exception e) {
            return "删除失败，请先删除相关的用户";
        }
        return "删除成功";
    }
}
