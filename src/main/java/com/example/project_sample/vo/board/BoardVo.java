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
    String b_hashtag; //해쉬태그 추가 (08/21)
    int day_idx;
    int mem_idx;
}
