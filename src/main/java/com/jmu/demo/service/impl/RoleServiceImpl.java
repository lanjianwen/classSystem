package com.jmu.demo.service.impl;

import com.jmu.demo.entity.Permission;
import com.jmu.demo.entity.Role;
import com.jmu.demo.repository.PermissionRepository;
import com.jmu.demo.repository.RoleRepository;
import com.jmu.demo.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private PermissionRepository permissionRepository;

    @Override
    public List<Role> findAllRoles() {
        return roleRepository.findAll();
    }

    @Override
    public Role findByName(String name) {
        return roleRepository.findByName(name);
    }

    @Override
    public Role findById(Integer id) {
        return roleRepository.findById(id).get();
    }

    @Override
    public void addRole(Role role, List<String> permissionId) {
        Set<Permission> permissions = new HashSet<>();

        for (int i = 0;i<permissionId.size();i++){
            Permission permission = permissionRepository.findById(Integer.parseInt(permissionId.get(i))).get();
            permissions.add(permission);
            if (permission.getPId() != 0){
                Permission p = permissionRepository.findById(permission.getPId()).get();
               permissions.add(p);
            }
        }
        role.setPermissions(permissions);
        roleRepository.save(role);
    }

    @Override
    public void updateRole(Role role, List<String> permissionId) {
        Role r = roleRepository.findById(role.getId()).get();
        r.setName(role.getName());
        r.getPermissions().clear();

        for (int i = 0; i < permissionId.size() ; i++) {
            Permission permission = permissionRepository.findById(Integer.parseInt(permissionId.get(i))).get();
            r.getPermissions().add(permission);
            if (permission.getPId() != 0) {
                Permission p = permissionRepository.findById(permission.getPId()).get();
                r.getPermissions().add(p);

            }
        }
        roleRepository.save(r);
    }

    @Override
    public void deleteRole (Integer id){
        roleRepository.deleteById(id);
    }
}
