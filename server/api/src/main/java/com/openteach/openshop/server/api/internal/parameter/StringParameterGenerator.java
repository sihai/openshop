package com.openteach.openshop.server.api.internal.parameter;

import com.openteach.openshop.server.api.ApiContext;
import com.openteach.openshop.server.api.ApiRequest;
import com.openteach.openshop.server.api.exception.ParameterGeneratedException;
import com.openteach.openshop.server.api.security.SecurityUtils;
import com.openteach.openshop.server.api.util.ConvertUtils;

/**
 * 
 * @author sihai
 *
 */
public class StringParameterGenerator extends AbstractSimpleParameterGenerator {

	/**
	 * 
	 * @param type
	 * @param name
	 * @param required
	 * @param ecrypted
	 */
	public StringParameterGenerator(ParameterType type, String name, boolean required, boolean ecrypted) {
		super(type, name, required, ecrypted);
	}
	
	@Override
	public Object generateValue(ApiContext ac) throws ParameterGeneratedException {
		ApiRequest request = ac.getRequest();
		ParameterType type = getType();
		String name = getName();
		if(ParameterType.SYS == type) {
			return this.isEcrypted() ? SecurityUtils.decrypt(ConvertUtils.asString(request.getSys(name)), ac.getHttpServletRequest()) : ConvertUtils.asString(request.getSys(name));
		} else if (ParameterType.BIZ == type) {
			return this.isEcrypted() ? SecurityUtils.decrypt(ConvertUtils.asString(request.getBiz(name)), ac.getHttpServletRequest()) : ConvertUtils.asString(request.getBiz(name));
		} else {
			throw new IllegalArgumentException(String.format("Unkown Parameter type: %s for Parameter:%s", type, name));
		}
	}

	@Override
	public Object generateValue(Object v) throws ParameterGeneratedException {
		throw new RuntimeException("StringParameterGenerator not possible");
	}
}
