package com.openteach.openshop.server.api;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 
 * @author sihai
 *
 */
public interface ApiContextFactory {

	/**
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	ApiContext createApiContext(HttpServletRequest request, HttpServletResponse response);
}
