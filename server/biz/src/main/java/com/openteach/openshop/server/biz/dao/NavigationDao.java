/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.biz.dao;

import java.util.List;

import com.openteach.openshop.server.biz.entity.Navigation;
import com.openteach.openshop.server.biz.entity.Navigation.Position;

/**
 * Dao - 导航
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
public interface NavigationDao extends BaseDAO<Navigation, Long> {

	/**
	 * 查找导航
	 * 
	 * @param position
	 *            位置
	 * @return 导航
	 */
	List<Navigation> findList(Position position);

}