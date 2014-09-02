package com.openteach.openshop.server.api.http;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;

import com.openteach.openshop.server.api.ApiContext;
import com.openteach.openshop.server.api.ApiContextFactory;
import com.openteach.openshop.server.api.DefaultApiContext;
import com.openteach.openshop.server.api.DefaultApiResponse;

/**
 * 
 * @author sihai
 *
 */
@Component("httpApiContextFactory")
public class HttpApiContextFactory implements ApiContextFactory {

	/**
	 * 
	 */
	@Resource(name = "httpApiRequestParser")
	private HttpApiRequestParser parser;
	
	/**
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@Override
	public ApiContext createApiContext(HttpServletRequest request, HttpServletResponse response) {
		return new DefaultApiContext(request, response, parser.parse(request), new DefaultApiResponse());
	}
}