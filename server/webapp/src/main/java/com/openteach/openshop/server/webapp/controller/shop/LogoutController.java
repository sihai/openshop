/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.webapp.controller.shop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.openteach.openshop.server.biz.entity.Member;
import com.openteach.openshop.server.biz.util.WebUtils;

/**
 * Controller - 会员注销
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Controller("shopLogoutController")
public class LogoutController extends BaseController {

	/**
	 * 注销
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		session.removeAttribute(Member.PRINCIPAL_ATTRIBUTE_NAME);
		WebUtils.removeCookie(request, response, Member.USERNAME_COOKIE_NAME);
		return "redirect:/";
	}

}