package com.jmu.demo.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "opera_record")
@Data
public class OperaRecord {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "name")
    private String name;
    @Column(name = "module")
    private String module;
    @Column(name = "create_time")
    private Date createTime;
//    @Column(name = "user_id")
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User user;
    @Column(name = "belonging")
    private String belonging;
    @Column(name = "discription")
    private String discription;



}
