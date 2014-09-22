/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.service.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.openteach.openshop.server.service.dao.AttributeDAO;
import com.openteach.openshop.server.service.entity.Attribute;
import com.openteach.openshop.server.service.service.AttributeService;

/**
 * Service - 属性
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Service("attributeServiceImpl")
public class AttributeServiceImpl extends BaseServiceImpl<Attribute, Long> implements AttributeService {

	@Resource(name = "attributeDaoImpl")
	public void setBaseDao(AttributeDAO attributeDao) {
		super.setBaseDao(attributeDao);
	}

}