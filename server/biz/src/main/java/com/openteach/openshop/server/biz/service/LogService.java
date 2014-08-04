/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.biz.service;

import com.openteach.openshop.server.biz.entity.Log;

/**
 * Service - 日志
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
public interface LogService extends BaseService<Log, Long> {

	/**
	 * 清空日志
	 */
	void clear();

}