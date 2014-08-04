/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.biz.listener;

import java.io.Serializable;
import java.util.logging.Logger;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.apache.commons.codec.digest.DigestUtils;
import org.msgpack.MessagePack;
import org.msgpack.annotation.Message;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;
import org.springframework.web.context.ServletContextAware;

import com.openteach.openshop.server.biz.service.CacheService;
import com.openteach.openshop.server.biz.service.SearchService;
import com.openteach.openshop.server.biz.service.StaticService;

/**
 * Listener - 初始化
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Component("initListener")
public class InitListener implements ServletContextAware, ApplicationListener<ContextRefreshedEvent> {

	/** 安装初始化配置文件 */
	private static final String INSTALL_INIT_CONFIG_FILE_PATH = "/install_init.conf";

	/** logger */
	private static final Logger logger = Logger.getLogger(InitListener.class.getName());

	/** servletContext */
	private ServletContext servletContext;

	@Value("${system.version}")
	private String systemVersion;
	@Resource(name = "staticServiceImpl")
	private StaticService staticService;
	@Resource(name = "cacheServiceImpl")
	private CacheService cacheService;
	@Resource(name = "searchServiceImpl")
	private SearchService searchService;

	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}

	public void onApplicationEvent(ContextRefreshedEvent contextRefreshedEvent) {
		if (servletContext != null && contextRefreshedEvent.getApplicationContext().getParent() == null) {
			String info = "I|n|i|t|i|a|l|i|z|i|n|g| |A|I|G|E|C|H|I|B|A|O|L|E| |" + systemVersion;
			logger.info(info.replace("|", ""));
			//File installInitConfigFile = new File(servletContext.getRealPath(INSTALL_INIT_CONFIG_FILE_PATH));
			//if(true){
				cacheService.clear();
				staticService.buildAll();
				searchService.purge();
				searchService.index();
				//installInitConfigFile.delete();
			/*} else {
				staticService.buildRootCategory();
				staticService.buildOther();
			}*/
		}
	}
	
	@Message
	static class Domain implements Serializable {
		private static final long serialVersionUID = -5180173233972829942L;
		private long id;
		
		private String name;
		
		public Domain() {
		}

		public long getId() {
			return id;
		}

		public String getName() {
			return name;
		}

		public void setId(long id) {
			this.id = id;
		}

		public void setName(String name) {
			this.name = name;
		}
	}
	public static void main(String[] args) throws Exception {
		MessagePack msgpack = new MessagePack();
		Domain domain = new Domain();
		domain.setId(100L);
		Domain d = new Domain();
		byte[] buffer = msgpack.write(domain);
		msgpack.read(buffer, d);
		System.out.println(0xc0);
		System.out.println(d);
		
		System.out.println(DigestUtils.md5Hex("378206"));
	}

}