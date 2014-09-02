package com.openteach.openshop.server.api;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.openteach.openshop.server.api.async.ApiAsyncContext;
import com.openteach.openshop.server.api.spring.SpringContextHolder;

/**
 * API request context
 * @author sihai
 *
 */
public interface ApiContext {

	/**
	 * 
	 * @return
	 */
	HttpServletRequest getHttpServletRequest();
	
	/**
	 * 
	 * @return
	 */
	HttpServletResponse getHttpServletResponse();
	
	/**
	 * 
	 * @return
	 */
	ApiRequest getRequest();
	
	/**
	 * 
	 * @return
	 */
	ApiResponse getResponse();
	
	/**
	 * 
	 * @param asyncContext
	 */
	void setAsyncContext(ApiAsyncContext asyncContext);
	
	/**
	 * 
	 * @return
	 */
	ApiAsyncContext getAsyncContext();
	
	/**
	 * 
	 * @return
	 */
	ExecutionContext getExecutionContext();
	
	/**
	 * 
	 * @return
	 */
	SpringContextHolder getSpringContextHolder();
}
