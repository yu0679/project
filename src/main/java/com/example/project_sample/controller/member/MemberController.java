package com.example.project_sample.controller.member;


import com.example.project_sample.service.EmailService;
import com.example.project_sample.service.SendMessage;
import com.example.project_sample.vo.member.EmailMessage;
import com.google.inject.spi.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.example.project_sample.dao.member.MemberDao;
import com.example.project_sample.vo.member.MemberVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/member")
public class MemberController {


    MemberDao dao;

    @Autowired
    public EmailService emailService;


    @Autowired
    public MemberController(MemberDao dao) {
        this.dao = dao;
    }


    @Autowired
    private PasswordEncoder pwEncoder;


    @Autowired
    HttpServletRequest request;

    @Autowired
    HttpSession session;


    @Autowired
    ServletContext application;



    @RequestMapping("/login")
    public String login(){

        return "member/member_login";
    }


    @RequestMapping("/join")
    public String test() {

        return "member/join";
    }


    @RequestMapping("/join_ceo")
    public String join_ceo() {

        return "member/join_ceo";
    }


    @RequestMapping("/check_id")
    @ResponseBody
    public Map checkId(String mem_id) {

        String id = dao.checkId(mem_id);

        Map map = new HashMap();

        if (id != null) {
            map.put("result", false);
        } else {
            map.put("result", true);
        }

        return map;
    }


    @RequestMapping("/check_nickname")
    @ResponseBody
    public Map checkNickname(String mem_nickname) {

        String nickname = dao.checkNickname(mem_nickname);

        Map map = new HashMap();

        if (nickname != null) {
            map.put("result", false);
        } else {
            map.put("result", true);
        }

        return map;
    }


    @RequestMapping("/register")
    @PostMapping
    public String register(MemberVo vo, @RequestParam(name = "photo") MultipartFile photo, Model model)
            throws IOException {


        String web_path = "/img/profile-img/";
        String abs_path = application.getRealPath(web_path);

        String mem_photo = "no_file";


        if (mem_photo.isEmpty() == false) {
            mem_photo = photo.getOriginalFilename();
            vo.setMem_photo(mem_photo);
            File f = new File(abs_path, mem_photo);

            if (f.exists()) {
                long tm = System.currentTimeMillis();

                //파일명 -> 시간_파일명
                mem_photo = String.format("%d_%s", tm, mem_photo);
                vo.setMem_photo(mem_photo);
                f = new File(abs_path, mem_photo);

            }

            //임시파일 -> f로 복사
            photo.transferTo(f);
        }

        vo.setMem_addr(vo.getMem_addr().replace(",", " "));
        vo.setMem_phone(vo.getMem_phone().replaceAll(",", "-"));


        String encodepwd = pwEncoder.encode(vo.getMem_pwd());
        vo.setMem_pwd(encodepwd);


        int res = dao.insert(vo);

        if (res == 0) {
            System.out.println("failed");
        }

        return "member/complete_join";
    }


    //로그인
    @RequestMapping("/login.do")
    @PostMapping
    public String login(String mem_id, String mem_pwd, RedirectAttributes ra) {

        MemberVo user = dao.selectOne(mem_id);

        String encodePwd;

        if (user == null) {
            ra.addAttribute("reason", "wrong_id");
            return "redirect:login";
        } else {
            encodePwd = user.getMem_pwd();

            if (pwEncoder.matches(mem_pwd, encodePwd)) {
                user.setMem_pwd("");
                session.setAttribute("user", "user");
                return "redirect:../main";
            } else {
                ra.addAttribute("reason", "wrong_pwd");
                return "redirect:login";
            }
        }


    }


    //로그아웃
    @RequestMapping("/logout")
    public String logout() {
        session.removeAttribute("user");

        return "redirect:../main";
    }


    //아이디, 비밀번호 찾기 폼
    @RequestMapping("/find_idPwd")
    public String find_Id() {

        return "member/find_idPwd";
    }


    //휴대폰 번호로 아이디 찾기
    @ResponseBody
    @PostMapping("/searchIdByPhone")
    public Map searchIdByPhone(String mem_name, String mem_phone) {

        String phone1 = mem_phone.substring(0, 3);
        String phone2 = mem_phone.substring(3, 7);
        String phone3 = mem_phone.substring(7, 11);


        mem_phone = phone1 + "-" + phone2 + "-" + phone3;

        Map map = new HashMap<>();


        MemberVo vo = dao.searchIdByPhone(mem_name, mem_phone);

        map.put("resId", vo.getMem_id());
        map.put("resName", vo.getMem_name());
        map.put("resRegidate", vo.getMem_regidate());

        return map;
    }


    //이메일 주소로 아이디 찾기
    @ResponseBody
    @PostMapping("/searchIdByEmail")
    public Map searchIdByEmail(String mem_name, String mem_email) {

        Map map = new HashMap<>();


        MemberVo vo = dao.searchIdByEmail(mem_name, mem_email);

        map.put("resId", vo.getMem_id());
        map.put("resName", vo.getMem_name());
        map.put("resRegidate", vo.getMem_regidate());

        return map;
    }


    //휴대폰 번호로 비밀번호 찾기
    @ResponseBody
    @PostMapping("/searchPwdByPhone")
    public Map searchPwdByPhone(String mem_name, String mem_phone, String mem_id) {

        String phone1 = mem_phone.substring(0, 3);
        String phone2 = mem_phone.substring(3, 7);
        String phone3 = mem_phone.substring(7, 11);


        mem_phone = phone1 + "-" + phone2 + "-" + phone3;


        Map map = new HashMap<>();

        MemberVo vo = dao.searchPwdByPhone(mem_name, mem_id, mem_phone);

        SendMessage sendMessage = new SendMessage();
        sendMessage.sendSms(vo.getMem_phone(),vo.getMem_id());


        map.put("resName", vo.getMem_name());
        map.put("resPhone", vo.getMem_phone());

        return map;
    }


    //이메일로 비밀번호 찾기
    @ResponseBody
    @PostMapping("/searchPwdByEmail")
    public Map searchPwdByEmail(String mem_name, String mem_id, String mem_email) {

        MemberVo vo = dao.searchPwdByEmail(mem_name, mem_id, mem_email);

        EmailMessage emailMessage = EmailMessage.builder()
                .to(vo.getMem_email())
                .subject("임시 비밀번호 안내입니다.")
                .build();

        emailService.sendMail(emailMessage, "password", vo.getMem_id());


        Map map = new HashMap<>();



        map.put("resName", vo.getMem_name());
        map.put("resEmail", vo.getMem_email());

        return map;
    }


}
