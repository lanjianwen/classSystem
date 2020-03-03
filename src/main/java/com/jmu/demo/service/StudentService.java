package com.jmu.demo.service;

import com.jmu.demo.entity.Class;
import com.jmu.demo.entity.Student;

import java.util.List;

public interface StudentService {
    List<Student> findAll();

    void distribute(String classType, List<String> studentType);

    void updateStudent(Integer id, String className);

    List<Student> findStudentType();

    List<Student> findStudentByClassId(Integer classId);

    void deleteAll();

    Student findById(Integer id);
}
