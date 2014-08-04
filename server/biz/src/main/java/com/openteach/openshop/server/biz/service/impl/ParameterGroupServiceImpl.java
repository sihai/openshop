/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.biz.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.openteach.openshop.server.biz.dao.ParameterGroupDao;
import com.openteach.openshop.server.biz.entity.ParameterGroup;
import com.openteach.openshop.server.biz.service.ParameterGroupService;

/**
 * Service - 参数组
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Service("parameterGroupServiceImpl")
public class ParameterGroupServiceImpl extends BaseServiceImpl<ParameterGroup, Long> implements ParameterGroupService {

	@Resource(name = "parameterGroupDaoImpl")
	public void setBaseDao(ParameterGroupDao parameterGroupDao) {
		super.setBaseDao(parameterGroupDao);
	}

}