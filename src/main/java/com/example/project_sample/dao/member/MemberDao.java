package com.example.project_sample.dao.member;

import com.example.project_sample.vo.member.MemberVo;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface MemberDao {


    List <MemberVo> selectList();

    //일반회원의 리스트만 가져오기
    List <MemberVo> selectNormalList();


    
    String checkId(String memId);

    String checkNickname(String memNickname);

    int insert(MemberVo vo);

    //로그인
    MemberVo selectOne(String mem_id);

    MemberVo searchPartner(String mem_code);

    void changePwd(String mem_id, String pwd);

    MemberVo searchIdByPhone(Map userInfo);

    MemberVo searchIdByEmail(Map userInfo);

    MemberVo searchPwdByPhone(Map userInfo);

    MemberVo searchPwdByEmail(Map userInfo);

    int changePointandPartner (Map map);

    int modify(MemberVo vo);

    List<MemberVo> checkingCeoList();

    MemberVo selectByIdx(int mem_idx);

    int modifyCeo(MemberVo ceo);

    int deleteCeo(MemberVo ceo);

    int deleteMember(int mem_idx);
}
