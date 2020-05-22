package com.jmu.demo.service;

import com.jmu.demo.entity.Role;

import java.util.List;

public interface RoleService {
    List<Role> findAllRoles();

    Role findByName(String name);

    Role findById(Integer id);

    void addRole(Role role, List<String> permissionId);

    void updateRole(Role role, List<String> permission);

    void deleteRole(Integer id);
}
