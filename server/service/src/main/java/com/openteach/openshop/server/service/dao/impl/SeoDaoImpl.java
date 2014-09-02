/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.service.dao.impl;

import javax.persistence.FlushModeType;
import javax.persistence.NoResultException;

import org.springframework.stereotype.Repository;

import com.openteach.openshop.server.service.dao.SeoDao;
import com.openteach.openshop.server.service.entity.Seo;
import com.openteach.openshop.server.service.entity.Seo.Type;

/**
 * Dao - SEO设置
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Repository("seoDaoImpl")
public class SeoDaoImpl extends BaseDAOImpl<Seo, Long> implements SeoDao {

	public Seo find(Type type) {
		if (type == null) {
			return null;
		}
		try {
			String jpql = "select seo from Seo seo where seo.type = :type";
			return entityManager.createQuery(jpql, Seo.class).setFlushMode(FlushModeType.COMMIT).setParameter("type", type).getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

}