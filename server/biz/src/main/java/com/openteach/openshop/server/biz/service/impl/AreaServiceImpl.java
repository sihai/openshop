/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.biz.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.openteach.openshop.server.biz.dao.AreaDao;
import com.openteach.openshop.server.biz.entity.Area;
import com.openteach.openshop.server.biz.service.AreaService;

/**
 * Service - 地区
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Service("areaServiceImpl")
public class AreaServiceImpl extends BaseServiceImpl<Area, Long> implements AreaService {

	@Resource(name = "areaDaoImpl")
	private AreaDao areaDao;

	@Resource(name = "areaDaoImpl")
	public void setBaseDao(AreaDao areaDao) {
		super.setBaseDao(areaDao);
	}

	@Transactional(readOnly = true)
	public List<Area> findRoots() {
		return areaDao.findRoots(null);
	}

	@Transactional(readOnly = true)
	public List<Area> findRoots(Integer count) {
		return areaDao.findRoots(count);
	}

	@Override
	@Transactional
	@CacheEvict(value = "area", allEntries = true)
	public void save(Area area) {
		super.save(area);
	}

	@Override
	@Transactional
	@CacheEvict(value = "area", allEntries = true)
	public Area update(Area area) {
		return super.update(area);
	}

	@Override
	@Transactional
	@CacheEvict(value = "area", allEntries = true)
	public Area update(Area area, String... ignoreProperties) {
		return super.update(area, ignoreProperties);
	}

	@Override
	@Transactional
	@CacheEvict(value = "area", allEntries = true)
	public void delete(Long id) {
		super.delete(id);
	}

	@Override
	@Transactional
	@CacheEvict(value = "area", allEntries = true)
	public void delete(Long... ids) {
		super.delete(ids);
	}

	@Override
	@Transactional
	@CacheEvict(value = "area", allEntries = true)
	public void delete(Area area) {
		super.delete(area);
	}

}