package com.openteach.openshop.server.api.filter;

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
import com.openteach.openshop.server.api.ErrorCode;
import com.openteach.openshop.server.api.Result;
import com.openteach.openshop.server.api.ResultFactory;
import com.openteach.openshop.server.api.annotation.Sort;

/**
 * 
 * @author sihai
 *
 */
@Component("defaultFilter")
public class DeafultFilter implements Filter, ApplicationContextAware {

	private ApplicationContext applicationContext;
	
	private Filter[] fs;
	
	/**
	 * 
	 */
	@PostConstruct
	public void initialize() {
		List<Filter> l = new ArrayList<Filter>();
		Map<String, Filter> beans = applicationContext.getBeansOfType(Filter.class);
		for(Filter o : beans.values()) {
			if(o == this) {
				continue;
			}
			l.add(o);
		}
		
		Collections.sort(l, new Comparator() {

			@Override
			public int compare(Object v1, Object v2) {
				return  v2.getClass().getAnnotation(Sort.class).value() - v1.getClass().getAnnotation(Sort.class).value();
			}
			
		});
		this.fs = l.toArray(new Filter[l.size()]);
	}
	
	@PreDestroy
	public void destroy() {
	}
	
	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.applicationContext = applicationContext;
	}

	@Override
	public Result doFilter(ApiContext apiContext) {
		Result result = ResultFactory.succeed(null);
		if(null != fs && fs.length > 0) {
			for(Filter f : fs) {
				result = f.doFilter(apiContext);
				if(!ErrorCode.SUCCEED.name().equals(result.getErrorCode())) {
					return result;
				}
			}
		}
		return result;
	}
}
