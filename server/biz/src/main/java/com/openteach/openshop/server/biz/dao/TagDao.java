/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.biz.dao;

import java.util.List;

import com.openteach.openshop.server.biz.entity.Tag;
import com.openteach.openshop.server.biz.entity.Tag.Type;

/**
 * Dao - 标签
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
public interface TagDao extends BaseDAO<Tag, Long> {

	/**
	 * 查找标签
	 * 
	 * @param type
	 *            类型
	 * @return 标签
	 */
	List<Tag> findList(Type type);

}