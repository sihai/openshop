/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package net.shopxx.entity;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import net.shopxx.entity.Order.ShippingStatus;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * Entity - 订单项
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Entity
@Table(name = "xx_order_item")
@SequenceGenerator(name = "sequenceGenerator", sequenceName = "xx_order_item_sequence")
public class OrderItem extends BaseEntity {

	private static final long serialVersionUID = -4999926022604479334L;
	
	/**
	 * 支付状态
	 */
	public static enum PlatformPaymentStatus {

		/** 未支付 */
		unpaid,

		/** 已支付 */
		paid
	}

	/** 商品编号 */
	private String sn;

	/** 商品名称 */
	private String name;

	/** 商品全称 */
	private String fullName;

	/** 商品价格 */
	private BigDecimal price;

	/** 商品重量 */
	private Integer weight;

	/** 商品缩略图 */
	private String thumbnail;

	/** 是否为赠品 */
	private Boolean isGift;

	/** 数量 */
	private Integer quantity;

	/** 已发货数量 */
	private Integer shippedQuantity;

	/** 已退货数量 */
	private Integer returnQuantity;
	
	/**
	 * 平台支付状态
	 */
	private PlatformPaymentStatus platformPaymentStatus;
	
	/** 配送状态 */
	private ShippingStatus shippingStatus;

	/** 商品 */
	private Product product;
	
	/**
	 * 供应商
	 */
	private Supplier supplier;
	
	/**
	 * 返点比例
	 */
	private BigDecimal rebatePoint;
	
	/**
	 * 返点
	 */
	private BigDecimal rebate;
	
	/** 订单 */
	private Order order;
	
	/**
	 * 平台付款
	 */
	private PlatformPayment platformPayment;

	/**
	 * 获取商品编号
	 * 
	 * @return 商品编号
	 */
	@JsonProperty
	@NotEmpty
	@Column(nullable = false, updatable = false)
	public String getSn() {
		return sn;
	}

	/**
	 * 设置商品编号
	 * 
	 * @param sn
	 *            商品编号
	 */
	public void setSn(String sn) {
		this.sn = sn;
	}

	/**
	 * 获取商品名称
	 * 
	 * @return 商品名称
	 */
	@JsonProperty
	@Column(nullable = false, updatable = false)
	public String getName() {
		return name;
	}

	/**
	 * 设置商品名称
	 * 
	 * @param name
	 *            商品名称
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * 获取商品全称
	 * 
	 * @return 商品全称
	 */
	@JsonProperty
	@Column(nullable = false, updatable = false)
	public String getFullName() {
		return fullName;
	}

	/**
	 * 设置商品全称
	 * 
	 * @param fullName
	 *            商品全称
	 */
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	/**
	 * 获取商品价格
	 * 
	 * @return 商品价格
	 */
	@JsonProperty
	@NotNull
	@Min(0)
	@Digits(integer = 12, fraction = 3)
	@Column(nullable = false, precision = 21, scale = 6)
	public BigDecimal getPrice() {
		return price;
	}

	/**
	 * 设置商品价格
	 * 
	 * @param price
	 *            商品价格
	 */
	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	/**
	 * 获取商品重量
	 * 
	 * @return 商品重量
	 */
	@JsonProperty
	@Column(updatable = false)
	public Integer getWeight() {
		return weight;
	}

	/**
	 * 设置商品重量
	 * 
	 * @param weight
	 *            商品重量
	 */
	public void setWeight(Integer weight) {
		this.weight = weight;
	}

	/**
	 * 获取商品缩略图
	 * 
	 * @return 商品缩略图
	 */
	@JsonProperty
	@Column(updatable = false)
	public String getThumbnail() {
		return thumbnail;
	}

	/**
	 * 设置商品缩略图
	 * 
	 * @param thumbnail
	 *            商品缩略图
	 */
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	/**
	 * 获取是否为赠品
	 * 
	 * @return 是否为赠品
	 */
	@JsonProperty
	@Column(nullable = false, updatable = false)
	public Boolean getIsGift() {
		return isGift;
	}

	/**
	 * 设置是否为赠品
	 * 
	 * @param isGift
	 *            是否为赠品
	 */
	public void setIsGift(Boolean isGift) {
		this.isGift = isGift;
	}

	/**
	 * 获取数量
	 * 
	 * @return 数量
	 */
	@JsonProperty
	@NotNull
	@Min(1)
	@Max(10000)
	@Column(nullable = false)
	public Integer getQuantity() {
		return quantity;
	}

	/**
	 * 设置数量
	 * 
	 * @param quantity
	 *            数量
	 */
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	/**
	 * 获取已发货数量
	 * 
	 * @return 已发货数量
	 */
	@Column(nullable = false)
	public Integer getShippedQuantity() {
		return shippedQuantity;
	}

