/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package net.shopxx.service;

import net.shopxx.Page;
import net.shopxx.Pageable;
import net.shopxx.entity.Deposit;
import net.shopxx.entity.Member;

/**
 * Service - 预存款
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
public interface DepositService extends BaseService<Deposit, Long> {

	/**
	 * 查找预存款分页
	 * 
	 * @param member
	 *            会员
	 * @param pageable
	 *            分页信息
	 * @return 预存款分页
	 */
	Page<Deposit> findPage(Member member, Pageable pageable);

}