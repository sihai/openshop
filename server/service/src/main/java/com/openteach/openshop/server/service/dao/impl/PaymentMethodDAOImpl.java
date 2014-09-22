/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.service.dao.impl;

import org.springframework.stereotype.Repository;

import com.openteach.openshop.server.service.dao.PaymentMethodDAO;
import com.openteach.openshop.server.service.entity.PaymentMethod;

/**
 * Dao - 支付方式
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Repository("paymentMethodDaoImpl")
public class PaymentMethodDAOImpl extends BaseDAOImpl<PaymentMethod, Long> implements PaymentMethodDAO {

}