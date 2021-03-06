/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.service.dao;

import java.util.List;

import com.openteach.openshop.server.service.entity.FriendLink;
import com.openteach.openshop.server.service.entity.FriendLink.Type;

/**
 * Dao - 友情链接
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
public interface FriendLinkDAO extends BaseDAO<FriendLink, Long> {

	/**
	 * 查找友情链接
	 * 
	 * @param type
	 *            类型
	 * @return 友情链接
	 */
	List<FriendLink> findList(Type type);

}