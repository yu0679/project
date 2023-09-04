package com.example.project_sample.vo.accommodation;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class KakaoPayReadyVO {

    String tid;
    String next_redirect_app_url;
    String next_redirect_mobile_url;
    String next_redirect_pc_url;
    String anodroid_app_scheme;
    String ios_app_scheme;
    String create_at;

}
