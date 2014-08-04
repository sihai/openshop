/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.webapp.controller.shop;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.openteach.openshop.server.biz.Pageable;
import com.openteach.openshop.server.biz.ResourceNotFoundException;
import com.openteach.openshop.server.biz.entity.ArticleCategory;
import com.openteach.openshop.server.biz.service.ArticleCategoryService;
import com.openteach.openshop.server.biz.service.ArticleService;
import com.openteach.openshop.server.biz.service.SearchService;

/**
 * Controller - 文章
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Controller("shopArticleController")
@RequestMapping("/article")
public class ArticleController extends BaseController {

	/** 每页记录数 */
	private static final int PAGE_SIZE = 20;

	@Resource(name = "articleServiceImpl")
	private ArticleService articleService;
	@Resource(name = "articleCategoryServiceImpl")
	private ArticleCategoryService articleCategoryService;
	@Resource(name = "searchServiceImpl")
	private SearchService searchService;

	/**
	 * 列表
	 */
	@RequestMapping(value = "/list/{id}", method = RequestMethod.GET)
	public String list(@PathVariable Long id, Integer pageNumber, ModelMap model) {
		ArticleCategory articleCategory = articleCategoryService.find(id);
		if (articleCategory == null) {
			throw new ResourceNotFoundException();
		}
		Pageable pageable = new Pageable(pageNumber, PAGE_SIZE);
		model.addAttribute("articleCategory", articleCategory);
		model.addAttribute("page", articleService.findPage(articleCategory, null, pageable));
		return "/shop/article/list";
	}

	/**
	 * 搜索
	 */
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(String keyword, Integer pageNumber, ModelMap model) {
		if (StringUtils.isEmpty(keyword)) {
			return ERROR_VIEW;
		}
		Pageable pageable = new Pageable(pageNumber, PAGE_SIZE);
		model.addAttribute("articleKeyword", keyword);
		model.addAttribute("page", searchService.search(keyword, pageable));
		return "shop/article/search";
	}

	/**
	 * 点击数
	 */
	@RequestMapping(value = "/hits/{id}", method = RequestMethod.GET)
	public @ResponseBody
	Long hits(@PathVariable Long id) {
		return articleService.viewHits(id);
	}

}