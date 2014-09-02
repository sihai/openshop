package com.openteach.openshop.server.api.internal.parameter;

import com.openteach.openshop.server.api.ApiContext;
import com.openteach.openshop.server.api.exception.ParameterGeneratedException;

/**
 * 
 * @author sihai
 *
 */
public class HttpServletResponseParameterGenerator extends AbstractSimpleParameterGenerator {

	/**
	 * 
	 * @param type
	 * @param name
	 * @param required
	 */
	public HttpServletResponseParameterGenerator(ParameterType type, String name, boolean required) {
		super(type, name, true);
	}
	
	@Override
	public Object generate(ApiContext ac)  throws ParameterGeneratedException {
		return null == ac.getAsyncContext() ? ac.getHttpServletResponse() : ac.getAsyncContext().getAsyncContext().getResponse();
	}
	
	@Override
	public Object generateValue(Object v) throws ParameterGeneratedException {
		throw new RuntimeException("HttpServletRequestParameterGenerator not possible");
	}
}
