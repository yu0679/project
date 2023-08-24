package com.example.project_sample.dao.member;

import com.example.project_sample.vo.member.MemberVo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDao {
    String checkId(String memId);

    String checkNickname(String memNickname);

    int insert(MemberVo vo);
}
