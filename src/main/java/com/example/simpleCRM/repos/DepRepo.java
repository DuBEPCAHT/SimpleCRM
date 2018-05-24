package com.example.simpleCRM.repos;

import com.example.simpleCRM.model.DepartmentEntity;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

//CRUD + доп запросы для Department

public interface DepRepo extends CrudRepository<DepartmentEntity, Long> {
    List<DepartmentEntity> findById(Integer id);
}
