/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.service.service;

import java.math.BigDecimal;

import com.openteach.openshop.server.service.Page;
import com.openteach.openshop.server.service.Pageable;
import com.openteach.openshop.server.service.entity.PlatformPayment;
import com.openteach.openshop.server.service.entity.Supplier;

/**
 * Service - 供应商
 * 
 * @author 
 * @version 0.0.1
 */
public interface PlatformPaymentService extends BaseService<PlatformPayment, Long> {

	/**
	 * 
	 * @param supplier
	 * @return
	 */
	Long platformPaymentCount(Supplier supplier);
	
	/**
	 * 
	 * @param supplier
	 * @return
	 */
	BigDecimal income(Supplier supplier);
	
	/**
	 * 
	 * @param supplier
	 * @return
	 */
	BigDecimal rebate(Supplier supplier);
	
	/**
	 * 
	 * @param supplier
	 * @param pageable
	 * @return
	 */
	Page<PlatformPayment> findPage(Supplier supplier, Pageable pageable);
}