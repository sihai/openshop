/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.biz.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.openteach.openshop.server.biz.dao.AttributeDao;
import com.openteach.openshop.server.biz.entity.Attribute;
import com.openteach.openshop.server.biz.service.AttributeService;

/**
 * Service - 属性
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Service("attributeServiceImpl")
public class AttributeServiceImpl extends BaseServiceImpl<Attribute, Long> implements AttributeService {

	@Resource(name = "attributeDaoImpl")
	public void setBaseDao(AttributeDao attributeDao) {
		super.setBaseDao(attributeDao);
	}

}