/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.webapp.controller.shop;

import java.util.Date;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang.RandomStringUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.openteach.openshop.server.service.Message;
import com.openteach.openshop.server.service.Setting;
import com.openteach.openshop.server.service.Setting.CaptchaType;
import com.openteach.openshop.server.service.entity.Member;
import com.openteach.openshop.server.service.entity.SafeKey;
import com.openteach.openshop.server.service.entity.BaseEntity.Save;
import com.openteach.openshop.server.service.service.CaptchaService;
import com.openteach.openshop.server.service.service.MailService;
import com.openteach.openshop.server.service.service.MemberService;
import com.openteach.openshop.server.service.util.SettingUtils;

/**
 * Controller - 密码
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Controller("shopPasswordController")
@RequestMapping("/password")
public class PasswordController extends BaseController {

	@Resource(name = "captchaServiceImpl")
	private CaptchaService captchaService;
	@Resource(name = "memberServiceImpl")
	private MemberService memberService;
	@Resource(name = "mailServiceImpl")
	private MailService mailService;

	/**
	 * 找回密码
	 */
	@RequestMapping(value = "/find", method = RequestMethod.GET)
	public String find(Model model) {
		model.addAttribute("captchaId", UUID.randomUUID().toString());
		return "/shop/password/find";
	}

	/**
	 * 找回密码提交
	 */
	@RequestMapping(value = "/find", method = RequestMethod.POST)
	public @ResponseBody
	Message find(String captchaId, String captcha, String username, String email) {
		if (!captchaService.isValid(CaptchaType.findPassword, captchaId, captcha)) {
			return Message.error("shop.captcha.invalid");
		}
		if (StringUtils.isEmpty(username) && StringUtils.isEmpty(email)) {
			return Message.error("shop.password.username_or_email_needed");
		}
		
		Member member = null;
		//memberService.finByEmail(email);
		if (null != username) {
			member = memberService.findByUsername(username);
		} else if (null != email) {
			member = memberService.findByUsername(email);
		}
		
		if (member == null) {
			return Message.error("shop.password.memberNotExist");
		}
		
		if(StringUtils.isNotEmpty(username) && StringUtils.isNotEmpty(email) && !StringUtils.equals(email, member.getEmail())) {
			return Message.error("shop.password.username_not_matched_email");
		}
		
		/*if (!member.getEmail().equalsIgnoreCase(email)) {
			return Message.error("shop.password.invalidEmail");
		}*/
		
		Setting setting = SettingUtils.get();
		SafeKey safeKey = new SafeKey();
		safeKey.setValue(UUID.randomUUID().toString() + DigestUtils.md5Hex(RandomStringUtils.randomAlphabetic(30)));
		safeKey.setExpire(setting.getSafeKeyExpiryTime() != 0 ? DateUtils.addMinutes(new Date(), setting.getSafeKeyExpiryTime()) : null);
		member.setSafeKey(safeKey);
		memberService.update(member);
		mailService.sendFindPasswordMail(member.getEmail(), member.getUsername(), safeKey);
		return Message.success("shop.password.mailSuccess", member.getEmail());
	}

	/**
	 * 重置密码
	 */
	@RequestMapping(value = "/reset", method = RequestMethod.GET)
	public String reset(String username, String key, Model model) {
		Member member = memberService.findByUsername(username);
		if (member == null) {
			return ERROR_VIEW;
		}
		SafeKey safeKey = member.getSafeKey();
		if (safeKey == null || safeKey.getValue() == null || !safeKey.getValue().equals(key)) {
			return ERROR_VIEW;
		}
		if (safeKey.hasExpired()) {
			model.addAttribute("erroInfo", Message.warn("shop.password.hasExpired"));
			return ERROR_VIEW;
		}
		model.addAttribute("captchaId", UUID.randomUUID().toString());
		model.addAttribute("member", member);
		model.addAttribute("key", key);
		return "/shop/password/reset";
	}

	/**
	 * 重置密码提交
	 */
	@RequestMapping(value = "reset", method = RequestMethod.POST)
	public @ResponseBody
	Message reset(String captchaId, String captcha, String username, String newPassword, String key) {
		if (!captchaService.isValid(CaptchaType.resetPassword, captchaId, captcha)) {
			return Message.error("shop.captcha.invalid");
		}
		Member member = memberService.findByUsername(username);
		if (member == null) {
			return ERROR_MESSAGE;
		}
		if (!isValid(Member.class, "password", newPassword, Save.class)) {
			return Message.warn("shop.password.invalidPassword");
		}
		Setting setting = SettingUtils.get();
		if (newPassword.length() < setting.getPasswordMinLength() || newPassword.length() > setting.getPasswordMaxLength()) {
			return Message.warn("shop.password.invalidPassword");
		}
		SafeKey safeKey = member.getSafeKey();
		if (safeKey == null || safeKey.getValue() == null || !safeKey.getValue().equals(key)) {
			return ERROR_MESSAGE;
		}
		if (safeKey.hasExpired()) {
			return Message.error("shop.password.hasExpired");
		}
		member.setPassword(DigestUtils.md5Hex(newPassword));
		safeKey.setExpire(new Date());
		safeKey.setValue(null);
		memberService.update(member);
		return Message.success("shop.password.resetSuccess");
	}

}