/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.biz.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.openteach.openshop.server.biz.dao.ParameterDao;
import com.openteach.openshop.server.biz.entity.Parameter;
import com.openteach.openshop.server.biz.service.ParameterService;

/**
 * Service - 参数
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Service("parameterServiceImpl")
public class ParameterServiceImpl extends BaseServiceImpl<Parameter, Long> implements ParameterService {

	@Resource(name = "parameterDaoImpl")
	public void setBaseDao(ParameterDao parameterDao) {
		super.setBaseDao(parameterDao);
	}

}