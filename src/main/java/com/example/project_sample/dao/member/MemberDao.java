package com.example.project_sample.dao.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.project_sample.vo.member.MemberVo;

@Mapper
public interface MemberDao {


    List <MemberVo> selectList();

    //일반회원의 리스트만 가져오기
    List <MemberVo> selectNormalList();

    
    //CEO회원의 리스트만 가져오기
    List <MemberVo> selectCeoList();

    //숙소 승인 대기중인 CEO 리스트 가져오기
    List <MemberVo> selectCeo_acc_state_n_list();


    //총 일반 이용자수
    int selectNormalCount();
    //총 ceo 이용자수
    int selectCeoCount();


   





    
    String checkId(String memId);

    String checkNickname(String memNickname);

    int insert(MemberVo vo);

    //로그인
    MemberVo selectOne(String mem_id);

    MemberVo searchPartner(String mem_code);

    void changePwd(Map changePwd);

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
