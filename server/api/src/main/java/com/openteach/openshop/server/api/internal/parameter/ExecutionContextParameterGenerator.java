package com.openteach.openshop.server.api.internal.parameter;

import com.openteach.openshop.server.api.ApiContext;
import com.openteach.openshop.server.api.exception.ParameterGeneratedException;

/**
 * 
 * @author sihai
 *
 */
public class ExecutionContextParameterGenerator extends AbstractSimpleParameterGenerator {

	/**
	 * 
	 * @param type
	 * @param name
	 * @param required
	 */
	public ExecutionContextParameterGenerator(ParameterType type, String name, boolean required) {
		super(type, name, required);
	}
	
	@Override
	public Object generate(ApiContext ac) throws ParameterGeneratedException {
		return ac.getExecutionContext();
	}

	@Override
	public Object generateValue(Object v) throws ParameterGeneratedException {
		throw new RuntimeException("ExecutionContextParameterGenerator not possible");
	}
	
}
