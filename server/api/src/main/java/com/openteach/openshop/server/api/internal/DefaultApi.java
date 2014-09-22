package com.openteach.openshop.server.api.internal;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.orm.jpa.EntityManagerFactoryUtils;
import org.springframework.orm.jpa.EntityManagerHolder;
import org.springframework.transaction.support.TransactionSynchronizationManager;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.openteach.openshop.server.api.ApiContext;
import com.openteach.openshop.server.api.ResultFactory;
import com.openteach.openshop.server.api.biz.BizExecutor;
import com.openteach.openshop.server.api.exception.ParameterGeneratedException;
import com.openteach.openshop.server.api.interceptor.Interceptor;
import com.openteach.openshop.server.api.internal.parameter.ParameterMetadata;
import com.openteach.openshop.server.api.internal.parameter.ParametersMetadata;

/**
 * 
 * @author sihai
 *
 */
public class DefaultApi implements Api {
	
	private static final Log logger = LogFactory.getLog(DefaultApi.class);
	
	/**
	 * 
	 */
	private Object target;
	
	/**
	 * 
	 */
	private Method method;
	
	/**
	 * 
	 */
	private ParametersMetadata pm;
	
	/**
	 * 
	 */
	private BizExecutor bizExecutor;
	
	/**
	 * 
	 */
	private Interceptor interceptor;
	
	/**
	 * 
	 */
	private EntityManagerFactoryAccessorHelper entityManagerFactoryAccessorHelper;
	
	/**
	 * 
	 * @param bizExecutor
	 * @param target
	 * @param method
	 * @param pm
	 * @param interceptor
	 * @param entityManagerFactoryAccessorHelper
	 */
	public DefaultApi(BizExecutor bizExecutor, Object target, Method method, ParametersMetadata pm, Interceptor interceptor, EntityManagerFactoryAccessorHelper entityManagerFactoryAccessorHelper) {
		this.bizExecutor = bizExecutor;
		this.target = target;
		this.method = method;
		this.pm = pm;
		this.interceptor = interceptor;
		this.entityManagerFactoryAccessorHelper = entityManagerFactoryAccessorHelper;
	}

	/**
	 * 
	 */
	private void unboundJPA() {
		EntityManagerHolder emHolder = (EntityManagerHolder)TransactionSynchronizationManager.unbindResource(entityManagerFactoryAccessorHelper.getEntityManagerFactory());
		logger.debug("Closing JPA EntityManager in OpenEntityManagerInViewInterceptor");
		EntityManagerFactoryUtils.closeEntityManager(emHolder.getEntityManager());
	}
	
	/**
	 * 
	 */
	private void boundJPA() {
		EntityManager em = entityManagerFactoryAccessorHelper.createEntityManager();
		EntityManagerHolder emHolder = new EntityManagerHolder(em);
		TransactionSynchronizationManager.bindResource(entityManagerFactoryAccessorHelper.getEntityManagerFactory(), emHolder);
	}
	
	@Override
	public void execute(final ApiContext apiContext, final Listener l) { 
		
		// unbound jpa
		//unboundJPA();
		
		bizExecutor.execute(new Runnable() {

			@Override
			public void run() {
				try {
					before(apiContext);
					
					ParameterMetadata[] pms = pm.getPms();
					Object[] args = new Object[pms.length];
					for(int i = 0; i < pms.length; i++) {
						args[i] = pms[i].getPg().generate(apiContext);
					}
					Object data = method.invoke(target, args);
					apiContext.getResponse().setResult(ResultFactory.newResult(apiContext.getExecutionContext().getCode(), apiContext.getExecutionContext().getErrorMsg(), data));
					l.onCompleted(DefaultApi.this);
				} catch (ParameterGeneratedException e) {
					logger.error("Parameter generated failed", e);
					l.onException(DefaultApi.this, e);
				} catch (InvocationTargetException e) {
					logger.error(String.format("Invoke method of api:%s@%s, method:%s, failed", apiContext.getRequest().getApiName(), apiContext.getRequest().getApiVersion(), method.getName()), e);
					l.onException(DefaultApi.this, e);
				} catch (IllegalAccessException e) {
					logger.error(String.format("Invoke method of api:%s@%s, method:%s, failed", apiContext.getRequest().getApiName(), apiContext.getRequest().getApiVersion(), method.getName()), e);
					l.onException(DefaultApi.this, e);
				} catch (Throwable t) {
					logger.error(String.format("Invoke method of api:%s@%s, method:%s, failed", apiContext.getRequest().getApiName(), apiContext.getRequest().getApiVersion(), method.getName()), t);
					l.onException(DefaultApi.this, t);
				} finally {
					// 
					after(apiContext);
				}
			}
			
			private void before(ApiContext apiContext) {
				// bound jpa
				boundJPA();
				// bridge spring
				HttpServletRequest hsr =(HttpServletRequest)apiContext.getAsyncContext().getAsyncContext().getRequest();
				RequestContextHolder.setRequestAttributes(/*apiContext.getSpringContextHolder().getRequestAttributes()*/ new ServletRequestAttributes(hsr));
			}
			
			private void after(ApiContext apiContext) {
				// unbound jpa
				unboundJPA();
				// bridge spring
				RequestContextHolder.resetRequestAttributes();
			}
		});
	}
}
