/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.service.dao;

import com.openteach.openshop.server.service.entity.Log;

/**
 * Dao - 日志
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
public interface LogDAO extends BaseDAO<Log, Long> {

	/**
	 * 删除所有日志
	 */
	void removeAll();

}