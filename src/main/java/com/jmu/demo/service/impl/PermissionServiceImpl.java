package com.jmu.demo.service.impl;

import com.jmu.demo.entity.Permission;
import com.jmu.demo.repository.PermissionRepository;
import com.jmu.demo.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class PermissionServiceImpl implements PermissionService {
    @Autowired
    private PermissionRepository permissionRepository;

    @Override
    public List<Permission> findAllPermission() {
        List<Permission> permissions =  permissionRepository.findAll();
        return permissions;
    }

    @Override
    public Permission findByName(String name) {
        return permissionRepository.findByName(name);
    }

    @Override
    public Permission findById(Integer id) {
        return permissionRepository.findById(id).get();
    }


}
