package com.example.project_sample.vo.member;

import lombok.Data;

@Data
public class NaverInfo {
    public String resultcode;
    public String message;
    public Response response;

   @Data
    public class Response {

        public String id;
        public String nickname;
        public String profile_image;
        public String email;
        public String mobile;
        public String mobile_e164;
        public String name;

    }

}