package com.example.simpleCRM.repos;

import com.example.simpleCRM.model.DepartmentEntity;
import com.example.simpleCRM.model.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

//CRUD + доп запросы для User

public interface UserRepo extends CrudRepository<UserEntity, Long>, JpaRepository<UserEntity, Long> {
    List<UserEntity> findById(Integer id);

    @Query("select u from UserEntity u, DepartmentEntity d where u.codeDepartment = d and d.depName = :nameDep")
    List<UserEntity> findByDepartment(@Param("nameDep") String nameDep);

    List<UserEntity> findByCodeDepartment(DepartmentEntity codeDepartment);
}
