package com.example.project_sample.dao.accommodation;

import org.apache.ibatis.annotations.Mapper;

import com.example.project_sample.vo.accommodation.Acc_PhotoVo;

@Mapper
public interface Acc_PhotoDao {

    int insert(Acc_PhotoVo photoVo);
    
}
