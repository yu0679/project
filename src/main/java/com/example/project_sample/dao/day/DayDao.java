package com.example.project_sample.dao.day;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.project_sample.vo.day.DayVo;


@Mapper
public interface DayDao {
    
    int dayinsert(DayVo vo);

    DayVo recentData();

    // int recent_onIdx_Data();

    List<DayVo> recent_d_idx_Data();


    

}
