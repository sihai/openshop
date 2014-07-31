package net.shopxx.dao;

import net.shopxx.Page;
import net.shopxx.Pageable;
import net.shopxx.entity.Cooperation;

/**
 * <b></b>
 * @author sihai
 *
 */
public interface CooperationDao extends BaseDao<Cooperation, Long> {

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
