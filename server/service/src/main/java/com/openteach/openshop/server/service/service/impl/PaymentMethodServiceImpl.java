/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.service.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.openteach.openshop.server.service.dao.PaymentMethodDAO;
import com.openteach.openshop.server.service.entity.PaymentMethod;
import com.openteach.openshop.server.service.service.PaymentMethodService;

/**
 * Service - 支付方式
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Service("paymentMethodServiceImpl")
public class PaymentMethodServiceImpl extends BaseServiceImpl<PaymentMethod, Long> implements PaymentMethodService {

	@Resource(name = "paymentMethodDaoImpl")
	public void setBaseDao(PaymentMethodDAO paymentMethodDao) {
		super.setBaseDao(paymentMethodDao);
	}

}