/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.biz.dao.impl;

import java.util.Date;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Repository;

import com.openteach.openshop.server.biz.Page;
import com.openteach.openshop.server.biz.Pageable;
import com.openteach.openshop.server.biz.dao.OrderItemDao;
import com.openteach.openshop.server.biz.entity.Order;
import com.openteach.openshop.server.biz.entity.OrderItem;
import com.openteach.openshop.server.biz.entity.Supplier;
import com.openteach.openshop.server.biz.entity.Order.OrderStatus;
import com.openteach.openshop.server.biz.entity.Order.PaymentStatus;
import com.openteach.openshop.server.biz.entity.Order.ShippingStatus;
import com.openteach.openshop.server.biz.entity.OrderItem.PlatformPaymentStatus;

/**
 * Dao - 订单项
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Repository("orderItemDaoImpl")
public class OrderItemDaoImpl extends BaseDaoImpl<OrderItem, Long> implements OrderItemDao {

	@Override
	public List<OrderItem> findOrderBySupplier(Supplier supplier, OrderStatus[] orderStatuss, PaymentStatus[] paymentStatuss,
			ShippingStatus[] shippingStatuss, Boolean hasExpired, PlatformPaymentStatus[] platformPaymentStatuss,
			ShippingStatus[] itemShippingStatuss) {
		return super.findList(buildQuery(supplier, orderStatuss, paymentStatuss, shippingStatuss, hasExpired, platformPaymentStatuss, itemShippingStatuss), 0, Integer.MAX_VALUE, null, null);
	}

	@Override
	public Page<OrderItem> findOrderBySupplier(Supplier supplier, OrderStatus[] orderStatuss, PaymentStatus[] paymentStatuss,
			ShippingStatus[] shippingStatuss, Boolean hasExpired, PlatformPaymentStatus[] platformPaymentStatuss,
			ShippingStatus[] itemShippingStatuss, Pageable pageable) {
		return super.findPage(buildQuery(supplier, orderStatuss, paymentStatuss, shippingStatuss, hasExpired, platformPaymentStatuss, itemShippingStatuss), pageable);
	}
	
	/**
	 * 
	 * @param supplier
	 * @param orderStatus
	 * @param paymentStatus
	 * @param shippingStatus
	 * @param hasExpired
	 * @param platformPaymentStatus
	 * @param itemShippingStatus
	 * @return
	 */
	private CriteriaQuery<OrderItem> buildQuery(Supplier supplier, OrderStatus[] orderStatuss, PaymentStatus[] paymentStatuss,
			ShippingStatus[] shippingStatuss, Boolean hasExpired, PlatformPaymentStatus[] platformPaymentStatuss,
			ShippingStatus[] itemShippingStatuss) {
		CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
		CriteriaQuery<OrderItem> criteriaQuery = criteriaBuilder.createQuery(OrderItem.class);
		Root<OrderItem> orderItemFrom = criteriaQuery.from(OrderItem.class);
		Join<OrderItem, Order> orderItemOrder = orderItemFrom.join("order", JoinType.INNER);
		criteriaQuery.select(orderItemFrom);
		Predicate restrictions = criteriaBuilder.conjunction();
		restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.equal(orderItemFrom.get("supplier"), supplier));
		
		if (orderStatuss != null && orderStatuss.length > 0) {
			Predicate orp = criteriaBuilder.or(criteriaBuilder.equal(orderItemOrder.get("orderStatus"), orderStatuss[0]));
			for(int i = 1; i < orderStatuss.length; i++) {
				orp = criteriaBuilder.or(orp, criteriaBuilder.equal(orderItemOrder.get("orderStatus"), orderStatuss[i]));
			}
			restrictions = criteriaBuilder.and(restrictions, orp);
		}
		
		if (paymentStatuss != null && paymentStatuss.length > 0) {
			Predicate orp = criteriaBuilder.or(criteriaBuilder.equal(orderItemOrder.get("paymentStatus"), paymentStatuss[0]));
			for(int i = 1; i < paymentStatuss.length; i++) {
				orp = criteriaBuilder.or(orp, criteriaBuilder.equal(orderItemOrder.get("paymentStatus"), paymentStatuss[i]));
			}
			restrictions = criteriaBuilder.and(restrictions, orp);
		}
		if (shippingStatuss != null && shippingStatuss.length > 0) {
			Predicate orp = criteriaBuilder.or(criteriaBuilder.equal(orderItemOrder.get("shippingStatus"), shippingStatuss[0]));
			for(int i = 1; i < shippingStatuss.length; i++) {
				orp = criteriaBuilder.or(orp, criteriaBuilder.equal(orderItemOrder.get("shippingStatus"), shippingStatuss[i]));
			}
			restrictions = criteriaBuilder.and(restrictions, orp);
		}
		if (hasExpired != null) {
			if (hasExpired) {
				restrictions = criteriaBuilder.and(restrictions, orderItemOrder.get("expire").isNotNull(), criteriaBuilder.lessThan(orderItemOrder.<Date> get("expire"), new Date()));
			} else {
				restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.or(orderItemOrder.get("expire").isNull(), criteriaBuilder.greaterThanOrEqualTo(orderItemOrder.<Date> get("expire"), new Date())));
			}
		}
		if (platformPaymentStatuss != null && platformPaymentStatuss.length > 0) {
			Predicate orp = criteriaBuilder.or(criteriaBuilder.equal(orderItemFrom.get("platformPaymentStatus"), platformPaymentStatuss[0]));
			for(int i = 1; i < platformPaymentStatuss.length; i++) {
				orp = criteriaBuilder.or(orp, criteriaBuilder.equal(orderItemFrom.get("platformPaymentStatus"), platformPaymentStatuss[i]));
			}
			restrictions = criteriaBuilder.and(restrictions, orp);
		}
		if (itemShippingStatuss != null && itemShippingStatuss.length > 0) {
			Predicate orp = criteriaBuilder.or(criteriaBuilder.equal(orderItemFrom.get("shippingStatus"), itemShippingStatuss[0]));
			for(int i = 1; i < itemShippingStatuss.length; i++) {
				orp = criteriaBuilder.or(orp, criteriaBuilder.equal(orderItemFrom.get("shippingStatus"), itemShippingStatuss[i]));
			}
			restrictions = criteriaBuilder.and(restrictions, orp);
		}
		criteriaQuery.where(restrictions);
		return criteriaQuery;
	}

	@Override
	public Long waitingShippingCount(Supplier supplier) {
		CriteriaQuery<OrderItem> query = buildQuery(supplier, new OrderStatus[] {OrderStatus.confirmed}, new PaymentStatus[] {PaymentStatus.paid}, new ShippingStatus[] {ShippingStatus.unshipped, ShippingStatus.partialShipment}, false, null, new ShippingStatus[] {ShippingStatus.unshipped, ShippingStatus.partialShipment});
		return super.count(query, null);
	}

	@Override
	public Long waitingPlatformPaymentOrderCount(Supplier supplier) {
		CriteriaQuery<OrderItem> query = buildQuery(supplier, new OrderStatus[] {OrderStatus.completed}, new PaymentStatus[] {PaymentStatus.paid}, new ShippingStatus[] {ShippingStatus.shipped}, false, new PlatformPaymentStatus[] {PlatformPaymentStatus.unpaid}, new ShippingStatus[] {ShippingStatus.shipped});
		return super.count(query, null);
	}

}