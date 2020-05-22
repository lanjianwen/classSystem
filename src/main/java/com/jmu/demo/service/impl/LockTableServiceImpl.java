package com.jmu.demo.service.impl;

import com.jmu.demo.entity.LockTable;
import com.jmu.demo.repository.LockTableRepository;
import com.jmu.demo.service.LockTableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LockTableServiceImpl implements LockTableService {
    @Autowired
    private LockTableRepository  lockTableRepository;

    @Override
    public List<LockTable> findAll() {
        return lockTableRepository.findAll();
    }

    @Override
    public void updateLockState(LockTable lockTable) {
        LockTable lock = lockTableRepository.findById(lockTable.getId()).get();
        lock.setIsLock(lockTable.getIsLock());
        lockTableRepository.save(lock);
    }
}
