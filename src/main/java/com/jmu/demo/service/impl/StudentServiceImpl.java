package com.jmu.demo.service.impl;

import com.jmu.demo.entity.Class;
import com.jmu.demo.entity.Student;
import com.jmu.demo.repository.ClassRepository;
import com.jmu.demo.repository.StudentRepository;
import com.jmu.demo.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
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
    public List<Student> findAll(String belonging) {
        return studentRepository.findByBelonging(belonging);
    }

    @Override
    public Page<Student> findAll(String belonging,Integer begin) {
        Pageable pageable = PageRequest.of(begin,12);
//        Page<Student> page = studentRepository.findAll(pageable);
        Page<Student> page = studentRepository.findByBelonging(belonging,pageable);
        return page;
//        return studentRepository.findAll(page);
    }

    @Override
    public void distribute(String classType, List<String> studentType, String belonging) {
        List<Class> classes = classRepository.findByTypeAndBelonging(classType,belonging);
        //班级数量
        int classNum = classes.size();
        //每个班最大人数
        int maxNum = classes.get(0).getMaxMum();
        //总人数
        int totalNum = studentRepository.findByClassTypeAndBelonging(classType, belonging);
        int sum = totalNum;
        //男生队列
        List<Student> boys = new ArrayList<Student>();
        List<Student> girls = new ArrayList<Student>();


        int index = 0;
        while (totalNum < classNum * maxNum && index < studentType.size()){
            if (studentType.get(index).isEmpty() || studentType.get(index) == null){
                index++;
                continue;
            }
            List<Student> list = studentRepository.findByTypeAndBelongingOrderByTotalGradeDesc(studentType.get(index), belonging);
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
        // 将男/女生人数变成班级的倍数
        while (((boys.size() + (sum % classNum)) % classNum) != 0){
            if (boys.size() + girls.size() < classNum){
                boys.addAll(girls);
                girls.removeAll(girls);
                break;
            }
            int x = boys.size() - (boys.size() % classNum) - (sum % classNum);
            girls.add(boys.get(x));
            boys.remove(x);
        }

        //男生 排序法则12344321
        //i 学生  j 班级
        int j = Math.abs(classes.get(0).getFlag()) - 1;
        if (classes.get(0).getFlag() < 0){
            sum += classNum;
        }
        for (int i = 0; i < boys.size(); i++) {
            if (((sum + i)/classNum) % 2 == 0){
                boys.get(i).setClassId(classes.get(j).getId());
                j++;
            }
            else{
                boys.get(i).setClassId(classes.get(j).getId());
                j--;
            }
            if(j == classNum){
                j--;
            }
            else if(j == -1){
                j++;
            }
        }

        //女生+小部分男生 排序法则43211234
        if (boys.size() == 0){
            j = classNum - 2 - Math.abs(classes.get(0).getFlag());
        }
        else {
            j = classNum - 1;
        }
        if (boys.size() > 0){
            sum = 0;
        }
        for (int i = 0; i < girls.size(); i++) {
            if (((sum + i)/classNum) % 2 == 0){
                girls.get(i).setClassId(classes.get(j).getId());
                j--;
            }
            else{
                girls.get(i).setClassId(classes.get(j).getId());
                j++;
            }
            if(j == classNum){
                j--;
            }
            else if(j == -1){
                j++;
            }
        }

        //分班 入数据库
        //TODO
        for (int i = 0; i < classes.size(); i++) {
            if (girls.size() > 0){
                classes.get(i).setFlag(-j-1);
            }
            else {
                classes.get(i).setFlag(j+1);
            }
        }
        classRepository.saveAll(classes);
        boys.addAll(girls);
        updateClassId(boys);
    }

    //调整
    @Override
    public void updateStudent(Integer id, String className, String belonging) {
        Class c = classRepository.findByNameAndBelonging(className, belonging);
        Student s = studentRepository.findById(id).get();
        s.setClassId(c.getId());
        studentRepository.save(s);
    }

    @Override
    public List<Student> findStudentType() {
        return studentRepository.findStudentType();
    }

    @Override
    public List<Student> findStudentByClassId(Integer classId, String belonging) {
        return studentRepository.findByClassIdAndBelonging(classId, belonging);
    }

    @Override
    public Page<Student> findStudentByClassId(Integer classId, String belonging, Integer begin) {
        Pageable pageable = PageRequest.of(begin,10);
        Page<Student> page = studentRepository.findByClassIdAndBelonging(classId, belonging,pageable);
        return page;
//        return studentRepository.findByClassId(classId);
    }

    @Override
    @Transactional(rollbackOn = Exception.class)
    public void deleteAll(String belonging) {
        studentRepository.deleteAllByBelonging(belonging);
        List<Class> cs = classRepository.findAll();
        for (int i = 0; i < cs.size(); i++) {
            cs.get(i).setFlag(1);
        }
        classRepository.saveAll(cs);
    }

    @Override
    public Student findById(Integer id) {
        return studentRepository.findById(id).get();
    }

    @Override
    public Page<Student> findAllQualityStudents(String belonging, Integer begin) {
        Pageable pageable = PageRequest.of(begin,10);
        Page<Student> page = studentRepository.findAllQualityStudentsByBelonging(belonging, pageable);
        return page;
    }

    @Override
    public Student addQualityStudent(Student student) {
        Student s = studentRepository.findByIdCard(student.getIdCard());
        if (s != null){
            s.setPriority(1);
            return studentRepository.save(s);
        }
        return s;
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