	/**
	 * 设置已发货数量
	 * 
	 * @param shippedQuantity
	 *            已发货数量
	 */
	public void setShippedQuantity(Integer shippedQuantity) {
		this.shippedQuantity = shippedQuantity;
	}

	/**
	 * 获取已退货数量
	 * 
	 * @return 已退货数量
	 */
	@Column(nullable = false)
	public Integer getReturnQuantity() {
		return returnQuantity;
	}

	/**
	 * 设置已退货数量
	 * 
	 * @param returnQuantity
	 *            已退货数量
	 */
	public void setReturnQuantity(Integer returnQuantity) {
		this.returnQuantity = returnQuantity;
	}
	
	/**
	 * 
	 * @return
	 */
	@Column(nullable = false)
	public PlatformPaymentStatus getPlatformPaymentStatus() {
		return platformPaymentStatus;
	}

	/**
	 * 
	 * @param platformPaymentStatus
	 */
	public void setPlatformPaymentStatus(PlatformPaymentStatus platformPaymentStatus) {
		this.platformPaymentStatus = platformPaymentStatus;
	}
	
	/**
	 * 获取配送状态
	 * 
	 * @return 配送状态
	 */
	@Column(nullable = false)
	public ShippingStatus getShippingStatus() {
		return shippingStatus;
	}

	/**
	 * 设置配送状态
	 * 
	 * @param shippingStatus
	 *            配送状态
	 */
	public void setShippingStatus(ShippingStatus shippingStatus) {
		this.shippingStatus = shippingStatus;
	}

	/**
	 * 获取商品
	 * 
	 * @return 商品
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	public Product getProduct() {
		return product;
	}

	/**
	 * 设置商品
	 * 
	 * @param product
	 *            商品
	 */
	public void setProduct(Product product) {
		this.product = product;
	}
	
	/**
	 * 获取供应商
	 * 
	 * @return 供应商
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	public Supplier getSupplier() {
		return supplier;
	}

	/**
	 * 设置供应商
	 * 
	 * @param supplier
	 *            供应商
	 */
	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}
	
	/**
	 * 
	 * @return
	 */
	@JsonProperty
	@NotNull
	@Min(0)
	@Digits(integer = 12, fraction = 3)
	@Column(nullable = false, precision = 21, scale = 6)
	public BigDecimal getRebatePoint() {
		return rebatePoint;
	}

	/**
	 * 
	 * @param rebatePoint
	 */
	public void setRebatePoint(BigDecimal rebatePoint) {
		this.rebatePoint = rebatePoint;
	}

	/**
	 * 
	 * @return
	 */
	@JsonProperty
	@NotNull
	@Min(0)
	@Digits(integer = 12, fraction = 3)
	@Column(nullable = false, precision = 21, scale = 6)
	public BigDecimal getRebate() {
		return rebate;
	}

	/**
	 * 
	 * @param rebate
	 */
	public void setRebate(BigDecimal rebate) {
		this.rebate = rebate;
	}

	/**
	 * 获取订单
	 * 
	 * @return 订单
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "orders", nullable = false, updatable = false)
	public Order getOrder() {
		return order;
	}

	/**
	 * 设置订单
	 * 
	 * @param order
	 *            订单
	 */
	public void setOrder(Order order) {
		this.order = order;
	}

	/**
	 * 获取商品总重量
	 * 
	 * @return 商品总重量
	 */
	@JsonProperty
	@Transient
	public int getTotalWeight() {
		if (getWeight() != null && getQuantity() != null) {
			return getWeight() * getQuantity();
		} else {
			return 0;
		}
	}

	/**
	 * 获取小计
	 * 
	 * @return 小计
	 */
	@JsonProperty
	@Transient
	public BigDecimal getSubtotal() {
		if (getPrice() != null && getQuantity() != null) {
			return getPrice().multiply(new BigDecimal(getQuantity()));
		} else {
			return new BigDecimal(0);
		}
	}
	
	/**
	 * 获取小计
	 * 
	 * @return 小计
	 */
	@JsonProperty
	@Transient
	public BigDecimal getPlatformShouldPay() {
		BigDecimal amount = getSubtotal();
		if(amount.compareTo(new BigDecimal(0)) > 0) {
			return amount.subtract(this.getRebate());
		}
		return new BigDecimal(0);
	}

	/**
	 * 
	 * @return
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	public PlatformPayment getPlatformPayment() {
		return platformPayment;
	}

	/**
	 * 
	 * @param platformPaymen
	 */
	public void setPlatformPayment(PlatformPayment platformPayment) {
		this.platformPayment = platformPayment;
	}
}