package com.example.project_sample.vo.member;

import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;
import org.springframework.web.bind.annotation.RequestParam;

@Getter
@Setter
@Alias("membervo")
public class MemberVo {
    int mem_idx;
    String mem_distinguish;
    String mem_id;
    String mem_nickname;
    String mem_pwd;
    String mem_name;
    int mem_zipcode;
    String mem_addr;
    String mem_phone;
    String mem_email;
    String mem_regidate;
    String mem_partner;
    int mem_point;
    String mem_photo;

}
