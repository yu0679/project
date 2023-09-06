package com.example.project_sample.vo.place;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Alias("placevo")
public class PlaceVo {
    int p_idx;

    String p_name;
    String p_addr;
    String p_lat;
    String p_log;
  

    int mem_idx;
    int memo_idx;

}
