/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.biz.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.openteach.openshop.server.biz.dao.DeliveryCenterDao;
import com.openteach.openshop.server.biz.entity.DeliveryCenter;
import com.openteach.openshop.server.biz.service.DeliveryCenterService;

/**
 * Service - 广告
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Service("deliveryCenterServiceImpl")
public class DeliveryCenterServiceImpl extends BaseServiceImpl<DeliveryCenter, Long> implements DeliveryCenterService {

	@Resource(name = "deliveryCenterDaoImpl")
	private DeliveryCenterDao deliveryCenterDao;

	@Resource(name = "deliveryCenterDaoImpl")
	public void setBaseDao(DeliveryCenterDao DeliveryCenterDao) {
		super.setBaseDao(DeliveryCenterDao);
	}

	@Transactional(readOnly = true)
	public DeliveryCenter findDefault() {
		return deliveryCenterDao.findDefault();
	}

}