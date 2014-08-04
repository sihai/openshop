/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.biz;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.time.DateUtils;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.pam.UnsupportedTokenException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import com.openteach.openshop.server.biz.AuthenticationToken.TokenType;
import com.openteach.openshop.server.biz.Setting.AccountLockType;
import com.openteach.openshop.server.biz.Setting.CaptchaType;
import com.openteach.openshop.server.biz.entity.Admin;
import com.openteach.openshop.server.biz.entity.Supplier;
import com.openteach.openshop.server.biz.service.AdminService;
import com.openteach.openshop.server.biz.service.CaptchaService;
import com.openteach.openshop.server.biz.service.SupplierService;
import com.openteach.openshop.server.biz.util.SettingUtils;

/**
 * 权限认证
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
public class AuthenticationRealm extends AuthorizingRealm {

	@Resource(name = "captchaServiceImpl")
	private CaptchaService captchaService;
	@Resource(name = "adminServiceImpl")
	private AdminService adminService;
	@Resource(name = "supplierService")
	private SupplierService supplierService;

	/**
	 * 获取认证信息
	 * 
	 * @param token
	 *            令牌
	 * @return 认证信息
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(org.apache.shiro.authc.AuthenticationToken token) {
		AuthenticationToken authenticationToken = (AuthenticationToken) token;
		TokenType type = authenticationToken.getType();
		String username = authenticationToken.getUsername();
		String password = new String(authenticationToken.getPassword());
		String captchaId = authenticationToken.getCaptchaId();
		String captcha = authenticationToken.getCaptcha();
		String ip = authenticationToken.getHost();
		if (!captchaService.isValid(TokenType.ADMIN == type ? CaptchaType.adminLogin : CaptchaType.supplierLogin, captchaId, captcha)) {
			throw new UnsupportedTokenException();
		}
		if (username != null && password != null) {
			if(TokenType.ADMIN == type) {
				// Admin登录
				Admin admin = adminService.findByUsername(username);
				if (admin == null) {
					throw new UnknownAccountException();
				}
				if (!admin.getIsEnabled()) {
					throw new DisabledAccountException();
				}
				Setting setting = SettingUtils.get();
				if (admin.getIsLocked()) {
					if (ArrayUtils.contains(setting.getAccountLockTypes(), AccountLockType.admin)) {
						int loginFailureLockTime = setting.getAccountLockTime();
						if (loginFailureLockTime == 0) {
							throw new LockedAccountException();
						}
						Date lockedDate = admin.getLockedDate();
						Date unlockDate = DateUtils.addMinutes(lockedDate, loginFailureLockTime);
						if (new Date().after(unlockDate)) {
							admin.setLoginFailureCount(0);
							admin.setIsLocked(false);
							admin.setLockedDate(null);
							adminService.update(admin);
						} else {
							throw new LockedAccountException();
						}
					} else {
						admin.setLoginFailureCount(0);
						admin.setIsLocked(false);
						admin.setLockedDate(null);
						adminService.update(admin);
					}
				}
				if (!DigestUtils.md5Hex(password).equals(admin.getPassword())) {
					int loginFailureCount = admin.getLoginFailureCount() + 1;
					if (loginFailureCount >= setting.getAccountLockCount()) {
						admin.setIsLocked(true);
						admin.setLockedDate(new Date());
					}
					admin.setLoginFailureCount(loginFailureCount);
					adminService.update(admin);
					throw new IncorrectCredentialsException();
				}
				admin.setLoginIp(ip);
				admin.setLoginDate(new Date());
				admin.setLoginFailureCount(0);
				adminService.update(admin);
				return new SimpleAuthenticationInfo(new Principal(TokenType.ADMIN, admin.getId(), username), password, getName());
			} else if (TokenType.SUPPLIER == type) {
				// Supplier登录
				Supplier supplier = supplierService.findByName(username);
				if (supplier == null) {
					throw new UnknownAccountException();
				}
				if (!supplier.getIsEnabled()) {
					throw new DisabledAccountException();
				}
				Setting setting = SettingUtils.get();
				if (supplier.getIsLocked()) {
					if (ArrayUtils.contains(setting.getAccountLockTypes(), AccountLockType.admin)) {
						int loginFailureLockTime = setting.getAccountLockTime();
						if (loginFailureLockTime == 0) {
							throw new LockedAccountException();
						}
						Date lockedDate = supplier.getLockedDate();
						Date unlockDate = DateUtils.addMinutes(lockedDate, loginFailureLockTime);
						if (new Date().after(unlockDate)) {
							supplier.setLoginFailureCount(0);
							supplier.setIsLocked(false);
							supplier.setLockedDate(null);
							supplierService.update(supplier);
						} else {
							throw new LockedAccountException();
						}
					} else {
						supplier.setLoginFailureCount(0);
						supplier.setIsLocked(false);
						supplier.setLockedDate(null);
						supplierService.update(supplier);
					}
				}
				if (!DigestUtils.md5Hex(password).equals(supplier.getPassword())) {
					int loginFailureCount = supplier.getLoginFailureCount() + 1;
					if (loginFailureCount >= setting.getAccountLockCount()) {
						supplier.setIsLocked(true);
						supplier.setLockedDate(new Date());
					}
					supplier.setLoginFailureCount(loginFailureCount);
					supplierService.update(supplier);
					throw new IncorrectCredentialsException();
				}
				supplier.setLoginIp(ip);
				supplier.setLoginDate(new Date());
				supplier.setLoginFailureCount(0);
				supplierService.update(supplier);
				return new SimpleAuthenticationInfo(new Principal(TokenType.SUPPLIER, supplier.getId(), username), password, getName());
			} else {
				throw new UnknownAccountException();
			}
		}
		throw new UnknownAccountException();
	}

	/**
	 * 获取授权信息
	 * 
	 * @param principals
	 *            principals
	 * @return 授权信息
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		Principal principal = (Principal) principals.fromRealm(getName()).iterator().next();
		if (principal != null) {
			List<String> authorities = null;
			if(TokenType.ADMIN == principal.getType()) {
				authorities = adminService.findAuthorities(principal.getId());
			} else if (TokenType.SUPPLIER == principal.getType()) {
				authorities = supplierService.findAuthorities(principal.getId());
			}
			
			if (authorities != null) {
				SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
				authorizationInfo.addStringPermissions(authorities);
				return authorizationInfo;
			}
		}
		return null;
	}

}