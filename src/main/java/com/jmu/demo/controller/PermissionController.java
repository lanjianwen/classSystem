package com.jmu.demo.controller;

import com.jmu.demo.entity.Permission;
import com.jmu.demo.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class PermissionController {
    @Autowired
    private PermissionService permissionService;

    @GetMapping("/findAllPermissions")
    private @ResponseBody List<Permission> findAllPermissions(Model model){
        List<Permission> permissions = permissionService.findAllPermission();
        model.addAttribute("permissions", permissions);
        return permissions;
//        return "permission";
    }
}
