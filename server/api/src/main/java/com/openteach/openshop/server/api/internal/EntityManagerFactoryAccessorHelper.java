package com.openteach.openshop.server.api.internal;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

import org.springframework.orm.jpa.EntityManagerFactoryAccessor;
import org.springframework.stereotype.Component;

@Component("entityManagerFactoryAccessorHelper")
public class EntityManagerFactoryAccessorHelper extends EntityManagerFactoryAccessor {

	@Override
	public EntityManagerFactory getEntityManagerFactory() {
		return super.getEntityManagerFactory();
	}

	@Override
	public EntityManager createEntityManager() throws IllegalStateException {
		return super.createEntityManager();
	}

}
