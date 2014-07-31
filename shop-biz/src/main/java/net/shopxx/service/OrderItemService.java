/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package net.shopxx.service;

import java.util.List;

import net.shopxx.Page;
import net.shopxx.Pageable;
import net.shopxx.entity.Order.OrderStatus;
import net.shopxx.entity.Order.PaymentStatus;
import net.shopxx.entity.Order.ShippingStatus;
import net.shopxx.entity.OrderItem;
import net.shopxx.entity.PlatformPayment;
import net.shopxx.entity.OrderItem.PlatformPaymentStatus;
import net.shopxx.entity.Supplier;

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