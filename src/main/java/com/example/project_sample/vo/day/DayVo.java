package com.example.project_sample.vo.day;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("dayvo")
@Getter
@Setter
public class DayVo {

    int d_idx;
    int d_num;
    String d_date;
    int p_idx;
    int t_idx;
    int acc_idx;
    int b_idx;
    
}
