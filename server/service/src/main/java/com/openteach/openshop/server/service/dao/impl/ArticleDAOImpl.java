/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.service.dao.impl;

import java.util.Date;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.persistence.criteria.Subquery;

import org.springframework.stereotype.Repository;

import com.openteach.openshop.server.service.Filter;
import com.openteach.openshop.server.service.Order;
import com.openteach.openshop.server.service.Page;
import com.openteach.openshop.server.service.Pageable;
import com.openteach.openshop.server.service.dao.ArticleDAO;
import com.openteach.openshop.server.service.entity.Article;
import com.openteach.openshop.server.service.entity.ArticleCategory;
import com.openteach.openshop.server.service.entity.Tag;

/**
 * Dao - 文章
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Repository("articleDaoImpl")
public class ArticleDAOImpl extends BaseDAOImpl<Article, Long> implements ArticleDAO {

	public List<Article> findList(ArticleCategory articleCategory, List<Tag> tags, Integer count, List<Filter> filters, List<Order> orders) {
		CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
		CriteriaQuery<Article> criteriaQuery = criteriaBuilder.createQuery(Article.class);
		Root<Article> root = criteriaQuery.from(Article.class);
		criteriaQuery.select(root);
		Predicate restrictions = criteriaBuilder.conjunction();
		restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.equal(root.get("isPublication"), true));
		if (articleCategory != null) {
			restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.or(criteriaBuilder.equal(root.get("articleCategory"), articleCategory), criteriaBuilder.like(root.get("articleCategory").<String> get("treePath"), "%" + ArticleCategory.TREE_PATH_SEPARATOR + articleCategory.getId() + ArticleCategory.TREE_PATH_SEPARATOR + "%")));
		}
		if (tags != null && !tags.isEmpty()) {
			Subquery<Article> subquery = criteriaQuery.subquery(Article.class);
			Root<Article> subqueryRoot = subquery.from(Article.class);
			subquery.select(subqueryRoot);
			subquery.where(criteriaBuilder.equal(subqueryRoot, root), subqueryRoot.join("tags").in(tags));
			restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.exists(subquery));
		}
		criteriaQuery.where(restrictions);
		criteriaQuery.orderBy(criteriaBuilder.desc(root.get("isTop")));
		return super.findList(criteriaQuery, null, count, filters, orders);
	}

	public List<Article> findList(ArticleCategory articleCategory, Date beginDate, Date endDate, Integer first, Integer count) {
		CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
		CriteriaQuery<Article> criteriaQuery = criteriaBuilder.createQuery(Article.class);
		Root<Article> root = criteriaQuery.from(Article.class);
		criteriaQuery.select(root);
		Predicate restrictions = criteriaBuilder.conjunction();
		restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.equal(root.get("isPublication"), true));
		if (articleCategory != null) {
			restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.or(criteriaBuilder.equal(root.get("articleCategory"), articleCategory), criteriaBuilder.like(root.get("articleCategory").<String> get("treePath"), "%" + ArticleCategory.TREE_PATH_SEPARATOR + articleCategory.getId() + ArticleCategory.TREE_PATH_SEPARATOR + "%")));
		}
		if (beginDate != null) {
			restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.greaterThanOrEqualTo(root.<Date> get("createDate"), beginDate));
		}
		if (endDate != null) {
			restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.lessThanOrEqualTo(root.<Date> get("createDate"), endDate));
		}
		criteriaQuery.where(restrictions);
		criteriaQuery.orderBy(criteriaBuilder.desc(root.get("isTop")));
		return super.findList(criteriaQuery, first, count, null, null);
	}

	public Page<Article> findPage(ArticleCategory articleCategory, List<Tag> tags, Pageable pageable) {
		CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
		CriteriaQuery<Article> criteriaQuery = criteriaBuilder.createQuery(Article.class);
		Root<Article> root = criteriaQuery.from(Article.class);
		criteriaQuery.select(root);
		Predicate restrictions = criteriaBuilder.conjunction();
		restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.equal(root.get("isPublication"), true));
		if (articleCategory != null) {
			restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.or(criteriaBuilder.equal(root.get("articleCategory"), articleCategory), criteriaBuilder.like(root.get("articleCategory").<String> get("treePath"), "%" + ArticleCategory.TREE_PATH_SEPARATOR + articleCategory.getId() + ArticleCategory.TREE_PATH_SEPARATOR + "%")));
		}
		if (tags != null && !tags.isEmpty()) {
			Subquery<Article> subquery = criteriaQuery.subquery(Article.class);
			Root<Article> subqueryRoot = subquery.from(Article.class);
			subquery.select(subqueryRoot);
			subquery.where(criteriaBuilder.equal(subqueryRoot, root), subqueryRoot.join("tags").in(tags));
			restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.exists(subquery));
		}
		criteriaQuery.where(restrictions);
		criteriaQuery.orderBy(criteriaBuilder.desc(root.get("isTop")));
		return super.findPage(criteriaQuery, pageable);
	}

}