package com.openteach.openshop.server.api.internal.parameter;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * 
 * @author sihai
 *
 */
public class SigleParameterSetter implements ParameterSetter {

	private Method setterMethod;
	
	private Field field;
	
	/**
	 * 
	 * @param setterMethod
	 */
	public SigleParameterSetter(Method setterMethod) {
		this(setterMethod, null);
	}
	
	/**
	 * 
	 * @param field
	 */
	public SigleParameterSetter(Field field) {
		this(null, field);
	}
	
	/**
	 * 
	 * @param setterMethod
	 * @param field
	 */
	public SigleParameterSetter(Method setterMethod, Field field) {
		this.setterMethod = setterMethod;
		this.field = field;
		if(null == this.setterMethod && null == this.field) {
			throw new IllegalArgumentException("setterMethod and field must not be null");
		}
	}
	
	/**
	 * 
	 * @param o
	 * @param vs
	 */
	public void set(Object o, Object... vs) {
		try {
			if(null != setterMethod) {
				setterMethod.invoke(o, vs);
			} else  if(null != field) {
				field.set(o, vs[0]);
			}
		} catch (IllegalAccessException e) {
			throw new IllegalArgumentException(e);
		} catch (InvocationTargetException e) {
			throw new IllegalArgumentException(e);
		}
	}
}
