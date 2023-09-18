package com.example.project_sample.service;

import com.example.project_sample.dao.member.MemberDao;
import com.example.project_sample.vo.member.EmailMessage;
import com.example.project_sample.vo.member.MemberVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.thymeleaf.context.Context;
import org.thymeleaf.spring5.SpringTemplateEngine;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;


@Slf4j
@Service
@RequiredArgsConstructor
public class EmailService {

    @Autowired
    private final JavaMailSender javaMailSender;

    @Autowired
    private final SpringTemplateEngine templateEngine;

    @Autowired
    private PasswordEncoder pwEncoder;

    @Autowired
    MemberDao dao;


    public void sendMail(EmailMessage emailMessage, String type, String mem_id) {
        String pwd = createRandomPwd();

        MemberVo vo = dao.selectOne(mem_id);

        MimeMessage mimeMessage = javaMailSender.createMimeMessage();

        String encodepwd = pwEncoder.encode(pwd);

         Map changePwd = new HashMap<>();
         changePwd.put("pwd", encodepwd);
         changePwd.put("mem_id", vo.getMem_id());
        

        if (type.equals("password")) vo.setMem_pwd(encodepwd);
        dao.changePwd(changePwd);

        try {
            MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, false, "UTF-8");
            mimeMessageHelper.setTo(emailMessage.getTo()); // 메일 수신자
            mimeMessageHelper.setSubject(emailMessage.getSubject()); // 메일 제목
            mimeMessageHelper.setText(setContext(pwd, vo.getMem_name()), true); // 메일 본문 내용, HTML 여부
            javaMailSender.send(mimeMessage);


        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }



    public void sendMailtoCeo(EmailMessage emailMessage, int mem_idx, String rejectmsg) {

        MemberVo vo = dao.selectByIdx(mem_idx);

        MimeMessage mimeMessage = javaMailSender.createMimeMessage();

        try {
            MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, false, "UTF-8");
            mimeMessageHelper.setTo(emailMessage.getTo()); // 메일 수신자
            mimeMessageHelper.setSubject(emailMessage.getSubject()); // 메일 제목
            mimeMessageHelper.setText(setContextForCeo(vo.getMem_id(), rejectmsg), true); // 메일 본문 내용, HTML 여부
            javaMailSender.send(mimeMessage);


        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }



    //회원에게 메일보내기
    public void sendman_mail(EmailMessage emailMessage, int mem_idx, String rejectmsg) {

        MemberVo vo = dao.selectByIdx(mem_idx);

        MimeMessage mimeMessage = javaMailSender.createMimeMessage();

        try {
            MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, false, "UTF-8");
            mimeMessageHelper.setTo(emailMessage.getTo()); // 메일 수신자
            mimeMessageHelper.setSubject(emailMessage.getSubject()); // 메일 제목
            mimeMessageHelper.setText(setContextFor_man_Mail(vo.getMem_id(), rejectmsg), true); // 메일 본문 내용, HTML 여부
            javaMailSender.send(mimeMessage);


        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
    


    public void confirmedMail(EmailMessage emailMessage, int mem_idx) {

        MemberVo vo = dao.selectByIdx(mem_idx);

        MimeMessage mimeMessage = javaMailSender.createMimeMessage();

        try {
            MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, false, "UTF-8");
            mimeMessageHelper.setTo(emailMessage.getTo()); // 메일 수신자
            mimeMessageHelper.setSubject(emailMessage.getSubject()); // 메일 제목
            mimeMessageHelper.setText(confirmedContext(vo.getMem_id()), true); // 메일 본문 내용, HTML 여부
            javaMailSender.send(mimeMessage);


        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }




    public String createRandomPwd(){
        Random random = new Random();
        StringBuffer key = new StringBuffer();

        for (int i = 0; i < 8; i++) {
            int index = random.nextInt(4);

            switch (index) {
                case 0: key.append((char) ((int) random.nextInt(26) + 97)); break;
                case 1: key.append((char) ((int) random.nextInt(26) + 65)); break;
                default: key.append(random.nextInt(9));
            }
        }
        return key.toString();

    }


    private String setContext(String pwd, String name) { // 타임리프 설정하는 코드
        Context context = new Context();
        context.setVariable("pwd", pwd); // Template에 전달할 데이터 설정
        context.setVariable("name", name); // Template에 전달할 데이터 설정
        return templateEngine.process("mail", context); // mail.html
    }


    private String setContextForCeo(String id, String rejectmsg) { // 타임리프 설정하는 코드
        Context context = new Context();
        context.setVariable("id", id); // Template에 전달할 데이터 설정
        context.setVariable("rejectmsg", rejectmsg); // Template에 전달할 데이터 설정
        return templateEngine.process("mailtoCeo", context); // mail.html
    }
    //회원에게 이메일 보내기
    private String setContextFor_man_Mail(String id, String rejectmsg) { // 타임리프 설정하는 코드
        Context context = new Context();
        context.setVariable("id", id); // Template에 전달할 데이터 설정
        context.setVariable("rejectmsg", rejectmsg); // Template에 전달할 데이터 설정
        return templateEngine.process("man_mailtoCeo", context); // mail.html
    }







    private String confirmedContext(String id) { // 타임리프 설정하는 코드
        Context context = new Context();
        context.setVariable("id", id); // Template에 전달할 데이터 설정
        return templateEngine.process("confirmedMail", context); // mail.html
    }


}