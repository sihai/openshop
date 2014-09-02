/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.service.dao;

import java.util.List;

import com.openteach.openshop.server.service.entity.Area;

/**
 * Dao - 地区
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
public interface AreaDao extends BaseDAO<Area, Long> {

	/**
	 * 查找顶级地区
	 * 
	 * @param count
	 *            数量
	 * @return 顶级地区
	 */
	List<Area> findRoots(Integer count);

}