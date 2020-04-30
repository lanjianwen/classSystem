package com.jmu.demo.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "role_permission")
@Data
public class RolePermission {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "role_id")
    private Integer roleId;

    @Column(name = "permission_id")
    private Integer permissionId;
}
