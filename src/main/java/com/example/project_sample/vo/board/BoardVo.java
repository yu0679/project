package com.example.project_sample.vo.board;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("boardvo")
@Getter
@Setter
public class BoardVo {
    int b_idx;
    String b_subject;
    String b_ip;
    String b_start;
    String b_end;
    String b_main_photo;
    String b_content;
    int b_good;
    int b_hit;   //조회수
    int d_idx;
    int d_num;
    int t_idx;
    String t_name;
    int p_idx;
    int memo_idx;
    int mem_idx;

    //ThemeVo t_sum;

}


