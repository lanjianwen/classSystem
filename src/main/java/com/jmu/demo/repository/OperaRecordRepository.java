package com.jmu.demo.repository;


import com.jmu.demo.entity.OperaRecord;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OperaRecordRepository extends JpaRepository<OperaRecord,Integer>, JpaSpecificationExecutor<Integer> {
        public List<OperaRecord> findByBelonging(String belonging, Sort sort);


        Page<OperaRecord> findByBelonging(String belonging, Pageable pageable);
}
