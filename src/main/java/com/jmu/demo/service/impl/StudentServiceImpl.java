package com.jmu.demo.service.impl;

import com.jmu.demo.entity.Class;
import com.jmu.demo.entity.Student;
import com.jmu.demo.repository.ClassRepository;
import com.jmu.demo.repository.StudentRepository;
import com.jmu.demo.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudentRepository studentRepository;
    @Autowired
    private ClassRepository classRepository;

    @Override
    public List<Student> findAll() {
        return studentRepository.findAll();
    }

    @Override
    public void distribute(String classType, List<String> studentType) {
        List<Class> classes = classRepository.findByType(classType);
        //班级数量
        int classNum = classes.size();
        //每个班最大人数
        int maxNum = classes.get(0).getMaxMum();
        //总人数
        int totalNum = studentRepository.findByClassId(classType);
        //男生队列
        List<Student> boys = new ArrayList<Student>();
        List<Student> girls = new ArrayList<Student>();


        int index = 0;
        while (totalNum < classNum * maxNum && index < studentType.size()){
            if (studentType.get(index).isEmpty() || studentType.get(index) == null){
                index++;
                continue;
            }
            List<Student> list = studentRepository.findByTypeOrderByTotalGradeDesc(studentType.get(index));
            index++;
            int count = 0;
            if (classNum * maxNum - totalNum > list.size()){
                count = list.size();
            }
            else {
                count = classNum * maxNum - totalNum;
            }
            totalNum += count;
            for (int i = 0; i < count; i++) {
                if (list.get(i).getSex().equals("男")){
                    boys.add(list.get(i));
                }
                else {
                    girls.add(list.get(i));
                }
            }

        }

        compare(boys);
        compare(girls);
        //将男/女生人数变成班级的倍数
        while (boys.size() % classNum != 0){
            int x = boys.size() - (boys.size() % classNum);
            girls.add(boys.get(x));
            boys.remove(x);
        }

        //男生 排序法则12344321
        int j = 0;
        int flag = 1;
        for (int i = 0; i < boys.size(); i++) {
            if (j == 0){
                if (i != 0){
                    boys.get(i).setClassId(classes.get(j).getId());
                    i++;
                }
                flag = 1;
            }
            else if (j == classNum - 1){
                boys.get(i).setClassId(classes.get(j).getId());
                i++;
                flag = -1;
            }
            if (i < boys.size()){
                boys.get(i).setClassId(classes.get(j).getId());
            }
            if (flag == 1){
                j++;
            }
            else {
                j--;
            }
        }

        //女生+小部分男生 排序法则43211234
        j = classNum - 1;
        flag = -1;
        for (int i = 0; i < girls.size(); i++) {
            if (j == classNum - 1){
                if (i != 0){
                    girls.get(i).setClassId(classes.get(j).getId());
                    i++;
                }
                flag = -1;
            }
            else if (j == 0){
                girls.get(i).setClassId(classes.get(j).getId());
                i++;
                flag = 1;
            }
            if (i < girls.size()){
                girls.get(i).setClassId(classes.get(j).getId());
            }
            if (flag == 1){
                j++;
            }
            else {
                j--;
            }
        }

        //分班 入数据库
        //TODO
        boys.addAll(girls);
        updateClassId(boys);
    }

    //调整
    @Override
    public void updateStudent(Student student) {
        Student s = studentRepository.findById(student.getId()).get();
        s.setClassId(student.getClassId());
        studentRepository.save(s);
    }

    @Override
    public List<Student> findStudentType() {
        return studentRepository.findStudentType();
    }

    //按总分排序  降序
    public void compare(List<Student> list){
        Collections.sort(list, new Comparator<Student>() {
            @Override
            public int compare(Student o1, Student o2) {
                //降序
                return (int) (o2.getTotalGrade() - o1.getTotalGrade());
            }
        });
    }

    @Transactional(rollbackOn = Exception.class)
    public void updateClassId(List<Student> students){
        for (Student student : students) {
            Student s = studentRepository.findById(student.getId()).get();
            s.setClassId(student.getClassId());
            studentRepository.save(s);
        }
    }
}
