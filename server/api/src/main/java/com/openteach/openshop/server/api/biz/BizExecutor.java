package com.openteach.openshop.server.api.biz;

import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.springframework.stereotype.Component;

import com.openteach.openshop.server.api.util.NamedThreadFactory;

/**
 * 
 * @author sihai
 *
 */
@Component("bizExecutor")
public class BizExecutor {

	public static int DEFAULT_CORE_SIZE = 4;
	public static int DEFAULT_MAX_SIZE = 32;
	public static int DEFAULT_KEEP_ALIVE_TIME = 60;
	public static int DEFAULT_CAPACITY = 64;
	
	private int coreSize = DEFAULT_CORE_SIZE;
	
	private int maxSize = DEFAULT_MAX_SIZE;
	
	private int keepAliveTime = DEFAULT_KEEP_ALIVE_TIME;
	
	private int queueCapacity = DEFAULT_CAPACITY;

	private BlockingQueue<Runnable> workQueue;
	
	/**
	 * 
	 */
	private ThreadPoolExecutor threadpool;
	
	/**
	 * 
	 */
	@PostConstruct
	public void initialize() {
		workQueue = new ArrayBlockingQueue<Runnable>(queueCapacity);
		threadpool = new ThreadPoolExecutor(coreSize, maxSize, keepAliveTime, TimeUnit.SECONDS, workQueue, new NamedThreadFactory("biz-executor"));
	}
	
	@PreDestroy
	public void destroy() {
		if(null != threadpool) {
			threadpool.shutdown();
		}
		if(null != workQueue) {
			workQueue.clear();
		}
	}
	
	/**
	 * 
	 * @param r
	 */
	public void execute(Runnable r) {
		threadpool.execute(r);
	}
}
