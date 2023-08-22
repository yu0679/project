package com.example.project_sample.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

    @RequestMapping("/main")
    public String mainView(){

        return "main";
    }


    @RequestMapping("member/login")
    public String test(){

        return "/member/login";
    }

}
