/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.service.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.openteach.openshop.server.service.dao.DeliveryTemplateDAO;
import com.openteach.openshop.server.service.entity.DeliveryTemplate;
import com.openteach.openshop.server.service.service.DeliveryTemplateService;

/**
 * Service - 快递单模板
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Service("deliveryTemplateServiceImpl")
public class DeliveryTemplateServiceImpl extends BaseServiceImpl<DeliveryTemplate, Long> implements DeliveryTemplateService {

	@Resource(name = "deliveryTemplateDaoImpl")
	private DeliveryTemplateDAO deliveryTemplateDao;

	@Resource(name = "deliveryTemplateDaoImpl")
	public void setBaseDao(DeliveryTemplateDAO deliveryTemplateDao) {
		super.setBaseDao(deliveryTemplateDao);
	}

	@Transactional(readOnly = true)
	public DeliveryTemplate findDefault() {
		return deliveryTemplateDao.findDefault();
	}

}