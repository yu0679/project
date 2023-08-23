package com.example.project_sample.controller.member;

import com.example.project_sample.dao.member.MemberDao;
import com.example.project_sample.vo.member.MemberVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/member")
public class MemberController {

    MemberDao dao;

    @Autowired
    public MemberController(MemberDao dao) {
        this.dao = dao;
    }


    @Autowired
    HttpServletRequest request;



    @RequestMapping("/join")
    public String join(){

        return "member/join";
    }

    @RequestMapping("/join_ceo")
    public String join_ceo(){

        return "member/join_ceo";
    }



    @RequestMapping("/login")
    public String test(){

        return "member/login";
    }



    @RequestMapping("/check_id")
    @ResponseBody
    public Map checkId(String mem_id){

        String id = dao.checkId(mem_id);

        Map map = new HashMap();

        if (id!=null) {
            map.put("result",false);
        }else {
            map.put("result",true);
        }

        return map;
    }



    @RequestMapping("/check_nickname")
    @ResponseBody
    public Map checkNickname(String mem_nickname){

        String nickname = dao.checkNickname(mem_nickname);

        Map map = new HashMap();

        if (nickname!=null) {
            map.put("result",false);
        }else {
            map.put("result",true);
        }

        return map;
    }



    @RequestMapping("/register")
    public String register(MemberVo vo){

        int res = dao.insert(vo);

        if(res==0) {
            System.out.println("failed");
        }

        return "member/complete";
    }





}
