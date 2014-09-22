/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.service.dao.impl;

import javax.persistence.FlushModeType;

import org.springframework.stereotype.Repository;

import com.openteach.openshop.server.service.dao.LogDAO;
import com.openteach.openshop.server.service.entity.Log;

/**
 * Dao - 日志
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Repository("logDaoImpl")
public class LogDAOImpl extends BaseDAOImpl<Log, Long> implements LogDAO {

	public void removeAll() {
		String jpql = "delete from Log log";
		entityManager.createQuery(jpql).setFlushMode(FlushModeType.COMMIT).executeUpdate();
	}

}