package com.openteach.openshop.server.api.validator;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

import com.openteach.openshop.server.api.ApiContext;
import com.openteach.openshop.server.api.ErrorCode;
import com.openteach.openshop.server.api.Result;
import com.openteach.openshop.server.api.ResultFactory;
import com.openteach.openshop.server.api.SysParameters;
import com.openteach.openshop.server.api.annotation.Sort;

/**
 * 
 * @author sihai
 *
 */
@Component
@Sort(2)
public class BizParameterValidator implements Validator {

	@Override
	public Result validate(ApiContext apiContext) {
		for(SysParameters sp : SysParameters.values()) {
			if(!sp.isRequired()) {
				continue;
			}
			if(StringUtils.isBlank((String)apiContext.getRequest().getSys(sp.getKey()))) {
				return ResultFactory.failed(ErrorCode.MISSING_SYS_PARAMETER, sp.getKey());
			}
		}
		return ResultFactory.succeed(null);
	}
}
