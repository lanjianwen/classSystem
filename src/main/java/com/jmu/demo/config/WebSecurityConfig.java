package com.jmu.demo.config;

import com.jmu.demo.entity.Permission;
import com.jmu.demo.repository.PermissionRepository;
import com.jmu.demo.security.MyPasswordEncoder;
import com.jmu.demo.security.UserDetailsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.configurers.ExpressionUrlAuthorizationConfigurer;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;


@Configuration
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
   @Autowired
   private UserDetailsServiceImpl userDetailsServiceImpl;
    @Autowired
    private PermissionRepository permissionRepository;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//        auth.userDetailsService(customUserService()).passwordEncoder(new MyPasswordEncoder());
        auth.userDetailsService(userDetailsServiceImpl).passwordEncoder(new MyPasswordEncoder());
    }
    @Override
    protected void configure(HttpSecurity http) throws Exception {

//        http.authorizeRequests()
//                .antMatchers("/").permitAll()
//                .and().formLogin().loginPage("/toLogin")
//                .defaultSuccessUrl("/showStudents").failureUrl("/toLogin").permitAll();
//
//        // 开启记住我功能 cookie默认保存两周
//        http.rememberMe().rememberMeParameter("remember");
//
//        // 如果没有权限跳转到登陆页面
//        http.formLogin().usernameParameter("username").passwordParameter("password").loginPage("/toLogin").loginProcessingUrl("/login");
//
//        // 关闭 springboot默认开启的 防止网站攻击 才能登出
//        http.csrf().disable();
//
//        // 开启登出
//        http.logout().logoutSuccessUrl("/");

//        ExpressionUrlAuthorizationConfigurer<HttpSecurity>.ExpressionInterceptUrlRegistry authorizeRequests = http
//                .authorizeRequests();
//
//        authorizeRequests.antMatchers("/toLogin","/static/**").permitAll()
//                .antMatchers("/**").fullyAuthenticated()
//                .and().formLogin().loginPage("/toLogin").defaultSuccessUrl("/showStudents").failureUrl("/toLogin").permitAll()
//                .and().csrf().disable();
//
//        List<Permission> permissions = permissionRepository.findAll();
//        for (Permission permission : permissions){
//            authorizeRequests.antMatchers(permission.getUrl()).hasAnyAuthority(permission.getName());
//        }

//         如果没有权限跳转到登陆页面
//        http.formLogin().usernameParameter("username").passwordParameter("password").loginPage("/toLogin").loginProcessingUrl("/login");

        ExpressionUrlAuthorizationConfigurer<HttpSecurity>.ExpressionInterceptUrlRegistry authorizeRequests = http
                .authorizeRequests();

        List<Permission> permissions = permissionRepository.findAll();
        for (Permission permission : permissions){
            authorizeRequests.antMatchers(permission.getUrl()).hasAnyAuthority(permission.getName());
        }

        authorizeRequests.antMatchers("/login","/css/**","/js/**","/img/**","/bootstrap/**","/main").permitAll()
                .antMatchers("/**")
                .fullyAuthenticated()
                .and()
                .formLogin().loginPage("/login").defaultSuccessUrl("/main",true).failureUrl("/login").permitAll()
                .and().
                csrf().disable();
    }

}
