package com.example.sweater.model;

import javax.persistence.*;

@Entity
@Table(name = "users")
public class UserEntity {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Integer id;

    private String firstName;
    private String lastName;
    private String middleName;
    private String date;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "departments_id")
    private DepartmentEntity codeDepartment;


    public UserEntity() {
    }

    public UserEntity(String firstName, String lastName, String middleName, String date) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.middleName = middleName;
        this.date = date;
    }

    public String getDepartmentId(){
        return codeDepartment != null ? codeDepartment.getDepName() : "<none>";
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public DepartmentEntity getCodeDepartment() {
        return codeDepartment;
    }

    public void setCodeDepartment(DepartmentEntity codeDepartment) {
        this.codeDepartment = codeDepartment;
    }
}
