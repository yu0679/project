package com.example.project_sample.vo.reply;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("good_rvo")
@Getter
@Setter
public class Good_rVo {
    int good_r_idx;
    int mem_idx;
    int b_idx;
}
