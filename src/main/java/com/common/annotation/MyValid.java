package com.common.annotation;

import java.lang.annotation.*;

/**
 * 切面注解
 */
@Target({ElementType.METHOD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface MyValid {
    /**
     * 该注解作用于方法上时需要备注信息
     */
    String remark() default "";

    String operType() default "0";
}