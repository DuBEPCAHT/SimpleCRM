package com.example.sweater.controller;

import com.example.sweater.domain.DepartmentEntity;
import com.example.sweater.domain.UserEntity;
import com.example.sweater.repos.DepRepo;
import com.example.sweater.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


@RestController
public class RESTuserController {
    @Autowired
    UserRepo userRepo;

    @Autowired
    DepRepo depRepo;

    @RequestMapping(value = "restAllUsers", method = RequestMethod.GET)
    public List<UserEntity> restAllUsers(){
        List<UserEntity> users = userRepo.findAll();
        int x = users.size();
        return users;
    }

    @RequestMapping(value = "restAllDepartments", method = RequestMethod.GET)
    public Iterable<DepartmentEntity> restAddDepartments(){
        Iterable<DepartmentEntity> departments = depRepo.findAll();
        return departments;
    }

    @RequestMapping(value = "restDelDepartment", method = RequestMethod.POST)
    public DepartmentEntity delDepartment(@RequestParam Integer id){
        Iterable<DepartmentEntity> departments = depRepo.findById(id);
        for (DepartmentEntity d: departments){
            List<UserEntity> users = userRepo.findByCodeDepartment(d);
            for(UserEntity u: users){
                u.setCodeDepartment(null);
                userRepo.save(u);
            }
            depRepo.delete(d);
        }
        return ((List<DepartmentEntity>) departments).get(0);
    }

    @RequestMapping(value = "restAddDepartment", method = RequestMethod.POST)
    public DepartmentEntity addDepartment(@RequestParam String depName,
                                @RequestParam String description){
        DepartmentEntity dep = new DepartmentEntity(depName, description);
        depRepo.save(dep);
        return dep;
    }

    @RequestMapping(value="rest_find_user_by_id", method = RequestMethod.POST)
    public Iterable<UserEntity> filter(@RequestParam Integer id) {
        Iterable<UserEntity> users = userRepo.findById(id);
        return users;
    }

    @RequestMapping(value = "rest_del_user", method = RequestMethod.POST)
    public Iterable<UserEntity> delete(@RequestParam Integer id){
        Iterable<UserEntity> users;

        if(id != null){
            users = userRepo.findById(id);
            for (UserEntity u: users) {
                userRepo.delete(u);
            }
        } else {
            users = null;
        }

        return users;
    }
}
