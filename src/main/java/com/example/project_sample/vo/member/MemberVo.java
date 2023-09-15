package com.example.project_sample.vo.member;

import java.util.Collection;
import java.util.Collections;

import org.apache.ibatis.type.Alias;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;


@Data
@Alias("membervo")
public class MemberVo implements UserDetails {
    int mem_idx;
    String mem_distinguish;
    String mem_photo;
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
    String mem_root;
    String mem_code;
    String mem_state;
    String mem_withdrawalDate;




 @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return Collections.singletonList(new SimpleGrantedAuthority(this.mem_distinguish));
    }

    @Override
    public String getPassword() {
        return this.mem_pwd;
    }

    // 시큐리티의 userName
    // -> 따라서 얘는 인증할 때 id를 봄
    @Override
    public String getUsername() {
        return this.mem_id;
    }

    // Vo의 userName !
    public String getUserName(){
        return this.mem_name;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

}
