package com.example.project_sample.vo.reply;

import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;
import org.springframework.web.bind.annotation.RequestParam;

@Getter
@Setter
@Alias("replyvo")
public class ReplyVo {
    int reply_idx;
    String reply_content;
    String reply_date;
    String reply_regidate;
    int b_idx;
    int mem_idx;

}
