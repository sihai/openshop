/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.biz.dao;

import com.openteach.openshop.server.biz.entity.PluginConfig;

/**
 * Dao - 插件配置
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
public interface PluginConfigDao extends BaseDao<PluginConfig, Long> {

	/**
	 * 判断插件ID是否存在
	 * 
	 * @param pluginId
	 *            插件ID
	 * @return 插件ID是否存在
	 */
	boolean pluginIdExists(String pluginId);

	/**
	 * 根据插件ID查找插件配置
	 * 
	 * @param pluginId
	 *            插件ID
	 * @return 插件配置，若不存在则返回null
	 */
	PluginConfig findByPluginId(String pluginId);

}