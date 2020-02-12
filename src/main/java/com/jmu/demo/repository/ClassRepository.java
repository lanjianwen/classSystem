package com.jmu.demo.repository;

import com.jmu.demo.entity.Class;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ClassRepository extends JpaRepository<Class,Integer>, JpaSpecificationExecutor<Integer> {
    List<Class> findByType(Integer type);
}
