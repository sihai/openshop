/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.service.dao.impl;

import javax.persistence.FlushModeType;
import javax.persistence.NoResultException;

import org.springframework.stereotype.Repository;

import com.openteach.openshop.server.service.dao.ShippingDAO;
import com.openteach.openshop.server.service.entity.Shipping;

/**
 * Dao - 发货单
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Repository("shippingDaoImpl")
public class ShippingDAOImpl extends BaseDAOImpl<Shipping, Long> implements ShippingDAO {

	public Shipping findBySn(String sn) {
		if (sn == null) {
			return null;
		}
		String jpql = "select shipping from Shipping shipping where lower(shipping.sn) = lower(:sn)";
		try {
			return entityManager.createQuery(jpql, Shipping.class).setFlushMode(FlushModeType.COMMIT).setParameter("sn", sn).getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

}