/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.service.dao.impl;

import org.springframework.stereotype.Repository;

import com.openteach.openshop.server.service.dao.OrderLogDAO;
import com.openteach.openshop.server.service.entity.OrderLog;

/**
 * Dao - 订单日志
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Repository("orderLogDaoImpl")
public class OrderLogDAOImpl extends BaseDAOImpl<OrderLog, Long> implements OrderLogDAO {

}