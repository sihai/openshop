/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.service.service;

import java.util.List;

import com.openteach.openshop.server.service.LogConfig;

/**
 * Service - 日志配置
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
public interface LogConfigService {

	/**
	 * 获取所有日志配置
	 * 
	 * @return 所有日志配置
	 */
	List<LogConfig> getAll();

}