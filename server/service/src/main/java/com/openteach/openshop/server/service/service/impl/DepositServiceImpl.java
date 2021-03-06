/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.service.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.openteach.openshop.server.service.Page;
import com.openteach.openshop.server.service.Pageable;
import com.openteach.openshop.server.service.dao.DepositDAO;
import com.openteach.openshop.server.service.entity.Deposit;
import com.openteach.openshop.server.service.entity.Member;
import com.openteach.openshop.server.service.service.DepositService;

/**
 * Service - 预存款
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Service("depositServiceImpl")
public class DepositServiceImpl extends BaseServiceImpl<Deposit, Long> implements DepositService {

	@Resource(name = "depositDaoImpl")
	private DepositDAO depositDao;

	@Resource(name = "depositDaoImpl")
	public void setBaseDao(DepositDAO depositDao) {
		super.setBaseDao(depositDao);
	}

	@Transactional(readOnly = true)
	public Page<Deposit> findPage(Member member, Pageable pageable) {
		return depositDao.findPage(member, pageable);
	}

}