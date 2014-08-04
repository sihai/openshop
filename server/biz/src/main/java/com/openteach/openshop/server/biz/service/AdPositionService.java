/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.biz.service;

import com.openteach.openshop.server.biz.entity.AdPosition;

/**
 * Service - 广告位
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
public interface AdPositionService extends BaseService<AdPosition, Long> {

	/**
	 * 查找广告位(缓存)
	 * 
	 * @param id
	 *            ID
	 * @param cacheRegion
	 *            缓存区域
	 * @return 广告位(缓存)
	 */
	AdPosition find(Long id, String cacheRegion);

}