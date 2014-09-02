package com.openteach.openshop.server.api.internal.parameter;

import com.openteach.openshop.server.api.ApiContext;
import com.openteach.openshop.server.api.exception.ParameterGeneratedException;

/**
 * 
 * @author sihai
 *
 */
public class MultiParameterGenerator implements ParameterGenerator {

	private ParameterGenerator[] pgs;
	
	/**
	 * 
	 * @param pgs
	 */
	public MultiParameterGenerator(ParameterGenerator[] pgs) {
		this.pgs = pgs;
	}
	
	@Override
	public Object generate(ApiContext ac) throws ParameterGeneratedException {
		Object[] a = new Object[pgs.length];
		for(int i = 0; i < pgs.length; i++) {
			a[i] = pgs[i].generate(ac);
		}
		return a;
	}

	@Override
	public Object generateValue(Object v) throws ParameterGeneratedException {
		throw new RuntimeException("MultiParameterGenerator not possible");
	}
}
