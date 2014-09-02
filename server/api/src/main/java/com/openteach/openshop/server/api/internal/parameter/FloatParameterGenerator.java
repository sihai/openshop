package com.openteach.openshop.server.api.internal.parameter;

import com.openteach.openshop.server.api.exception.ParameterGeneratedException;
import com.openteach.openshop.server.api.util.ConvertUtils;

/**
 * 
 * @author sihai
 *
 */
public class FloatParameterGenerator extends AbstractSimpleParameterGenerator {

	/**
	 * 
	 * @param type
	 * @param name
	 * @param required
	 */
	public FloatParameterGenerator(ParameterType type, String name, boolean required) {
		super(type, name, required);
	}
	
	@Override
	public Object generateValue(Object v) throws ParameterGeneratedException {
		return ConvertUtils.asFloat(v);
	}
}
