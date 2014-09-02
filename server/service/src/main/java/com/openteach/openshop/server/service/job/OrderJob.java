/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.service.job;

import javax.annotation.Resource;

import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.openteach.openshop.server.service.service.OrderService;

/**
 * Job - 订单
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Component("orderJob")
@Lazy(false)
public class OrderJob {

	@Resource(name = "orderServiceImpl")
	private OrderService orderService;

	/**
	 * 释放过期订单库存
	 */
	@Scheduled(cron = "${job.order_release_stock.cron}")
	public void releaseStock() {
		orderService.releaseStock();
	}
	
	/**
	 * 自动确认收货(发货后7天)
	 */
	@Scheduled(cron = "${job.order_auto_confirm_received.cron}")
	public void autoConfirmReceived() {
		orderService.autoConfirmReceived();
	}

}