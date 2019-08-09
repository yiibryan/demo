/**
 *
 * <pre>Title: UserInterceptor.java</pre>
 * <pre>Description: UserInterceptor.java</pre>
 * <pre>Copyright: Copyright (c) 2017</pre>
 * <pre>Company: JUSFOUN </pre>
 * @author yany
 * @version 1.0 
 * @creattime  2017年3月13日 下午8:21:28
 */

package com.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * <pre>
 * Title: UserInterceptor.java
 * </pre>
 * 
 * <pre>
 * Description: UserInterceptor.java
 * </pre>
 * 
 * <pre>
 * Copyright: Copyright (c) 2017
 * </pre>
 * 
 * <pre>
 * Company: JUSFOUN
 * </pre>
 * 
 * @author yany
 * @version 1.0
 * @creattime 2017年3月13日 下午8:21:28
 */
public class UserInterceptor implements HandlerInterceptor {
	/*
	 * (non-Javadoc)
	 * 
	 * @see org.springframework.web.servlet.HandlerInterceptor#preHandle(javax.
	 * servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse,
	 * java.lang.Object)
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		/*if ("http://localhost:4200".equals(request.getHeader("origin"))) {
			response.setHeader("Access-Control-Allow-Origin", "http://localhost:4200");
		} else if ("http://192.168.10.220".equals(request.getHeader("origin"))) {
			response.setHeader("Access-Control-Allow-Origin", "http://192.168.10.220");
		} else {
			response.setHeader("Access-Control-Allow-Origin", "*");
		}
		response.setHeader("Access-Control-Allow-Credentials", "true");
		response.setHeader("Access-Control-Allow-Methods", "POST");
		response.setHeader("Access-Control-Allow-Headers", "x-requested-with,content-type");
		response.setHeader("Access-Control-Allow-Headers", "deviceId");*/

		// response.setHeader("X-Frame-Options", "ALLOW-FROM
		// http://192.168.10.254:8080");
//		response.setHeader("X-Frame-Options", "SAMEORIGIN");
		return true;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.springframework.web.servlet.HandlerInterceptor#postHandle(javax.
	 * servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse,
	 * java.lang.Object, org.springframework.web.servlet.ModelAndView)
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.springframework.web.servlet.HandlerInterceptor#afterCompletion(javax.
	 * servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse,
	 * java.lang.Object, java.lang.Exception)
	 */
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
	}
}
