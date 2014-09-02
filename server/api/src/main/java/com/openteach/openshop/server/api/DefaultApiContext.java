package com.openteach.openshop.server.api;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.openteach.openshop.server.api.async.ApiAsyncContext;
import com.openteach.openshop.server.api.spring.SpringContextHolder;

/**
 * 
 * @author sihai
 *
 */
public class DefaultApiContext implements ApiContext {

	private HttpServletRequest hRequest;
	private HttpServletResponse hResponse;
	private ApiRequest request;
	private ApiResponse response;
	
	private ApiAsyncContext asyncContext;
	
	private ExecutionContext executionContext;
	
	private SpringContextHolder springContextHolder;

	/**
	 * 
	 * @param hRequest
	 * @param hResponse
	 * @param request
	 * @param response
	 */
	public DefaultApiContext(HttpServletRequest hRequest, HttpServletResponse hResponse, ApiRequest request, ApiResponse response) {
		this.hRequest = hRequest;
		this.hResponse = hResponse;
		this.request = request;
		this.response = response;
		this.executionContext = new ExecutionContext();
		this.springContextHolder = new SpringContextHolder();
	}
	
	@Override
	public HttpServletRequest getHttpServletRequest() {
		return hRequest;
	}

	@Override
	public HttpServletResponse getHttpServletResponse() {
		return hResponse;
	}

	@Override
	public ApiRequest getRequest() {
		return request;
	}

	@Override
	public ApiResponse getResponse() {
		return response;
	}
	
	@Override
	public ApiAsyncContext getAsyncContext() {
		return asyncContext;
	}

	@Override
	public void setAsyncContext(ApiAsyncContext asyncContext) {
		this.asyncContext = asyncContext;
	}

	@Override
	public ExecutionContext getExecutionContext() {
		return executionContext;
	}

	@Override
	public SpringContextHolder getSpringContextHolder() {
		return springContextHolder;
	}
}
