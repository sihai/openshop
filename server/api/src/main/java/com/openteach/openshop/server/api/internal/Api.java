package com.openteach.openshop.server.api.internal;

import com.openteach.openshop.server.api.ApiContext;

/**
 * 
 * @author sihai
 *
 */
public interface Api  {

	interface Listener {
		
		/**
		 * 
		 * @param api
		 */
		void onCompleted(Api api);
		
		/**
		 * 
		 * @param api
		 * @param t
		 */
		void onException(Api api, Throwable t);
		
		/**
		 * 
		 * @param api
		 */
		void onTimeout(Api api);
	}
	
	/**
	 * 
	 * @param apiContext
	 * @param l
	 */
	void execute(ApiContext apiContext, Listener l);
}
