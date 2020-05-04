package com.jmu.demo.repository;

import com.jmu.demo.entity.Permission;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

@Repository
public interface PermissionRepository extends JpaRepository<Permission,Integer>, JpaSpecificationExecutor<Integer> {
    Permission findByName(String name);
}
