package com.openteach.openshop.server.api.internal.parameter;

/**
 * 
 * @author sihai
 *
 */
public class ParameterValidator {

	/**
	 * 
	 */
	private Class type;
	
	/**
	 * 
	 */
	private boolean required = false;
	
	/**
	 * 
	 */
	private ParameterValidator[] memberValidators;
	
	/**
	 * 
	 * @param type
	 * @param required
	 * @param memberValidators
	 */
	public ParameterValidator(Class type, boolean required, ParameterValidator[] memberValidators) {
		this.type = type;
		this.required = required;
		this.memberValidators = memberValidators;
	}
	
	/**
	 * 
	 * @return
	 */
	public boolean validate(Object v) {
		return true;
	}
}
