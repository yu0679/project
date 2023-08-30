package com.example.project_sample.vo.place;

import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;
import org.springframework.web.bind.annotation.RequestParam;

@Getter
@Setter
@Alias("placevo")
public class PlaceVo {
    int p_idx;
    String p_name;
    String p_category;
    String p_addr;
    String p_lat;
    String p_log;
    String p_exp;
    int mem_idx;
    int memo_idx;

}
