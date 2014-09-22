/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.service.dao;

import com.openteach.openshop.server.service.entity.Cart;

/**
 * Dao - 购物车
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
public interface CartDAO extends BaseDAO<Cart, Long> {

	/**
	 * 清除过期购物车
	 */
	void evictExpired();

}