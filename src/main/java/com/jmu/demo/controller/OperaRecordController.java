package com.jmu.demo.controller;

import com.jmu.demo.entity.OperaRecord;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OperaRecordController extends BaseController {

    @GetMapping("/operaRecords")
    public String findAllUsers(Integer page, String belonging, Model model){

        if (page == null || page.intValue() == 0){
            page = 1;
        }
//        List<OperaRecord> operaRecords = operaRecordService.findByBelonging(belonging);
        Page<OperaRecord> operaRecords = operaRecordService.queryPageByBelonging(belonging,page-1);
        model.addAttribute("operaRecords",operaRecords.getContent());
        model.addAttribute("total", operaRecords.getTotalElements());
        model.addAttribute("totalPages", operaRecords.getTotalPages());
        model.addAttribute("currentPage", operaRecords.getNumber()+1);
        model.addAttribute("belonging", belonging);
        return "operaRecords";
    }
}
