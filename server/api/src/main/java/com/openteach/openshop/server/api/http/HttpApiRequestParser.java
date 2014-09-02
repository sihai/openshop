package com.openteach.openshop.server.api.http;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.openteach.openshop.server.api.ApiRequest;
import com.openteach.openshop.server.api.DefaultApiRequest;
import com.openteach.openshop.server.api.SysParameters;
import com.openteach.openshop.server.service.service.MemberService;

/**
 * 
 * @author sihai
 *
 */
@Component("httpApiRequestParser")
public class HttpApiRequestParser {
	
	/**
	 * 
	 */
	private static final String BIZ_PARAMETERS = "biz_parameters";
	
	/**
	 * 
	 * @param request
	 * @return
	 */
	public ApiRequest parse(HttpServletRequest request) {
		Map<String, Object> sys = new HashMap<String, Object>();
		Map<String, Object> biz = JSON.parseObject(request.getParameter(BIZ_PARAMETERS), HashMap.class);
		for(SysParameters sp : SysParameters.values()) {
			sys.put(sp.getKey(), request.getHeader(sp.getKey()));
		}
		DefaultApiRequest dar = new DefaultApiRequest(sys, biz);
		return dar;
	}
}
