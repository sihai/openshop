/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.service.dao.impl;

import java.util.Date;

import javax.persistence.FlushModeType;

import org.apache.commons.lang.time.DateUtils;
import org.springframework.stereotype.Repository;

import com.openteach.openshop.server.service.dao.CartDAO;
import com.openteach.openshop.server.service.entity.Cart;

/**
 * Dao - 购物车
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Repository("cartDaoImpl")
public class CartDAOImpl extends BaseDAOImpl<Cart, Long> implements CartDAO {

	public void evictExpired() {
		String jpql = "delete from Cart cart where cart.modifyDate <= :expire";
		entityManager.createQuery(jpql).setFlushMode(FlushModeType.COMMIT).setParameter("expire", DateUtils.addSeconds(new Date(), -Cart.TIMEOUT)).executeUpdate();
	}

}