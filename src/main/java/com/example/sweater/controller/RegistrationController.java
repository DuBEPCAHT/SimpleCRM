package com.example.sweater.controller;

import com.example.sweater.domain.Role;
import com.example.sweater.domain.UserLogin;
import com.example.sweater.repos.UserLoginRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Collections;

@Controller
public class RegistrationController {
    @Autowired
    UserLoginRepo userLogRepo;

    @GetMapping("registration")
    public String registration(){
        return "registration";
    }

    @PostMapping("registration")
    public String addUser(@RequestParam String username
            ,@RequestParam String password
            ,Model model){

        UserLogin userFromDB = userLogRepo.findByUsername(username);
        if(userFromDB != null){
            model.addAttribute("message", "User exists!");
            return "registration";
        }
        UserLogin user = new UserLogin();
        user.setUsername(username);
        user.setPassword(password);
        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        userLogRepo.save(user);
        return "redirect:/login";
    }


}
