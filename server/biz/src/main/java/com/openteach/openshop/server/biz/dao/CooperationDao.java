package com.openteach.openshop.server.biz.dao;

import com.openteach.openshop.server.biz.Page;
import com.openteach.openshop.server.biz.Pageable;
import com.openteach.openshop.server.biz.entity.Cooperation;

/**
 * <b></b>
 * @author sihai
 *
 */
public interface CooperationDao extends BaseDAO<Cooperation, Long> {

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
}
