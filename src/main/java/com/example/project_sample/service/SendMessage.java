package com.example.project_sample.service;


import com.example.project_sample.dao.member.MemberDao;
import com.example.project_sample.vo.member.MemberVo;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Random;

@Service
public class SendMessage {

    @Autowired
    MemberDao dao;

    @Autowired
    private PasswordEncoder pwEncoder;

    public void sendSms(String mem_phone, String mem_id)  {
        String api_key = "NCSM3THYTSTGQHHC";
        String api_secret = "TPMADJNL20GNVCDHZU3YEV076B0JKJNC";
        Message coolsms = new Message(api_key, api_secret);

        String pwd = createRandomPwd();
        String encodepwd = pwEncoder.encode(pwd);

        MemberVo vo = dao.selectOne(mem_id);


        dao.changePwd(mem_id,encodepwd);
        vo.setMem_pwd(encodepwd);


        HashMap<String, String> params = new HashMap<String, String>();


        params.put("to", "010-9231-8717");
        params.put("from", mem_phone);
        params.put("type", "SMS");
        params.put("text", pwd);
        params.put("app_version", "test app 1.2");

        try {
            coolsms.send(params);
        } catch (CoolsmsException e) {
            System.out.println("전송 실패");
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



}