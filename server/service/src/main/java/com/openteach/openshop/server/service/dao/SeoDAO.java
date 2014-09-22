/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.service.dao;

import com.openteach.openshop.server.service.entity.Seo;
import com.openteach.openshop.server.service.entity.Seo.Type;

/**
 * Dao - SEO设置
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
public interface SeoDAO extends BaseDAO<Seo, Long> {

	/**
	 * 查找SEO设置
	 * 
	 * @param type
	 *            类型
	 * @return SEO设置
	 */
	Seo find(Type type);

}