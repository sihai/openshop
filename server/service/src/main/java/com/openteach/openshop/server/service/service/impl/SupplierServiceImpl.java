/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.service.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.openteach.openshop.server.service.Filter;
import com.openteach.openshop.server.service.Order;
import com.openteach.openshop.server.service.Principal;
import com.openteach.openshop.server.service.dao.SupplierDAO;
import com.openteach.openshop.server.service.entity.Admin;
import com.openteach.openshop.server.service.entity.Role;
import com.openteach.openshop.server.service.entity.Supplier;
import com.openteach.openshop.server.service.service.SupplierService;

/**
 * Service - 供应商
 * 
 * @author Team
 * @version 0.0.1
 */
@Service("supplierService")
public class SupplierServiceImpl extends BaseServiceImpl<Supplier, Long> implements SupplierService {

	@Resource(name = "supplierDAO")
	private SupplierDAO supplierDAO;
	
	@Resource(name = "supplierDAO")
	public void setBaseDao(SupplierDAO supplierDAO) {
		super.setBaseDao(supplierDAO);
	}

	@Override
	@Transactional(readOnly = true)
	public boolean isNameExists(String name) {
		return supplierDAO.isNameExists(name);
	}

	@Override
	@Transactional(readOnly = true)
	public Supplier findByName(String name) {
		return supplierDAO.findByName(name);
	}

	@Transactional(readOnly = true)
	@Cacheable("supplier")
	public List<Supplier> findList(Integer count, List<Filter> filters, List<Order> orders, String cacheRegion) {
		return supplierDAO.findList(null, count, filters, orders);
	}

	@Override
	@Transactional(readOnly = true)
	public List<String> findAuthorities(Long id) {
		List<String> authorities = new ArrayList<String>();
		Supplier supplier = supplierDAO.find(id);
		// XXX TODO
		return authorities;
	}

	@Override
	@Transactional
	@CacheEvict(value = "supplier", allEntries = true)
	public void save(Supplier supplier) {
		super.save(supplier);
	}

	@Override
	@Transactional
	@CacheEvict(value = "supplier", allEntries = true)
	public Supplier update(Supplier supplier) {
		return super.update(supplier);
	}

	@Override
	@Transactional
	@CacheEvict(value = "supplier", allEntries = true)
	public Supplier update(Supplier supplier, String... ignoreProperties) {
		return super.update(supplier, ignoreProperties);
	}

	@Override
	@Transactional
	@CacheEvict(value = "supplier", allEntries = true)
	public void delete(Long id) {
		super.delete(id);
	}

	@Override
	@Transactional
	@CacheEvict(value = "supplier", allEntries = true)
	public void delete(Long... ids) {
		super.delete(ids);
	}

	@Override
	@Transactional
	@CacheEvict(value = "supplier", allEntries = true)
	public void delete(Supplier supplier) {
		super.delete(supplier);
	}
	
	@Override
	@Transactional(readOnly = true)
	public Supplier getCurrent() {
		Subject subject = SecurityUtils.getSubject();
		if (subject != null) {
			Principal principal = (Principal) subject.getPrincipal();
			if (principal != null) {
				return supplierDAO.find(principal.getId());
			}
		}
		return null;
	}

}