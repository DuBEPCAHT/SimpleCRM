package com.example.simpleCRM.model;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "departments")
public class DepartmentEntity {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Integer id;

    @NotNull
    @NotEmpty
    @Column(unique = true)
    private String depName;

    @NotNull
    @NotEmpty
    @Size(max=200)
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
