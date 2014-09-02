package com.openteach.openshop.server.api.security;

import javax.servlet.http.HttpServletRequest;

/**
 * 
 * @author sihai
 *
 */
public abstract class SecurityUtils {

	/**
	 * 
	 * @param value
	 * @param request
	 * @return
	 */
	public static String ecrypt(String value, HttpServletRequest request) {
		//
		return null;
	}
	
	/**
	 * 
	 * @param value
	 * @param request
	 * @return
	 */
	public static String decrypt(String value, HttpServletRequest request) {
		return RSAUtils.decrypt(value, request);
	}
}
