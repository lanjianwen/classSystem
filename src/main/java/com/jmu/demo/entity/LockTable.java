package com.jmu.demo.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "lock_table")
@Data
public class LockTable {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "type")
    private String type;

    @Column(name = "dsc")
    private String dsc;

    @Column(name = "is_lock")
    private Integer isLock;
}
