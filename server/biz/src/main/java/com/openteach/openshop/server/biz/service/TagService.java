/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.biz.service;

import java.util.List;

import com.openteach.openshop.server.biz.Filter;
import com.openteach.openshop.server.biz.Order;
import com.openteach.openshop.server.biz.entity.Tag;
import com.openteach.openshop.server.biz.entity.Tag.Type;

/**
 * Service - 标签
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
public interface TagService extends BaseService<Tag, Long> {

	/**
	 * 查找标签
	 * 
	 * @param type
	 *            类型
	 * @return 标签
	 */
	List<Tag> findList(Type type);

	/**
	 * 查找标签(缓存)
	 * 
	 * @param count
	 *            数量
	 * @param filters
	 *            筛选
	 * @param orders
	 *            排序
	 * @param cacheRegion
	 *            缓存区域
	 * @return 标签(缓存)
	 */
	List<Tag> findList(Integer count, List<Filter> filters, List<Order> orders, String cacheRegion);

}