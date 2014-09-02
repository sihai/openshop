package com.openteach.openshop.server.api;

import java.util.HashMap;
import java.util.Map;

/**
 * 
 * @author sihai
 *
 */
public class ExecutionContext {
	
	/**
	 * 
	 */
	private ErrorCode code = ErrorCode.SUCCEED;
	
	/**
	 * 
	 */
	private String errorMsg;

	/**
	 * 
	 */
	private Map<String, Object> map;
	
	/**
	 * 
	 */
	public ExecutionContext() {
		map = new HashMap<String, Object>();
	}
	
	/**
	 * 
	 * @param key
	 * @return
	 */
	public Object get(String key) {
		return map.get(key);
	}
	
	/**
	 * 
	 * @param key
	 * @param value
	 */
	public void put(String key, Object value) {
		map.put(key, value);
	}
	
	/**
	 * 
	 * @param key
	 */
	public void remove(String key) {
		map.remove(key);
	}
	
	public ErrorCode getCode() {
		return code;
	}

	public void setCode(ErrorCode code) {
		this.code = code;
	}

	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}
}
