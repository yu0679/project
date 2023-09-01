package com.example.project_sample.controller.manager;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manager")
public class ManagerController {

    @RequestMapping("/main")
    public String ManagerMain(){

        return "manager/managerMain";
    }



}
