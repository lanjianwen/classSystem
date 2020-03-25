package com.jmu.demo.service;

import com.jmu.demo.entity.Class;

import java.util.List;

public interface ClassService {
    void editClass(Integer typeNum, List<String> classTypeName, List<Integer> num, List<Integer> maxNum);

    List<Class> findClassType();

    List<Class> findClassByClassType(String classType);

    List<Class> findAll();

    Class findClass(Integer classId);

    void deleteAll();

    void updateClass();
}
