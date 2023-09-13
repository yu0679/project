package com.example.project_sample.config;

import javax.sql.DataSource;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@EnableWebSecurity
@Configuration
public class SecurityConfiguration extends WebSecurityConfigurerAdapter  {

        
        @Autowired
        private DataSource dataSource;

        @Override
        protected void configure(HttpSecurity http) throws Exception {

                http
                                .cors().disable() // cors방지
                                .csrf().disable() // csrf방지
                                .formLogin().disable() // 기본 로그인 페이지 없애기
                                .headers().frameOptions().disable();
                
                http
                                .csrf().disable() // csrf 토큰 비활성화 (테스트시 걸어두는게 좋음)
                                .authorizeRequests() // request가 들어오면
                                .antMatchers("/manager/**").authenticated() // 여기로 들어오면
                                .anyRequest().permitAll() // 모두 가능 (누구나 가능)
                                .and()
                                .formLogin()
                                .loginPage("/manager/man_login_Form")

                                .loginProcessingUrl("/manager/man_login")// 로그인 주소가 호출이 되면 시큐리티가 대신 로그인을 진행
                                .usernameParameter("username") // 사용자 이름 필드 이름
                                .passwordParameter("password") // 비밀번호 필드 이름
                                .defaultSuccessUrl("/main")
                                .permitAll()
                                .and()
                                .logout()
                                .permitAll();

        }

        public void configureGlobal(AuthenticationManagerBuilder auth)
                        throws Exception {
                auth.jdbcAuthentication()
                                .dataSource(dataSource)
                                .passwordEncoder(encodePWD())
                                .usersByUsernameQuery("select mem_idx,mem_pwd,mem_distinguish "
                                                + "from member "
                                                + "where mem_idx = ?")

                                .authoritiesByUsernameQuery("select mem_idx,name "
                                                + "from mem_role mr inner join member m on mr.member_idx = m.idx "
                                                + "inner join role r on mr.role_id = r.id "
                                                + "where email = ?");
        }

        @Bean
        public PasswordEncoder encodePWD() {
                return new BCryptPasswordEncoder(); // 이 객체를 스프링이 관리하게 됨. 필요할 때마다 가져가서 쓰면 된다.
        }



    @Test
    public void 해쉬_암호화화() {
        String encPassword = new BCryptPasswordEncoder().encode("1234");
        System.out.println("1234 해쉬 : " + encPassword);
    }

}