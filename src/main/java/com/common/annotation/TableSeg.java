package com.common.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
/**
 * 分表注解
 * @author lxxx
 *
 */
@Retention(RetentionPolicy.RUNTIME)  
@Target({ ElementType.TYPE })  
public @interface TableSeg {
	//是否分表  
    public boolean split() default true;  
    //表名  
    public String value();  
    //获取分表策略  
    public String strategy();
}
