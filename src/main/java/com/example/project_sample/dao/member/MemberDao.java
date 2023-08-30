package com.example.project_sample.dao.member;

import com.example.project_sample.vo.member.MemberVo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDao {
    String checkId(String memId);

    String checkNickname(String memNickname);

    int insert(MemberVo vo);

    MemberVo selectOne(String mem_id);

    MemberVo searchIdByPhone(String mem_name, String mem_phone);

    MemberVo searchIdByEmail(String mem_name, String mem_email);
}
