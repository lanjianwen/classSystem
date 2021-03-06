package com.jmu.demo.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.hibernate.sql.Update;

import javax.persistence.*;

@Data
@Entity
@Table(name = "student")
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Student {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "name")
    private String name;
    @Column(name = "id_Card")
    private String idCard;
    @Column(name = "sex")
    private String sex;
    @Column(name = "total_grade")
    private double totalGrade;
    @Column(name = "class_id")
    private Integer classId;
    @Column(name = "type")
    private String type;
    @Column(name = "nation")
    private String nation;
    @Column(name = "nativePlace")
    private String nativePlace;
    @Column(name = "patriarch")
    private String patriarch;
    @Column(name = "phone")
    private String phone;
    @Column(name = "address")
    private String address;
    @Column(name = "priority")
    private Integer priority;
    @Column(name = "belonging")
    private String belonging;

    @OneToOne()
    @JoinColumn(name = "class_id", referencedColumnName = "id",insertable = false, updatable = false)
    private Class clazz;
}
