/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.service.dao;

import com.openteach.openshop.server.service.entity.DeliveryCenter;

/**
 * Dao - 发货点
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
public interface DeliveryCenterDao extends BaseDAO<DeliveryCenter, Long> {

	/**
	 * 查找默认发货点
	 * 
	 * @return 默认发货点，若不存在则返回null
	 */
	DeliveryCenter findDefault();

}