package com.openteach.openshop.server.api.internal.parameter;

import com.openteach.openshop.server.api.ApiContext;
import com.openteach.openshop.server.api.ApiRequest;
import com.openteach.openshop.server.api.ErrorCode;
import com.openteach.openshop.server.api.exception.ParameterGeneratedException;

/**
 * 
 * @author sihai
 *
 */
public class ComplexParameterGenerator implements ParameterGenerator {

	private Class clazz;
	
	private ParameterGenerator[] pgs;
	
	/**
	 * 
	 */
	private ParameterSetter[] pss;
	
	/**
	 * 
	 * @param clazz
	 * @param pgs
	 * @param pss
	 * @param required
	 */
	public ComplexParameterGenerator(Class clazz, ParameterGenerator[] pgs, ParameterSetter[] pss, boolean required) {
		this.clazz = clazz;
		this.pgs = pgs;
		this.pss = pss;
	}
	
	@Override
	public Object generate(ApiContext ac) throws ParameterGeneratedException {
		ApiRequest request = ac.getRequest();
		try {
			Object o = clazz.getConstructor(new Class[0]);
			for(int i = 0; i < pss.length; i++) {
				pss[i].set(o, pgs[i].generate(ac));
			}
			return o;
		} catch (NoSuchMethodException e) {
			throw new ParameterGeneratedException(ErrorCode.WRONG_BIZ_PARAMETER, clazz.getName());
		}
	}

	@Override
	public Object generateValue(Object v) throws ParameterGeneratedException {
		throw new RuntimeException("ComplexParameterGenerator not possible");
	}
}
