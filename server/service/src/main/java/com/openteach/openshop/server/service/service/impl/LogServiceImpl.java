/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.service.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.openteach.openshop.server.service.dao.LogDAO;
import com.openteach.openshop.server.service.entity.Log;
import com.openteach.openshop.server.service.service.LogService;

/**
 * Service - 日志
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Service("logServiceImpl")
public class LogServiceImpl extends BaseServiceImpl<Log, Long> implements LogService {

	@Resource(name = "logDaoImpl")
	private LogDAO logDao;

	@Resource(name = "logDaoImpl")
	public void setBaseDao(LogDAO logDao) {
		super.setBaseDao(logDao);
	}

	public void clear() {
		logDao.removeAll();
	}

}