package com.jmu.demo.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "class")
@Data
public class Class {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "name")
    private String name;
    @Column(name = "maxNum")
    private Integer maxMum;
    @Column(name = "type")
    private String type;
    @Column(name = "boy_num")
    private Integer boyNum;
    @Column(name = "girl_num")
    private Integer girlNum;
    @Column(name = "average_score")
    private Double averageScore;
    @Column(name = "priority")
    private Integer priority;
    @Column(name = "flag")
    private Integer flag;
    @Column(name = "belonging")
    private String belonging;
}
