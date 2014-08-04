/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.biz.service;

import com.openteach.openshop.server.biz.entity.DeliveryCenter;

/**
 * Service - 发货点
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
public interface DeliveryCenterService extends BaseService<DeliveryCenter, Long> {

	/**
	 * 查找默认发货点
	 * 
	 * @return 默认发货点，若不存在则返回null
	 */
	DeliveryCenter findDefault();

}