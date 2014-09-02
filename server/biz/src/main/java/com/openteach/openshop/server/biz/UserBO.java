package com.openteach.openshop.server.biz;

import java.math.BigDecimal;
import java.text.ParseException;
import java.util.Arrays;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateUtils;
import org.springframework.stereotype.Component;

import com.openteach.openshop.server.api.security.RSAUtils;
import com.openteach.openshop.server.service.CommonAttributes;
import com.openteach.openshop.server.service.Message;
import com.openteach.openshop.server.service.Principal;
import com.openteach.openshop.server.service.Setting;
import com.openteach.openshop.server.service.Setting.AccountLockType;
import com.openteach.openshop.server.service.Setting.CaptchaType;
import com.openteach.openshop.server.service.entity.Area;
import com.openteach.openshop.server.service.entity.BaseEntity.Save;
import com.openteach.openshop.server.service.entity.Cart;
import com.openteach.openshop.server.service.entity.Member;
import com.openteach.openshop.server.service.entity.Member.Gender;
import com.openteach.openshop.server.service.entity.MemberAttribute;
import com.openteach.openshop.server.service.entity.MemberAttribute.Type;
import com.openteach.openshop.server.service.service.AreaService;
import com.openteach.openshop.server.service.service.CaptchaService;
import com.openteach.openshop.server.service.service.CartService;
import com.openteach.openshop.server.service.service.MemberAttributeService;
import com.openteach.openshop.server.service.service.MemberRankService;
import com.openteach.openshop.server.service.service.MemberService;
import com.openteach.openshop.server.service.util.SettingUtils;
import com.openteach.openshop.server.service.util.WebUtils;

/**
 * 
 * @author sihai
 *
 */
@Component("userBO")
public class UserBO extends BaseBO {

	@Resource(name = "captchaServiceImpl")
	private CaptchaService captchaService;
	@Resource(name = "memberServiceImpl")
	private MemberService memberService;
	@Resource(name = "memberRankServiceImpl")
	private MemberRankService memberRankService;
	@Resource(name = "memberAttributeServiceImpl")
	private MemberAttributeService memberAttributeService;
	@Resource(name = "cartServiceImpl")
	private CartService cartService;
	@Resource(name = "areaServiceImpl")
	private AreaService areaService;
	
