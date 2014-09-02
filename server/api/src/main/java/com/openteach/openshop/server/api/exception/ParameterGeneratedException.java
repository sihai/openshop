package com.openteach.openshop.server.api.exception;

import com.openteach.openshop.server.api.ErrorCode;

/**
 * 
 * @author sihai
 *
 */
public class ParameterGeneratedException extends ApiException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2332285431326129027L;

	/**
	 * 
	 * @param errorCode
	 * @param errorMsg
	 * @param t
	 */
	public ParameterGeneratedException(ErrorCode errorCode, String errorMsg, Throwable t) {
		super(errorCode , errorMsg, t);
	}
	
	/**
	 * 
	 * @param errorCode
	 * @param errorMsg
	 */
	public ParameterGeneratedException(ErrorCode errorCode, String errorMsg) {
		super(errorCode, errorMsg);
	}
}
