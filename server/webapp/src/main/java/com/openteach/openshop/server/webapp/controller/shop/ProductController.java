/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.webapp.controller.shop;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang.RandomStringUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.openteach.openshop.server.biz.Message;
import com.openteach.openshop.server.biz.Pageable;
import com.openteach.openshop.server.biz.ResourceNotFoundException;
import com.openteach.openshop.server.biz.entity.Attribute;
import com.openteach.openshop.server.biz.entity.Brand;
import com.openteach.openshop.server.biz.entity.Cart;
import com.openteach.openshop.server.biz.entity.CartItem;
import com.openteach.openshop.server.biz.entity.Member;
import com.openteach.openshop.server.biz.entity.Product;
import com.openteach.openshop.server.biz.entity.ProductCategory;
import com.openteach.openshop.server.biz.entity.Promotion;
import com.openteach.openshop.server.biz.entity.Tag;
import com.openteach.openshop.server.biz.entity.Product.OrderType;
import com.openteach.openshop.server.biz.service.BrandService;
import com.openteach.openshop.server.biz.service.ProductCategoryService;
import com.openteach.openshop.server.biz.service.ProductService;
import com.openteach.openshop.server.biz.service.PromotionService;
import com.openteach.openshop.server.biz.service.SearchService;
import com.openteach.openshop.server.biz.service.TagService;
import com.openteach.openshop.server.biz.util.WebUtils;

/**
 * Controller - 商品
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Controller("shopProductController")
@RequestMapping("/product")
public class ProductController extends BaseController {

	@Resource(name = "productServiceImpl")
	private ProductService productService;
	@Resource(name = "productCategoryServiceImpl")
	private ProductCategoryService productCategoryService;
	@Resource(name = "brandServiceImpl")
	private BrandService brandService;
	@Resource(name = "promotionServiceImpl")
	private PromotionService promotionService;
	@Resource(name = "tagServiceImpl")
	private TagService tagService;
	@Resource(name = "searchServiceImpl")
	private SearchService searchService;

	/**
	 * 浏览记录
	 */
	@RequestMapping(value = "/history", method = RequestMethod.GET)
	public @ResponseBody
	List<Product> history(Long[] ids) {
		return productService.findList(ids);
	}
	
	/**
	 * 添加
	 */

	/**
	 * 列表
	 */
	@RequestMapping(value = "/list/{productCategoryId}", method = RequestMethod.GET)
	public String list(@PathVariable Long productCategoryId, Long brandId, Long promotionId, Long[] tagIds, BigDecimal startPrice, BigDecimal endPrice, OrderType orderType, Integer pageNumber, Integer pageSize, HttpServletRequest request, ModelMap model) {
		ProductCategory productCategory = productCategoryService.find(productCategoryId);
		if (productCategory == null) {
			throw new ResourceNotFoundException();
		}
		Brand brand = brandService.find(brandId);
		Promotion promotion = promotionService.find(promotionId);
		List<Tag> tags = tagService.findList(tagIds);
		Map<Attribute, String> attributeValue = new HashMap<Attribute, String>();
		if (productCategory != null) {
			Set<Attribute> attributes = productCategory.getAttributes();
			for (Attribute attribute : attributes) {
				String value = request.getParameter("attribute_" + attribute.getId());
				if (StringUtils.isNotEmpty(value) && attribute.getOptions().contains(value)) {
					attributeValue.put(attribute, value);
				}
			}
		}
		Pageable pageable = new Pageable(pageNumber, pageSize);
		model.addAttribute("orderTypes", OrderType.values());
		model.addAttribute("productCategory", productCategory);
		model.addAttribute("brand", brand);
		model.addAttribute("promotion", promotion);
		model.addAttribute("tags", tags);
		model.addAttribute("attributeValue", attributeValue);
		model.addAttribute("startPrice", startPrice);
		model.addAttribute("endPrice", endPrice);
		model.addAttribute("orderType", orderType);
		model.addAttribute("pageNumber", pageNumber);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("page", productService.findPage(productCategory, brand, promotion, tags, attributeValue, startPrice, endPrice, true, true, null, false, null, null, orderType, pageable));
		return "/shop/product/newList";
	}

	/**
	 * 列表
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Long brandId, Long promotionId, Long[] tagIds, BigDecimal startPrice, BigDecimal endPrice, OrderType orderType, Integer pageNumber, Integer pageSize, HttpServletRequest request, ModelMap model) {
		Brand brand = brandService.find(brandId);
		Promotion promotion = promotionService.find(promotionId);
		List<Tag> tags = tagService.findList(tagIds);
		Pageable pageable = new Pageable(pageNumber, pageSize);
		model.addAttribute("orderTypes", OrderType.values());
		model.addAttribute("brand", brand);
		model.addAttribute("promotion", promotion);
		model.addAttribute("tags", tags);
		model.addAttribute("startPrice", startPrice);
		model.addAttribute("endPrice", endPrice);
		model.addAttribute("orderType", orderType);
		model.addAttribute("pageNumber", pageNumber);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("page", productService.findPage(null, brand, promotion, tags, null, startPrice, endPrice, true, true, null, false, null, null, orderType, pageable));
		return "/shop/product/newList";
	}

	/**
	 * 搜索
	 */
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(String keyword, BigDecimal startPrice, BigDecimal endPrice, OrderType orderType, Integer pageNumber, Integer pageSize, ModelMap model) {
		if (StringUtils.isEmpty(keyword)) {
			return ERROR_VIEW;
		}
		Pageable pageable = new Pageable(pageNumber, pageSize);
		model.addAttribute("orderTypes", OrderType.values());
		model.addAttribute("productKeyword", keyword);
		model.addAttribute("startPrice", startPrice);
		model.addAttribute("endPrice", endPrice);
		model.addAttribute("orderType", orderType);
		model.addAttribute("page", searchService.search(keyword, startPrice, endPrice, orderType, pageable));
		return "shop/product/newSearch";
	}

	/**
	 * 点击数
	 */
	@RequestMapping(value = "/hits/{id}", method = RequestMethod.GET)
	public @ResponseBody
	Long hits(@PathVariable Long id) {
		return productService.viewHits(id);
	}
	
	//收藏数
	@RequestMapping(value = "/favours/{id}", method = RequestMethod.POST)
	public @ResponseBody
	Long favours(@PathVariable Long id) {
		return productService.viewFavours(id);
	}

}