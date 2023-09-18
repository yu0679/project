package com.example.project_sample.controller.member;


import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.project_sample.dao.member.MemberDao;
import com.example.project_sample.service.EmailService;
import com.example.project_sample.vo.member.EmailMessage;
import com.example.project_sample.vo.member.MemberVo;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

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
    public String login() {

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
        MemberVo user = dao.selectOne(mem_id);

        Map map = new HashMap();

        if (id != null&& user.getMem_withdrawalDate().isEmpty()==true) {
            map.put("result", false);
        } else if(id != null && user.getMem_withdrawalDate().isEmpty()==false) {
            map.put("result", "withdrawal");
        }else {
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

    @RequestMapping("/search_partner")
    @ResponseBody
    public Map search_partner(String mem_partner) {

        System.out.println(mem_partner);

        Map map = new HashMap();

        MemberVo partner = dao.searchPartner(mem_partner);

        if (partner == null) {
            map.put("result", "null");
        } else if (partner.getMem_partner()==null){
            map.put("result", "confirmed");
        } else {
            map.put("result", "exist");
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

        vo.setMem_phone(vo.getMem_phone().replaceAll(",", "-"));


        String encodepwd = pwEncoder.encode(vo.getMem_pwd());
        vo.setMem_pwd(encodepwd);

        vo.setMem_root("web");
        vo.setMem_code(emailService.createRandomPwd());

        if (vo.getMem_distinguish().equals("ceo")) {  // 사업자 가입
            vo.setMem_point(0);
            vo.setMem_code(null);
            vo.setMem_state("checking");

            int res = dao.insert(vo);

            if (res == 0) {
                System.out.println("failed");
            }

            return "member/ceo_join_msg";

        } else if (vo.getMem_distinguish().equals("normal") && vo.getMem_partner().isEmpty()) {   // 일반회원 가입(파트너 없음)
            vo.setMem_point(3000);

        } else if (vo.getMem_distinguish().equals("normal") && !vo.getMem_partner().isEmpty()) {  //파트너 있음

            vo.setMem_point(5000);

            MemberVo partner = dao.searchPartner(vo.getMem_partner());

            Map partnerInfo = new HashMap();
            partnerInfo.put("mem_point", partner.getMem_point() + 2000);
            partnerInfo.put("mem_partner", vo.getMem_id());
            partnerInfo.put("mem_idx", partner.getMem_idx());

            dao.changePointandPartner(partnerInfo);

            vo.setMem_partner(partner.getMem_id());

        }


        int res = dao.insert(vo);

        if (res == 0) {
            System.out.println("failed");
        }

        return "member/complete_join";
    }


    //로그인
    @RequestMapping("/login.do")
    @PostMapping
    public String login(String mem_id, String mem_pwd, @RequestParam(name = "url", defaultValue = "") String url, RedirectAttributes ra) {

        MemberVo user = dao.selectOne(mem_id);

        String encodePwd;

        if (user == null) {
            ra.addAttribute("reason", "wrong_id");     //id가 존재하지 않을 경우
            return "redirect:login";
        } else if(user.getMem_withdrawalDate()==null) {
            encodePwd = user.getMem_pwd();
            if ((pwEncoder.matches(mem_pwd, encodePwd) && user.getMem_distinguish().equals("normal")) || user.getMem_distinguish().equals("관리자")) {
                user.setMem_pwd("");
                session.setAttribute("user", user);
                return "redirect:../main";
            } else if (user.getMem_distinguish().equals("ceo")&& user.getMem_state().equals("y")) {
                return "redirect:../acc_list.do";
            } else if (pwEncoder.matches(mem_pwd, encodePwd) && user.getMem_state().equals("checking")) {
                ra.addAttribute("reason", "checking");    //승인 요청중인 회원일 경우
                return "redirect:login";
            } else {
                ra.addAttribute("reason", "wrong_pwd");   //비밀번호가 다를 경우
                return "redirect:login";
            }
        }else {
                ra.addAttribute("reason", "withdrawal");    //탈퇴 회원
                return "redirect:login";
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


        Map userInfo = new HashMap<>();

        userInfo.put("mem_name", mem_name);
        userInfo.put("mem_phone", mem_phone);


        MemberVo vo = dao.searchIdByPhone(userInfo);
        Map map = new HashMap<>();


            map.put("resId", vo.getMem_id());
            map.put("resName", vo.getMem_name());
            map.put("resRegidate", vo.getMem_regidate());



        return map;
    }


    //이메일 주소로 아이디 찾기
    @ResponseBody
    @PostMapping("/searchIdByEmail")
    public Map searchIdByEmail(String mem_name, String mem_email) {

        Map userInfo = new HashMap<>();

        userInfo.put("mem_name", mem_name);
        userInfo.put("mem_email", mem_email);


        MemberVo vo = dao.searchIdByEmail(userInfo);


        Map map = new HashMap<>();

        map.put("resId", vo.getMem_id());
        map.put("resName", vo.getMem_name());
        map.put("resRegidate", vo.getMem_regidate());

        return map;
    }


    //휴대폰 번호로 비밀번호 찾기
    @ResponseBody
    @PostMapping("/searchPwdByPhone")
    public Map searchPwdByPhone(String mem_name, String mem_phone, String mem_id) throws CoolsmsException {


        String phone1 = mem_phone.substring(0, 3);
        String phone2 = mem_phone.substring(3, 7);
        String phone3 = mem_phone.substring(7, 11);


        mem_phone = phone1 + "-" + phone2 + "-" + phone3;


        Map userInfo = new HashMap<>();

        userInfo.put("mem_name", mem_name);
        userInfo.put("mem_phone", mem_phone);
        userInfo.put("mem_id", mem_id);


        MemberVo vo = dao.searchPwdByPhone(userInfo);

        Map map = new HashMap<>();


        String api_key = "NCSM3THYTSTGQHHC";
        String api_secret = "TPMADJNL20GNVCDHZU3YEV076B0JKJNC";
        Message coolsms = new Message(api_key, api_secret);

        String pwd = emailService.createRandomPwd();


        String encodepwd = pwEncoder.encode(pwd);

        Map changePwd = new HashMap<>();

        changePwd.put("pwd", pwd);
        changePwd.put("mem_id", mem_id);

        dao.changePwd(changePwd);
        vo.setMem_pwd(encodepwd);


        HashMap<String, String> params = new HashMap<String, String>();

        params.put("to", mem_phone);
        params.put("from", "010-9231-8717");
        params.put("type", "SMS");
        params.put("text", vo.getMem_name() + "님의 임시 비밀번호입니다.\n\n" + pwd + "\n\n마이페이지에서 비밀번호 수정이 가능합니다.");

        JSONObject result = coolsms.send(params); // 보내기&전송결과받기

        map.put("resName", vo.getMem_name());
        map.put("resPhone", vo.getMem_phone());

        return map;
    }


    //이메일로 비밀번호 찾기
    @ResponseBody
    @PostMapping("/searchPwdByEmail")
    public Map searchPwdByEmail(String mem_name, String mem_id, String mem_email) {

        Map userInfo = new HashMap<>();

        userInfo.put("mem_name", mem_name);
        userInfo.put("mem_id", mem_id);
        userInfo.put("mem_email", mem_email);


        MemberVo vo = dao.searchPwdByEmail(userInfo);

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

    @RequestMapping("/modify_form")
    public String modifyForm() {



        return "mypage/modifyForm";
    }


    @RequestMapping("/modify")
    @PostMapping
    public String modify(MemberVo vo, @RequestParam(name = "photo") MultipartFile photo, Model model)
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

        vo.setMem_phone(vo.getMem_phone().replaceAll(",", "-"));


        if(vo.getMem_root().equals("normal")) {
            String encodepwd = pwEncoder.encode(vo.getMem_pwd());
            vo.setMem_pwd(encodepwd);
        } else {
            MemberVo user = dao.selectByIdx(vo.getMem_idx());

            vo.setMem_pwd(user.getMem_pwd());
        }


        if(vo.getMem_partner()==null){
            MemberVo user = dao.selectByIdx(vo.getMem_idx());
            vo.setMem_partner(user.getMem_partner());
        }
        else {
            vo.setMem_point(vo.getMem_point() + 2000);

            MemberVo partner = dao.searchPartner(vo.getMem_partner());

            Map partnerInfo = new HashMap();
            partnerInfo.put("mem_point", partner.getMem_point() + 2000);
            partnerInfo.put("mem_partner", vo.getMem_code());
            partnerInfo.put("mem_idx", partner.getMem_idx());

            dao.changePointandPartner(partnerInfo);
        }


        int res = dao.modify(vo);

        if (res == 0) {
            System.out.println("failed");
        }

        return "member/complete_modify";
    }

    @RequestMapping("/deleteMember")
    public String deleteMember(int mem_idx) {

        int res = dao.deleteMember(mem_idx);
        session.removeAttribute("user");

        return "redirect:../main";
    }


}
