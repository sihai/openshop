package com.openteach.openshop.server.service.util;

import java.util.UUID;

/**
 * 
 * @author sihai
 *
 */
public class TokenUtils {

	/**
	 * 
	 * @return
	 */
	public static String random() {
		return UUID.randomUUID().toString();
	}
}