	/**
	 * 
	 * @param username
	 * @param email
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	public Message register(String username, String email, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String password = RSAUtils.decryptParameter("enPassword", request);
		RSAUtils.removePrivateKey(request);
		Setting setting = SettingUtils.get();
		if (!setting.getIsRegisterEnabled()) {
			return Message.error("shop.register.disabled");
		}
		if (!isValid(Member.class, "username", username, Save.class) || !isValid(Member.class, "password", password, Save.class) || !isValid(Member.class, "email", email, Save.class)) {
			return Message.error("shop.common.invalid");
		}
		if (username.length() < setting.getUsernameMinLength() || username.length() > setting.getUsernameMaxLength()) {
			return Message.error("shop.common.invalid");
		}
		if (password.length() < setting.getPasswordMinLength() || password.length() > setting.getPasswordMaxLength()) {
			return Message.error("shop.common.invalid");
		}
		if (memberService.usernameDisabled(username) || memberService.usernameExists(username)) {
			return Message.error("shop.register.disabledExist");
		}
		if (!setting.getIsDuplicateEmail() && memberService.emailExists(email)) {
			return Message.error("shop.register.emailExist");
		}

		Member member = new Member();
		List<MemberAttribute> memberAttributes = memberAttributeService.findList();
		for (MemberAttribute memberAttribute : memberAttributes) {
			String parameter = request.getParameter("memberAttribute_" + memberAttribute.getId());
			if (memberAttribute.getType() == Type.name || memberAttribute.getType() == Type.address || memberAttribute.getType() == Type.zipCode || memberAttribute.getType() == Type.phone || memberAttribute.getType() == Type.mobile || memberAttribute.getType() == Type.text || memberAttribute.getType() == Type.select) {
				if (memberAttribute.getIsRequired() && StringUtils.isEmpty(parameter)) {
					return Message.error("shop.common.invalid");
				}
				member.setAttributeValue(memberAttribute, parameter);
			} else if (memberAttribute.getType() == Type.gender) {
				Gender gender = StringUtils.isNotEmpty(parameter) ? Gender.valueOf(parameter) : null;
				if (memberAttribute.getIsRequired() && gender == null) {
					return Message.error("shop.common.invalid");
				}
				member.setGender(gender);
			} else if (memberAttribute.getType() == Type.birth) {
				try {
					Date birth = StringUtils.isNotEmpty(parameter) ? DateUtils.parseDate(parameter, CommonAttributes.DATE_PATTERNS) : null;
					if (memberAttribute.getIsRequired() && birth == null) {
						return Message.error("shop.common.invalid");
					}
					member.setBirth(birth);
				} catch (ParseException e) {
					return Message.error("shop.common.invalid");
				}
			} else if (memberAttribute.getType() == Type.area) {
				Area area = StringUtils.isNotEmpty(parameter) ? areaService.find(Long.valueOf(parameter)) : null;
				if (area != null) {
					member.setArea(area);
				} else if (memberAttribute.getIsRequired()) {
					return Message.error("shop.common.invalid");
				}
			} else if (memberAttribute.getType() == Type.checkbox) {
				String[] parameterValues = request.getParameterValues("memberAttribute_" + memberAttribute.getId());
				List<String> options = parameterValues != null ? Arrays.asList(parameterValues) : null;
				if (memberAttribute.getIsRequired() && (options == null || options.isEmpty())) {
					return Message.error("shop.common.invalid");
				}
				member.setAttributeValue(memberAttribute, options);
			}
		}
		member.setUsername(username.toLowerCase());
		member.setPassword(DigestUtils.md5Hex(password));
		member.setEmail(email);
		member.setPoint(setting.getRegisterPoint());
		member.setAmount(new BigDecimal(0));
		member.setBalance(new BigDecimal(0));
		member.setIsEnabled(true);
		member.setIsLocked(false);
		member.setLoginFailureCount(0);
		member.setLockedDate(null);
		member.setRegisterIp(request.getRemoteAddr());
		member.setLoginIp(request.getRemoteAddr());
		member.setLoginDate(new Date());
		member.setSafeKey(null);
		member.setMemberRank(memberRankService.findDefault());
		member.setFavoriteProducts(null);
		memberService.save(member);

		Cart cart = cartService.getCurrent();
		if (cart != null && cart.getMember() == null) {
			cartService.merge(member, cart);
			WebUtils.removeCookie(request, response, Cart.ID_COOKIE_NAME);
			WebUtils.removeCookie(request, response, Cart.KEY_COOKIE_NAME);
		}

		Map<String, Object> attributes = new HashMap<String, Object>();
		Enumeration<?> keys = session.getAttributeNames();
		while (keys.hasMoreElements()) {
			String key = (String) keys.nextElement();
			attributes.put(key, session.getAttribute(key));
		}
		session.invalidate();
		session = request.getSession();
		for (Entry<String, Object> entry : attributes.entrySet()) {
			session.setAttribute(entry.getKey(), entry.getValue());
		}

		session.setAttribute(Member.PRINCIPAL_ATTRIBUTE_NAME, new Principal(member.getId(), member.getUsername()));
		WebUtils.addCookie(request, response, Member.USERNAME_COOKIE_NAME, member.getUsername());
		if(StringUtils.isNotBlank(member.getName())) {
			WebUtils.addCookie(request, response, Member.NAME_COOKIE_NAME, member.getName());
		}
		
		return Message.success("shop.register.success");
	}
	
	/**
	 * 
	 * @param captchaId
	 * @param captcha
	 * @param username
	 * @param email
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	public Message register(String captchaId, String captcha, String username, String email, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		if (!captchaService.isValid(CaptchaType.memberRegister, captchaId, captcha)) {
			return Message.error("shop.captcha.invalid");
		}
		return register(username, email, request, response, session);
	}
	
	/**
	 * 
	 * @param username
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	public Message login(String username, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String password = RSAUtils.decryptParameter("enPassword", request);
		if (StringUtils.isEmpty(username) || StringUtils.isEmpty(password)) {
			return Message.error("shop.common.invalid");
		}
		RSAUtils.removePrivateKey(request);
		return login(username, password, request, response, session);
	}
	
	/**
	 * 
	 * @param username
	 * @param password
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	public Message login(String username, String password, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		Member member;
		Setting setting = SettingUtils.get();
		if (setting.getIsEmailLogin() && username.contains("@")) {
			List<Member> members = memberService.findListByEmail(username);
			if (members.isEmpty()) {
				member = null;
			} else if (members.size() == 1) {
				member = members.get(0);
			} else {
				return Message.error("shop.login.unsupportedAccount");
			}
		} else {
			member = memberService.findByUsername(username);
		}
		if (member == null) {
			return Message.error("shop.login.unknownAccount");
		}
		return login(member, setting, password, request, response, session);
	}
	
	/**
	 * 
	 * @param captchaId
	 * @param captcha
	 * @param username
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	public Message login(String captchaId, String captcha, String username, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		if (!captchaService.isValid(CaptchaType.memberLogin, captchaId, captcha)) {
			return Message.error("shop.captcha.invalid");
		}
		return login(username, request, response, session);
	}
	
	/**
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	public Message logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		return SUCCESS_MESSAGE;
	}
	
	/**
	 * 
	 * @param from
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	public Message othersLogin(String from, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		try {
			boolean isNew = false;
			Member member = null;
			if(StringUtils.equals("qq", from)) {
				// XXX
				JSONObject json = JSONObject.fromObject(request.getParameter("user_info"));
				String openId = json.getString("openId");
                if (json.getInt("ret") == 0) {
                	member = memberService.findByUsername(openId);
                	if(null == member) {
                		isNew = true;
                		member = new Member();
                	}
                	// XXX
                	member.setUsername(openId);
                	member.setName(json.getString("nickname"));
                	member.setGender(StringUtils.equals("男", json.getString("gender")) ? Gender.male : Gender.female);
                } else {
                    // TODO
                	return Message.error("shop.login.unknownAccount");
                }
			} else if(StringUtils.equals("sina_weibo", from)) {
				// XXX
				String id = null;
				JSONObject json = JSONObject.fromObject(request.getParameter("user_info"));
				id = json.getString("idstr");
				member = memberService.findByUsername(id);
	        	if(null == member) {
	        		isNew = true;
	        		member = new Member();
	        	}
	        	// XXX
	        	member.setUsername(id);
	        	member.setName(json.getString("screen_name"));
	        	member.setGender(StringUtils.equals("m", json.getString("gender")) ? Gender.male : Gender.female);
			}
			if(null == member) {
				// TODO
				return Message.error("shop.login.unknownAccount");
			}
			
			if(isNew) {
				// TODO generate password
				member.setPassword(DigestUtils.md5Hex("123456"));
				member.setAmount(new BigDecimal(0));
				member.setBalance(new BigDecimal(0));
				member.setCreateDate(new Date());
				member.setEmail(String.format("%s@aigechibaole.com", member.getName()));
				member.setIsEnabled(true);
				member.setIsLocked(false);
				member.setPoint(0L);
				member.setRegisterIp(request.getRemoteAddr());
				member.setLoginFailureCount(0);
				member.setMemberRank(memberRankService.findDefault());
	    		memberService.save(member);
	    	} else {
	    		memberService.update(member);
	    	}
			
			return login(member, SettingUtils.get(), null, request, response, session);
		} catch (Throwable t) {
			t.printStackTrace();
		}
		return Message.error("shop.login.unknownAccount");
	}

	
	/**
	 * 
	 * @param member
	 * @param setting
	 * @param password
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	private Message login(Member member, Setting setting, String password, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		if (!member.getIsEnabled()) {
			return Message.error("shop.login.disabledAccount");
		}
		if (member.getIsLocked()) {
			if (ArrayUtils.contains(setting.getAccountLockTypes(), AccountLockType.member)) {
				int loginFailureLockTime = setting.getAccountLockTime();
				if (loginFailureLockTime == 0) {
					return Message.error("shop.login.lockedAccount");
				}
				Date lockedDate = member.getLockedDate();
				Date unlockDate = DateUtils.addMinutes(lockedDate, loginFailureLockTime);
				if (new Date().after(unlockDate)) {
					member.setLoginFailureCount(0);
					member.setIsLocked(false);
					member.setLockedDate(null);
					memberService.update(member);
				} else {
					return Message.error("shop.login.lockedAccount");
				}
			} else {
				member.setLoginFailureCount(0);
				member.setIsLocked(false);
				member.setLockedDate(null);
				memberService.update(member);
			}
		}
		
		if(null != password) {
			if (!DigestUtils.md5Hex(password).equals(member.getPassword())) {
				int loginFailureCount = member.getLoginFailureCount() + 1;
				if (loginFailureCount >= setting.getAccountLockCount()) {
					member.setIsLocked(true);
					member.setLockedDate(new Date());
				}
				member.setLoginFailureCount(loginFailureCount);
				memberService.update(member);
				if (ArrayUtils.contains(setting.getAccountLockTypes(), AccountLockType.member)) {
					return Message.error("shop.login.accountLockCount", setting.getAccountLockCount());
				} else {
					return Message.error("shop.login.incorrectCredentials");
				}
			}
		}
		member.setLoginIp(request.getRemoteAddr());
		member.setLoginDate(new Date());
		member.setLoginFailureCount(0);
		memberService.update(member);

		Cart cart = cartService.getCurrent();
		if (cart != null) {
			if (cart.getMember() == null) {
				cartService.merge(member, cart);
				WebUtils.removeCookie(request, response, Cart.ID_COOKIE_NAME);
				WebUtils.removeCookie(request, response, Cart.KEY_COOKIE_NAME);
			}
		}

		Map<String, Object> attributes = new HashMap<String, Object>();
		Enumeration<?> keys = session.getAttributeNames();
		while (keys.hasMoreElements()) {
			String key = (String) keys.nextElement();
			attributes.put(key, session.getAttribute(key));
		}
		session.invalidate();
		session = request.getSession();
		for (Entry<String, Object> entry : attributes.entrySet()) {
			session.setAttribute(entry.getKey(), entry.getValue());
		}

		session.setAttribute(Member.PRINCIPAL_ATTRIBUTE_NAME, new Principal(member.getId(), member.getUsername()));
		WebUtils.addCookie(request, response, Member.USERNAME_COOKIE_NAME, member.getUsername());
		if(StringUtils.isNotBlank(member.getName())) {
			WebUtils.addCookie(request, response, Member.NAME_COOKIE_NAME, member.getName());
		}

		return SUCCESS_MESSAGE;
	}
}