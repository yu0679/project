package com.example.project_sample.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.project_sample.dao.board.BoardDao;
import com.example.project_sample.dao.member.MemberDao;
import com.example.project_sample.dao.visit.VisitCountDao;
import com.example.project_sample.vo.member.MemberVo;

@Service
// @RequiredArgsConstructor
public class UserService implements UserDetailsService {

    @Autowired
    HttpSession session;

    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:sss");
    Date time = new Date();
    String localTime = format.format(time);
    // UserMapper = MemberDao
    private MemberDao memberDao;
    private BoardDao boardDao;
    private VisitCountDao visitcountDao;

    @Autowired
    public UserService(MemberDao memberDao, BoardDao boardDao, VisitCountDao visitcountDao) {
        this.memberDao = memberDao;
        this.boardDao = boardDao;
        this.visitcountDao = visitcountDao;
    }

    @Override
    public MemberVo loadUserByUsername(String mem_id) throws UsernameNotFoundException {
        // 여기서 받은 유저 패스워드와 비교하여 로그인 인증
        MemberVo memberVo = memberDao.selectOne(mem_id);

        if (memberVo == null) {
            throw new UsernameNotFoundException("User not authorized.");
        }
        // "mem_distinguish" 값이 "관리자"인 경우에만 "ROLE_ADMIN" 권한을 부여합니다.
        List<GrantedAuthority> authorities = new ArrayList<>();
        if ("관리자".equals(memberVo.getMem_distinguish())) {
            authorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
        }

        session.setAttribute("admin_user", memberVo);

        // UserDetails 객체를 생성하여 반환합니다.
        return memberVo;
    }

    public int selectNormalCount() {
        return memberDao.selectNormalCount();
    }
    


    public int selectCeoCount() {
        return memberDao.selectCeoCount();
    }

    public int select_B_AllCount() {
        return boardDao.selectAllCount();
    }

    public int todayVisitorCount() {

        return visitcountDao.todayVisitorCount();
    }

    public int monthlyVisitorCount() {

        return visitcountDao.monthlyVisitorCount();
    }
    public int yearlyVisitorCount() {

        return visitcountDao.yearlyVisitorCount();
    }

    @Transactional
    public void joinUser(MemberVo memberVo) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        memberVo.setMem_pwd(passwordEncoder.encode(memberVo.getPassword()));
        memberVo.setMem_distinguish("관리자");
        memberDao.insert(memberVo);
    }

}