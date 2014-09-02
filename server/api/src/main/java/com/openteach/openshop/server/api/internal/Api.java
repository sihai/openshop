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
		 */
		void onCompleted();
		
		/**
		 * 
		 * @param t
		 */
		void onException(Throwable t);
		
		/**
		 * 
		 */
		void onTimeout();
	}
	
	/**
	 * 
	 * @param apiContext
	 * @param l
	 */
	void execute(ApiContext apiContext, Listener l);
}
