package com.openteach.openshop.server.api.filter;

import com.openteach.openshop.server.api.ApiContext;
import com.openteach.openshop.server.api.Result;

/**
 * 
 * @author sihai
 *
 */
public interface Filter {

	/**
	 * 
	 * @param apiContext
	 * @return
	 */
	Result doFilter(ApiContext apiContext);
}
