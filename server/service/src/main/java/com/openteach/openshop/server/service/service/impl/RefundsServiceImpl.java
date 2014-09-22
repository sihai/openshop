/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.service.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.openteach.openshop.server.service.dao.RefundsDAO;
import com.openteach.openshop.server.service.entity.Refunds;
import com.openteach.openshop.server.service.service.RefundsService;

/**
 * Service - 退款单
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Service("refundsServiceImpl")
public class RefundsServiceImpl extends BaseServiceImpl<Refunds, Long> implements RefundsService {

	@Resource(name = "refundsDaoImpl")
	public void setBaseDao(RefundsDAO refundsDao) {
		super.setBaseDao(refundsDao);
	}

}