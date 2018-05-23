package com.example.sweater.controller.REST;

import com.example.sweater.model.DepartmentEntity;
import com.example.sweater.model.UserEntity;
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


    @RequestMapping(value = "restAddUser", method = RequestMethod.POST)
    public UserEntity add(@RequestParam String firstName,
                      @RequestParam String lastName,
                      @RequestParam String middleName,
                      @RequestParam String date,
                      @RequestParam String codeDepartment) {

        UserEntity userEntity = null;

        if(!codeDepartment.isEmpty()) {
            Iterable<DepartmentEntity> de = depRepo.findById(Integer.parseInt(codeDepartment));
            for (DepartmentEntity d : de) {
                userEntity = new UserEntity(firstName, lastName, middleName, date);
                userEntity.setCodeDepartment(d);
                userRepo.save(userEntity);
            }
        } else {
            userEntity = new UserEntity(firstName, lastName, middleName, date);
            userRepo.save(userEntity);
        }

        return userEntity;
    }

    @RequestMapping(value = "find_by_department", method = RequestMethod.POST)
    public  Iterable<UserEntity> findByDepartment(@RequestParam String nameDep){
        Iterable<UserEntity> users = userRepo.findByDepartment(nameDep);
        return users;
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
