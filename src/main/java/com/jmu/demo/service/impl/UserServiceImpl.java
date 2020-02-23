package com.jmu.demo.service.impl;

import com.jmu.demo.entity.User;
import com.jmu.demo.repository.UserRepository;
import com.jmu.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;

    @Override
    public User findUser(String username) {
        return userRepository.findByUsername(username);
    }
}
