package com.jmu.demo.service;

import com.jmu.demo.entity.LockTable;

import java.util.List;

public interface LockTableService {
    List<LockTable> findAll();

    void updateLockState(LockTable lockTable);
}
