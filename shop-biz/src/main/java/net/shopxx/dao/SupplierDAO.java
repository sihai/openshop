/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package net.shopxx.dao;

import net.shopxx.entity.Supplier;

/**
 * DAO - 供应商
 * 
 * @author Team
 * @version 0.0.1
 */
public interface SupplierDAO extends BaseDao<Supplier, Long> {

	/**
	 * 判断供应商名称是否存在
	 * 
	 * @param name
	 *            供应商名称(忽略大小写)
	 * @return 供应商名称是否存在
	 */
	boolean isNameExists(String name);

	/**
	 * 根据供应商名称查找供应商名称
	 * 
	 * @param name
	 *            供应商名称(忽略大小写)
	 * @return 供应商名称，若不存在则返回null
	 */
	Supplier findByName(String name);

}