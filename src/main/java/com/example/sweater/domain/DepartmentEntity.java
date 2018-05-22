package com.example.sweater.domain;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "departments")
public class DepartmentEntity {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Integer id;

    private String depName;
    private String description;




    public DepartmentEntity() {
    }


    public DepartmentEntity(String depName, String description) {
        this.depName = depName;
        this.description = description;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer depId) {
        this.id = depId;
    }

    public String getDepName() {
        return depName;
    }

    public void setDepName(String depName) {
        this.depName = depName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
