package com.openteach.openshop.server.api.internal.parameter;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * 
 * @author sihai
 *
 */
public class MultiParameterSetter implements ParameterSetter {

	private Method setterMethod;
	
	/**
	 * 
	 * @param setterMethod
	 */
	public MultiParameterSetter(Method setterMethod) {
		this.setterMethod = setterMethod;
		if(null == this.setterMethod) {
			throw new IllegalArgumentException("setterMethod must not be null");
		}
	}
	
	/**
	 * 
	 * @param o
	 * @param vs
	 */
	public void set(Object o, Object... vs) {
		try {
			setterMethod.invoke(o, vs);
		} catch (IllegalAccessException e) {
			throw new IllegalArgumentException(e);
		} catch (InvocationTargetException e) {
			throw new IllegalArgumentException(e);
		}
	}
}
