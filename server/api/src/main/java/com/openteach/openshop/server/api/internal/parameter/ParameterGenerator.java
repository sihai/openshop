package com.openteach.openshop.server.api.internal.parameter;

import com.openteach.openshop.server.api.ApiContext;
import com.openteach.openshop.server.api.exception.ParameterGeneratedException;

/**
 * 
 * @author sihai
 *
 */
public interface ParameterGenerator {

	/**
	 * 
	 * @param ac
	 * @return
	 * @throws ParameterGeneratedException
	 */
	Object generate(ApiContext ac) throws ParameterGeneratedException;
	
	/**
	 * 
	 * @param v
	 * @return
	 * @throws ParameterGeneratedException
	 */
	Object generateValue(Object v) throws ParameterGeneratedException;
}
