/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.biz.dao.impl;

import javax.persistence.FlushModeType;
import javax.persistence.NoResultException;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Repository;
import org.springframework.util.Assert;

import com.openteach.openshop.server.biz.Page;
import com.openteach.openshop.server.biz.Pageable;
import com.openteach.openshop.server.biz.dao.ReceiverDao;
import com.openteach.openshop.server.biz.entity.Member;
import com.openteach.openshop.server.biz.entity.Receiver;

/**
 * Dao - 收货地址
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Repository("receiverDaoImpl")
public class ReceiverDaoImpl extends BaseDAOImpl<Receiver, Long> implements ReceiverDao {

	public Receiver findDefault(Member member) {
		if (member == null) {
			return null;
		}
		try {
			String jpql = "select receiver from Receiver receiver where receiver.member = :member and receiver.isDefault = true";
			return entityManager.createQuery(jpql, Receiver.class).setFlushMode(FlushModeType.COMMIT).setParameter("member", member).getSingleResult();
		} catch (NoResultException e) {
			try {
				String jpql = "select receiver from Receiver receiver where receiver.member = :member order by receiver.modifyDate desc";
				return entityManager.createQuery(jpql, Receiver.class).setFlushMode(FlushModeType.COMMIT).setParameter("member", member).setMaxResults(1).getSingleResult();
			} catch (NoResultException e1) {
				return null;
			}
		}
	}

	public Page<Receiver> findPage(Member member, Pageable pageable) {
		CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
		CriteriaQuery<Receiver> criteriaQuery = criteriaBuilder.createQuery(Receiver.class);
		Root<Receiver> root = criteriaQuery.from(Receiver.class);
		criteriaQuery.select(root);
		if (member != null) {
			criteriaQuery.where(criteriaBuilder.equal(root.get("member"), member));
		}
		return super.findPage(criteriaQuery, pageable);
	}

	/**
	 * 保存并处理默认
	 * 
	 * @param receiver
	 *            收货地址
	 */
	@Override
	public void persist(Receiver receiver) {
		Assert.notNull(receiver);
		Assert.notNull(receiver.getMember());
		if (receiver.getIsDefault()) {
			String jpql = "update Receiver receiver set receiver.isDefault = false where receiver.member = :member and receiver.isDefault = true";
			entityManager.createQuery(jpql).setFlushMode(FlushModeType.COMMIT).setParameter("member", receiver.getMember()).executeUpdate();
		}
		super.persist(receiver);
	}

	/**
	 * 更新并处理默认
	 * 
	 * @param receiver
	 *            收货地址
	 * @return 收货地址
	 */
	@Override
	public Receiver merge(Receiver receiver) {
		Assert.notNull(receiver);
		Assert.notNull(receiver.getMember());
		if (receiver.getIsDefault()) {
			String jpql = "update Receiver receiver set receiver.isDefault = false where receiver.member = :member and receiver.isDefault = true and receiver != :receiver";
			entityManager.createQuery(jpql).setFlushMode(FlushModeType.COMMIT).setParameter("member", receiver.getMember()).setParameter("receiver", receiver).executeUpdate();
		}
		return super.merge(receiver);
	}

}