/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package net.shopxx.job;

import javax.annotation.Resource;

import net.shopxx.service.StaticService;

import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * Job - 静态化
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Component("staticJob")
@Lazy(false)
public class StaticJob {

	@Resource(name = "staticServiceImpl")
	private StaticService staticService;

	/**
	 * 生成静态
	 */
	@Scheduled(cron = "${job.static_build.cron}")
	public void build() {
		staticService.buildAll();
	}

}