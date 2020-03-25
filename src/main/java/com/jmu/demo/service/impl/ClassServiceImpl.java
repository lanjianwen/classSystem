package com.jmu.demo.service.impl;

import com.jmu.demo.entity.Class;
import com.jmu.demo.po.ClassPO;
import com.jmu.demo.repository.ClassRepository;
import com.jmu.demo.repository.StudentRepository;
import com.jmu.demo.service.ClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class ClassServiceImpl implements ClassService {
    @Autowired
    private ClassRepository classRepository;
    @Autowired
    private StudentRepository studentRepository;

    @Override
    @Transactional(rollbackOn = Exception.class)
    public void editClass(Integer typeNum, List<String> classTypeName, List<Integer> num, List<Integer> maxNum) {
        int n = 0;
        for (int i = 0; i < typeNum; i++) {
            n = classRepository.findByType(classTypeName.get(i)).size();
            n++;
            for (int j = 0; j < num.get(i); j++) {
                Class c = new Class();
                c.setType(classTypeName.get(i));
                c.setName(classTypeName.get(i)+n+"班");
                c.setMaxMum(maxNum.get(i));
                n++;
                classRepository.save(c);
            }
        }
    }

    @Override
    public List<Class> findClassType() {
        return classRepository.findClassType();
    }

    @Override
    public List<Class> findClassByClassType(String classType) {
        return classRepository.findByType(classType);
    }

    @Override
    public List<Class> findAll() {
        return classRepository.findAll();
    }

    @Override
    public Class findClass(Integer classId) {
        return classRepository.findById(classId).get();
    }

    @Override
    public void deleteAll() {
        classRepository.deleteAll();
    }

    @Override
    public void updateClass() {
        List<ClassPO> boys = studentRepository.findSexNum("男");
        List<ClassPO> girls = studentRepository.findSexNum("女");

        for (int i = 0; i < boys.size(); i++) {
            Class c = classRepository.findById(boys.get(i).getId()).get();
            c.setBoyNum(boys.get(i).getNum());
            c.setGirlNum(girls.get(i).getNum());
            c.setAverageScore((girls.get(i).getTotalGrade()+boys.get(i).getTotalGrade())/(boys.get(i).getNum()+girls.get(i).getNum()));
            classRepository.save(c);
        }
    }
}
