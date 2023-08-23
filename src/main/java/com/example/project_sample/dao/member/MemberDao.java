package com.example.project_sample.dao.member;

import com.example.project_sample.vo.member.MemberVo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDao {

    String checkId(String mem_id);

    String checkNickname(String mem_nickname);

    int insert(MemberVo vo);
}
