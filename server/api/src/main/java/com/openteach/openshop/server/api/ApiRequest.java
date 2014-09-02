package com.openteach.openshop.server.api;

import java.util.Map;

import com.openteach.openshop.server.service.entity.Member;

/**
 * API request
 * @author sihai
 *
 */
public interface ApiRequest {

	/**
	 * get api name
	 * @return
	 */
	String getApiName();
	
	/**
	 * get api version
	 * @return
	 */
	String getApiVersion();
	
	/**
	 * 获取系统级别参数map
	 * @return
	 */
	Map<String, Object> getSysParameters();
	
	/**
	 * 获取业务参数map
	 * @return
	 */
	Map<String, Object> getBizParameters();
	
	/**
	 * 
	 * @param key
	 * @return
	 */
	Object getSys(String key);
	
	/**
	 * 
	 * @param key
	 * @return
	 */
	Object getBiz(String key);
}
