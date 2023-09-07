package com.example.project_sample.dao.cs;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.project_sample.vo.cs.CommentVo;

@Mapper
public interface CommentDao {
   
    List<CommentVo> selectList(Map<String,Object> map);
    
    int             selectRowTotal(Map<String,Object> map);

    int insert(CommentVo vo);
    int delete(int comment_idx);

}
