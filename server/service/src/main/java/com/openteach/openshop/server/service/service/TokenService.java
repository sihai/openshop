package com.openteach.openshop.server.service.service;

import com.openteach.openshop.server.service.entity.Token;

/**
 * 
 * @author sihai
 *
 */
public interface TokenService extends BaseService<Token, Long> {

	/**
	 * 
	 * @param content
	 * @param type
	 * @return
	 */
	Token findByContentAndType(String content, Token.Type type);
}
