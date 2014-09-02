package com.openteach.openshop.server.api.internal.parameter;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import com.openteach.openshop.server.api.exception.ParameterGeneratedException;
import com.openteach.openshop.server.api.util.ConvertUtils;

/**
 * 
 * @author sihai
 *
 */
public class EnumParameterGenerator extends AbstractSimpleParameterGenerator {

	/**
	 * 
	 */
	private Class clazz;
	
	/**
	 * 
	 */
	private Method method;
	
	/**
	 * 
	 * @param clazz
	 * @param type
	 * @param name
	 * @param required
	 */
	public EnumParameterGenerator(Class clazz, ParameterType type, String name, boolean required) {
		super(type, name, required, false);
		this.clazz = clazz;
		try {
			this.method = clazz.getMethod("valueOf", new Class[] {String.class});
		} catch (NoSuchMethodException e) {
			throw new IllegalArgumentException("Unsupported enum, that has none valueOf(String) method", e);
		}
	}
	
	@Override
	public Object generateValue(Object v) throws ParameterGeneratedException {
		if(null == v) {
			return null;
		}
		try {
			return this.method.invoke(null, ConvertUtils.asString(v));
		} catch (InvocationTargetException e) {
			throw new IllegalArgumentException(e);
		} catch (IllegalAccessException e) {
			throw new IllegalArgumentException(e);
		} catch (IllegalArgumentException e) {
			throw new IllegalArgumentException(e);
		}
	}
}
