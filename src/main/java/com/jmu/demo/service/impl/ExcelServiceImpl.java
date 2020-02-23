package com.jmu.demo.service.impl;

import com.jmu.demo.entity.Student;
import com.jmu.demo.repository.StudentRepository;
import com.jmu.demo.service.ExcelService;
import com.jmu.demo.util.ExcelUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@Service
public class ExcelServiceImpl implements ExcelService {
    @Autowired
    private StudentRepository studentRepository;


    @Override
    @Transactional(rollbackOn = Exception.class)
    public Boolean readExcelFile(MultipartFile file) {
        Boolean result;
        ExcelUtil excel = new ExcelUtil();
        List<Student> studentList = excel.getExcelInfo(file);
        if (studentList != null && ! studentList.isEmpty()) {
            //不为空的话添加到数据库
            for (Student student : studentList) {
//                studentRepository.save(student);
                Student student1 = null;
                try {
                    student1 = studentRepository.findByIdCard(student.getIdCard());
                } catch (Exception e) {
                    e.printStackTrace();
                }
                if (student1 == null || student.getPriority() != 1){
                    studentRepository.save(student);
                }
                else {
                    student1.setPriority(1);
                    studentRepository.save(student1);
                }
            }
            result = true;
        } else {
            result = false;
        }
        return result;
    }

    @Override
    public void downloadExcel(ServletOutputStream outputStream, Integer id) {
        List<Student> students = new ArrayList<Student>();
        if (id == null || id == 0){
            students = studentRepository.findAll();
        }
        else {
            students = studentRepository.findByClassId(id);
        }
        ExcelUtil excel = new ExcelUtil();
        excel.downloadExcel(outputStream, students);
    }


}
