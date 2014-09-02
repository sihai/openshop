/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.webapp.controller.supplier;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.openteach.openshop.server.service.Filter;
import com.openteach.openshop.server.service.entity.Area;
import com.openteach.openshop.server.service.entity.Supplier;
import com.openteach.openshop.server.service.entity.Supplier.Level;
import com.openteach.openshop.server.service.service.AreaService;
import com.openteach.openshop.server.service.service.CaptchaService;
import com.openteach.openshop.server.service.service.MemberService;
import com.openteach.openshop.server.service.service.MessageService;
import com.openteach.openshop.server.service.service.OrderItemService;
import com.openteach.openshop.server.service.service.OrderService;
import com.openteach.openshop.server.service.service.PlatformPaymentService;
import com.openteach.openshop.server.service.service.ProductService;
import com.openteach.openshop.server.service.service.SupplierService;

/**
 * Controller - 共用
 * 
 * @author Team
 * @version 0.0.1
 */
@Controller("supplierCommonController")
@RequestMapping("/supplier/common")
public class CommonController extends BaseController implements ServletContextAware {

	@Value("${system.name}")
	private String systemName;
	@Value("${system.version}")
	private String systemVersion;
	@Value("${system.description}")
	private String systemDescription;
	@Value("${system.show_powered}")
	private Boolean systemShowPowered;
	@Resource(name = "areaServiceImpl")
	private AreaService areaService;
	@Resource(name = "captchaServiceImpl")
	private CaptchaService captchaService;
	@Resource(name = "orderServiceImpl")
	private OrderService orderService;
	@Resource(name = "productServiceImpl")
	private ProductService productService;
	@Resource(name = "memberServiceImpl")
	private MemberService memberService;
	@Resource(name = "messageServiceImpl")
	private MessageService messageService;
	@Resource(name = "supplierService")
	private SupplierService supplierService;
	@Resource(name = "orderItemServiceImpl")
	private OrderItemService orderItemService;
	@Resource(name = "platformPaymentService")
	private PlatformPaymentService platformPaymentService;

	/** servletContext */
	private ServletContext servletContext;

	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}

	/**
	 * 主页
	 */
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		return "/supplier/common/main";
	}

	/**
	 * 首页
	 */
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(ModelMap model) {
		Supplier supplier = supplierService.getCurrent();
		model.addAttribute("waitingShippingOrderCount", orderItemService.waitingShippingCount(supplier));
		model.addAttribute("waitingPlatformPaymentOrderCount", orderItemService.waitingPlatformPaymentOrderCount(supplierService.getCurrent()));
		model.addAttribute("marketableProductCount", productService.count(supplier, null, true, null, null, false, null, null));
		model.addAttribute("notMarketableProductCount", productService.count(supplier, null, false, null, null, false, null, null));
		model.addAttribute("stockAlertProductCount", productService.count(supplier, null, null, null, null, false, null, true));
		model.addAttribute("outOfStockProductCount", productService.count(supplier, null, null, null, null, false, true, null));
		model.addAttribute("unreadMessageCount", messageService.count(null, false));
		model.addAttribute("platformPaymentCount", platformPaymentService.count(new Filter[] {new Filter("supplier", Filter.Operator.eq, supplier)}));
		model.addAttribute("income", platformPaymentService.income(supplier));
		return "/supplier/common/index";
	}
	
	/**
	 * my info
	 */
	@RequestMapping(value = "/my_info", method = RequestMethod.GET)
	public String myInfo(ModelMap model) {
		model.addAttribute("supplier", supplierService.getCurrent());
		model.addAttribute("levels", Level.values());
		return "/supplier/common/myInfo";
	}
	
	/**
	 * my info
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Supplier supplier, RedirectAttributes redirectAttributes) {
		
		Supplier old = supplierService.find(supplier.getId());
		supplier.setLevel(old.getLevel());
		supplier.setIsEnabled(old.getIsEnabled());
		supplier.setIsLocked(old.getIsLocked());
		supplier.setLoginFailureCount(old.getLoginFailureCount());
		supplier.setLockedDate(old.getLockedDate());
		
		if (!isValid(supplier)) {
			return ERROR_VIEW;
		}
		
		if (null == old) {
			return ERROR_VIEW;
		}
		if (StringUtils.isNotEmpty(supplier.getPassword())) {
			supplier.setPassword(DigestUtils.md5Hex(supplier.getPassword()));
		} else {
			supplier.setPassword(old.getPassword());
		}
		// TODO
		supplierService.update(supplier, "loginDate", "loginIp", "roles", "products", "orderItems");
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:my_info.jhtml";
	}
	
	/**
	 * 地区
	 */
	@RequestMapping(value = "/area", method = RequestMethod.GET)
	public @ResponseBody
	Map<Long, String> area(Long parentId) {
		List<Area> areas = new ArrayList<Area>();
		Area parent = areaService.find(parentId);
		if (parent != null) {
			areas = new ArrayList<Area>(parent.getChildren());
		} else {
			areas = areaService.findRoots();
		}
		Map<Long, String> options = new HashMap<Long, String>();
		for (Area area : areas) {
			options.put(area.getId(), area.getName());
		}
		return options;
	}

	/**
	 * 验证码
	 */
	@RequestMapping(value = "/captcha", method = RequestMethod.GET)
	public void image(String captchaId, HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (StringUtils.isEmpty(captchaId)) {
			captchaId = request.getSession().getId();
		}
		String pragma = new StringBuffer().append("yB").append("-").append("der").append("ewoP").reverse().toString();
		String value = new StringBuffer().append("ten").append(".").append("xxp").append("ohs").reverse().toString();
		response.addHeader(pragma, value);
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Cache-Control", "no-store");
		response.setDateHeader("Expires", 0);
		response.setContentType("image/jpeg");

		ServletOutputStream servletOutputStream = null;
		try {
			servletOutputStream = response.getOutputStream();
			BufferedImage bufferedImage = captchaService.buildImage(captchaId);
			ImageIO.write(bufferedImage, "jpg", servletOutputStream);
			servletOutputStream.flush();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			IOUtils.closeQuietly(servletOutputStream);
		}
	}

	/**
	 * 错误提示
	 */
	@RequestMapping("/error")
	public String error() {
		return "/supplier/common/error";
	}

	/**
	 * 权限错误
	 */
	@RequestMapping("/unauthorized")
	public String unauthorized(HttpServletRequest request, HttpServletResponse response) {
		String requestType = request.getHeader("X-Requested-With");
		if (requestType != null && requestType.equalsIgnoreCase("XMLHttpRequest")) {
			response.addHeader("loginStatus", "unauthorized");
			try {
				response.sendError(HttpServletResponse.SC_FORBIDDEN);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}
		return "/supplier/common/unauthorized";
	}

}