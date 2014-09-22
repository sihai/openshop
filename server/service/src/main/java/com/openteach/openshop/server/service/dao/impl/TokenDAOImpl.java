package com.openteach.openshop.server.service.dao.impl;

import javax.persistence.FlushModeType;
import javax.persistence.NoResultException;

import org.springframework.stereotype.Repository;

import com.openteach.openshop.server.service.dao.TokenDAO;
import com.openteach.openshop.server.service.entity.Token;
import com.openteach.openshop.server.service.entity.Token.Type;

/**
 * 
 * @author sihai
 *
 */
@Repository("tokenDAO")
public class TokenDAOImpl extends BaseDAOImpl<Token, Long> implements TokenDAO {

	@Override
	public Token findByContentAndType(String content, Type type) {
		if (null == content || null == type) {
			return null;
		}
		
		try {
			String jpql = "select token from Token token where token.content = :content AND token.type = :type";
			return entityManager.createQuery(jpql, Token.class).setFlushMode(FlushModeType.COMMIT).setParameter("content", content).setParameter("type", type).getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}
}
