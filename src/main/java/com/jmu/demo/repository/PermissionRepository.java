package com.jmu.demo.repository;

import com.jmu.demo.entity.Permission;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PermissionRepository extends JpaRepository<Permission,Integer>, JpaSpecificationExecutor<Integer> {
    Permission findByName(String name);

    @Query(value = "SELECT name FROM permission where url= :s",nativeQuery = true)
    List<String> findByUrl(String s);
}
