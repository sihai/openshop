/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.biz.service.impl;

import java.util.Date;

import javax.annotation.Resource;
import javax.persistence.LockModeType;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.openteach.openshop.server.biz.dao.PaymentDao;
import com.openteach.openshop.server.biz.entity.Member;
import com.openteach.openshop.server.biz.entity.Order;
import com.openteach.openshop.server.biz.entity.Payment;
import com.openteach.openshop.server.biz.entity.Payment.Status;
import com.openteach.openshop.server.biz.entity.Payment.Type;
import com.openteach.openshop.server.biz.service.MemberService;
import com.openteach.openshop.server.biz.service.OrderService;
import com.openteach.openshop.server.biz.service.PaymentService;

/**
 * Service - 收款单
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Service("paymentServiceImpl")
public class PaymentServiceImpl extends BaseServiceImpl<Payment, Long> implements PaymentService {

	@Resource(name = "paymentDaoImpl")
	private PaymentDao paymentDao;
	@Resource(name = "orderServiceImpl")
	private OrderService orderService;
	@Resource(name = "memberServiceImpl")
	private MemberService memberService;

	@Resource(name = "paymentDaoImpl")
	public void setBaseDao(PaymentDao paymentDao) {
		super.setBaseDao(paymentDao);
	}

	@Transactional(readOnly = true)
	public Payment findBySn(String sn) {
		return paymentDao.findBySn(sn);
	}

	public void handle(Payment payment) {
		paymentDao.refresh(payment, LockModeType.PESSIMISTIC_WRITE);
		if (payment != null && payment.getStatus() == Status.wait) {
			if (payment.getType() == Type.payment) {
				Order order = payment.getOrder();
				if (order != null) {
					orderService.payment(order, payment, null);
				}
			} else if (payment.getType() == Type.recharge) {
				Member member = payment.getMember();
				if (member != null) {
					memberService.update(member, null, payment.getEffectiveAmount(), null, null);
				}
			}
			payment.setStatus(Status.success);
			payment.setPaymentDate(new Date());
			paymentDao.merge(payment);
		}
	}

}