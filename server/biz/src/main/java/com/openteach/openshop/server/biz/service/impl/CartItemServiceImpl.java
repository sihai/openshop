/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.biz.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.openteach.openshop.server.biz.dao.CartItemDao;
import com.openteach.openshop.server.biz.entity.CartItem;
import com.openteach.openshop.server.biz.service.CartItemService;

/**
 * Service - 购物车项
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Service("cartItemServiceImpl")
public class CartItemServiceImpl extends BaseServiceImpl<CartItem, Long> implements CartItemService {

	@Resource(name = "cartItemDaoImpl")
	public void setBaseDao(CartItemDao cartItemDao) {
		super.setBaseDao(cartItemDao);
	}

}