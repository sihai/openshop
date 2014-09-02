package com.openteach.openshop.server.api.repository;

import com.openteach.openshop.server.api.internal.DefaultApi;

/**
 * 
 * @author sihai
 *
 */
public interface ApiRepository {

	/**
	 * 
	 * @param apiName
	 * @param apiVersion
	 * @return
	 */
	DefaultApi get(String apiName, String apiVersion);
}
