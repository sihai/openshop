/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.biz.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.openteach.openshop.server.biz.dao.RefundsDao;
import com.openteach.openshop.server.biz.entity.Refunds;
import com.openteach.openshop.server.biz.service.RefundsService;

/**
 * Service - 退款单
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Service("refundsServiceImpl")
public class RefundsServiceImpl extends BaseServiceImpl<Refunds, Long> implements RefundsService {

	@Resource(name = "refundsDaoImpl")
	public void setBaseDao(RefundsDao refundsDao) {
		super.setBaseDao(refundsDao);
	}

}