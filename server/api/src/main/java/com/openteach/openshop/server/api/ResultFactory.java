package com.openteach.openshop.server.api;

/**
 * 
 * @author sihai
 *
 */
public abstract class ResultFactory {

	/**
	 * 
	 * @param data
	 * @return
	 */
	public static Result succeed(Object data) {
		return newResult(ErrorCode.SUCCEED, null, data);
	}
	
	/**
	 * 
	 * @param code
	 * @param errorMsg
	 * @return
	 */
	public static Result failed(ErrorCode code, String errorMsg) {
		return newResult(code, errorMsg, null);
	}
	
	/**
	 * 
	 * @param code
	 * @param errorMsg
	 * @param data
	 * @return
	 */
	public static Result newResult(ErrorCode code, String errorMsg, Object data) {
		return new Result(code.name(), errorMsg, data);
	}
}
