package com.openteach.openshop.server.service.dao.impl;

import java.math.BigDecimal;

import javax.annotation.Resource;
import javax.persistence.FlushModeType;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.openteach.openshop.server.service.Page;
import com.openteach.openshop.server.service.Pageable;
import com.openteach.openshop.server.service.dao.PlatformPaymentDAO;
import com.openteach.openshop.server.service.dao.SnDao;
import com.openteach.openshop.server.service.entity.PlatformPayment;
import com.openteach.openshop.server.service.entity.Supplier;
import com.openteach.openshop.server.service.entity.Sn.Type;

/**
 * 
 * @author sihai
 *
 */
@Repository("platformPaymentDAO")
public class PlatformPaymentDAOImpl extends BaseDAOImpl<PlatformPayment, Long> implements PlatformPaymentDAO {

	@Resource(name = "snDaoImpl")
	private SnDao snDao;
	
	@Override
	public void persist(PlatformPayment entity) {
		if (StringUtils.isEmpty(entity.getSn())) {
			String sn;
			do {
				sn = snDao.generate(Type.product);
			} while (isSnExists(sn));
			entity.setSn(sn);
		}
		super.persist(entity);
	}

	@Override
	public Page<PlatformPayment> findPage(Supplier supplier, Pageable pageable) {
		CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
		CriteriaQuery<PlatformPayment> criteriaQuery = criteriaBuilder.createQuery(PlatformPayment.class);
		Root<PlatformPayment> root = criteriaQuery.from(PlatformPayment.class);
		criteriaQuery.select(root);
		criteriaQuery.where(criteriaBuilder.equal(root.get("supplier"), supplier));
		return super.findPage(criteriaQuery, pageable);
	}
	
	@Override
	public boolean isSnExists(String sn) {
		if (sn == null) {
			return false;
		}
		String jpql = "select count(*) from PlatformPayment payment where lower(payment.sn) = lower(:sn)";
		Long count = entityManager.createQuery(jpql, Long.class).setFlushMode(FlushModeType.COMMIT).setParameter("sn", sn).getSingleResult();
		return count > 0;
	}

	@Override
	public BigDecimal income(Supplier supplier) {
		String jpql = "select sum(money) from PlatformPayment payment where lower(payment.supplier) = :supplier";
		return entityManager.createQuery(jpql, BigDecimal.class).setFlushMode(FlushModeType.COMMIT).setParameter("supplier", supplier).getSingleResult();
	}

	@Override
	public BigDecimal rebate(Supplier supplier) {
		String jpql = "select sum(rebate) from PlatformPayment payment where lower(payment.supplier) = :supplier";
		return entityManager.createQuery(jpql, BigDecimal.class).setFlushMode(FlushModeType.COMMIT).setParameter("supplier", supplier).getSingleResult();
	}
}
