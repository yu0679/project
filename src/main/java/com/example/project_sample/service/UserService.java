package com.example.project_sample.service;


import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.project_sample.dao.member.MemberDao;
import com.example.project_sample.vo.member.MemberVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserService implements UserDetailsService{
    
    SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:sss");
    Date time = new Date();
    String localTime = format.format(time);
                    //UserMapper  = MemberDao
    private final MemberDao memberDao;

   

    @Override
    public MemberVo loadUserByUsername(String mem_id) throws UsernameNotFoundException {
        //여기서 받은 유저 패스워드와 비교하여 로그인 인증
        MemberVo memberVo = memberDao.selectOne(mem_id);
        if (memberVo == null){
            throw new UsernameNotFoundException("User not authorized.");
        }
          // "mem_distinguish" 칼럼 값이 "관리자"가 아닌 경우에는 예외를 던집니다.
        if (!"관리자".equals(memberVo.getMem_distinguish())) {
            throw new UsernameNotFoundException("User is not an administrator.");
        }
        return memberVo;
    }


     @Transactional
    public void joinUser(MemberVo memberVo){
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        memberVo.setMem_pwd(passwordEncoder.encode(memberVo.getPassword()));
        memberVo.setMem_distinguish("관리자");
        memberDao.insert(memberVo);
    }
    
}