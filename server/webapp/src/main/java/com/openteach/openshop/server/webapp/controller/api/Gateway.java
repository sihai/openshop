package com.openteach.openshop.server.webapp.controller.api;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.openteach.openshop.server.api.ApiContextFactory;
import com.openteach.openshop.server.api.ApiExecutor;

@Controller
@RequestMapping("/api")
public class Gateway {

	@Resource(name = "defaultApiExecutor")
	private ApiExecutor apiExecutor;
	@Resource(name = "httpApiContextFactory")
	private ApiContextFactory apiContextFactory;
	
	@RequestMapping(value = "/do.jhtml", method = {RequestMethod.GET, RequestMethod.POST})
	public void doApi(HttpServletRequest request, HttpServletResponse response) {
		apiExecutor.execute(apiContextFactory.createApiContext(request, response));
	}
}
