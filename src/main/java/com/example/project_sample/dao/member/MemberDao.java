package com.example.project_sample.dao.member;

import com.example.project_sample.vo.member.MemberVo;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface MemberDao {


    List <MemberVo> selectList();
    
    String checkId(String memId);

    String checkNickname(String memNickname);

    int insert(MemberVo vo);

    MemberVo selectOne(String mem_id);

    MemberVo searchPartner(String mem_code);

    void changePwd(String mem_id, String pwd);

    MemberVo searchIdByPhone(Map userInfo);

    MemberVo searchIdByEmail(Map userInfo);

    MemberVo searchPwdByPhone(Map userInfo);

    MemberVo searchPwdByEmail(Map userInfo);

    int changePointandPartner (Map map);

    int modify(MemberVo vo);

}
