package com.jmu.demo.service.impl;

import com.jmu.demo.entity.Role;
import com.jmu.demo.entity.User;
import com.jmu.demo.repository.RoleRepository;
import com.jmu.demo.repository.UserRepository;
import com.jmu.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;

    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    @Override
    public User findById(Integer id) {
        return userRepository.findById(id).get();
    }

    @Override
    public String addUser(User user,String roleName) {
        Role role = roleRepository.findByName(roleName);
        User u = userRepository.findByUsername(user.getUsername());
        if (u == null){
            user.getRoles().add(role);
            user.setPassword("123456");
            userRepository.save(user);
            return "添加成功";
        }
        else {
            return "用户已存在";
        }
    }

    @Override
    public List<User> findAllUser() {
        return userRepository.findAll();
    }

    @Override
    public void updateUser(User user, String roleName) {
        User u = userRepository.findByUsername(user.getUsername());
        Role role = roleRepository.findByName(roleName);
        if (u != null){
            u.getRoles().removeAll(u.getRoles());
            u.getRoles().add(role);
            userRepository.save(u);
        }
    }

    @Override
    public void deleteUser(Integer id) {
        userRepository.deleteById(id);
    }

    @Override
    public void updatePassword(User user) {
        User u = userRepository.findById(user.getId()).get();
        u.setPassword(user.getPassword());
        userRepository.save(u);
    }

}
