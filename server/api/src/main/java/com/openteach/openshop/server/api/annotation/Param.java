package com.openteach.openshop.server.api.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import com.openteach.openshop.server.api.internal.parameter.ParameterType;

@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.PARAMETER, ElementType.FIELD, ElementType.METHOD})
@Documented
public @interface Param {

	/**
	 * 参数名称
	 * @return
	 */
	String name();
	
	/**
	 * 类型
	 * @return
	 */
	ParameterType type() default ParameterType.BIZ;
	
	/**
	 * 是否必须
	 * @return
	 */
	boolean required() default false;
	
	/**
	 * 是否已经加密
	 * @return
	 */
	boolean ecrypted() default false;
}
