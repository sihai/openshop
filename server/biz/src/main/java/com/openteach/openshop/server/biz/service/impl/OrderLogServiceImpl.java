/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.biz.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.openteach.openshop.server.biz.dao.OrderLogDao;
import com.openteach.openshop.server.biz.entity.OrderLog;
import com.openteach.openshop.server.biz.service.OrderLogService;

/**
 * Service - 订单日志
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Service("orderLogServiceImpl")
public class OrderLogServiceImpl extends BaseServiceImpl<OrderLog, Long> implements OrderLogService {

	@Resource(name = "orderLogDaoImpl")
	public void setBaseDao(OrderLogDao orderLogDao) {
		super.setBaseDao(orderLogDao);
	}

}