package com.example.project_sample.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.example.project_sample.service.UserService;

import lombok.RequiredArgsConstructor;

@EnableWebSecurity
@Configuration
@RequiredArgsConstructor
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
        private final UserService userService;



        
                @Override
                protected void configure(HttpSecurity http ) throws Exception {
                                        
                        http
                                        .cors().disable() // cors방지
                                        .csrf().disable() // csrf방지
                                        .formLogin().disable() // 기본 로그인 페이지 없애기
                                        .headers().frameOptions().disable();

                        http
                                        .csrf().disable() // csrf 토큰 비활성화 (테스트시 걸어두는게 좋음)
                                        .authorizeRequests() // request가 들어오면
                                        .antMatchers("/manager/**").hasAuthority("관리자") // 여기로 들어오면
                                        .anyRequest().permitAll() // 그 외의 URL에 대해서는 모든 사용자에게 허용
                                        .and()
                                        .formLogin()
                                        .loginPage("/manager/man_login_Form")

                                        .loginProcessingUrl("/manager/man_login" )// 로그인 주소가 호출이 되면 시큐리티가 대신 로그인을 진행
                                        
                                        .defaultSuccessUrl("/manager/main")
                                        .failureUrl("/manager/man_login_Form") // 실패시 url
                                        .permitAll()
                                        .and()
                                        .logout()
                                        .permitAll();
                                
                }


        


        @Override
        public void configure(AuthenticationManagerBuilder auth) throws Exception {
                auth.userDetailsService(userService).passwordEncoder(new BCryptPasswordEncoder());
        }

        @Bean
        public PasswordEncoder encodePWD() {
                return new BCryptPasswordEncoder(); // 이 객체를 스프링이 관리하게 됨. 필요할 때마다 가져가서 쓰면 된다.
        }

}