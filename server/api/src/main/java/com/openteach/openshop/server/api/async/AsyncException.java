package com.openteach.openshop.server.api.async;

/**
 * 
 * @author sihai
 *
 */
public class AsyncException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = -432896540017539713L;

	/**
	 * 
	 * @param msg
	 * @param t
	 */
	public AsyncException(String msg, Throwable t) {
		super(msg, t);
	}
	
	/**
	 * 
	 * @param msg
	 */
	public AsyncException(String msg) {
		super(msg);
	}
	
	/**
	 * 
	 * @param t
	 */
	public AsyncException(Throwable t) {
		super(t);
	}
}
