package com.jmu.demo.service.impl;

import com.jmu.demo.entity.OperaRecord;
import com.jmu.demo.entity.User;
import com.jmu.demo.repository.OperaRecordRepository;
import com.jmu.demo.repository.UserRepository;
import com.jmu.demo.service.OperaRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;

@Service
public class OperaRecordServiceImpl implements OperaRecordService {
    @Autowired
    private OperaRecordRepository operaRecordRepository;
    @Autowired
    private UserRepository userRepository;

    @Override
    public List<OperaRecord> findAll(){
        return operaRecordRepository.findAll(Sort.by(Sort.Order.desc("createTime")));
    }
    @Override
    public List<OperaRecord> findByBelonging(String belonging){
        return operaRecordRepository.findByBelonging( belonging, Sort.by(Sort.Order.desc("createTime")));
    }

    @Override
    public void saveOperaRecord(String module, String name, String username, String belonging, String discription){
        if(StringUtils.isEmpty(username)){
            throw  new RuntimeException("not user");
        }
        User user = userRepository.findByUsername(username);
        if(user != null){
            OperaRecord t = new OperaRecord();
            t.setName(name);
            t.setModule(module);
            t.setUser(user);
            t.setBelonging(belonging);
            t.setCreateTime(new Date());
            t.setDiscription(discription);
            this.operaRecordRepository.save(t);
        }else{
            throw  new RuntimeException("not found user");
        }
    }

    @Override
    public Page<OperaRecord> queryPageByBelonging(String belonging, int page) {
        Sort sort = new Sort(Sort.Direction.DESC,"createTime"); //points1列明  desc降序 asc升序
        Pageable pageable =PageRequest.of(page, 12,sort);//压入pageable对象

        return this.operaRecordRepository.findByBelonging(belonging, pageable);
    }
}
