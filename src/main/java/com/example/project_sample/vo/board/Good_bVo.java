package com.example.project_sample.vo.board;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("good_bvo")
@Getter
@Setter
public class Good_bVo {
    int good_idx;
    int mem_idx;
    int b_idx;
}
