package com.jmu.demo.service;

import com.jmu.demo.entity.Student;
import org.springframework.data.domain.Page;

import java.util.List;

public interface StudentService {
    List<Student> findAll();

    Page<Student> findAll(Integer page);

    void distribute(String classType, List<String> studentType);

    void updateStudent(Integer id, String className);

    List<Student> findStudentType();

    List<Student> findStudentByClassId(Integer classId);

    Page<Student> findStudentByClassId(Integer classId, Integer page);

    void deleteAll();

    Student findById(Integer id);

    Page<Student> findAllQualityStudents(Integer begin);

    Student addQualityStudent(Student student);
}
