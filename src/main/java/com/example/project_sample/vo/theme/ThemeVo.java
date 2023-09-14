package com.example.project_sample.vo.theme;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("themevo")
@Getter
@Setter
public class ThemeVo {
    int t_idx;
    String t_name;
    int mem_idx;
    int b_idx;
}
