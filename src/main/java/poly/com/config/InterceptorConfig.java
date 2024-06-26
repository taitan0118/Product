package poly.com.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import poly.com.service.AuthInterceptor;
import poly.com.service.GlobalInterceptor;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer{
	
	@Autowired
	GlobalInterceptor global;
	
	@Autowired
	AuthInterceptor auth;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// TODO Auto-generated method stub
		registry.addInterceptor(global)
			.addPathPatterns("/**")
			.excludePathPatterns("/assets/**");
		
		registry.addInterceptor(auth)
			.addPathPatterns("/account/**", "/admin/**")
			//.excludePathPatterns("/assets/**", "/admin/index");
		.excludePathPatterns("/assets/**");
	}
}
