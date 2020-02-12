package com.jmu.demo.service;

import com.jmu.demo.entity.Student;

import java.util.List;

public interface StudentService {
    List<Student> findAll();

    void distribute(Integer classType, List<Integer> studentType);

    void updateStudent(Student student);
}
