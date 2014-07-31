package net.shopxx.service.impl;

import javax.annotation.Resource;
import javax.persistence.LockModeType;

import net.shopxx.Page;
import net.shopxx.Pageable;
import net.shopxx.dao.CooperationDao;
import net.shopxx.entity.Cooperation;
import net.shopxx.service.CooperationService;

import org.springframework.stereotype.Service;

/**
 * 
 * @author sihai
 *
 */
@Service("cooperationServiceImpl")
public class CooperationServiceImpl extends BaseServiceImpl<Cooperation, Long> implements CooperationService {

	@Resource(name = "cooperationDaoImpl")
	private CooperationDao cooperationDao;

	@Resource(name = "cooperationDaoImpl")
	public void setCooperationDao(CooperationDao cooperationDao) {
		this.setBaseDao(cooperationDao);
		this.cooperationDao = cooperationDao;
	}

	@Override
	public Page<Cooperation> findPage(Cooperation.Status status, Pageable pageable) {
		return cooperationDao.findPage(status, pageable);
	}

	@Override
	public Long count(Cooperation.Status status) {
		return cooperationDao.count(status);
	}

	@Override
	public void read(Long id) {
		Cooperation c = cooperationDao.find(id, LockModeType.PESSIMISTIC_WRITE);
		if(null == c) {
			throw new IllegalArgumentException("No cooperation for id: " + id);
		}
		if(Cooperation.Status.UNREADED == c.getStatus()) {
			c.setStatus(Cooperation.Status.READED);
		}
		cooperationDao.merge(c);
	}

	@Override
	public void accept(Long id, String memo) {
		Cooperation c = cooperationDao.find(id, LockModeType.PESSIMISTIC_WRITE);
		if(null == c) {
			throw new IllegalArgumentException("No cooperation for id: " + id);
		}
		c.setStatus(Cooperation.Status.ACCEPTED);
		c.setMemo(memo);
		cooperationDao.merge(c);
	}

	@Override
	public void reject(Long id, String memo) {
		Cooperation c = cooperationDao.find(id, LockModeType.PESSIMISTIC_WRITE);
		if(null == c) {
			throw new IllegalArgumentException("No cooperation for id: " + id);
		}
		c.setStatus(Cooperation.Status.REJECTED);
		c.setMemo(memo);
		cooperationDao.merge(c);
	}

}
