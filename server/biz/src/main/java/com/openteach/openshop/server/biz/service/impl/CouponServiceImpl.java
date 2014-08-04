/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.biz.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.openteach.openshop.server.biz.Page;
import com.openteach.openshop.server.biz.Pageable;
import com.openteach.openshop.server.biz.dao.CouponDao;
import com.openteach.openshop.server.biz.entity.Coupon;
import com.openteach.openshop.server.biz.service.CouponService;

/**
 * Service - 优惠券
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Service("couponServiceImpl")
public class CouponServiceImpl extends BaseServiceImpl<Coupon, Long> implements CouponService {

	@Resource(name = "couponDaoImpl")
	private CouponDao couponDao;

	@Resource(name = "couponDaoImpl")
	public void setBaseDao(CouponDao couponDao) {
		super.setBaseDao(couponDao);
	}

	@Transactional(readOnly = true)
	public Page<Coupon> findPage(Boolean isEnabled, Boolean isExchange, Boolean hasExpired, Pageable pageable) {
		return couponDao.findPage(isEnabled, isExchange, hasExpired, pageable);
	}

}