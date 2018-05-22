package com.example.sweater.repos;

import com.example.sweater.domain.DepartmentEntity;
import com.example.sweater.domain.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface UserRepo extends CrudRepository<UserEntity, Long>, JpaRepository<UserEntity, Long> {
    List<UserEntity> findById(Integer id);

    @Query("select u from UserEntity u, DepartmentEntity d where u.codeDepartment = d and d.depName = :nameDep")
    List<UserEntity> findByDepartment(@Param("nameDep") String nameDep);

    List<UserEntity> findByCodeDepartment(DepartmentEntity codeDepartment);

}
