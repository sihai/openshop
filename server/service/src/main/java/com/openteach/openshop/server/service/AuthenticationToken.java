/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.service;

import org.apache.shiro.authc.UsernamePasswordToken;

/**
 * 登录令牌
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
public class AuthenticationToken extends UsernamePasswordToken {

	private static final long serialVersionUID = 5898441540965086534L;
	
	/**
	 * 
	 * @author sihai
	 *
	 */
	public static enum TokenType {
		/**
		 * 
		 */
		ADMIN,
		/**
		 * 
		 */
		SUPPLIER;
	}
	
	/**
	 * 
	 */
	private TokenType type;

	/** 验证码ID */
	private String captchaId;

	/** 验证码 */
	private String captcha;
	
	
	/**
	 * @param username
	 *            token类型
	 * @param username
	 *            用户名
	 * @param password
	 *            密码
	 * @param captchaId
	 *            验证码ID
	 * @param captcha
	 *            验证码
	 * @param rememberMe
	 *            记住我
	 * @param host
	 *            IP
	 */
	public AuthenticationToken(TokenType type, String username, String password, String captchaId, String captcha, boolean rememberMe, String host) {
		super(username, password, rememberMe, host);
		this.type = type;
		this.captchaId = captchaId;
		this.captcha = captcha;
	}
	
	/**
	 * @param username
	 *            用户名
	 * @param password
	 *            密码
	 * @param captchaId
	 *            验证码ID
	 * @param captcha
	 *            验证码
	 * @param rememberMe
	 *            记住我
	 * @param host
	 *            IP
	 */
	public AuthenticationToken(String username, String password, String captchaId, String captcha, boolean rememberMe, String host) {
		this(TokenType.ADMIN, username, password, captchaId, captcha, rememberMe, host);
	}
	
	/**
	 * 获取token类型
	 * @return
	 */
	public TokenType getType() {
		return type;
	}

	/**
	 * 设置token类型
	 * @param type
	 * 				token类型
	 */
	public void setType(TokenType type) {
		this.type = type;
	}

	/**
	 * 获取验证码ID
	 * 
	 * @return 验证码ID
	 */
	public String getCaptchaId() {
		return captchaId;
	}

	/**
	 * 设置验证码ID
	 * 
	 * @param captchaId
	 *            验证码ID
	 */
	public void setCaptchaId(String captchaId) {
		this.captchaId = captchaId;
	}

	/**
	 * 获取验证码
	 * 
	 * @return 验证码
	 */
	public String getCaptcha() {
		return captcha;
	}

	/**
	 * 设置验证码
	 * 
	 * @param captcha
	 *            验证码
	 */
	public void setCaptcha(String captcha) {
		this.captcha = captcha;
	}

}