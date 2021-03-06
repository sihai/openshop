/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.service.dao.impl;

import java.util.List;

import javax.persistence.FlushModeType;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.openteach.openshop.server.service.dao.AreaDAO;
import com.openteach.openshop.server.service.entity.Area;

/**
 * Dao - 地区
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Repository("areaDaoImpl")
public class AreaDAOImpl extends BaseDAOImpl<Area, Long> implements AreaDAO {

	public List<Area> findRoots(Integer count) {
		String jpql = "select area from Area area where area.parent is null order by area.order asc";
		TypedQuery<Area> query = entityManager.createQuery(jpql, Area.class).setFlushMode(FlushModeType.COMMIT);
		if (count != null) {
			query.setMaxResults(count);
		}
		return query.getResultList();
	}

}