package com.jmu.demo.dto;

import com.jmu.demo.entity.Student;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.Entity;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
//@Entity
public class StudentDTO extends Student {
    private Integer num;
}
