/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.webapp.controller.shop;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.openteach.openshop.server.service.entity.FriendLink.Type;
import com.openteach.openshop.server.service.service.FriendLinkService;

/**
 * Controller - 友情链接
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Controller("shopFriendLinkController")
@RequestMapping("/friend_link")
public class FriendLinkController extends BaseController {

	@Resource(name = "friendLinkServiceImpl")
	private FriendLinkService friendLinkService;

	/**
	 * 首页
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap model) {
		model.addAttribute("textFriendLinks", friendLinkService.findList(Type.text));
		model.addAttribute("imageFriendLinks", friendLinkService.findList(Type.image));
		return "/shop/friend_link/index";
	}

}