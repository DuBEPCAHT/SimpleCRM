package com.example.sweater.repos;

import com.example.sweater.domain.DepartmentEntity;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface DepRepo extends CrudRepository<DepartmentEntity, Long> {
    List<DepartmentEntity> findById(Integer id);
}
