/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.biz.dao.impl;

import javax.persistence.FlushModeType;
import javax.persistence.NoResultException;

import org.springframework.stereotype.Repository;

import com.openteach.openshop.server.biz.dao.SupplierDAO;
import com.openteach.openshop.server.biz.entity.Supplier;

/**
 * Dao - 供应商
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Repository("supplierDAO")
public class SupplierDAOImpl extends BaseDaoImpl<Supplier, Long> implements SupplierDAO {

	public boolean isNameExists(String name) {
		if (name == null) {
			return false;
		}
		String jpql = "select count(*) from Supplier supplier where lower(supplier.name) = lower(:name)";
		Long count = entityManager.createQuery(jpql, Long.class).setFlushMode(FlushModeType.COMMIT).setParameter("name", name).getSingleResult();
		return count > 0;
	}

	public Supplier findByName(String name) {
		if (name == null) {
			return null;
		}
		try {
			String jpql = "select supplier from Supplier supplier where lower(supplier.name) = lower(:name)";
			return entityManager.createQuery(jpql, Supplier.class).setFlushMode(FlushModeType.COMMIT).setParameter("name", name).getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

}