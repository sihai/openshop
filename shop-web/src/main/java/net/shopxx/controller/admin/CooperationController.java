package net.shopxx.controller.admin;

import javax.annotation.Resource;

import net.shopxx.Message;
import net.shopxx.Pageable;
import net.shopxx.entity.Cooperation;
import net.shopxx.service.CooperationService;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 
 * @author sihai
 *
 */
@Controller("adminCooperationController")
@RequestMapping("/admin/cooperation")
public class CooperationController extends BaseController {

	@Resource(name = "cooperationServiceImpl")
	private CooperationService cooperationService;
	
	/**
	 * 注册提交
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(String status, Pageable pageable, ModelMap model) {
		model.put("page", cooperationService.findPage(StringUtils.isBlank(status) ? null : Cooperation.Status.valueOf(status), pageable));
		return "/admin/cooperation/list";
	}
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String read(Long id, ModelMap model) {
		model.put("cooperation", cooperationService.find(id));
		Cooperation c = cooperationService.find(id);
		if(null != c) {
			cooperationService.read(id);
		}
		model.put("cooperation", c);
		model.put("ACCEPTED", Cooperation.Status.ACCEPTED);
		model.put("REJECTED", Cooperation.Status.REJECTED);
		return "/admin/cooperation/read";
	}
	
	@RequestMapping(value = "/handle", method = RequestMethod.POST)
	@ResponseBody
	public Message accept(Long id, String memo, Cooperation.Status status) {
		if(Cooperation.Status.ACCEPTED == status) {
			cooperationService.accept(id, memo);
		} else if(Cooperation.Status.REJECTED == status) {
			cooperationService.reject(id, memo);
		}
		return SUCCESS_MESSAGE;
	}
}