/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.service.dao;

import java.math.BigDecimal;

import com.openteach.openshop.server.service.Page;
import com.openteach.openshop.server.service.Pageable;
import com.openteach.openshop.server.service.entity.PlatformPayment;
import com.openteach.openshop.server.service.entity.Supplier;

/**
 * DAO - 供应商
 * 
 * @author Team
 * @version 0.0.1
 */
public interface PlatformPaymentDAO extends BaseDAO<PlatformPayment, Long> {
	
	/**
	 * 
	 * @param sn
	 * @return
	 */
	boolean isSnExists(String sn);
	
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