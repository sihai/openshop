/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.webapp.filter;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.WebUtils;

import com.openteach.openshop.server.api.security.RSAUtils;
import com.openteach.openshop.server.service.AuthenticationToken;
import com.openteach.openshop.server.service.AuthenticationToken.TokenType;
import com.openteach.openshop.server.service.Principal;

/**
 * Filter - 权限认证
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
public class AuthenticationFilter extends FormAuthenticationFilter {

	private static final Log logger = LogFactory.getLog(AuthenticationFilter.class);
	
	/** 默认"加密密码"参数名称 */
	private static final String DEFAULT_EN_PASSWORD_PARAM = "enPassword";

	/** 默认"验证ID"参数名称 */
	private static final String DEFAULT_CAPTCHA_ID_PARAM = "captchaId";

	/** 默认"验证码"参数名称 */
	private static final String DEFAULT_CAPTCHA_PARAM = "captcha";

	/** "加密密码"参数名称 */
	private String enPasswordParam = DEFAULT_EN_PASSWORD_PARAM;

	/** "验证ID"参数名称 */
	private String captchaIdParam = DEFAULT_CAPTCHA_ID_PARAM;

	/** "验证码"参数名称 */
	private String captchaParam = DEFAULT_CAPTCHA_PARAM;
	
	private TokenType tokenType = TokenType.ADMIN;
	
	@Override
	protected org.apache.shiro.authc.AuthenticationToken createToken(ServletRequest servletRequest, ServletResponse servletResponse) {
		String username = getUsername(servletRequest);
		String password = getPassword(servletRequest);
		String captchaId = getCaptchaId(servletRequest);
		String captcha = getCaptcha(servletRequest);
		boolean rememberMe = isRememberMe(servletRequest);
		String host = getHost(servletRequest);
		return new AuthenticationToken(tokenType, username, password, captchaId, captcha, rememberMe, host);
	}
	
	@Override
	protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) {
		if(isLoginRequest(request, response)) {
			return super.isAccessAllowed(request, response, mappedValue);
		}
		
		Subject subject = getSubject(request, response);
		Principal principal = (Principal) subject.getPrincipal();
		if(null != principal && principal.getType() != tokenType) {
			subject.logout();
			return false;
		}
		
		return super.isAccessAllowed(request, response, mappedValue);
	}

	@Override
	protected boolean executeLogin(ServletRequest request, ServletResponse response) throws Exception {
		return super.executeLogin(request, response);
	}

	@Override
	protected boolean onAccessDenied(ServletRequest servletRequest, ServletResponse servletResponse) throws Exception {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		String requestType = request.getHeader("X-Requested-With");
		if (requestType != null && requestType.equalsIgnoreCase("XMLHttpRequest")) {
			response.addHeader("loginStatus", "accessDenied");
			response.sendError(HttpServletResponse.SC_FORBIDDEN);
			return false;
		}
		
		return super.onAccessDenied(request, response);
	}

	@Override
	protected boolean onLoginSuccess(org.apache.shiro.authc.AuthenticationToken token, Subject subject, ServletRequest servletRequest, ServletResponse servletResponse) throws Exception {
		Session session = subject.getSession();
		Map<Object, Object> attributes = new HashMap<Object, Object>();
		Collection<Object> keys = session.getAttributeKeys();
		for (Object key : keys) {
			attributes.put(key, session.getAttribute(key));
		}
		session.stop();
		session = subject.getSession();
		for (Entry<Object, Object> entry : attributes.entrySet()) {
			session.setAttribute(entry.getKey(), entry.getValue());
		}
		return super.onLoginSuccess(token, subject, servletRequest, servletResponse);
	}

	@Override
	protected String getPassword(ServletRequest servletRequest) {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		String password = RSAUtils.decryptParameter(enPasswordParam, request);
		RSAUtils.removePrivateKey(request);
		return password;
	}

	/**
	 * 获取验证ID
	 * 
	 * @param servletRequest
	 *            ServletRequest
	 * @return 验证ID
	 */
	protected String getCaptchaId(ServletRequest servletRequest) {
		String captchaId = WebUtils.getCleanParam(servletRequest, captchaIdParam);
		if (captchaId == null) {
			captchaId = ((HttpServletRequest) servletRequest).getSession().getId();
		}
		return captchaId;
	}

	/**
	 * 获取验证码
	 * 
	 * @param servletRequest
	 *            ServletRequest
	 * @return 验证码
	 */
	protected String getCaptcha(ServletRequest servletRequest) {
		return WebUtils.getCleanParam(servletRequest, captchaParam);
	}

	/**
	 * 获取"加密密码"参数名称
	 * 
	 * @return "加密密码"参数名称
	 */
	public String getEnPasswordParam() {
		return enPasswordParam;
	}

	/**
	 * 设置"加密密码"参数名称
	 * 
	 * @param enPasswordParam
	 *            "加密密码"参数名称
	 */
	public void setEnPasswordParam(String enPasswordParam) {
		this.enPasswordParam = enPasswordParam;
	}

	/**
	 * 获取"验证ID"参数名称
	 * 
	 * @return "验证ID"参数名称
	 */
	public String getCaptchaIdParam() {
		return captchaIdParam;
	}

	/**
	 * 设置"验证ID"参数名称
	 * 
	 * @param captchaIdParam
	 *            "验证ID"参数名称
	 */
	public void setCaptchaIdParam(String captchaIdParam) {
		this.captchaIdParam = captchaIdParam;
	}

	/**
	 * 获取"验证码"参数名称
	 * 
	 * @return "验证码"参数名称
	 */
	public String getCaptchaParam() {
		return captchaParam;
	}

	/**
	 * 设置"验证码"参数名称
	 * 
	 * @param captchaParam
	 *            "验证码"参数名称
	 */
	public void setCaptchaParam(String captchaParam) {
		this.captchaParam = captchaParam;
	}
	
	public void setTokenType(TokenType tokenType) {
		this.tokenType = tokenType;
	}

}