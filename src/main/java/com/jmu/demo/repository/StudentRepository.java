package com.jmu.demo.repository;

import com.jmu.demo.entity.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StudentRepository extends JpaRepository<Student,Integer>, JpaSpecificationExecutor<Integer> {

//    @Query(value = "select * from student where sex= :sex order by total_grade",nativeQuery = true)
//    List<Student> findBySex(@Param("sex") String sex);
//    List<Student> findByTypeOrderByTotalGradeDesc(String sex,Integer type);
    @Query(value = "select * from student where type= :type and class_id is null order by total_grade desc",nativeQuery = true)
    List<Student> findByTypeOrderByTotalGradeDesc(String type);

    @Query(value = "select count(*) from student where class_id in (select id from class where type= :classType)",nativeQuery = true)
    int findByClassId(String classType);

    @Query(value = "select * from student group by type order by priority", nativeQuery = true)
    List<Student> findStudentType();
}
