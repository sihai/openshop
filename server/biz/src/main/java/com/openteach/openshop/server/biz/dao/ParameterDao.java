/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.biz.dao;

import java.util.List;
import java.util.Set;

import com.openteach.openshop.server.biz.entity.Parameter;
import com.openteach.openshop.server.biz.entity.ParameterGroup;

/**
 * Dao - 参数
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
public interface ParameterDao extends BaseDAO<Parameter, Long> {

	/**
	 * 查找参数
	 * 
	 * @param parameterGroup
	 *            参数组
	 * @param excludes
	 *            排除参数
	 * @return 参数
	 */
	List<Parameter> findList(ParameterGroup parameterGroup, Set<Parameter> excludes);

}