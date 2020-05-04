package com.jmu.demo.repository;

import com.jmu.demo.entity.Class;
import com.jmu.demo.entity.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

@Repository
public interface RoleRepository extends JpaRepository<Role,Integer>, JpaSpecificationExecutor<Integer> {
    Role findByName(String name);
}
