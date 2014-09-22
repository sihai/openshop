/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.webapp.controller.shop;

import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.openteach.openshop.server.biz.UserBO;
import com.openteach.openshop.server.service.Message;
import com.openteach.openshop.server.service.entity.Member.Gender;
import com.openteach.openshop.server.service.service.CartService;
import com.openteach.openshop.server.service.service.MemberService;

/**
 * Controller - 会员注册
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Controller("shopRegisterController")
@RequestMapping("/register")
public class RegisterController extends BaseController {

	@Resource(name = "memberServiceImpl")
	private MemberService memberService;
	@Resource(name = "cartServiceImpl")
	private CartService cartService;
	
	@Resource(name = "userBO")
	private UserBO userBO;

	/**
	 * 检查用户名是否被禁用或已存在
	 */
	@RequestMapping(value = "/check_username", method = RequestMethod.GET)
	public @ResponseBody
	boolean checkUsername(String username) {
		if (StringUtils.isEmpty(username)) {
			return false;
		}
		if (memberService.usernameDisabled(username) || memberService.usernameExists(username)) {
			return false;
		} else {
			return true;
		}
	}

	/**
	 * 检查E-mail是否存在
	 */
	@RequestMapping(value = "/check_email", method = RequestMethod.GET)
	public @ResponseBody
	boolean checkEmail(String email) {
		if (StringUtils.isEmpty(email)) {
			return false;
		}
		if (memberService.emailExists(email)) {
			return false;
		} else {
			return true;
		}
	}

	/**
	 * 注册页面
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String index(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		model.addAttribute("genders", Gender.values());
		model.addAttribute("captchaId", UUID.randomUUID().toString());
		return "/shop/register/t";
	}

	/**
	 * 注册提交
	 */
	@RequestMapping(value = "/submit", method = RequestMethod.POST)
	public @ResponseBody
	Message submit(String captchaId, String captcha, String username, String email, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		//return userBO.register(captchaId, captcha, username, email, request, response, session);
		return null;
	}

}