/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.biz.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.openteach.openshop.server.biz.dao.DeliveryCorpDao;
import com.openteach.openshop.server.biz.entity.DeliveryCorp;
import com.openteach.openshop.server.biz.service.DeliveryCorpService;

/**
 * Service - 物流公司
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Service("deliveryCorpServiceImpl")
public class DeliveryCorpServiceImpl extends BaseServiceImpl<DeliveryCorp, Long> implements DeliveryCorpService {

	@Resource(name = "deliveryCorpDaoImpl")
	public void setBaseDao(DeliveryCorpDao deliveryCorpDao) {
		super.setBaseDao(deliveryCorpDao);
	}

}