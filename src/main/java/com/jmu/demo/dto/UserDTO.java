package com.jmu.demo.dto;

import com.jmu.demo.entity.Role;
import com.jmu.demo.entity.User;
import lombok.Data;

@Data
public class UserDTO extends User {

    private Role role;
}
