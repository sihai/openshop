package com.openteach.openshop.server.api.internal;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.context.request.RequestContextHolder;

import com.openteach.openshop.server.api.ApiContext;
import com.openteach.openshop.server.api.ResultFactory;
import com.openteach.openshop.server.api.biz.BizExecutor;
import com.openteach.openshop.server.api.exception.ParameterGeneratedException;
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
	 * @param bizExecutor
	 * @param target
	 * @param method
	 * @param pgs
	 */
	public DefaultApi(BizExecutor bizExecutor, Object target, Method method, ParametersMetadata pm) {
		this.bizExecutor = bizExecutor;
		this.target = target;
		this.method = method;
		this.pm = pm;
	}
	
	@Override
	public void execute(final ApiContext apiContext, final Listener l) {
		
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
					l.onCompleted();
				} catch (ParameterGeneratedException e) {
					logger.error("Parameter generated failed", e);
					l.onException(e);
				} catch (InvocationTargetException e) {
					logger.error(String.format("Invoke method of api:%s@%s, method:%s, failed", apiContext.getRequest().getApiName(), apiContext.getRequest().getApiVersion(), method.getName()), e);
					l.onException(e);
				} catch (IllegalAccessException e) {
					logger.error(String.format("Invoke method of api:%s@%s, method:%s, failed", apiContext.getRequest().getApiName(), apiContext.getRequest().getApiVersion(), method.getName()), e);
					l.onException(e);
				} catch (Throwable t) {
					logger.error(String.format("Invoke method of api:%s@%s, method:%s, failed", apiContext.getRequest().getApiName(), apiContext.getRequest().getApiVersion(), method.getName()), t);
					l.onException(t);
				}
			}
			
			private void before(ApiContext apiContext) {
				// bridge spring
				RequestContextHolder.setRequestAttributes(apiContext.getSpringContextHolder().getRequestAttributes());
			}
		});
	}
}
