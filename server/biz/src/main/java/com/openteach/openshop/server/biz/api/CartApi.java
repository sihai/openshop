package com.openteach.openshop.server.biz.api;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;

import com.openteach.openshop.server.api.ExecutionContext;
import com.openteach.openshop.server.api.SysMappings;
import com.openteach.openshop.server.api.annotation.Api;
import com.openteach.openshop.server.api.annotation.Apis;
import com.openteach.openshop.server.api.annotation.Param;
import com.openteach.openshop.server.api.internal.parameter.ParameterType;
import com.openteach.openshop.server.biz.CartBO;
import com.openteach.openshop.server.service.Message;

@Component
@Apis
public class CartApi {

	@Resource(name = "cartBO")
	private CartBO cartBO;
	
	@Api(name = "com.openteach.openshop.server.cart.add", version = "0.0.1")
	public Message list(
			@Param(type = ParameterType.BIZ, name = "pid", required = true) Long pid,
			@Param(type = ParameterType.BIZ, name = "quantity", required = true) Integer quantity,
			@Param(type = ParameterType.SYS, name = SysMappings.HTTP_REQUEST, required = true) HttpServletRequest request, 
			@Param(type = ParameterType.SYS, name = SysMappings.HTTP_RESPONSE, required = true) HttpServletResponse response, 
			@Param(type = ParameterType.SYS, name = SysMappings.HTTP_SESSION, required = true) HttpSession session,
			@Param(type = ParameterType.SYS, name = SysMappings.EXECUTION_CONTEXT, required = true) ExecutionContext context) {
		return cartBO.add(pid, quantity, request, response);
	}
}
