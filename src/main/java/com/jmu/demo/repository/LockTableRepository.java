package com.jmu.demo.repository;

import com.jmu.demo.entity.LockTable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

@Repository
public interface LockTableRepository extends JpaRepository<LockTable,Integer>, JpaSpecificationExecutor<Integer> {

}
