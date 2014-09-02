package com.openteach.openshop.server.api.internal.parameter;

import java.lang.reflect.Array;

import com.alibaba.fastjson.JSONArray;
import com.openteach.openshop.server.api.exception.ParameterGeneratedException;

/**
 * 
 * @author sihai
 *
 */
public class ArrayParameterGenerator extends AbstractSimpleParameterGenerator {

	/**
	 * 
	 */
	private Class cc;
	
	/**
	 * 
	 */
	private ParameterGenerator pg;
	
	/**
	 * 
	 * @param cc
	 * @param pg
	 * @param type
	 * @param name
	 * @param required
	 */
	public ArrayParameterGenerator(Class cc, ParameterGenerator pg, ParameterType type, String name, boolean required) {
		super(type, name, required);
		this.cc = cc;
		this.pg = pg;
	}

	@Override
	public Object generateValue(Object v) throws ParameterGeneratedException {
		JSONArray ja = (JSONArray)v;
		if((null == ja || 0 == ja.size())) {
			return null; 
		}
		
		Object[] a = (Object[])Array.newInstance(cc, ja.size());
		
		int i = 0;
		for(Object jo : ja) {
			a[i++] = pg.generateValue(jo);
		}
		return a;
	}
}
