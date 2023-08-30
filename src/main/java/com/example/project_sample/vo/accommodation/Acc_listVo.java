package com.example.project_sample.vo.accommodation;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
@Alias("acc_listvo")
@Getter
@Setter
public class Acc_listVo {
    int acc_list_idx;
    int mem_idx;
    int acc_idx;
}
