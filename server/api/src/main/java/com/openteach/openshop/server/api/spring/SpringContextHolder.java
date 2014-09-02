package com.openteach.openshop.server.api.spring;

import org.springframework.web.context.request.RequestAttributes;

/**
 * 
 * @author sihai
 *
 */
public class SpringContextHolder {

	/**
	 * 
	 */
	private RequestAttributes requestAttributes;
	
	public RequestAttributes getRequestAttributes() {
		return requestAttributes;
	}

	public void setRequestAttributes(RequestAttributes requestAttributes) {
		this.requestAttributes = requestAttributes;
	}
}
