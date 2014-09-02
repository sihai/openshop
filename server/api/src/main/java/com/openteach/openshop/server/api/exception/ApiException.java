package com.openteach.openshop.server.api.exception;

import com.openteach.openshop.server.api.ErrorCode;

/**
 * 
 * @author sihai
 *
 */
public class ApiException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4458168290888157122L;

	/**
	 * 
	 */
	private final ErrorCode errorCode;
	
	/**
	 * 
	 */
	private final String errorMsg;

	/**
	 * 
	 * @param errorCode
	 * @param errorMsg
	 * @param t
	 */
	public ApiException(ErrorCode errorCode, String errorMsg, Throwable t) {
		super(errorCode.name() + "--->" + errorMsg, t);
		this.errorCode = errorCode;
		this.errorMsg = errorMsg;
	}
	
	/**
	 * 
	 * @param errorCode
	 * @param errorMsg
	 */
	public ApiException(ErrorCode errorCode, String errorMsg) {
		super(errorCode.name() + "--->" + errorMsg);
		this.errorCode = errorCode;
		this.errorMsg = errorMsg;
	}
	
	public ErrorCode getErrorCode() {
		return errorCode;
	}

	public String getErrorMsg() {
		return errorMsg;
	}
}
