package com.openteach.openshop.server.api;

import org.apache.commons.lang.StringUtils;

/**
 * 
 * @author sihai
 *
 */
public class Result {
	
	/**
	 * 
	 */
	private String errorCode;
	
	/**
	 * 
	 */
	private String errorMsg;
	
	/**
	 * 
	 */
	private Object data;
	
	/**
	 *
	 * @param errorCode
	 * @param errorMsg
	 * @param data
	 */
	public Result(String errorCode, String errorMsg, Object data) {
		this.errorCode = errorCode;
		this.errorMsg = errorMsg;
		this.data = data;
	}

	public String getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}

	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
	
	public boolean isSucceed() {
		return StringUtils.equals(errorCode, ErrorCode.SUCCEED.name());
	}
}
