/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.biz.dao;

import java.util.List;

import com.openteach.openshop.server.biz.Filter;
import com.openteach.openshop.server.biz.Order;
import com.openteach.openshop.server.biz.entity.Promotion;

/**
 * Dao - 促销
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
public interface PromotionDao extends BaseDAO<Promotion, Long> {

	/**
	 * 查找促销
	 * 
	 * @param hasBegun
	 *            是否已开始
	 * @param hasEnded
	 *            是否已结束
	 * @param count
	 *            数量
	 * @param filters
	 *            筛选
	 * @param orders
	 *            排序
	 * @return 促销
	 */
	List<Promotion> findList(Boolean hasBegun, Boolean hasEnded, Integer count, List<Filter> filters, List<Order> orders);

}