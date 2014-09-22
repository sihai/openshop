package com.openteach.openshop.server.api.interceptor;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

import com.openteach.openshop.server.api.ApiContext;
import com.openteach.openshop.server.api.annotation.Sort;

/**
 * 
 * @author sihai
 *
 */
@Component("defaultInterceptor")
public class DefaultInterceptor implements Interceptor, ApplicationContextAware {

	private ApplicationContext applicationContext;
	
	private Interceptor[] is;
	
	/**
	 * 
	 */
	@PostConstruct
	public void initialize() {
		List<Interceptor> iss = new ArrayList<Interceptor>();
		Map<String, Interceptor> beans = applicationContext.getBeansOfType(Interceptor.class);
		for(Interceptor o : beans.values()) {
			if(o == this) {
				continue;
			}
			iss.add(o);
		}
		
		Collections.sort(iss, new Comparator() {

			@Override
			public int compare(Object v1, Object v2) {
				return  v2.getClass().getAnnotation(Sort.class).value() - v1.getClass().getAnnotation(Sort.class).value();
			}
			
		});
		is = iss.toArray(new Interceptor[iss.size()]);
	}
	
	@PreDestroy
	public void destroy() {
	}
	
	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.applicationContext = applicationContext;
	}
	@Override
	public void preHandle(ApiContext apiContext) {
		for(Interceptor i : is) {
			i.preHandle(apiContext);
		}
	}

	@Override
	public void postHandle(ApiContext apiContext) {
		for(Interceptor i : is) {
			i.postHandle(apiContext);
		}
	}

}
