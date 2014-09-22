/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.service.dao;

import java.util.List;

import com.openteach.openshop.server.service.entity.Navigation;
import com.openteach.openshop.server.service.entity.Navigation.Position;

/**
 * Dao - 导航
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
public interface NavigationDAO extends BaseDAO<Navigation, Long> {

	/**
	 * 查找导航
	 * 
	 * @param position
	 *            位置
	 * @return 导航
	 */
	List<Navigation> findList(Position position);

}