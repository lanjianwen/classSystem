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
    @Column(name = "priority")
    private Integer priority;
}
