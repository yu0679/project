package com.example.project_sample.vo.accommodation;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("good_accvo")
@Getter
@Setter
public class Good_accVo {
    int good_acc_idx;
    int acc_idx;
    int mem_idx;
}
