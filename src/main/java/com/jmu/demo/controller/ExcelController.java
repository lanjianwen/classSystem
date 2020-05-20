package com.jmu.demo.controller;

import com.jmu.demo.entity.Student;
import com.jmu.demo.service.ClassService;
import com.jmu.demo.service.ExcelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class ExcelController extends  BaseController {
    @Autowired
    private ExcelService excelService;
    @Autowired
    private ClassService classService;

    @PostMapping("/importFile")
    public String importFile(@RequestParam(value = "file") MultipartFile file, Integer isQualityStudents, String belonging){
        Boolean result = excelService.readExcelFile(file, isQualityStudents, belonging);
        if (isQualityStudents == 1){
            this.saveOperaRecord("优质生源","导入跟踪表",belonging);
            return "redirect:/showQualityStudents?belonging="+belonging;
        }
        else {
            this.saveOperaRecord("花名册","导入名单",belonging);
            return "redirect:/showStudents?belonging="+belonging;
        }
    }

    /**
     * 导出Excel
     * @param response
     * @param id 班级id
     */
    @GetMapping("/downloadExcel")
    public void downloadExcel(Integer id, String belonging, HttpServletResponse response){
        String fileName = classService.findClass(id).getName();
        try {
            this.saveOperaRecord("花名册","下载excel",belonging);
            response.setHeader("Content-type","application/vnd.ms-excel");
            // 解决导出文件名中文乱码
            response.setCharacterEncoding("UTF-8");
            response.setHeader("Content-Disposition","attachment;filename="+new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+".xls");
            // 模板导出Excel
            excelService.downloadExcel(response.getOutputStream(), id, belonging);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
