package net.shopxx.controller.shop;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.shopxx.Message;
import net.shopxx.Setting.CaptchaType;
import net.shopxx.entity.Cooperation;
import net.shopxx.service.CaptchaService;
import net.shopxx.service.CooperationService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
