/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.biz.service.impl;

import java.math.BigDecimal;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.openteach.openshop.server.biz.Filter;
import com.openteach.openshop.server.biz.Page;
import com.openteach.openshop.server.biz.Pageable;
import com.openteach.openshop.server.biz.dao.PlatformPaymentDAO;
import com.openteach.openshop.server.biz.entity.PlatformPayment;
import com.openteach.openshop.server.biz.entity.Supplier;
import com.openteach.openshop.server.biz.service.PlatformPaymentService;

/**
 * Service - 供应商
 * 
 * @author Team
 * @version 0.0.1
 */
@Service("platformPaymentService")
public class PlatformPaymentServiceImpl extends BaseServiceImpl<PlatformPayment, Long> implements PlatformPaymentService {

	@Resource(name = "platformPaymentDAO")
	private PlatformPaymentDAO platformPaymentDAO;
	
	@Resource(name = "platformPaymentDAO")
	public void setBaseDao(PlatformPaymentDAO platformPaymentDAO) {
		super.setBaseDao(platformPaymentDAO);
	}

	@Override
	@Transactional(readOnly = true)
	public Long platformPaymentCount(Supplier supplier) {
		return count(new Filter[] {new Filter("supplier", Filter.Operator.eq, supplier)});
	}

	@Override
	@Transactional(readOnly = true)
	public BigDecimal income(Supplier supplier) {
		return platformPaymentDAO.income(supplier);
	}

	@Override
	public BigDecimal rebate(Supplier supplier) {
		return platformPaymentDAO.rebate(supplier);
	}

	@Override
	@Transactional(readOnly = true)
	public Page<PlatformPayment> findPage(Supplier supplier, Pageable pageable) {
		return platformPaymentDAO.findPage(supplier, pageable);
	}

}