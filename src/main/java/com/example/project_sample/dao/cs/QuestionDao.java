package com.example.project_sample.dao.cs;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.project_sample.vo.cs.QuestionVo;



@Mapper
public interface QuestionDao {
    
    List<QuestionVo> selectList();

    List<QuestionVo> cs_selectConditionList(Map<String,Object> map);
    
    List<QuestionVo> man_selectConditionList(Map<String,Object> map);

    QuestionVo selectOne(int q_idx);
    
    //전체게시물수
    int selectRowTotal(Map<String,Object> map);

    //새글쓰기
    int  insert(QuestionVo vo);

    //답글쓰기
    int  reply(QuestionVo vo);

    //조회수 증가
    int  update_readhit(int q_idx);

    //기준글보다 b_step이 큰게시물의 b_step 1씩 증가
    int update_step(QuestionVo baseVo);
    
    //수정
    int update(QuestionVo vo);

    //삭제
    int delete_update_q_use(int q_idx);
    
    int delete(int q_idx);



}

