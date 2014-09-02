package com.openteach.openshop.server.api.internal.parameter;

import com.openteach.openshop.server.api.ApiContext;
import com.openteach.openshop.server.api.ApiRequest;
import com.openteach.openshop.server.api.ErrorCode;
import com.openteach.openshop.server.api.exception.ParameterGeneratedException;
import com.openteach.openshop.server.api.util.ConvertUtils;

/**
 * 
 * @author sihai
 *
 */
public abstract class AbstractSimpleParameterGenerator implements ParameterGenerator {

	/**
	 * 
	 */
	private ParameterType type;
	
	/**
	 * 
	 */
	private String name;
	
	/**
	 * 
	 */
	private boolean required;
	
	/**
	 * 
	 */
	private boolean ecrypted;

	/**
	 * 
	 * @param type
	 * @param name
	 * @param required
	 */
	public AbstractSimpleParameterGenerator(ParameterType type, String name, boolean required) {
		this(type, name, required, false);
	}
	
	/**
	 * 
	 * @param type
	 * @param name
	 * @param required
	 * @param ecrypted
	 */
	public AbstractSimpleParameterGenerator(ParameterType type, String name, boolean required, boolean ecrypted) {
		this.type = type;
		this.name = name;
		this.required = required;
		this.ecrypted = ecrypted;
	}
	
	@Override
	public Object generate(ApiContext ac) throws ParameterGeneratedException {
		Object v = generateValue(ac);
		if(null == v && required) {
			throw new ParameterGeneratedException(ErrorCode.MISSING_BIZ_PARAMETER, name);
		}
		return v;
	}

	/**
	 * 
	 * @param ac
	 * @return
	 * @throws ParameterGeneratedException
	 */
	protected Object generateValue(ApiContext ac) throws ParameterGeneratedException {
		ApiRequest request = ac.getRequest();
		ParameterType type = getType();
		String name = getName();
		if(ParameterType.SYS == type) {
			return generateValue(request.getSys(name));
		} else if (ParameterType.BIZ == type) {
			return generateValue(request.getBiz(name));
		} else {
			throw new IllegalArgumentException(String.format("Unkown Parameter type: %s for Parameter:%s", type, name));
		}
	}

	public ParameterType getType() {
		return type;
	}

	public String getName() {
		return name;
	}

	public boolean isRequired() {
		return required;
	}
	
	public boolean isEcrypted() {
		return ecrypted;
	}
}
