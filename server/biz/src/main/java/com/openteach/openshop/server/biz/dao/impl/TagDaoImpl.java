/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.biz.dao.impl;

import java.util.List;

import javax.persistence.FlushModeType;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Repository;

import com.openteach.openshop.server.biz.dao.TagDao;
import com.openteach.openshop.server.biz.entity.Tag;
import com.openteach.openshop.server.biz.entity.Tag.Type;

/**
 * Dao - 标签
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Repository("tagDaoImpl")
public class TagDaoImpl extends BaseDaoImpl<Tag, Long> implements TagDao {

	public List<Tag> findList(Type type) {
		CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
		CriteriaQuery<Tag> criteriaQuery = criteriaBuilder.createQuery(Tag.class);
		Root<Tag> root = criteriaQuery.from(Tag.class);
		criteriaQuery.select(root);
		if (type != null) {
			criteriaQuery.where(criteriaBuilder.equal(root.get("type"), type));
		}
		criteriaQuery.orderBy(criteriaBuilder.asc(root.get("order")));
		return entityManager.createQuery(criteriaQuery).setFlushMode(FlushModeType.COMMIT).getResultList();
	}

}