package com.example.simpleCRM.controller.REST;

import com.example.simpleCRM.model.DepartmentEntity;
import com.example.simpleCRM.model.UserEntity;
import com.example.simpleCRM.repos.DepRepo;
import com.example.simpleCRM.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


@RestController
public class RESTdepartmentController {
    @Autowired
    UserRepo userRepo;

    @Autowired
    DepRepo depRepo;

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

    @RequestMapping(value = "restSetDepartmentForUser", method = RequestMethod.POST)
    public Iterable<UserEntity> setDepartmentForUser(@RequestParam Integer idUser,
                                                     @RequestParam Integer idDep){
        Iterable<UserEntity> users = userRepo.findById(idUser);
        Iterable<DepartmentEntity> dep = depRepo.findById(idDep);
        for(UserEntity u: users){
            for (DepartmentEntity d: dep){
                u.setCodeDepartment(d);
                userRepo.save(u);
                break;
            }
            break;
        }
        return users;
    }

}
