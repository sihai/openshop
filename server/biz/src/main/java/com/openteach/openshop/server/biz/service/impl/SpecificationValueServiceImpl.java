/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.biz.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.openteach.openshop.server.biz.dao.SpecificationValueDao;
import com.openteach.openshop.server.biz.entity.SpecificationValue;
import com.openteach.openshop.server.biz.service.SpecificationValueService;

/**
 * Service - 规格值
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Service("specificationValueServiceImpl")
public class SpecificationValueServiceImpl extends BaseServiceImpl<SpecificationValue, Long> implements SpecificationValueService {

	@Resource(name = "specificationValueDaoImpl")
	public void setBaseDao(SpecificationValueDao specificationValueDao) {
		super.setBaseDao(specificationValueDao);
	}

}