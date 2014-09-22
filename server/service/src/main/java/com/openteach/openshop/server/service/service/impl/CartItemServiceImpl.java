/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.service.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.openteach.openshop.server.service.dao.CartItemDAO;
import com.openteach.openshop.server.service.entity.CartItem;
import com.openteach.openshop.server.service.service.CartItemService;

/**
 * Service - 购物车项
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Service("cartItemServiceImpl")
public class CartItemServiceImpl extends BaseServiceImpl<CartItem, Long> implements CartItemService {

	@Resource(name = "cartItemDaoImpl")
	public void setBaseDao(CartItemDAO cartItemDao) {
		super.setBaseDao(cartItemDao);
	}

}