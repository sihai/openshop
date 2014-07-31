/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package net.shopxx.dao;

import java.util.List;

import net.shopxx.entity.Tag;
import net.shopxx.entity.Tag.Type;

/**
 * Dao - 标签
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
public interface TagDao extends BaseDao<Tag, Long> {

	/**
	 * 查找标签
	 * 
	 * @param type
	 *            类型
	 * @return 标签
	 */
	List<Tag> findList(Type type);

}