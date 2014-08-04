/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.webapp.controller.admin;

import java.util.Iterator;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.openteach.openshop.server.biz.Message;
import com.openteach.openshop.server.biz.Pageable;
import com.openteach.openshop.server.biz.entity.Parameter;
import com.openteach.openshop.server.biz.entity.ParameterGroup;
import com.openteach.openshop.server.biz.service.ParameterGroupService;
import com.openteach.openshop.server.biz.service.ProductCategoryService;

/**
 * Controller - 参数
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Controller("adminParameterGroupController")
@RequestMapping("/admin/parameter_group")
public class ParameterGroupController extends BaseController {

	@Resource(name = "parameterGroupServiceImpl")
	private ParameterGroupService parameterGroupService;
	@Resource(name = "productCategoryServiceImpl")
	private ProductCategoryService productCategoryService;

	/**
	 * 添加
	 */
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(ModelMap model) {
		model.addAttribute("productCategoryTree", productCategoryService.findTree());
		return "/admin/parameter_group/add";
	}

	/**
	 * 保存
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(ParameterGroup parameterGroup, Long productCategoryId, RedirectAttributes redirectAttributes) {
		for (Iterator<Parameter> iterator = parameterGroup.getParameters().iterator(); iterator.hasNext();) {
			Parameter parameter = iterator.next();
			if (parameter == null || parameter.getName() == null) {
				iterator.remove();
			} else {
				parameter.setParameterGroup(parameterGroup);
			}
		}
		parameterGroup.setProductCategory(productCategoryService.find(productCategoryId));
		if (!isValid(parameterGroup)) {
			return ERROR_VIEW;
		}
		parameterGroupService.save(parameterGroup);
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:list.jhtml";
	}

	/**
	 * 编辑
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(Long id, ModelMap model) {
		model.addAttribute("parameterGroup", parameterGroupService.find(id));
		model.addAttribute("productCategoryTree", productCategoryService.findTree());
		return "/admin/parameter_group/edit";
	}

	/**
	 * 更新
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(ParameterGroup parameterGroup, Long productCategoryId, RedirectAttributes redirectAttributes) {
		for (Iterator<Parameter> iterator = parameterGroup.getParameters().iterator(); iterator.hasNext();) {
			Parameter parameter = iterator.next();
			if (parameter == null || parameter.getName() == null) {
				iterator.remove();
			} else {
				parameter.setParameterGroup(parameterGroup);
			}
		}
		parameterGroup.setProductCategory(productCategoryService.find(productCategoryId));
		if (!isValid(parameterGroup)) {
			return ERROR_VIEW;
		}
		parameterGroupService.update(parameterGroup);
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:list.jhtml";
	}

	/**
	 * 列表
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Pageable pageable, ModelMap model) {
		model.addAttribute("page", parameterGroupService.findPage(pageable));
		return "/admin/parameter_group/list";
	}

	/**
	 * 删除
	 */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public @ResponseBody
	Message delete(Long[] ids) {
		parameterGroupService.delete(ids);
		return SUCCESS_MESSAGE;
	}

}