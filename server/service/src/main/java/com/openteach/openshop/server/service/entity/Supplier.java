/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.service.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.PreRemove;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

/**
 * Entity - 供应商
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Entity
@Table(name = "xx_supplier")
@SequenceGenerator(name = "sequenceGenerator", sequenceName = "xx_supplier_sequence")
public class Supplier extends BaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8161742046190014918L;
	
	/**
	 * 级别
	 * @author sihai
	 *
	 */
	public static enum Level {
		/**
		 * 普通供应商
		 */
		GENERAL,
		/**
		 * 银牌供应商
		 */
		SILVER,
		/**
		 * 金牌供应商
		 */
		GOLD;
	}

	/** 供应名称 */
	private String name;

	/** 密码 */
	private String password;

	/** E-mail */
	private String email;
	
	/**
	 * 支付宝帐号
	 */
	private String alipay;
	
	/**
	 * 银行
	 */
	private String bank;
	
	/**
	 * 银行帐号
	 */
	private String account;
	
	/**
	 * 级别
	 */
	private Level level;

	/** 是否启用 */
	private Boolean isEnabled;

	/** 是否锁定 */
	private Boolean isLocked;

	/** 连续登录失败次数 */
	private Integer loginFailureCount;

	/** 锁定日期 */
	private Date lockedDate;

	/** 最后登录日期 */
	private Date loginDate;

	/** 最后登录IP */
	private String loginIp;
	
	/** 产品 */
	private Set<Product> products = new HashSet<Product>();
	
	/** 订单 */
	private Set<OrderItem> orderItems = new HashSet<OrderItem>();

	/**
	 * 获取用户名
	 * 
	 * @return 用户名
	 */
	@NotEmpty(groups = Save.class)
	@Pattern(regexp = "^[0-9a-z_A-Z\\u4e00-\\u9fa5]+$")
	@Length(min = 2, max = 20)
	@Column(nullable = false, updatable = false, unique = true, length = 100)
	public String getName() {
		return name;
	}

	/**
	 * 设置用户名
	 * 
	 * @param username
	 *            用户名
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * 获取密码
	 * 
	 * @return 密码
	 */
	@NotEmpty(groups = Save.class)
	@Pattern(regexp = "^[^\\s&\"<>]+$")
	@Length(min = 4, max = 20)
	@Column(nullable = false)
	public String getPassword() {
		return password;
	}

	/**
	 * 设置密码
	 * 
	 * @param password
	 *            密码
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * 获取E-mail
	 * 
	 * @return E-mail
	 */
	@NotEmpty
	@Email
	@Length(max = 200)
	@Column(nullable = false)
	public String getEmail() {
		return email;
	}

	/**
	 * 设置E-mail
	 * 
	 * @param email
	 *            E-mail
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	
	/**
	 * 获取alipay
	 * 
	 * @return E-mail
	 */
	@Length(max = 200)
	@Column(nullable = true)
	public String getAlipay() {
		return alipay;
	}

	/**
	 * 设置alipay
	 * 
	 * @param alipay
	 *            alipay
	 */
	public void setAlipay(String alipay) {
		this.alipay = alipay;
	}
	
	/**
	 * 获取bank
	 * 
	 * @return E-mail
	 */
	@Length(max = 200)
	@Column(nullable = true)
	public String getBank() {
		return bank;
	}

	/**
	 * 设置bank
	 * 
	 * @param bank
	 *            bank
	 */
	public void setBank(String bank) {
		this.bank = bank;
	}
	
	/**
	 * 获取account
	 * 
	 * @return account
	 */
	@Length(max = 200)
	@Column(nullable = true)
	public String getAccount() {
		return account;
	}

	/**
	 * 设置account
	 * 
	 * @param account
	 *            account
	 */
	public void setAccount(String account) {
		this.account = account;
	}
	
	/**
	 * 获取level
	 * 
	 * @return
	 */
	@NotNull
	@Column(nullable = false)
	public Level getLevel() {
		return level;
	}

	/**
	 * 设置级别
	 * 
	 * @param level
	 */
	public void setLevel(Level level) {
		this.level = level;
	}
	
	/**
	 * 获取是否启用
	 * 
	 * @return 是否启用
	 */
	@NotNull
	@Column(nullable = false)
	public Boolean getIsEnabled() {
		return isEnabled;
	}

	/**
	 * 设置是否启用
	 * 
	 * @param isEnabled
	 *            是否启用
	 */
	public void setIsEnabled(Boolean isEnabled) {
		this.isEnabled = isEnabled;
	}

	/**
	 * 获取是否锁定
	 * 
	 * @return 是否锁定
	 */
	@Column(nullable = false)
	public Boolean getIsLocked() {
		return isLocked;
	}

	/**
	 * 设置是否锁定
	 * 
	 * @param isLocked
	 *            是否锁定
	 */
	public void setIsLocked(Boolean isLocked) {
		this.isLocked = isLocked;
	}

	/**
	 * 获取连续登录失败次数
	 * 
	 * @return 连续登录失败次数
	 */
	@Column(nullable = false)
	public Integer getLoginFailureCount() {
		return loginFailureCount;
	}

	/**
	 * 设置连续登录失败次数
	 * 
	 * @param loginFailureCount
	 *            连续登录失败次数
	 */
	public void setLoginFailureCount(Integer loginFailureCount) {
		this.loginFailureCount = loginFailureCount;
	}

	/**
	 * 获取锁定日期
	 * 
	 * @return 锁定日期
	 */
	public Date getLockedDate() {
		return lockedDate;
	}

	/**
	 * 设置锁定日期
	 * 
	 * @param lockedDate
	 *            锁定日期
	 */
	public void setLockedDate(Date lockedDate) {
		this.lockedDate = lockedDate;
	}

	/**
	 * 获取最后登录日期
	 * 
	 * @return 最后登录日期
	 */
	public Date getLoginDate() {
		return loginDate;
	}

	/**
	 * 设置最后登录日期
	 * 
	 * @param loginDate
	 *            最后登录日期
	 */
	public void setLoginDate(Date loginDate) {
		this.loginDate = loginDate;
	}

	/**
	 * 获取最后登录IP
	 * 
	 * @return 最后登录IP
	 */
	public String getLoginIp() {
		return loginIp;
	}

	/**
	 * 设置最后登录IP
	 * 
	 * @param loginIp
	 *            最后登录IP
	 */
	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}
	
	/**
	 * 获取产品
	 * 
	 * @return 订单
	 */
	@OneToMany(mappedBy = "supplier", fetch = FetchType.LAZY)
	public Set<Product> getProducts() {
		return products;
	}

	/**
	 * 设置产品
	 * 
	 * @param products
	 *            订单
	 */
	public void setProducts(Set<Product> products) {
		this.products = products;
	}

	/**
	 * 获取订单
	 * 
	 * @return 订单
	 */
	@OneToMany(mappedBy = "supplier", fetch = FetchType.LAZY)
	public Set<OrderItem> getOrders() {
		return orderItems;
	}

	/**
	 * 设置订单
	 * 
	 * @param orders
	 *            订单
	 */
	public void setOrders(Set<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}

	/**
	 * 删除前处理
	 */
	@PreRemove
	public void preRemove() {
		// TODO
		throw new IllegalStateException("Not allowed delete");
	}

}