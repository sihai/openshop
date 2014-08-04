/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.biz.service;

import java.util.List;

import com.openteach.openshop.server.biz.Page;
import com.openteach.openshop.server.biz.Pageable;
import com.openteach.openshop.server.biz.entity.OrderItem;
import com.openteach.openshop.server.biz.entity.PlatformPayment;
import com.openteach.openshop.server.biz.entity.Supplier;
import com.openteach.openshop.server.biz.entity.Order.OrderStatus;
import com.openteach.openshop.server.biz.entity.Order.PaymentStatus;
import com.openteach.openshop.server.biz.entity.Order.ShippingStatus;
import com.openteach.openshop.server.biz.entity.OrderItem.PlatformPaymentStatus;

/**
 * Service - 订单项
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
public interface OrderItemService extends BaseService<OrderItem, Long> {

	/**
	 * 
	 * @param supplier
	 * @return
	 */
	Long waitingShippingCount(Supplier supplier);
	
	/**
	 * 
	 * @param supplier
	 * @return
	 */
	Long waitingPlatformPaymentOrderCount(Supplier supplier);
	
	/**
	 * 
	 * @param supplier
	 * @param orderStatuss
	 * @param paymentStatuss
	 * @param shippingStatuss
	 * @param hasExpired
	 * @param platformPaymentStatuss
	 * @param itemShippingStatuss
	 * @param pageable
	 * @return
	 */
	Page<OrderItem> findOrderBySupplier(Supplier supplier, OrderStatus[] orderStatuss, PaymentStatus[] paymentStatuss, ShippingStatus[] shippingStatuss, Boolean hasExpired, PlatformPaymentStatus[] platformPaymentStatuss, ShippingStatus[] itemShippingStatuss, Pageable pageable);

	/**
	 * 
	 * @param supplier
	 * @param orderStatuss
	 * @param paymentStatuss
	 * @param shippingStatuss
	 * @param hasExpired
	 * @param platformPaymentStatuss
	 * @param itemShippingStatuss
	 * @return
	 */
	List<OrderItem> findOrderBySupplier(Supplier supplier, OrderStatus[] orderStatuss, PaymentStatus[] paymentStatuss, ShippingStatus[] shippingStatuss, Boolean hasExpired, PlatformPaymentStatus[] platformPaymentStatuss, ShippingStatus[] itemShippingStatuss);
	
	/**
	 * 
	 * @param supplier
	 * @param orderItemIds
	 * @param payment
	 */
	void checkout(Supplier supplier, Long[] orderItemIds, PlatformPayment payment);
}