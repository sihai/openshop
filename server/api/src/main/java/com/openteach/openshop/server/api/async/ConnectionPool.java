package com.openteach.openshop.server.api.async;

import java.io.IOException;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;

import javax.servlet.AsyncContext;
import javax.servlet.AsyncEvent;
import javax.servlet.AsyncListener;

import com.openteach.openshop.server.api.ApiContext;

/**
 * 
 * @author sihai
 *
 */
public class ConnectionPool {

	private static final int max = 1048576;										// 1M
	
	private static final ConcurrentHashMap<AsyncKey, ApiContext> contextMap;	// 
	
	private static final AtomicInteger current = new AtomicInteger(0);
	
	static {
		contextMap = new ConcurrentHashMap<AsyncKey, ApiContext>(max);
	}
	
	/**
	 * 
	 * @param request
	 * @param timeout
	 * @param cl
	 * @return
	 * @throws AsyncException
	 */
	public static AsyncKey hold(ApiContext c, long timeout, ConnectionListener cl) throws AsyncException {
		if(current.incrementAndGet() < max) {
			AsyncContext ac = c.getHttpServletRequest().startAsync();
			AsyncKey k = AsyncKeyGenerator.next();
			c.setAsyncContext(new ApiAsyncContext(k, ac));
			contextMap.put(k, c);
			ac.setTimeout(timeout);
			ac.addListener(new ServletAsyncListener(k, cl));
			return k;
		} else {
			throw new AsyncException(String.format("connection pool is full, current:%d, max:%d", current.get(), max));
		}
	}
	
	/**
	 * 
	 * @param key
	 */
	public static ApiContext remove(AsyncKey key) {
		ApiContext ac = contextMap.remove(key);
		if(null != ac) {
			current.decrementAndGet();
		}
		return ac;
	}
	
	/**
	 * 
	 * @author sihai
	 *
	 */
	public static interface ConnectionListener {
		
		/**
		 * 
		 * @param ac
		 */
		void ontCompleted(ApiContext ac);
		
		/**
		 * 
		 * @param ac
		 * @param t
		 */
		void onError(ApiContext ac, Throwable t);
		
		/**
		 * 
		 * @param ac
		 */
		void onTimeout(ApiContext ac);
	}
	
	/**
	 * 
	 * @author sihai
	 *
	 */
	private static class ServletAsyncListener implements AsyncListener {

		private AsyncKey key;
		
		private ConnectionListener cl;
		
		/**
		 * 
		 * @param key
		 * @param cl
		 */
		public ServletAsyncListener(AsyncKey key, ConnectionListener cl) {
			this.key = key;
			this.cl = cl;
		}
		
		@Override
		public void onComplete(AsyncEvent ae) throws IOException {
			ConnectionPool.remove(key);
		}

		@Override
		public void onError(AsyncEvent ae) throws IOException {
			cl.onError(ConnectionPool.remove(key), ae.getThrowable());
		}

		@Override
		public void onStartAsync(AsyncEvent ae) throws IOException {
			
		}

		@Override
		public void onTimeout(AsyncEvent ae) throws IOException {
			cl.onTimeout(ConnectionPool.remove(key));
		}
	}
}
