package com.yeye.memo.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.yeye.memo.common.PermissionInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer{
	
	@Autowired
	private  PermissionInterceptor interceptor;
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/images/**") // 내가 url로 접근하고 싶은 path /images/10_1111111/test.png
		.addResourceLocations("file:///C:\\Users\\82109\\Desktop\\spring\\spring_test\\upload\\memo\\images/");
		
	}
	
	@Override
	public void addInterceptors (InterceptorRegistry registry) {
		registry.addInterceptor(interceptor)
		.addPathPatterns("/**") //어느 경로에 들어갈때 interceptor를 거쳐가게 할지
		.excludePathPatterns("/static/**", "/user/sign_out"); // 예외처리
	}
}
