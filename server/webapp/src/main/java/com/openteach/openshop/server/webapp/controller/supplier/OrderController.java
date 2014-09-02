/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.webapp.controller.supplier;

import java.util.Iterator;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.openteach.openshop.server.service.Message;
import com.openteach.openshop.server.service.Pageable;
import com.openteach.openshop.server.service.entity.Area;
import com.openteach.openshop.server.service.entity.DeliveryCorp;
import com.openteach.openshop.server.service.entity.Order;
import com.openteach.openshop.server.service.entity.OrderItem;
import com.openteach.openshop.server.service.entity.Shipping;
import com.openteach.openshop.server.service.entity.ShippingItem;
import com.openteach.openshop.server.service.entity.ShippingMethod;
import com.openteach.openshop.server.service.entity.Sn;
import com.openteach.openshop.server.service.entity.Supplier;
import com.openteach.openshop.server.service.entity.Order.OrderStatus;
import com.openteach.openshop.server.service.entity.Order.PaymentStatus;
import com.openteach.openshop.server.service.entity.Order.ShippingStatus;
import com.openteach.openshop.server.service.entity.OrderItem.PlatformPaymentStatus;
import com.openteach.openshop.server.service.service.AreaService;
import com.openteach.openshop.server.service.service.DeliveryCorpService;
import com.openteach.openshop.server.service.service.OrderItemService;
import com.openteach.openshop.server.service.service.OrderService;
import com.openteach.openshop.server.service.service.PaymentMethodService;
import com.openteach.openshop.server.service.service.ProductService;
import com.openteach.openshop.server.service.service.ShippingMethodService;
import com.openteach.openshop.server.service.service.SnService;
import com.openteach.openshop.server.service.service.SupplierService;

/**
 * 订单管理
 * @author sihai
 *
 */
@Controller("supplierOrderController")
@RequestMapping("/supplier/order")
public class OrderController extends BaseController {

	@Resource(name = "areaServiceImpl")
	private AreaService areaService;
	@Resource(name = "productServiceImpl")
	private ProductService productService;
	@Resource(name = "orderServiceImpl")
	private OrderService orderService;
	@Resource(name = "orderItemServiceImpl")
	private OrderItemService orderItemService;
	@Resource(name = "shippingMethodServiceImpl")
	private ShippingMethodService shippingMethodService;
	@Resource(name = "deliveryCorpServiceImpl")
	private DeliveryCorpService deliveryCorpService;
	@Resource(name = "paymentMethodServiceImpl")
	private PaymentMethodService paymentMethodService;
	@Resource(name = "snServiceImpl")
	private SnService snService;
	@Resource(name = "supplierService")
	private SupplierService supplierService;
	
	/**
	 * 列表
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(PlatformPaymentStatus platformPaymentStatus, ShippingStatus itemShippingStatus, Pageable pageable, ModelMap model) {
		model.addAttribute("platformPaymentStatus", platformPaymentStatus);
		model.addAttribute("itemShippingStatus", itemShippingStatus);
		model.addAttribute("page", orderItemService.findOrderBySupplier(supplierService.getCurrent(), null, new PaymentStatus[] {PaymentStatus.paid}, null, false, null == platformPaymentStatus ? null : new PlatformPaymentStatus[] {platformPaymentStatus}, null == itemShippingStatus ? null : new ShippingStatus[] {itemShippingStatus}, pageable));
		return "/supplier/order/list";
	}
	
	/**
	 * 查看
	 */
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String view(Long id, ModelMap model) {
		model.addAttribute("supplier", supplierService.getCurrent());
		model.addAttribute("shippingMethods", shippingMethodService.findAll());
		model.addAttribute("deliveryCorps", deliveryCorpService.findAll());
		model.addAttribute("orderItem", orderItemService.find(id));
		return "/supplier/order/view";
	}
	
	/**
	 * 检查锁定
	 */
	@RequestMapping(value = "/check_lock", method = RequestMethod.POST)
	public @ResponseBody
	Message checkLock(Long id) {
		// XXX
		return SUCCESS_MESSAGE;
	}
	
	/**
	 * 发货
	 */
	@RequestMapping(value = "/shipping", method = RequestMethod.POST)
	public String shipping(Long orderItemId, Long shippingMethodId, Long deliveryCorpId, Long areaId, Shipping shipping, RedirectAttributes redirectAttributes) {
		OrderItem orderItem = orderItemService.find(orderItemId);
		Order order = orderItem.getOrder();
		if (null == orderItem) {
			return ERROR_VIEW;
		}
		for (Iterator<ShippingItem> iterator = shipping.getShippingItems().iterator(); iterator.hasNext();) {
			ShippingItem shippingItem = iterator.next();
			if (shippingItem == null || StringUtils.isEmpty(shippingItem.getSn()) || shippingItem.getQuantity() == null || shippingItem.getQuantity() <= 0) {
				iterator.remove();
				continue;
			}
			if (shippingItem.getQuantity() > orderItem.getQuantity() - orderItem.getShippedQuantity()) {
				return ERROR_VIEW;
			}
			if (orderItem.getProduct() != null && orderItem.getProduct().getStock() != null && shippingItem.getQuantity() > orderItem.getProduct().getStock()) {
				return ERROR_VIEW;
			}
			shippingItem.setName(orderItem.getFullName());
			shippingItem.setShipping(shipping);
		}
		shipping.setOrder(order);
		ShippingMethod shippingMethod = shippingMethodService.find(shippingMethodId);
		shipping.setShippingMethod(shippingMethod != null ? shippingMethod.getName() : null);
		DeliveryCorp deliveryCorp = deliveryCorpService.find(deliveryCorpId);
		shipping.setDeliveryCorp(deliveryCorp != null ? deliveryCorp.getName() : null);
		shipping.setDeliveryCorpUrl(deliveryCorp != null ? deliveryCorp.getUrl() : null);
		shipping.setDeliveryCorpCode(deliveryCorp != null ? deliveryCorp.getCode() : null);
		Area area = areaService.find(areaId);
		shipping.setArea(area != null ? area.getFullName() : null);
		if (!isValid(shipping)) {
			return ERROR_VIEW;
		}
		if (order.isExpired() || order.getOrderStatus() != OrderStatus.confirmed) {
			return ERROR_VIEW;
		}
		if (order.getShippingStatus() != ShippingStatus.unshipped && order.getShippingStatus() != ShippingStatus.partialShipment) {
			return ERROR_VIEW;
		}
		Supplier supplier = supplierService.getCurrent();
		/*if (order.isLocked(admin)) {
			return ERROR_VIEW;
		}*/
		shipping.setSn(snService.generate(Sn.Type.shipping));
		shipping.setOperator(supplier.getName());
		shipping.setSupplier(supplier);
		orderService.shipping(order, shipping, null);
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:view.jhtml?id=" + orderItemId;
	}
}
