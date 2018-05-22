package com.example.sweater.controller;

import com.example.sweater.domain.DepartmentEntity;
import com.example.sweater.domain.UserEntity;
import com.example.sweater.repos.DepRepo;
import com.example.sweater.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Controller
public class MainController {
    @Autowired
    private UserRepo userRepo;

    @Autowired
    private DepRepo depRepo;

    @GetMapping("/")
    public String main() {
        return "home";
    }

    @GetMapping("main")
    public String mainRedirect(Model model) {
        showContent(model);
        return "main";
    }

    @GetMapping("google")
    public String google(Model model){
        showContent(model);
        return "main";
    }

    @GetMapping("rest")
    public String restPage(){
        return "rest";
    }

    @GetMapping("goToMain")
    public String goToMainPage(Model model){
        showContent(model);
        return "main";
    }

    @PostMapping("addUser")
    public String add(@RequestParam String firstName,
                      @RequestParam String lastName,
                      @RequestParam String middleName,
                      @RequestParam String date,
                      @RequestParam String codeDepartment,
                      Model model) {

        if(!codeDepartment.isEmpty()) {
            Iterable<DepartmentEntity> de = depRepo.findById(Integer.parseInt(codeDepartment));
            for (DepartmentEntity d : de) {
                UserEntity userEntity = new UserEntity(firstName, lastName, middleName, date);
                userEntity.setCodeDepartment(d);
                userRepo.save(userEntity);
            }
        } else {
            UserEntity userEntity = new UserEntity(firstName, lastName, middleName, date);
            userRepo.save(userEntity);
        }

        showContent(model);
        return "main";
    }

    @PostMapping("addDepartment")
    public String addDepartment(@RequestParam String depName,
                                @RequestParam String description,
                                Model model){
        depRepo.save(new DepartmentEntity(depName, description));

        showContent(model);
        return "main";
    }

    @PostMapping("find_by_id")
    public String filter(@RequestParam Integer id, Model model) {
        Iterable<UserEntity> users;

        if (id != null) {
            users = userRepo.findById(id);
        } else {
            users = userRepo.findAll();
        }

        model.addAttribute("users", users);

        Iterable<DepartmentEntity> departments = depRepo.findAll();
        model.addAttribute("departments", departments);
        return "main";
    }

    @PostMapping("del")
    public String delete(@RequestParam Integer id, Model model){
        Iterable<UserEntity> users;
        String idToString = id.toString();

        if(id != null){
            users = userRepo.findById(id);
            for (UserEntity u: users) {
                userRepo.delete(u);
            }
        }

        showContent(model);
        return "main";
    }

        @PostMapping("delDepartment")
        public String delDepartment(@RequestParam Integer id, Model model){
            Iterable<DepartmentEntity> departments = depRepo.findById(id);
            for (DepartmentEntity d: departments){
                List<UserEntity> users = userRepo.findByCodeDepartment(d);
                for(UserEntity u: users){
                    u.setCodeDepartment(null);
                    userRepo.save(u);
                }
                depRepo.delete(d);
            }


            showContent(model);
            return "main";
        }

    @PostMapping("setDepartmentForUser")
    public String setDepartmentForUser(@RequestParam Integer idUser,
                                       @RequestParam Integer idDep,
                                       Model model){
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

        showContent(model);
        return "main";
    }

    @PostMapping("find_by_department")
    public String findByDepartment(@RequestParam String nameDep,
                                   Model model){

        Iterable<UserEntity> users = userRepo.findByDepartment(nameDep);
        model.addAttribute("users", users);

        Iterable<DepartmentEntity> departments = depRepo.findAll();
        model.addAttribute("departments", departments);

        return "main";
    }

    public void showContent(Model model){
        Iterable<DepartmentEntity> departments = depRepo.findAll();
        Iterable<UserEntity> users = userRepo.findAll();
        model.addAttribute("users", users);
        model.addAttribute("departments", departments);
    }


}
