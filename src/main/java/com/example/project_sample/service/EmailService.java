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


    public void sendEmail() throws MessagingException {
        String pwd = createRandomPwd(); // 인증코드 생성
        MimeMessage message = javaMailSender.createMimeMessage();

        message.addRecipients(MimeMessage.RecipientType.TO, "987654aaa@naver.com"); // 보낼 이메일 설정
        message.setSubject("임시 비밀번호 안내입니다."); // 이메일 제목
        message.setText(setContext(pwd), "utf-8", "html"); // 내용 설정(Template Process)

        // 보낼 때 이름 설정하고 싶은 경우
        // message.setFrom(new InternetAddress([이메일 계정], [설정할 이름]));

        javaMailSender.send(message); // 이메일 전송


    } //sendEmail end


    public void sendMail(EmailMessage emailMessage, String type, String mem_id) {
        String pwd = createRandomPwd();

        MemberVo vo = dao.selectOne(mem_id);


        MimeMessage mimeMessage = javaMailSender.createMimeMessage();

        String encodepwd = pwEncoder.encode(pwd);

        if (type.equals("password")) vo.setMem_pwd(encodepwd);;
        dao.changePwd(vo.getMem_id(),encodepwd);

        try {
            MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, false, "UTF-8");
            mimeMessageHelper.setTo(emailMessage.getTo()); // 메일 수신자
            mimeMessageHelper.setSubject(emailMessage.getSubject()); // 메일 제목
            mimeMessageHelper.setText(setContext(pwd), true); // 메일 본문 내용, HTML 여부
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


    private String setContext(String pwd) { // 타임리프 설정하는 코드
        Context context = new Context();
        context.setVariable("pwd", pwd); // Template에 전달할 데이터 설정
        return templateEngine.process("mail", context); // mail.html
    }



}