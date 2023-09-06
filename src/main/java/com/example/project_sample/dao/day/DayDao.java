package com.example.project_sample.dao.day;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.project_sample.vo.day.DayVo;


@Mapper
public interface DayDao {
    
    List<DayVo> selectList();//전체조회

    
    int insert(DayVo vo);

    int update(DayVo vo);

    int delete(int d_idx);


    DayVo dayPlus(DayVo vo);



    

}
