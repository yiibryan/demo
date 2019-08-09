package com.common;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 *
 * <pre>Title: CustomWebMvcConfigurerAdapter.java</pre>
 * <pre>Description: CustomWebMvcConfigurerAdapter.java</pre>
 * <pre>Copyright: Copyright (c) 2017</pre>
 * <pre>Company: JUSFOUN </pre>
 * @author yany
 * @version 1.0
 * @creattime  2017年3月13日 下午8:31:01
 */
@Configuration   
public class CustomWebMvcConfigurerAdapter extends WebMvcConfigurerAdapter{
		@Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new UserInterceptor()).addPathPatterns("/**");  //对来自/** 这个链接来的请求进行拦截
    }

}
