package com.example.project_sample.dao.member;

import com.example.project_sample.vo.member.MemberVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface MemberDao {
    String checkId(String memId);

    String checkNickname(String memNickname);

    int insert(MemberVo vo);

    MemberVo selectOne(String mem_id);

    void changePwd(String mem_id, String pwd);

    MemberVo searchIdByPhone(Map userInfo);

    MemberVo searchIdByEmail(Map userInfo);

    MemberVo searchPwdByPhone(Map userInfo);

    MemberVo searchPwdByEmail(Map userInfo);
}
