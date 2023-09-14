package com.example.project_sample.dao.day;

import org.apache.ibatis.annotations.Mapper;

import com.example.project_sample.vo.day.DayVo;


@Mapper
public interface DayDao {
    
    int dayinsert(DayVo vo);

    DayVo recentData();

    int recent_onIdx_Data();




    

}
