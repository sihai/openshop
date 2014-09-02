/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.service.service;

import java.util.List;

import com.openteach.openshop.server.service.Filter;
import com.openteach.openshop.server.service.Order;
import com.openteach.openshop.server.service.entity.Supplier;

/**
 * Service - 供应商
 * 
 * @author 
 * @version 0.0.1
 */
public interface SupplierService extends BaseService<Supplier, Long> {

	/**
	 * 通过供应商名称查询
	 * @param name
	 * @return
	 */
	Supplier findByName(String name);
	
	/**
	 * 
	 * @param name
	 * @return
	 */
	boolean isNameExists(String name);
	
	/**
	 * 查找供应商(缓存)
	 * 
	 * @param count
	 *            数量
	 * @param filters
	 *            筛选
	 * @param orders
	 *            排序
	 * @param cacheRegion
	 *            缓存区域
	 * @return 供应商(缓存)
	 */
	List<Supplier> findList(Integer count, List<Filter> filters, List<Order> orders, String cacheRegion);
	
	/**
	 * 根据ID查找权限
	 * 
	 * @param id
	 *            ID
	 * @return 权限,若不存在则返回null
	 */
	List<String> findAuthorities(Long id);
	
	/**
	 * Get current supplier
	 * @return
	 */
	Supplier getCurrent();

}