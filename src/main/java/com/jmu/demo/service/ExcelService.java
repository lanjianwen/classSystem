package com.jmu.demo.service;

import com.jmu.demo.entity.Student;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import java.util.List;

public interface ExcelService {
    Boolean readExcelFile(MultipartFile file, Integer isQualityStudents, String belonging);

    void downloadExcel(ServletOutputStream outputStream, Integer id, String belonging);

    void downloadBlankExcel(ServletOutputStream outputStream, String belonging);
}
