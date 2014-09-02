package com.openteach.openshop.server.api.async;

import java.util.Map;

import javax.servlet.AsyncContext;

import com.openteach.openshop.server.api.DefaultApiContext;

/**
 * 
 * @author sihai
 *
 */
public class ApiAsyncContext {

	private AsyncKey     key;
	private AsyncContext asyncContext;
	
	/**
	 * 
	 * @param key
	 * @param asyncContext
	 */
	public ApiAsyncContext(AsyncKey key, AsyncContext asyncContext) {
		this.key = key;
		this.asyncContext = asyncContext;
	}

	public AsyncKey getKey() {
		return key;
	}

	public AsyncContext getAsyncContext() {
		return asyncContext;
	}
}
