package com.openteach.openshop.server.api.repository;

import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.annotation.Resource;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import com.openteach.openshop.server.api.annotation.Param;
import com.openteach.openshop.server.api.annotation.Params;
import com.openteach.openshop.server.api.biz.BizExecutor;
import com.openteach.openshop.server.api.interceptor.Interceptor;
import com.openteach.openshop.server.api.internal.DefaultApi;
import com.openteach.openshop.server.api.internal.EntityManagerFactoryAccessorHelper;
import com.openteach.openshop.server.api.internal.parameter.ParameterGeneratorFactory;
import com.openteach.openshop.server.api.internal.parameter.ParameterMetadata;
import com.openteach.openshop.server.api.internal.parameter.ParametersMetadata;

/**
 * 
 * @author sihai
 *
 */
@Component("annotationApiRepository")
@Lazy(false)
public class AnnotationApiRepository implements ApiRepository, ApplicationContextAware {

	private Map<String, DefaultApi> apis;
	
	private ApplicationContext applicationContext;
	
	@Resource(name = "bizExecutor")
	private BizExecutor bizExecutor;
	
	/**
	 * 
	 */
	@Resource(name = "defaultInterceptor")
	private Interceptor interceptor;
	
	/**
	 * 
	 */
	@Resource(name = "entityManagerFactoryAccessorHelper")
	private EntityManagerFactoryAccessorHelper entityManagerFactoryAccessorHelper;
	
	/**
	 * 
	 */
	public AnnotationApiRepository() {
		apis = new HashMap<String, DefaultApi>();
	}
	
	/**
	 * 
	 */
	@PostConstruct
	public void initialize() {
		Map<String, Object> beans = applicationContext.getBeansWithAnnotation(com.openteach.openshop.server.api.annotation.Apis.class);
		for(Object o : beans.values()) {
			for(Method m : o.getClass().getMethods()) {
				com.openteach.openshop.server.api.annotation.Api a = m.getAnnotation(com.openteach.openshop.server.api.annotation.Api.class);
				if(null != a) {
					put(a.name(), a.version(), generateApi(o, a, m));
				}
			}
		}
	}
	
	@PreDestroy
	public void destroy() {
		if(null != apis) {
			apis.clear();
		}
	}
	
	@Override
	public DefaultApi get(String apiName, String apiVersion) {
		return apis.get(key(apiName, apiVersion));
	}

	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.applicationContext = applicationContext;
	}
	
	/**
	 * 
	 * @param apiName
	 * @param apiVersion
	 * @param api
	 */
	private void put(String apiName, String apiVersion, DefaultApi api) {
		apis.put(key(apiName, apiVersion), api);
	}
	
	/**
	 * 
	 * @param apiName
	 * @param apiVersion
	 * @return
	 */
	private String key(String apiName, String apiVersion) {
		return String.format("%s@%s", apiName, apiVersion);
	}
	
	/**
	 * 
	 * @param o
	 * @param a
	 * @param m
	 * @return
	 */
	private DefaultApi generateApi(Object o, com.openteach.openshop.server.api.annotation.Api a, Method m) {
		Param ap = null;
		Params aps = null;
		Annotation[][] aa = m.getParameterAnnotations();
		Class[] pts = m.getParameterTypes();
		ParameterMetadata[] pms = new ParameterMetadata[pts.length];
		for(int i = 0; i < aa.length; i++) {
			for(int j = 0; j < aa[i].length; j++) {
				if(aa[i][j].annotationType() == Param.class) {
					ap = (Param)aa[i][j];
					pms[i] = new ParameterMetadata(ParameterGeneratorFactory.getSigleGenerator(pts[i], ap.type(), ap.name(), ap.required(), ap.ecrypted()));
				} else if(aa[i][j].annotationType() == Params.class) {
					aps = (Params)aa[i][j];
					pms[i] = new ParameterMetadata(ParameterGeneratorFactory.getSigleGenerator(pts[i], aps.type(), aps.name(), aps.required(), false));
				}
			}
		}
		return new DefaultApi(bizExecutor, o, m, new ParametersMetadata(pms), interceptor, entityManagerFactoryAccessorHelper);
	}
}
