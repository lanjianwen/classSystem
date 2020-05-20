package com.jmu.demo.service;

import com.jmu.demo.entity.OperaRecord;
import org.springframework.data.domain.Page;

import java.util.List;

public interface OperaRecordService {


    List<OperaRecord> findAll();

    List<OperaRecord> findByBelonging(String belonging);

    void saveOperaRecord(String module, String name, String username, String belonging, String discription);

    Page<OperaRecord> queryPageByBelonging(String belonging, int page);
}
