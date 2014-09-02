package com.openteach.openshop.server.api;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;

import com.alibaba.fastjson.JSON;
import com.openteach.openshop.server.api.async.AsyncException;
import com.openteach.openshop.server.api.async.AsyncKey;
import com.openteach.openshop.server.api.async.ConnectionPool;
import com.openteach.openshop.server.api.exception.ApiException;
import com.openteach.openshop.server.api.internal.Api;
import com.openteach.openshop.server.api.repository.ApiRepository;
import com.openteach.openshop.server.api.validator.Validator;

/**
 * 
 * @author sihai
 *
 */
@Component("defaultApiExecutor")
public class DefaultApiExecutor implements ApiExecutor {
	
	private static final Log logger = LogFactory.getLog(DefaultApiExecutor.class);

	public static final long DEFAULT_SERVLET_TIMEOUT = 1000 * 15;
	
	/**
	 * 
	 */
	@Value("${com.openteach.openshop.server.api.servlet.timeout}")
	private long servletTimeout = DEFAULT_SERVLET_TIMEOUT;
	
	@Resource(name = "annotationApiRepository")
	private ApiRepository apiRepository;
	
	@Resource(name = "defaultValidator")
	private Validator validator;
	
	@Override
	public void execute(ApiContext apiContext) {
		Result result = null;
		try {
			result = _execute_(apiContext);
		} catch (Throwable t) {
			logger.error("execut api faile", t);
			result = ResultFactory.failed(ErrorCode.UNKNOWN_ERROR, t.getMessage());
		}
		
		if(!result.isSucceed()) {
			apiContext.getResponse().setResult(result);
			response(apiContext);
		}
	}
	
	/**
	 * 
	 * @param apiContext
	 */
	public Result _execute_(ApiContext apiContext) {
		Result result = null;
		try {
			// 1. before
			result = before(apiContext);
			if(!result.isSucceed()) {
				return result;
			}
			// 2. 启动异步执行业务代码
			return doApi(apiContext);
		} finally {
			// 3. after
			after(apiContext);
		}
	}
	
	/**
	 * 
	 * @param apiContext
	 * @return
	 */
	private Result before(ApiContext apiContext) {
		
		Result result = null;

		// 解析
		// filter
		result = doFilters(apiContext);
		if(!result.isSucceed()) {
			return result;
		}
		
		// validate
		result = doValidators(apiContext);
		if(!result.isSucceed()) {
			return result;
		}
		
		// spring bridge
		bridgeSpringContext(apiContext);
		
		return result;
	}
	
	/**
	 * 
	 * @param apiContext
	 */
	private void bridgeSpringContext(ApiContext apiContext) {
		apiContext.getSpringContextHolder().setRequestAttributes(RequestContextHolder.getRequestAttributes());
	}
	
	/**
	 * 
	 * @param apiContext
	 * @return
	 */
	private Result doApi(ApiContext apiContext) {
		// 执行API
		// 1. 获取API
		Api api = getApi(apiContext);
		if(null == api) {
			return ResultFactory.failed(ErrorCode.UNKNOWN_API, String.format("unknown api:%s, version:%s", apiContext.getRequest().getApiName(), apiContext.getRequest().getApiVersion()));
		}
		// 2. 挂起request, 释放web容器线程
		try {
			AsyncKey ak = ConnectionPool.hold(apiContext, servletTimeout, new ConnectionPool.ConnectionListener() {
	
				@Override
				public void ontCompleted(ApiContext ac) {
					
				}
	
				@Override
				public void onError(ApiContext ac, Throwable t) {
					ac.getResponse().setResult(ResultFactory.failed(ErrorCode.UNKNOWN_ERROR, t.getMessage()));
					response(ac);
				}
	
				@Override
				public void onTimeout(ApiContext ac) {
					ac.getResponse().setResult(ResultFactory.failed(ErrorCode.SERVLET_TIMEOUT, "servlet timeout"));
					response(ac);
				}
				
			});
		} catch (AsyncException e) {
			logger.error("execut api faile", e);
			return ResultFactory.failed(ErrorCode.RESOURCE_LIMITED, e.getMessage());
		}
		
		// 3. 执行
		api.execute(apiContext, new BizExecuteListener(apiContext));
		return ResultFactory.succeed(null);
	}
	
	/**
	 * 
	 * @param apiContext
	 * @return
	 */
	private Result after(ApiContext apiContext) {
		// clean spring
		RequestContextHolder.resetRequestAttributes();
		return ResultFactory.succeed(null);
	}
	
	/**
	 * do filter
	 * @param apiContext
	 * @return
	 */
	private Result doFilters(ApiContext apiContext) {
		return ResultFactory.succeed(null);
	}
	
	/**
	 * do validator
	 * @param apiContext
	 * @return
	 */
	private Result doValidators(ApiContext apiContext) {
		// validate
		return validator.validate(apiContext);
	}
	
	/**
	 * 
	 * @param apiContext
	 * @return
	 */
	private Api getApi(ApiContext apiContext) {
		return apiRepository.get(apiContext.getRequest().getApiName(), apiContext.getRequest().getApiVersion());
	}
	
	/**
	 * 
	 * @param apiContext
	 * 
	 */
	private void response(ApiContext apiContext) {
		try {
			if(null == apiContext.getAsyncContext()) {
				apiContext.getHttpServletResponse().setStatus(HttpURLConnection.HTTP_OK);
				for(Map.Entry<String, String> e : apiContext.getResponse().getHeaders().entrySet()) {
					apiContext.getHttpServletResponse().addHeader(e.getKey(), e.getValue());
				}
				apiContext.getHttpServletResponse().getWriter().write(JSON.toJSONString(apiContext.getResponse().getResult()));
				apiContext.getHttpServletResponse().getWriter().flush();
			} else {
				((HttpServletResponse)apiContext.getAsyncContext().getAsyncContext().getResponse()).setStatus(HttpURLConnection.HTTP_OK);
				for(Map.Entry<String, String> e : apiContext.getResponse().getHeaders().entrySet()) {
					((HttpServletResponse)apiContext.getAsyncContext().getAsyncContext().getResponse()).addHeader(e.getKey(), e.getValue());
				}
				apiContext.getAsyncContext().getAsyncContext().getResponse().getWriter().write(JSON.toJSONString(apiContext.getResponse().getResult()));
				apiContext.getAsyncContext().getAsyncContext().getResponse().getWriter().flush();
			}
		} catch (IOException e) {
			throw new RuntimeException(e);
		} finally {
			if(null != apiContext.getAsyncContext()) {
				apiContext.getAsyncContext().getAsyncContext().complete();
			}
		}
	}
	
	/**
	 * 
	 * @author sihai
	 *
	 */
	private class BizExecuteListener implements Api.Listener {

		private ApiContext apiContext;
		
		/**
		 * 
		 * @param apiContext
		 */
		public BizExecuteListener(ApiContext apiContext) {
			this.apiContext = apiContext;
		}
		
		@Override
		public void onCompleted() {
			response(apiContext);
		}

		@Override
		public void onException(Throwable t) {
			if(t instanceof ApiException) {
				apiContext.getResponse().setResult(ResultFactory.failed(((ApiException)t).getErrorCode(), ((ApiException)t).getErrorMsg()));
			} else {
				apiContext.getResponse().setResult(ResultFactory.failed(ErrorCode.UNKNOWN_ERROR, t.getMessage()));
			}
			response(apiContext);
		}

		@Override
		public void onTimeout() {
			apiContext.getResponse().setResult(ResultFactory.failed(ErrorCode.BIZ_TIMEOUT, "biz timeout"));
			response(apiContext);
		}
	}
}
