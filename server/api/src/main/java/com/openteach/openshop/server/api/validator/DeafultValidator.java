package com.openteach.openshop.server.api.validator;

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
@Component("defaultValidator")
public class DeafultValidator implements Validator, ApplicationContextAware {

	private ApplicationContext applicationContext;
	
	private Validator[] vs;
	
	/**
	 * 
	 */
	@PostConstruct
	public void initialize() {
		List<Validator> vws = new ArrayList<Validator>();
		Map<String, Validator> beans = applicationContext.getBeansOfType(Validator.class);
		for(Validator o : beans.values()) {
			if(o == this) {
				continue;
			}
			vws.add(o);
		}
		
		Collections.sort(vws, new Comparator() {

			@Override
			public int compare(Object v1, Object v2) {
				return  v2.getClass().getAnnotation(Sort.class).value() - v1.getClass().getAnnotation(Sort.class).value();
			}
			
		});
		vs = vws.toArray(new Validator[vws.size()]);
	}
	
	@PreDestroy
	public void destroy() {
	}
	
	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.applicationContext = applicationContext;
	}

	@Override
	public Result validate(ApiContext apiContext) {
		Result result = ResultFactory.succeed(null);
		if(null != vs && vs.length > 0) {
			for(Validator v : vs) {
				result = v.validate(apiContext);
				if(!ErrorCode.SUCCEED.name().equals(result.getErrorCode())) {
					return result;
				}
			}
		}
		return result;
	}
	
	
}
