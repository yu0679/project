package com.example.project_sample.controller.member;

import com.example.project_sample.dao.member.MemberDao;
import com.example.project_sample.service.EmailService;
import com.example.project_sample.vo.member.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class LoginController {

    @Autowired
    MemberDao dao;

    @Autowired
    HttpSession session;

    @Autowired
    EmailService emailService;

    @Autowired
    private PasswordEncoder pwEncoder;

    @Value("${oauth.key}")
    private String oauthKey;

    @RequestMapping("/auth/kakao/callback")
    public String kakaoLogin(String code, Model model, RedirectAttributes ra) {


        //POST 방식으로 key=value 데이터를 요청(카카오쪽으로)
        RestTemplate rt = new RestTemplate();

        //HttpHeader 오브젝트 생성
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-type", "application/x-www-form-urlencoded");


        //HttpBody 오브젝트 생성
        MultiValueMap params = new LinkedMultiValueMap();
        params.add("grant_type", "authorization_code");
        params.add("client_id", "45363921b94e89ad85c5b8a819f45a4a");
        params.add("redirect_uri", "http://192.168.0.28:9090/auth/kakao/callback");
        params.add("code", code);

        //HttpHeader와 HttpBody를 하나의 오브젝트에 담기
        HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest =
                new HttpEntity<>(params, headers);

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
            oautToken = objectMapper.readValue((String) response.getBody(), OAuthToken.class);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        //POST 방식으로 key=value 데이터를 요청(카카오쪽으로)
        RestTemplate rt2 = new RestTemplate();

        //HttpHeader 오브젝트 생성
        HttpHeaders headers2 = new HttpHeaders();
        headers2.add("Authorization", "Bearer " + oautToken.getAccess_token());
        headers2.add("Content-type", "application/x-www-form-urlencoded");

        //HttpHeader와 HttpBody를 하나의 오브젝트에 담기
        HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest =
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
            kakaoInfo = objectMapper2.readValue((String) response2.getBody(), KakaoInfo.class);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }


        MemberVo vo = new MemberVo();

        vo.setMem_id(String.valueOf(kakaoInfo.getId()));

        MemberVo user = dao.selectOne(vo.getMem_id());

        if (user == null) {


            if (kakaoInfo.kakao_account.profile.profile_image_url.equals("http://k.kakaocdn.net/dn/dpk9l1/btqmGhA2lKL/Oz0wDuJn1YV2DIn92f6DVK/img_640x640.jpg")) {
                vo.setMem_photo(null);
            } else {
                vo.setMem_photo(kakaoInfo.kakao_account.profile.profile_image_url);
            }

            if (kakaoInfo.kakao_account.getEmail() != null) vo.setMem_email(kakaoInfo.kakao_account.getEmail());

            vo.setMem_nickname(kakaoInfo.properties.getNickname());
            vo.setMem_name(kakaoInfo.properties.getNickname());

            vo.setMem_pwd(pwEncoder.encode(oauthKey));
            vo.setMem_distinguish("normal");
            vo.setMem_phone(null);
            vo.setMem_partner(null);
            vo.setMem_root("kakao");
            vo.setMem_code(emailService.createRandomPwd());
            vo.setMem_point(3000);


            int res = dao.insert(vo);


            System.out.println("회원가입 완료");

            user = dao.selectOne(vo.getMem_id());

            session.setAttribute("user", user);
            return "redirect:../../main";
        }

        // 로그인 처리
        String encodePwd = pwEncoder.encode(user.getMem_pwd());

        if (pwEncoder.matches(user.getMem_pwd(), encodePwd) && user.getMem_withdrawalDate()==null) {
            user.setMem_pwd("");
            session.setAttribute("user", user);
            System.out.println("로그인 완료");
        } else {
            ra.addAttribute("reason", "withdrawal");    //탈퇴 회원
            return "redirect:../../member/login";
        }
        return "redirect:../../main";
    }


    @RequestMapping("/auth/naver/callback")
    public String getAccessToken(String code, String state, Model model, RedirectAttributes ra) throws JsonProcessingException, NoSuchFieldException {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
        body.add("grant_type", "authorization_code");
        body.add("client_id", "2hoie656b8eIovgqA1i_");
        body.add("client_secret", "kb0rYvgcUs");
        body.add("code", code);
        body.add("state", state);

        HttpEntity<MultiValueMap<String, String>> naverTokenRequest =
                new HttpEntity<>(body, headers);
        RestTemplate rt = new RestTemplate();
        ResponseEntity<String> response = rt.exchange(
                "https://nid.naver.com/oauth2.0/token",
                HttpMethod.POST,
                naverTokenRequest,
                String.class);

        // HTTP 응답 (JSON) -> 액세스 토큰 파싱
        String responseBody = response.getBody();
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode jsonNode = objectMapper.readTree(responseBody);
        String accessToken = jsonNode.get("access_token").asText();


        //POST 방식으로 key=value 데이터를 요청(카카오쪽으로)
        RestTemplate rt2 = new RestTemplate();

        //HttpHeader 오브젝트 생성
        HttpHeaders headers2 = new HttpHeaders();
        headers2.add("Authorization", "Bearer " + accessToken);
        headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");


        // HTTP 요청 보내기
        HttpEntity<MultiValueMap<String, String>> naverUserInfoRequest = new HttpEntity<>(headers2);
        ResponseEntity<String> response2 = rt2.exchange(
                "https://openapi.naver.com/v1/nid/me",
                HttpMethod.POST,
                naverUserInfoRequest,
                String.class
        );


        //Gson, Json Simple, ObjectMapper
        ObjectMapper objectMapper2 = new ObjectMapper();
        NaverInfo naverInfo = null;

        try {
            naverInfo = objectMapper2.readValue((String) response2.getBody(), NaverInfo.class);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        MemberVo vo = new MemberVo();

        vo.setMem_id(naverInfo.response.getId());


        MemberVo user = dao.selectOne(vo.getMem_id());

        if (user==null) {


            if (naverInfo.response.getProfile_image().equals("https://ssl.pstatic.net/static/pwe/address/img_profile.png")) {
                vo.setMem_photo(null);
            } else {
                vo.setMem_photo(naverInfo.response.getProfile_image());
            }

            if (naverInfo.response.getEmail() != null) vo.setMem_email(naverInfo.response.getEmail());

            vo.setMem_nickname(naverInfo.response.getNickname());
            vo.setMem_name(naverInfo.response.getName());

            vo.setMem_pwd(pwEncoder.encode(oauthKey));
            vo.setMem_distinguish("normal");

            if (naverInfo.response.getMobile() != null) vo.setMem_phone(naverInfo.response.getMobile());
            vo.setMem_partner(null);
            vo.setMem_root("naver");
            vo.setMem_code(emailService.createRandomPwd());
            vo.setMem_point(3000);

            int res = dao.insert(vo);


            System.out.println("회원가입 완료");

            user = dao.selectOne(vo.getMem_id());

            session.setAttribute("user", user);
            return "redirect:../../main";
        }

        // 로그인 처리
        String encodePwd = pwEncoder.encode(user.getMem_pwd());




       if (pwEncoder.matches(user.getMem_pwd(), encodePwd) && user.getMem_withdrawalDate()==null) {
            user.setMem_pwd("");
            session.setAttribute("user", user);
            System.out.println("로그인 완료");
        } else{
            ra.addAttribute("reason", "withdrawal");    //탈퇴 회원
            return "redirect:../../member/login";
        }
        return "redirect:../../main";

    }

}
