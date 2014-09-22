package com.openteach.openshop.server.api.interceptor;

import javax.persistence.EntityManager;

import org.springframework.orm.jpa.EntityManagerFactoryAccessor;
import org.springframework.orm.jpa.EntityManagerFactoryUtils;
import org.springframework.orm.jpa.EntityManagerHolder;
import org.springframework.stereotype.Component;
import org.springframework.transaction.support.TransactionSynchronizationManager;

import com.openteach.openshop.server.api.ApiContext;
import com.openteach.openshop.server.api.annotation.Sort;

/**
 * 
 * @author sihai
 *
 */
@Component
@Sort(100)
public class OpenEntityManagerInterceptor extends EntityManagerFactoryAccessor implements Interceptor {

	/**
	 * 
	 * @param apiContext
	 */
	@Override
	public void preHandle(ApiContext apiContext) {
		EntityManager em = createEntityManager();
		EntityManagerHolder emHolder = new EntityManagerHolder(em);
		TransactionSynchronizationManager.bindResource(getEntityManagerFactory(), emHolder);
	}
	
	/**
	 * 
	 * @param apiContext
	 */
	@Override
	public void postHandle(ApiContext apiContext) {
		EntityManagerHolder emHolder = (EntityManagerHolder)TransactionSynchronizationManager.unbindResource(getEntityManagerFactory());
		logger.debug("Closing JPA EntityManager in OpenEntityManagerInViewInterceptor");
		EntityManagerFactoryUtils.closeEntityManager(emHolder.getEntityManager());
	}
}
