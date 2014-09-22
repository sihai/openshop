package com.openteach.openshop.server.api.interceptor;

import com.openteach.openshop.server.api.ApiContext;

/**
 * 
 * @author sihai
 *
 */
public interface Interceptor {

	/**
	 * 
	 * @param apiContext
	 */
	void preHandle(ApiContext apiContext);
	
	/**
	 * 
	 * @param apiContext
	 */
	void postHandle(ApiContext apiContext);
}
