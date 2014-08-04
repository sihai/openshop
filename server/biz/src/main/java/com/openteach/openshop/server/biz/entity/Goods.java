/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.biz.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * Entity - 货品
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Entity
@Table(name = "xx_goods")
@SequenceGenerator(name = "sequenceGenerator", sequenceName = "xx_goods_sequence")
public class Goods extends BaseEntity {

	private static final long serialVersionUID = -6977025562650112419L;

	/** 商品 */
	private List<Product> products = new ArrayList<Product>();

	/**
	 * 获取商品
	 * 
	 * @return 商品
	 */
	@OneToMany(mappedBy = "goods", fetch = FetchType.EAGER, cascade = CascadeType.ALL, orphanRemoval = true)
	public List<Product> getProducts() {
		return products;
	}

	/**
	 * 设置商品
	 * 
	 * @param products
	 *            商品
	 */
	public void setProducts(List<Product> products) {
		this.products = products;
	}

	/**
	 * 获取规格值
	 * 
	 * @return 规格值
	 */
	@Transient
	public List<SpecificationValue> getSpecificationValues() {
		List<SpecificationValue> specificationValues = new ArrayList<SpecificationValue>();
		if (getProducts() != null) {
			for (Product product : getProducts()) {
				specificationValues.addAll(product.getSpecificationValues());
			}
		}
		return specificationValues;
	}

}