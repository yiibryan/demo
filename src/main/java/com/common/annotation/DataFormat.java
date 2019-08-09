package com.common.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 数据格式转换
 * @author lxxx
 *
 */
@Target({ElementType.TYPE, ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface DataFormat {
	/**
	 * 转换格式
	 */
	String value() default "";
	String dictKey() default "";
	/**
	 * 转换类型
	 */
	String type();
}
