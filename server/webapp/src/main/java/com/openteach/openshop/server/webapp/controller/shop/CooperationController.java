package com.openteach.openshop.server.webapp.controller.shop;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.openteach.openshop.server.biz.Message;
import com.openteach.openshop.server.biz.Setting.CaptchaType;
import com.openteach.openshop.server.biz.entity.Cooperation;
import com.openteach.openshop.server.biz.service.CaptchaService;
import com.openteach.openshop.server.biz.service.CooperationService;

/**
 * 
 * @author sihai
 *
 */
@Controller("cooperationController")
@RequestMapping("/cooperation")
public class CooperationController extends BaseController {

	@Resource(name = "captchaServiceImpl")
	private CaptchaService captchaService;
	@Resource(name = "cooperationServiceImpl")
	private CooperationService cooperationService;
	
	/**
	 * 注册提交
	 */
	@RequestMapping(value = "/submit", method = RequestMethod.POST)
	public @ResponseBody
	Message apply(String captchaId, String captcha, String name, String phone, String email, String msg, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		if (!captchaService.isValid(CaptchaType.cooperation, captchaId, captcha)) {
			return Message.error("shop.captcha.invalid");
		}
		Cooperation c = new Cooperation();
		c.setName(name);
		c.setPhone(phone);
		c.setEmail(email);
		c.setMsg(msg);
		c.setStatus(Cooperation.Status.UNREADED);
		cooperationService.save(c);
		return SUCCESS_MESSAGE;
	}
}
