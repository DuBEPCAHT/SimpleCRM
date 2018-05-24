package com.example.simpleCRM.controller;

import com.example.simpleCRM.repos.DepRepo;
import com.example.simpleCRM.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

//Контролеер для обработки запросов связанных с выдачей jsp

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

    @GetMapping("general")
    public String mainRedirect() {
        return "main";
    }

    @GetMapping("google")
    public String google(){
        return "redirect:/general";
    }

    @GetMapping("rest")
    public String restPage(){
        return "rest";
    }

    @GetMapping("goToMain")
    public String goToMainPage(){
        return "main";
    }



}
