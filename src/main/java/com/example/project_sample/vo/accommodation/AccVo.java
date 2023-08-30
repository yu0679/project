package com.example.project_sample.vo.accommodation;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
@Alias("accvo")
@Getter
@Setter
public class AccVo {
    int acc_idx;
    String acc_name;
    String acc_location;
    String acc_type;
    String acc_grade;
    int acc_count;
    int acc_person;
    String acc_service;
    String acc_cancle;
    String acc_contect;
    String acc_photo;
    int mem_idx;
}
