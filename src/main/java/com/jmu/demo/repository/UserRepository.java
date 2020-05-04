package com.jmu.demo.repository;

import com.jmu.demo.dto.UserDTO;
import com.jmu.demo.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface UserRepository extends JpaRepository<User, Integer>, JpaSpecificationExecutor<Integer> {

    User findByUsername(String username);

}
