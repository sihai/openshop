package com.openteach.openshop.server.service.dao.impl;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Repository;

import com.openteach.openshop.server.service.Page;
import com.openteach.openshop.server.service.Pageable;
import com.openteach.openshop.server.service.dao.CooperationDao;
import com.openteach.openshop.server.service.entity.Cooperation;

/**
 * 合作 dao
 * @author sihai
 *
 */
@Repository("cooperationDaoImpl")
public class CooperationDaoImpl extends BaseDAOImpl<Cooperation, Long> implements CooperationDao {

	@Override
	public Page<Cooperation> findPage(Cooperation.Status status, Pageable pageable) {
		CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
		CriteriaQuery<Cooperation> criteriaQuery = criteriaBuilder.createQuery(Cooperation.class);
		Root<Cooperation> root = criteriaQuery.from(Cooperation.class);
		criteriaQuery.select(root);
		Predicate restrictions = criteriaBuilder.conjunction();
		if (null != status) {
			restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.equal(root.get("status"), status));
		}
		criteriaQuery.where(restrictions);
		return super.findPage(criteriaQuery, pageable);
	}

	@Override
	public Long count(Cooperation.Status status) {
		CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
		CriteriaQuery<Cooperation> criteriaQuery = criteriaBuilder.createQuery(Cooperation.class);
		Root<Cooperation> root = criteriaQuery.from(Cooperation.class);
		criteriaQuery.select(root);
		Predicate restrictions = criteriaBuilder.conjunction();
		if (null != status) {
			restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.equal(root.get("status"), status));
		}
		criteriaQuery.where(restrictions);
		return super.count(criteriaQuery, null);
	}
}
