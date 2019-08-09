/**
 *
 * <pre>Title: SpringUtils.java</pre> <pre>Description: SpringUtils.java</pre>
 * <pre>Copyright: Copyright (c) 2017</pre> <pre>Company: JUSFOUN </pre>
 * 
 * @author yany
 * @version 1.0
 * @creattime 2017年1月4日 上午9:59:07
 */
package com.common.util;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

/**
 * 普通类调用Spring bean对象
 * <pre>Title: SpringUtils.java</pre>
 * <pre>Description: SpringUtils.java</pre>
 * <pre>Copyright: Copyright (c) 2017</pre>
 * <pre>Company: JUSFOUN </pre>
 * @author yany
 * @version 1.0
 * @creattime  2017年1月4日 上午9:59:07
 */
@ Component
public class SpringUtils implements ApplicationContextAware{
		private static ApplicationContext applicationContext = null;
		
		@ Override
		public void setApplicationContext(ApplicationContext applicationContext)
		    throws BeansException
		{
				if(SpringUtils.applicationContext == null) {
						SpringUtils.applicationContext = applicationContext;
				}
		}
		
		/**
		 *  获取applicationContext
		 * @return
		 */
		public static ApplicationContext getApplicationContext(){
				return applicationContext;
		}
		
		/**
		 *  通过name获取 Bean.
		 * @param name
		 * @return
		 */
		public static Object getBean(String name){
				return getApplicationContext().getBean(name);
		}
		
		/**
		 *  通过class获取Bean.
		 * @param clazz
		 * @return
		 */
		public static <T>T getBean(Class<T> clazz){
				return getApplicationContext().getBean(clazz);
		}
		
		/**
		 *  通过name,以及Clazz返回指定的Bean
		 * @param name
		 * @param clazz
		 * @return
		 */
		public static <T>T getBean(String name , Class<T> clazz){
				return getApplicationContext().getBean(name, clazz);
		}
}
