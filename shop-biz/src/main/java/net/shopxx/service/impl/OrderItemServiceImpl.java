/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package net.shopxx.service.impl;

import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;
import javax.persistence.LockModeType;

import net.shopxx.Page;
import net.shopxx.Pageable;
import net.shopxx.dao.OrderItemDao;
import net.shopxx.entity.Order.OrderStatus;
import net.shopxx.entity.Order.PaymentStatus;
import net.shopxx.entity.Order.ShippingStatus;
import net.shopxx.entity.OrderItem;
import net.shopxx.entity.OrderItem.PlatformPaymentStatus;
import net.shopxx.entity.PlatformPayment;
import net.shopxx.entity.Supplier;
import net.shopxx.service.OrderItemService;
import net.shopxx.service.PlatformPaymentService;
import net.shopxx.service.SupplierService;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Service - 订单项
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Service("orderItemServiceImpl")
public class OrderItemServiceImpl extends BaseServiceImpl<OrderItem, Long> implements OrderItemService {

	private OrderItemDao orderItemDao;
	@Resource(name = "supplierService")
	private SupplierService supplierService;
	@Resource(name = "platformPaymentService")
	private PlatformPaymentService platformPaymentService;
	
	
	@Resource(name = "orderItemDaoImpl")
	public void setOrderItemDao(OrderItemDao orderItemDao) {
		super.setBaseDao(orderItemDao);
		this.orderItemDao = orderItemDao;
	}

	@Override
	@Transactional(readOnly = true)
	public Long waitingShippingCount(Supplier supplier) {
		return orderItemDao.waitingShippingCount(supplier);
	}

	@Override
	@Transactional(readOnly = true)
	public Long waitingPlatformPaymentOrderCount(Supplier supplier) {
		return orderItemDao.waitingPlatformPaymentOrderCount(supplier);
	}

	@Override
	@Transactional(readOnly = true)
	public Page<OrderItem> findOrderBySupplier(Supplier supplier, OrderStatus[] orderStatuss, PaymentStatus[] paymentStatuss,
			ShippingStatus[] shippingStatuss, Boolean hasExpired, PlatformPaymentStatus[] platformPaymentStatuss,
			ShippingStatus[] itemShippingStatuss, Pageable pageable) {
		return orderItemDao.findOrderBySupplier(supplier, orderStatuss, paymentStatuss, shippingStatuss, hasExpired, platformPaymentStatuss, itemShippingStatuss, pageable);
	}

	@Override
	@Transactional(readOnly = true)
	public List<OrderItem> findOrderBySupplier(Supplier supplier, OrderStatus[] orderStatuss, PaymentStatus[] paymentStatuss,
			ShippingStatus[] shippingStatuss, Boolean hasExpired, PlatformPaymentStatus[] platformPaymentStatuss,
			ShippingStatus[] itemShippingStatuss) {
		return orderItemDao.findOrderBySupplier(supplier, orderStatuss, paymentStatuss, shippingStatuss, hasExpired, platformPaymentStatuss, itemShippingStatuss);
	}

	@Override
	public void checkout(Supplier supplier, Long[] orderItemIds, PlatformPayment payment) {
		List<OrderItem> itemList = findList(orderItemIds);
		for(OrderItem item : itemList) {
			if(!item.getSupplier().getId().equals(supplier.getId())) {
				throw new IllegalArgumentException("all order item must be one supplier");
			}
			orderItemDao.lock(item, LockModeType.PESSIMISTIC_WRITE);
			if(PlatformPaymentStatus.unpaid != item.getPlatformPaymentStatus()) {
				throw new IllegalArgumentException("Data modified by others, please retry");
			}
		}
		
		BigDecimal tmp = null;
		BigDecimal postage = new BigDecimal(0);
		BigDecimal pay = new BigDecimal(0);
		BigDecimal rebate = new BigDecimal(0);
		
		for(OrderItem item : itemList) {
			tmp = item.getPrice().multiply(new BigDecimal(item.getQuantity()));
			//postage += item.get
			rebate = rebate.add(tmp.multiply(item.getRebatePoint()));
			//rebate = rebate.subtract(subtrahend);
			pay = pay.add(tmp.subtract(item.getRebate()));
		}
		
		payment.setMoney(pay.add(postage));
		payment.setRebate(rebate);
		payment.setSupplier(supplier);
		
		// XXX
		platformPaymentService.save(payment);
		
		for(OrderItem item : itemList) {
			// 
			item.setPlatformPayment(payment);
			item.setPlatformPaymentStatus(PlatformPaymentStatus.paid);
			orderItemDao.merge(item);
		}
	}

}