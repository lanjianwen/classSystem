package com.jmu.demo.service;

import com.jmu.demo.entity.Class;

import java.util.List;

public interface ClassService {
    void editClass(Integer typeNum, List<String> classTypeName, List<Integer> num, List<Integer> maxNum,String belonging);

    List<Class> findClassType(String belonging);

    List<Class> findClassByClassType(String classType, String belonging);

    List<Class> findAll();

    Class findClass(Integer classId);

    void deleteAll(String belonging);

    void updateClass(String belonging);
}
