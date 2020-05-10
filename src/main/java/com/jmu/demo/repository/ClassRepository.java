package com.jmu.demo.repository;

import com.jmu.demo.entity.Class;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ClassRepository extends JpaRepository<Class,Integer>, JpaSpecificationExecutor<Integer> {
    List<Class> findByType(String type);

    @Query(value = "SELECT * FROM class GROUP BY type order by priority",nativeQuery = true)
    List<Class> findClassType();

    Class findByName(String className);

    List<Class> findByTypeAndBelonging(String classType, String belonging);

    Class findByNameAndBelonging(String className, String belonging);

    @Query(value = "SELECT * FROM class where belonging= :belonging GROUP BY type order by priority",nativeQuery = true)
    List<Class> findClassTypeAndBelonging(String belonging);

    List<Class> findByBelonging(String belonging);

    @Query(value = "delete from class where belonging= :belonging",nativeQuery = true)
    void deleteAllByBelonging(String belonging);
}
