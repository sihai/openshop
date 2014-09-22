/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.service.dao.impl;

import org.springframework.stereotype.Repository;

import com.openteach.openshop.server.service.dao.CartItemDAO;
import com.openteach.openshop.server.service.entity.CartItem;

/**
 * Dao - 购物车项
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Repository("cartItemDaoImpl")
public class CartItemDAOImpl extends BaseDAOImpl<CartItem, Long> implements CartItemDAO {

}