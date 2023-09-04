package com.example.project_sample.controller.manager;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manager")
public class ManagerController {


    //관리자 메인
    @RequestMapping("/main")
    public String ManagerMain(){

        return "manager/managerMain";
    }
    //문의 내역
    @RequestMapping("/question_list")
    public String question_list(){

        return "manager/question_list";
    }

    //캘린더
    @RequestMapping("/calendar")
    public String calendar(){

        return "manager/calendar";
    }



}
