package com.example.project_sample.controller.member;

import com.example.project_sample.dao.member.MemberDao;
import com.example.project_sample.vo.member.EmailMessage;
import com.example.project_sample.vo.member.KakaoInfo;
import com.example.project_sample.vo.member.MemberVo;
import com.example.project_sample.vo.member.OAuthToken;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import java.io.IOException;
import java.util.UUID;

@Controller
public class LoginController {

    @Autowired
    MemberDao dao;

    @Autowired
    private PasswordEncoder pwEncoder;

    @RequestMapping("/auth/kakao/callback")
    @ResponseBody
    public Object kakaoLogin(String code){

        //POST 방식으로 key=value 데이터를 요청(카카오쪽으로)
        RestTemplate rt = new RestTemplate();

        //HttpHeader 오브젝트 생성
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-type","application/x-www-form-urlencoded");

        //HttpBody 오브젝트 생성
        MultiValueMap params = new LinkedMultiValueMap();
        params.add("grant_type","authorization_code");
        params.add("client_id","45363921b94e89ad85c5b8a819f45a4a");
        params.add("redirect_uri","http://localhost:9090/auth/kakao/callback");
        params.add("code",code);

        //HttpHeader와 HttpBody를 하나의 오브젝트에 담기
        HttpEntity<MultiValueMap<String,String>> kakaoTokenRequest =
        new HttpEntity<>(params,headers);

        //Http 요청하기 - post 방식, response 변수의 응답 받음
        ResponseEntity response = rt.exchange(
                "https://kauth.kakao.com/oauth/token",
                HttpMethod.POST,
                kakaoTokenRequest,
                String.class
        );

        //Gson, Json Simple, ObjectMapper
        ObjectMapper objectMapper = new ObjectMapper();
        OAuthToken oautToken = null;

        try {
            oautToken = objectMapper.readValue((String) response.getBody(),OAuthToken.class);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        //POST 방식으로 key=value 데이터를 요청(카카오쪽으로)
        RestTemplate rt2 = new RestTemplate();

        //HttpHeader 오브젝트 생성
        HttpHeaders headers2 = new HttpHeaders();
        headers2.add("Authorization","Bearer "+oautToken.getAccess_token());
        headers2.add("Content-type","application/x-www-form-urlencoded");

        //HttpHeader와 HttpBody를 하나의 오브젝트에 담기
        HttpEntity<MultiValueMap<String,String>> kakaoProfileRequest =
                new HttpEntity<>(headers2);

        //Http 요청하기 - post 방식, response 변수의 응답 받음
        ResponseEntity response2 = rt2.exchange(
                "https://kapi.kakao.com/v2/user/me",
                HttpMethod.POST,
                kakaoProfileRequest,
                String.class
        );



        //Gson, Json Simple, ObjectMapper
        ObjectMapper objectMapper2 = new ObjectMapper();
        KakaoInfo kakaoInfo = null;

        try {
            kakaoInfo = objectMapper2.readValue((String) response2.getBody(),KakaoInfo.class);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }


        UUID tempPwd = UUID.randomUUID();


        MemberVo vo = new MemberVo();
        String encodepwd = null;

        vo.setMem_id(String.valueOf(kakaoInfo.getId()));

        MemberVo user = dao.selectOne(vo.getMem_id());

        if (user==null) {


            if (kakaoInfo.kakao_account.profile.profile_image_url.equals("http://k.kakaocdn.net/dn/dpk9l1/btqmGhA2lKL/Oz0wDuJn1YV2DIn92f6DVK/img_640x640.jpg")) {
                vo.setMem_photo(null);
            } else {
                vo.setMem_photo(kakaoInfo.kakao_account.profile.profile_image_url);
            }

            if (kakaoInfo.kakao_account.getEmail() != null) vo.setMem_email(kakaoInfo.kakao_account.getEmail());

            vo.setMem_nickname(kakaoInfo.properties.getNickname());
            vo.setMem_name(kakaoInfo.properties.getNickname());

            encodepwd = pwEncoder.encode(tempPwd.toString());
            vo.setMem_pwd(encodepwd);
            vo.setMem_distinguish("normal");
            vo.setMem_phone(null);
            vo.setMem_addr(null);
            vo.setMem_partner(null);
            vo.setMem_zipcode(0);

            dao.insert(vo);

        } else {
          return "기존 회원";
        }







        return "회원가입 완료";
    }

}
