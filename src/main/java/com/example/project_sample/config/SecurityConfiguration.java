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
                        .csrf().disable()
                        .authorizeRequests()
                        .antMatchers("/manager/man_login_Form").authenticated()
                        .antMatchers("/manager/**").hasAuthority("관리자")
                                .anyRequest().permitAll()
                                .and()
                        .formLogin()
                                .loginPage("/manager/man_login_Form")
                                .loginProcessingUrl("/manager/man_login")
                                .defaultSuccessUrl("/manager/main")
                                .failureUrl("/manager/man_login_Form")
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