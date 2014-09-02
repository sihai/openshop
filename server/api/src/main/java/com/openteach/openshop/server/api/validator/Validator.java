package com.openteach.openshop.server.api.validator;

import com.openteach.openshop.server.api.ApiContext;
import com.openteach.openshop.server.api.Result;

/**
 * 
 * @author sihai
 *
 */
public interface Validator {

	/**
	 * 
	 * @param apiContext
	 * @return
	 */
	Result validate(ApiContext apiContext);
}
