package com.openteach.openshop.server.api.async;

import java.util.concurrent.atomic.AtomicLong;

/**
 * 
 * @author sihai
 *
 */
public abstract class AsyncKeyGenerator {

	private static AtomicLong nextid = new AtomicLong(0);
	
	/**
	 * 
	 * @return
	 */
	public static AsyncKey next() {
		return new AsyncKey(nextid.getAndIncrement());
	}
}
