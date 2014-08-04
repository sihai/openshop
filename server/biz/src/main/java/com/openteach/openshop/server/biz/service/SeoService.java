/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.biz.service;

import com.openteach.openshop.server.biz.entity.Seo;
import com.openteach.openshop.server.biz.entity.Seo.Type;

/**
 * Service - SEO设置
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
public interface SeoService extends BaseService<Seo, Long> {

	/**
	 * 查找SEO设置
	 * 
	 * @param type
	 *            类型
	 * @return SEO设置
	 */
	Seo find(Type type);

	/**
	 * 查找SEO设置(缓存)
	 * 
	 * @param type
	 *            类型
	 * @param cacheRegion
	 *            缓存区域
	 * @return SEO设置(缓存)
	 */
	Seo find(Type type, String cacheRegion);

}