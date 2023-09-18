package com.example.project_sample.dao.day;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.project_sample.vo.day.DayVo;


@Mapper
public interface DayDao {
    
    int dayinsert(DayVo vo);

    DayVo recentData();

    // int recent_onIdx_Data();

    List<DayVo> recent_d_idx_Data();

    int day_memo_insert(Map<String, Object> map);

    DayVo recentMemoData();



    

}
