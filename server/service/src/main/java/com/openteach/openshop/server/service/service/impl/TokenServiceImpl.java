package com.openteach.openshop.server.service.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.openteach.openshop.server.service.dao.TokenDAO;
import com.openteach.openshop.server.service.entity.Token;
import com.openteach.openshop.server.service.entity.Token.Type;
import com.openteach.openshop.server.service.service.TokenService;

/**
 * 
 * @author sihai
 *
 */
@Service("tokenService")
public class TokenServiceImpl extends BaseServiceImpl<Token, Long> implements TokenService {

	@Resource(name = "tokenDAO")
	private TokenDAO tokenDAO;
	
	@Resource(name = "tokenDAO")
	public void setBaseDao(TokenDAO tokenDAO) {
		super.setBaseDao(tokenDAO);
	}
	
	@Override
	@Transactional(readOnly = true)
	public Token findByContentAndType(String content, Type type) {
		return tokenDAO.findByContentAndType(content, type);
	}
}
