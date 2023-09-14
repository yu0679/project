package com.example.project_sample.vo.memo;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("memovo")
@Getter
@Setter
public class MemoVo {

    int memo_idx;
    String memo_content;
    int d_idx;
    int d_num;
    int mem_idx;
    int b_idx;
}
