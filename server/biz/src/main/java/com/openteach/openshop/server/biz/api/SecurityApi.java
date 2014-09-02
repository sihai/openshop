package com.openteach.openshop.server.biz.api;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

import com.openteach.openshop.server.api.ExecutionContext;
import com.openteach.openshop.server.api.SysMappings;
import com.openteach.openshop.server.api.annotation.Api;
import com.openteach.openshop.server.api.annotation.Apis;
import com.openteach.openshop.server.api.annotation.Param;
import com.openteach.openshop.server.api.internal.parameter.ParameterType;
import com.openteach.openshop.server.biz.SecurityBO;

@Component
@Apis
public class SecurityApi {

	@Resource
	private SecurityBO securityBO;
	
	/**
	 * 
	 */
	@Api(name = "com.openteach.openshop.server.security.publick.alloc", version = "0.0.1")
	public Map<String, String> allocPublicKey(@Param(type = ParameterType.SYS, name = SysMappings.HTTP_REQUEST, required = true) HttpServletRequest request,
			@Param(type = ParameterType.SYS, name = SysMappings.EXECUTION_CONTEXT, required = true) ExecutionContext context) {
		return securityBO.allocPublicKey(request);
	}
}
