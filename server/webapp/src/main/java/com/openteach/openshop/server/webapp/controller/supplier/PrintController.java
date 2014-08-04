/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.webapp.controller.supplier;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.openteach.openshop.server.biz.entity.DeliveryCenter;
import com.openteach.openshop.server.biz.entity.DeliveryTemplate;
import com.openteach.openshop.server.biz.entity.OrderItem;
import com.openteach.openshop.server.biz.service.DeliveryCenterService;
import com.openteach.openshop.server.biz.service.DeliveryTemplateService;
import com.openteach.openshop.server.biz.service.OrderItemService;
import com.openteach.openshop.server.biz.service.OrderService;

/**
 * Controller - 打印
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Controller("supplierPrintController")
@RequestMapping("/supplier/print")
public class PrintController extends BaseController {

	@Resource(name = "orderServiceImpl")
	private OrderService orderService;
	@Resource(name = "orderItemServiceImpl")
	private OrderItemService orderItemService;
	@Resource(name = "deliveryTemplateServiceImpl")
	private DeliveryTemplateService deliveryTemplateService;
	@Resource(name = "deliveryCenterServiceImpl")
	private DeliveryCenterService deliveryCenterService;

	/**
	 * 订单打印
	 */
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String order(Long id, ModelMap model) {
		model.addAttribute("orderItem", orderItemService.find(id));
		return "/supplier/print/order";
	}

	/**
	 * 购物单打印
	 */
	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public String product(Long id, ModelMap model) {
		model.addAttribute("orderItem", orderItemService.find(id));
		return "/supplier/print/product";
	}

	/**
	 * 配送单打印
	 */
	@RequestMapping(value = "/shipping", method = RequestMethod.GET)
	public String shipping(Long id, ModelMap model) {
		model.addAttribute("orderItem", orderItemService.find(id));
		return "/supplier/print/shipping";
	}

	/**
	 * 快递单打印
	 */
	@RequestMapping(value = "/delivery", method = RequestMethod.GET)
	public String delivery(Long orderId, Long deliveryTemplateId, Long deliveryCenterId, ModelMap model) {
		OrderItem orderItem = orderItemService.find(orderId);
		DeliveryTemplate deliveryTemplate = deliveryTemplateService.find(deliveryTemplateId);
		DeliveryCenter deliveryCenter = deliveryCenterService.find(deliveryCenterId);
		if (deliveryTemplate == null) {
			deliveryTemplate = deliveryTemplateService.findDefault();
		}
		if (deliveryCenter == null) {
			deliveryCenter = deliveryCenterService.findDefault();
		}
		model.addAttribute("deliveryTemplates", deliveryTemplateService.findAll());
		model.addAttribute("deliveryCenters", deliveryCenterService.findAll());
		model.addAttribute("orderItem", orderItem);
		model.addAttribute("order", orderItem.getOrder());
		model.addAttribute("deliveryTemplate", deliveryTemplate);
		model.addAttribute("deliveryCenter", deliveryCenter);
		return "/supplier/print/delivery";
	}

}