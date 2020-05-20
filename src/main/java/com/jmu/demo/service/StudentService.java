package com.jmu.demo.service;

import com.jmu.demo.entity.Student;
import org.springframework.data.domain.Page;

import java.util.List;

public interface StudentService {
    List<Student> findAll(String belonging);

    Page<Student> findAll(String belonging, Integer page);

    void distribute(String classType, List<String> studentType, String belonging);

    void updateStudent(Integer id, String className, String belonging);

    List<Student> findStudentType();

    List<Student> findStudentByClassId(Integer classId, String belonging);

    Page<Student> findStudentByClassId(Integer classId, String belonging, Integer page);

    void deleteAll(String belonging);

    Student findById(Integer id);

    Page<Student> findAllQualityStudents(String belonging, Integer begin);

    Student addQualityStudent(Student student);

    void distribute(String classType, List<String> studentType, String belonging, String type);

    void distributeAtRand(String classType, List<String> studentType, String belonging);
}
