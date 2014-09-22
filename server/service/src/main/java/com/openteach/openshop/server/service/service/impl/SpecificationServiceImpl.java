/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.service.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.openteach.openshop.server.service.dao.SpecificationDAO;
import com.openteach.openshop.server.service.entity.Specification;
import com.openteach.openshop.server.service.service.SpecificationService;

/**
 * Service - 规格
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Service("specificationServiceImpl")
public class SpecificationServiceImpl extends BaseServiceImpl<Specification, Long> implements SpecificationService {

	@Resource(name = "specificationDaoImpl")
	public void setBaseDao(SpecificationDAO specificationDao) {
		super.setBaseDao(specificationDao);
	}

}