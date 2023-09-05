package com.example.project_sample.controller.manager;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.project_sample.dao.cs.QuestionDao;
import com.example.project_sample.dao.member.MemberDao;
import com.example.project_sample.vo.member.MemberVo;

@Controller
@RequestMapping("/manager")
public class ManagerController {

    @Autowired
    HttpServletRequest request;

    @Autowired
	HttpSession session;

    MemberDao memberdao;
    QuestionDao questionDao;

    
    public ManagerController(MemberDao memberdao, QuestionDao questionDao) {
        this.memberdao = memberdao;
        this.questionDao = questionDao;
    }

    //매니저 메인
    @RequestMapping("/main")
    public String ManagerMain(){

        return "manager/managerMain";
    }

    //일반 회원 목록
	@RequestMapping("/member_list")
	public String list(Model model) {

		List <MemberVo> list = memberdao.selectList();
		
		//request binding
		model.addAttribute("list", list);
		
		return "manager/member_list";
	}




    //캘린더
    @RequestMapping("/calendar")
    public String calendar(){

        return "manager/calendar";
    }



}

