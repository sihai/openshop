/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.service.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.openteach.openshop.server.service.Filter;
import com.openteach.openshop.server.service.Order;
import com.openteach.openshop.server.service.dao.PromotionDao;
import com.openteach.openshop.server.service.entity.Promotion;
import com.openteach.openshop.server.service.service.PromotionService;

/**
 * Service - 促销
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Service("promotionServiceImpl")
public class PromotionServiceImpl extends BaseServiceImpl<Promotion, Long> implements PromotionService {

	@Resource(name = "promotionDaoImpl")
	private PromotionDao promotionDao;

	@Resource(name = "promotionDaoImpl")
	public void setBaseDao(PromotionDao promotionDao) {
		super.setBaseDao(promotionDao);
	}

	@Transactional(readOnly = true)
	public List<Promotion> findList(Boolean hasBegun, Boolean hasEnded, Integer count, List<Filter> filters, List<Order> orders) {
		return promotionDao.findList(hasBegun, hasEnded, count, filters, orders);
	}

	@Transactional(readOnly = true)
	@Cacheable("promotion")
	public List<Promotion> findList(Boolean hasBegun, Boolean hasEnded, Integer count, List<Filter> filters, List<Order> orders, String cacheRegion) {
		return promotionDao.findList(hasBegun, hasEnded, count, filters, orders);
	}

	@Override
	@Transactional
	@CacheEvict(value = { "promotion", "product" }, allEntries = true)
	public void save(Promotion promotion) {
		super.save(promotion);
	}

	@Override
	@Transactional
	@CacheEvict(value = { "promotion", "product" }, allEntries = true)
	public Promotion update(Promotion promotion) {
		return super.update(promotion);
	}

	@Override
	@Transactional
	@CacheEvict(value = { "promotion", "product" }, allEntries = true)
	public Promotion update(Promotion promotion, String... ignoreProperties) {
		return super.update(promotion, ignoreProperties);
	}

	@Override
	@Transactional
	@CacheEvict(value = { "promotion", "product" }, allEntries = true)
	public void delete(Long id) {
		super.delete(id);
	}

	@Override
	@Transactional
	@CacheEvict(value = { "promotion", "product" }, allEntries = true)
	public void delete(Long... ids) {
		super.delete(ids);
	}

	@Override
	@Transactional
	@CacheEvict(value = { "promotion", "product" }, allEntries = true)
	public void delete(Promotion promotion) {
		super.delete(promotion);
	}

}