package com.jmu.demo.controller;

import com.jmu.demo.entity.LockTable;
import com.jmu.demo.service.LockTableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class LockTableController {

    @Autowired
    private LockTableService lockTableService;

    @GetMapping("/toLockTable")
    public String toLockTable(Model model){
        List<LockTable> lockTables = lockTableService.findAll();
        model.addAttribute("lockTables", lockTables);
        return "lockTable";
    }

    @PostMapping("/updateLockState")
    public @ResponseBody String updateLockState(LockTable lockTable){
        lockTableService.updateLockState(lockTable);
        return "";
    }

    @GetMapping("/getLockTable")
    public @ResponseBody List<LockTable> getLockTable(){

        return lockTableService.findAll();
    }
}
