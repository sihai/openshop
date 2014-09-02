package com.openteach.openshop.server.api;

import java.util.Map;

/**
 * API response
 * @author sihai
 *
 */
public interface ApiResponse {

	/**
	 * 
	 * @param result
	 */
	void setResult(Result result);
	
	/**
	 * 
	 * @return
	 */
	Result getResult();
	
	/**
	 * 
	 * @param key
	 * @param value
	 */
	void addHeader(String key, String value);
	
	/**
	 * 
	 * @param headers
	 */
	void addHeaders(Map<String, String> headers);
	
	/**
	 * 
	 * @return
	 */
	Map<String, String> getHeaders();
	
}
