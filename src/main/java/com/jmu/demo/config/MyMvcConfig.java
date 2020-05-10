package com.jmu.demo.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MyMvcConfig implements WebMvcConfigurer {
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
//        registry.addViewController("/main").setViewName("main");
//        registry.addViewController("/addClass").setViewName("editClass");
        registry.addViewController("/roster").setViewName("roster");
//        registry.addViewController("/devideClass").setViewName("devideClass");
    }

//    @Override
//    public void addInterceptors(InterceptorRegistry registry) {
//        registry.addInterceptor(new LoginHandlerInterceptor()).addPathPatterns("/**")
//                .excludePathPatterns("/","/login","/index","img/**","/css/**","/js/**","/bootstrap/**");
//    }
}
