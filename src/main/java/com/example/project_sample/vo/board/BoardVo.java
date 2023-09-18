package com.example.project_sample.vo.board;

import lombok.Getter;
import lombok.Setter;

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
    int b_hit;   //조회수
    String t_name;

    int d_idx;
    int d_num;

    int p_idx;
    String p_name;
    String p_addr;
    String p_lat;
    String p_log;
    String p_code;

    int memo_idx;
    String memo_content;
    int mem_idx;
    
    // int b_idx;
    // String b_subject;
    // String b_ip;
    // String b_start;
    // String b_end;
    // String b_main_photo;
    // String b_content;
    // int b_good;
    // int b_hit;   //조회수
    // int d_idx;
    // int d_num;
    // int t_idx;
    // String t_name;
    // int p_idx;
    // int memo_idx;
    // int mem_idx;
    // public Object getB_idx;

    //ThemeVo t_sum;

}


