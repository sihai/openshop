/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.service.dao;

import com.openteach.openshop.server.service.Page;
import com.openteach.openshop.server.service.Pageable;
import com.openteach.openshop.server.service.entity.Coupon;

/**
 * Dao - 优惠券
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
public interface CouponDAO extends BaseDAO<Coupon, Long> {

	/**
	 * 查找优惠券分页
	 * 
	 * @param isEnabled
	 *            是否启用
	 * @param isExchange
	 *            是否允许积分兑换
	 * @param hasExpired
	 *            是否已过期
	 * @param pageable
	 *            分页信息
	 * @return 优惠券分页
	 */
	Page<Coupon> findPage(Boolean isEnabled, Boolean isExchange, Boolean hasExpired, Pageable pageable);

}