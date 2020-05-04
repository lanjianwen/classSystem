package com.jmu.demo.service;

import com.jmu.demo.entity.User;

import java.util.List;

public interface UserService {
    User findByUsername(String username);

    User findById(Integer id);

    String addUser(User user, String roleName);

    List<User> findAllUser();

    void updateUser(User user, String roleName);

    void deleteUser(Integer id);
}
