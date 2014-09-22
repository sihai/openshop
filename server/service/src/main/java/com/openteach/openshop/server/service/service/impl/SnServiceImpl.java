/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.service.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.openteach.openshop.server.service.dao.SnDAO;
import com.openteach.openshop.server.service.entity.Sn.Type;
import com.openteach.openshop.server.service.service.SnService;

/**
 * Service - 序列号
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Service("snServiceImpl")
public class SnServiceImpl implements SnService {

	@Resource(name = "snDaoImpl")
	private SnDAO snDao;

	@Transactional
	public String generate(Type type) {
		return snDao.generate(type);
	}

}