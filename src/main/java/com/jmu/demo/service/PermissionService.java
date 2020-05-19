package com.jmu.demo.service;

import com.jmu.demo.entity.Permission;

import java.util.List;

public interface PermissionService {
    List<Permission> findAllPermission();

    Permission findByName(String name);

    Permission findById(Integer id);


}
