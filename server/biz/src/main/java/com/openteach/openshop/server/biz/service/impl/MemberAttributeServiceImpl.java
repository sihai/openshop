/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.biz.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.openteach.openshop.server.biz.dao.MemberAttributeDao;
import com.openteach.openshop.server.biz.entity.MemberAttribute;
import com.openteach.openshop.server.biz.service.MemberAttributeService;

/**
 * Service - 会员注册项
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Service("memberAttributeServiceImpl")
public class MemberAttributeServiceImpl extends BaseServiceImpl<MemberAttribute, Long> implements MemberAttributeService {

	@Resource(name = "memberAttributeDaoImpl")
	private MemberAttributeDao memberAttributeDao;

	@Resource(name = "memberAttributeDaoImpl")
	public void setBaseDao(MemberAttributeDao memberAttributeDao) {
		super.setBaseDao(memberAttributeDao);
	}

	@Transactional(readOnly = true)
	public Integer findUnusedPropertyIndex() {
		return memberAttributeDao.findUnusedPropertyIndex();
	}

	@Transactional(readOnly = true)
	public List<MemberAttribute> findList() {
		return memberAttributeDao.findList();
	}

	@Transactional(readOnly = true)
	@Cacheable("memberAttribute")
	public List<MemberAttribute> findList(String cacheRegion) {
		return memberAttributeDao.findList();
	}

	@Override
	@Transactional
	@CacheEvict(value = "memberAttribute", allEntries = true)
	public void save(MemberAttribute memberAttribute) {
		super.save(memberAttribute);
	}

	@Override
	@Transactional
	@CacheEvict(value = "memberAttribute", allEntries = true)
	public MemberAttribute update(MemberAttribute memberAttribute) {
		return super.update(memberAttribute);
	}

	@Override
	@Transactional
	@CacheEvict(value = "memberAttribute", allEntries = true)
	public MemberAttribute update(MemberAttribute memberAttribute, String... ignoreProperties) {
		return super.update(memberAttribute, ignoreProperties);
	}

	@Override
	@Transactional
	@CacheEvict(value = "memberAttribute", allEntries = true)
	public void delete(Long id) {
		super.delete(id);
	}

	@Override
	@Transactional
	@CacheEvict(value = "memberAttribute", allEntries = true)
	public void delete(Long... ids) {
		super.delete(ids);
	}

	@Override
	@Transactional
	@CacheEvict(value = "memberAttribute", allEntries = true)
	public void delete(MemberAttribute memberAttribute) {
		super.delete(memberAttribute);
	}

}