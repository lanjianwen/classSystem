package com.jmu.demo.service.impl;

import com.jmu.demo.entity.Class;
import com.jmu.demo.entity.Student;
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
    public void editClass(Integer typeNum, List<String> classTypeName, List<Integer> num, List<Integer> maxNum,String belonging) {
        int n = 0;
        for (int i = 0; i < typeNum; i++) {
            n = classRepository.findByType(classTypeName.get(i)).size();
            n++;
            for (int j = 0; j < num.get(i); j++) {
                Class c = new Class();
                c.setType(classTypeName.get(i));
                c.setName(classTypeName.get(i)+n+"班");
                c.setMaxMum(maxNum.get(i));
                c.setFlag(1);
                c.setBelonging(belonging);
                n++;
                classRepository.save(c);
            }
        }
    }

    @Override
    public List<Class> findClassType(String belonging) {
        return classRepository.findClassTypeAndBelonging(belonging);
    }

    @Override
    public List<Class> findClassByClassType(String classType, String belonging) {
        return classRepository.findByTypeAndBelonging(classType, belonging);
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
    public void deleteAll(String belonging) {
        classRepository.deleteAllByBelonging(belonging);
        studentRepository.resetClassId(belonging);
    }

    @Override
    public void updateClass(String belonging) {
        List<Class> classes = classRepository.findByBelonging(belonging);
        for (Class c : classes){
            double totalGrade =0;
            List<Student> boys = studentRepository.findByClassIdAndSex(c.getId(),"男");
            List<Student> girls = studentRepository.findByClassIdAndSex(c.getId(),"女");
            try {
                totalGrade = studentRepository.findByClassIdAndGetCount(c.getId());
            } catch (Exception e) {

            }
            Class c1 = classRepository.findById(c.getId()).get();
            if (c1 != null){
                c1.setBoyNum(boys.size());
                c1.setGirlNum(girls.size());

                //取小数点后两位
                Double average = new Double(0);
                if (totalGrade != 0){
                    average = Double.parseDouble(String.format("%.2f", (totalGrade/(boys.size()+girls.size()))));
                }
                c1.setAverageScore(average);
                classRepository.save(c1);
            }
        }
    }
}
