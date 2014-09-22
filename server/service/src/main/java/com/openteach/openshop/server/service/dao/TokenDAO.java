/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.service.dao;

import com.openteach.openshop.server.service.entity.Token;

/**
 * DAO - Token
 * 
 * @author Team
 * @version 0.0.1
 */
public interface TokenDAO extends BaseDAO<Token, Long> {

	/**
	 * 依据token的内容+type查询
	 * @param content
	 * @param type
	 * @return
	 */
	Token findByContentAndType(String content, Token.Type type);
}