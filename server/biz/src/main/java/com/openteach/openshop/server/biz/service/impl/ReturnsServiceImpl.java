/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.biz.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.openteach.openshop.server.biz.dao.ReturnsDao;
import com.openteach.openshop.server.biz.entity.Returns;
import com.openteach.openshop.server.biz.service.ReturnsService;

/**
 * Service - 退货单
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Service("returnsServiceImpl")
public class ReturnsServiceImpl extends BaseServiceImpl<Returns, Long> implements ReturnsService {

	@Resource(name = "returnsDaoImpl")
	public void setBaseDao(ReturnsDao returnsDao) {
		super.setBaseDao(returnsDao);
	}

}