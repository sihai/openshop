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
import com.openteach.openshop.server.service.dao.TagDao;
import com.openteach.openshop.server.service.entity.Tag;
import com.openteach.openshop.server.service.entity.Tag.Type;
import com.openteach.openshop.server.service.service.TagService;

/**
 * Service - 标签
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Service("tagServiceImpl")
public class TagServiceImpl extends BaseServiceImpl<Tag, Long> implements TagService {

	@Resource(name = "tagDaoImpl")
	private TagDao tagDao;

	@Resource(name = "tagDaoImpl")
	public void setBaseDao(TagDao tagDao) {
		super.setBaseDao(tagDao);
	}

	@Transactional(readOnly = true)
	public List<Tag> findList(Type type) {
		return tagDao.findList(type);
	}

	@Transactional(readOnly = true)
	@Cacheable("tag")
	public List<Tag> findList(Integer count, List<Filter> filters, List<Order> orders, String cacheRegion) {
		return tagDao.findList(null, count, filters, orders);
	}

	@Override
	@Transactional
	@CacheEvict(value = "tag", allEntries = true)
	public void save(Tag tag) {
		super.save(tag);
	}

	@Override
	@Transactional
	@CacheEvict(value = "tag", allEntries = true)
	public Tag update(Tag tag) {
		return super.update(tag);
	}

	@Override
	@Transactional
	@CacheEvict(value = "tag", allEntries = true)
	public Tag update(Tag tag, String... ignoreProperties) {
		return super.update(tag, ignoreProperties);
	}

	@Override
	@Transactional
	@CacheEvict(value = "tag", allEntries = true)
	public void delete(Long id) {
		super.delete(id);
	}

	@Override
	@Transactional
	@CacheEvict(value = "tag", allEntries = true)
	public void delete(Long... ids) {
		super.delete(ids);
	}

	@Override
	@Transactional
	@CacheEvict(value = "tag", allEntries = true)
	public void delete(Tag tag) {
		super.delete(tag);
	}

}