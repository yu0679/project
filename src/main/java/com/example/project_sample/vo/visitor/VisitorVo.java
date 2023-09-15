package com.example.project_sample.vo.visitor;

import lombok.Data;
import org.apache.ibatis.type.Alias;

@Data
@Alias("visitorvo")
public class VisitorVo {
    int visit_idx;
    String visit_ip;
    String visit_time;
}
