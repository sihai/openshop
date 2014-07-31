/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package net.shopxx.service;

import net.shopxx.Page;
import net.shopxx.Pageable;
import net.shopxx.entity.Cooperation;

/**
 * Service - 合作
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
public interface CooperationService extends BaseService<Cooperation, Long> {
	
	/**
	 * 
	 * @param status
	 * @param pageable
	 * @return
	 */
	Page<Cooperation> findPage(Cooperation.Status status, Pageable pageable);

	/**
	 * 
	 * @param status
	 * @return
	 */
	Long count(Cooperation.Status status);

	/**
	 * 
	 * @param id
	 */
	void read(Long id);
	
	/**
	 * 
	 * @param id
	 * @param memo
	 */
	void accept(Long id, String memo);
	
	/**
	 * 
	 * @param id
	 * @param memo
	 */
	void reject(Long id, String memo);
}