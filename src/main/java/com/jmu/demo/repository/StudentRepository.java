package com.jmu.demo.repository;

import com.jmu.demo.entity.Student;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public interface StudentRepository extends JpaRepository<Student,Integer>, JpaSpecificationExecutor<Integer> {

//    @Query(value = "select * from student where sex= :sex order by total_grade",nativeQuery = true)
//    List<Student> findBySex(@Param("sex") String sex);
//    List<Student> findByTypeOrderByTotalGradeDesc(String sex,Integer type);
    @Query(value = "select * from student where type= :type and class_id is null order by total_grade desc",nativeQuery = true)
    List<Student> findByTypeOrderByTotalGradeDesc(String type);

    @Query(value = "select count(*) from student where class_id in (select id from class where type= :classType)",nativeQuery = true)
    int findByClassType(String classType);

    @Query(value = "select * from student group by type order by priority", nativeQuery = true)
    List<Student> findStudentType();

    @Query(value = "select * from student group by class_id",nativeQuery = true)
    List<Student> findClassType();

    List<Student> findByClassId(Integer classId);

    Student findByIdCard(String idCard);

    Page<Student> findByClassId(Integer classId, Pageable pageable);

    List<Student> findByClassIdAndSex(Integer id, String sex);

    @Query(value = "SELECT SUM(total_grade) FROM student WHERE class_id= :id", nativeQuery = true)
    double findByClassIdAndGetCount(Integer id);

    @Transactional
    @Modifying
    @Query(value = "UPDATE student SET class_id = NULL", nativeQuery = true)
    void resetClassId();

    @Query(value = "SELECT * FROM student WHERE priority=1", nativeQuery = true)
    Page<Student> findAllQualityStudents(Pageable pageable);
}
