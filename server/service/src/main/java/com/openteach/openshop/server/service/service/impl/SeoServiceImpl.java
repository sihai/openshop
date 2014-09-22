/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.service.service.impl;

import javax.annotation.Resource;

import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.openteach.openshop.server.service.dao.SeoDAO;
import com.openteach.openshop.server.service.entity.Seo;
import com.openteach.openshop.server.service.entity.Seo.Type;
import com.openteach.openshop.server.service.service.SeoService;

/**
 * Service - SEO设置
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Service("seoServiceImpl")
public class SeoServiceImpl extends BaseServiceImpl<Seo, Long> implements SeoService {

	@Resource(name = "seoDaoImpl")
	private SeoDAO seoDao;

	@Resource(name = "seoDaoImpl")
	public void setBaseDao(SeoDAO seoDao) {
		super.setBaseDao(seoDao);
	}

	@Transactional(readOnly = true)
	public Seo find(Type type) {
		return seoDao.find(type);
	}

	@Transactional(readOnly = true)
	@Cacheable("seo")
	public Seo find(Type type, String cacheRegion) {
		return seoDao.find(type);
	}

	@Override
	@Transactional
	@CacheEvict(value = "seo", allEntries = true)
	public void save(Seo seo) {
		super.save(seo);
	}

	@Override
	@Transactional
	@CacheEvict(value = "seo", allEntries = true)
	public Seo update(Seo seo) {
		return super.update(seo);
	}

	@Override
	@Transactional
	@CacheEvict(value = "seo", allEntries = true)
	public Seo update(Seo seo, String... ignoreProperties) {
		return super.update(seo, ignoreProperties);
	}

	@Override
	@Transactional
	@CacheEvict(value = "seo", allEntries = true)
	public void delete(Long id) {
		super.delete(id);
	}

	@Override
	@Transactional
	@CacheEvict(value = "seo", allEntries = true)
	public void delete(Long... ids) {
		super.delete(ids);
	}

	@Override
	@Transactional
	@CacheEvict(value = "seo", allEntries = true)
	public void delete(Seo seo) {
		super.delete(seo);
	}

}