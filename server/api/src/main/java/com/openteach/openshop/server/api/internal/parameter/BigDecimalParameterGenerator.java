package com.openteach.openshop.server.api.internal.parameter;

import com.openteach.openshop.server.api.ApiContext;
import com.openteach.openshop.server.api.ApiRequest;
import com.openteach.openshop.server.api.exception.ParameterGeneratedException;
import com.openteach.openshop.server.api.util.ConvertUtils;

/**
 * 
 * @author sihai
 *
 */
public class BigDecimalParameterGenerator extends AbstractSimpleParameterGenerator {

	/**
	 * 
	 * @param type
	 * @param name
	 * @param required
	 */
	public BigDecimalParameterGenerator(ParameterType type, String name, boolean required) {
		super(type, name, required);
	}
	
	@Override
	public Object generateValue(Object v) throws ParameterGeneratedException {
		return ConvertUtils.asBigDecimal(v);
	}
}
