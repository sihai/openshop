/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.webapp.controller.shop;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang.RandomStringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.openteach.openshop.server.service.Message;
import com.openteach.openshop.server.service.entity.Cart;
import com.openteach.openshop.server.service.entity.CartItem;
import com.openteach.openshop.server.service.entity.Member;
import com.openteach.openshop.server.service.entity.Product;
import com.openteach.openshop.server.service.plugin.PaymentPlugin;
import com.openteach.openshop.server.service.service.CartItemService;
import com.openteach.openshop.server.service.service.CartService;
import com.openteach.openshop.server.service.service.MemberService;
import com.openteach.openshop.server.service.service.PaymentMethodService;
import com.openteach.openshop.server.service.service.PluginService;
import com.openteach.openshop.server.service.service.ProductService;
import com.openteach.openshop.server.service.service.ShippingMethodService;
import com.openteach.openshop.server.service.util.WebUtils;

/**
 * Controller - 购物车
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Controller("shopCartController")
@RequestMapping("/cart")
public class CartController extends BaseController {

	@Resource(name = "memberServiceImpl")
	private MemberService memberService;
	@Resource(name = "productServiceImpl")
	private ProductService productService;
	@Resource(name = "cartServiceImpl")
	private CartService cartService;
	@Resource(name = "cartItemServiceImpl")
	private CartItemService cartItemService;
	@Resource(name = "pluginServiceImpl")
	private PluginService pluginService;
	@Resource(name = "paymentMethodServiceImpl")
	private PaymentMethodService paymentMethodService;
	@Resource(name = "shippingMethodServiceImpl")
	private ShippingMethodService shippingMethodService;

	/**
	 * 添加
	 */
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public @ResponseBody
	Message add(Long id, Integer quantity, HttpServletRequest request, HttpServletResponse response) {
		if (quantity == null || quantity < 1) {
			return ERROR_MESSAGE;
		}
		Product product = productService.find(id);
		if (product == null) {
			return Message.warn("shop.cart.productNotExsit");
		}
		if (!product.getIsMarketable()) {
			return Message.warn("shop.cart.productNotMarketable");
		}
		if (product.getIsGift()) {
			return Message.warn("shop.cart.notForSale");
		}

		Cart cart = cartService.getCurrent();
		Member member = memberService.getCurrent();

		if (cart == null) {
			cart = new Cart();
			cart.setKey(UUID.randomUUID().toString()
					+ DigestUtils.md5Hex(RandomStringUtils.randomAlphabetic(30)));
			cart.setMember(member);
			cartService.save(cart);
		}

		if (Cart.MAX_PRODUCT_COUNT != null
				&& cart.getCartItems().size() >= Cart.MAX_PRODUCT_COUNT) {
			return Message.warn("shop.cart.addCountNotAllowed",
					Cart.MAX_PRODUCT_COUNT);
		}

		if (cart.contains(product)) {
			CartItem cartItem = cart.getCartItem(product);
			if (CartItem.MAX_QUANTITY != null
					&& cartItem.getQuantity() + quantity > CartItem.MAX_QUANTITY) {
				return Message.warn("shop.cart.maxCartItemQuantity",
						CartItem.MAX_QUANTITY);
			}
			if (product.getStock() != null
					&& cartItem.getQuantity() + quantity > product
							.getAvailableStock()) {
				return Message.warn("shop.cart.productLowStock");
			}
			cartItem.add(quantity);
			cartItemService.update(cartItem);
		} else {
			if (CartItem.MAX_QUANTITY != null
					&& quantity > CartItem.MAX_QUANTITY) {
				return Message.warn("shop.cart.maxCartItemQuantity",
						CartItem.MAX_QUANTITY);
			}
			if (product.getStock() != null
					&& quantity > product.getAvailableStock()) {
				return Message.warn("shop.cart.productLowStock");
			}
			CartItem cartItem = new CartItem();
			cartItem.setQuantity(quantity);
			cartItem.setProduct(product);
			cartItem.setCart(cart);
			cartItemService.save(cartItem);
			cart.getCartItems().add(cartItem);
		}

		if (member == null) {
			WebUtils.addCookie(request, response, Cart.ID_COOKIE_NAME, cart
					.getId().toString(), Cart.TIMEOUT);
			WebUtils.addCookie(request, response, Cart.KEY_COOKIE_NAME,
					cart.getKey(), Cart.TIMEOUT);
		}
		return Message.success("shop.cart.addSuccess", cart.getQuantity(),
				currency(cart.getEffectivePrice(), true, false));
	}

	/**
	 * 列表
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Long id, Integer quantity, ModelMap model) {
		Cart cart = cartService.getCurrent();
		model.addAttribute("cart", cart);
		if(null != cart) {
			model.addAttribute("cartToken", cart.getToken());
		}
		
		model.addAttribute("paymentMethods", paymentMethodService.findAll());
		model.addAttribute("shippingMethods", shippingMethodService.findAll());
		
		List<PaymentPlugin> paymentPlugins = pluginService.getPaymentPlugins(true);
		if (!paymentPlugins.isEmpty()) {
			PaymentPlugin defaultPaymentPlugin = paymentPlugins.get(0);
			model.addAttribute("defaultPaymentPlugin", defaultPaymentPlugin);
			model.addAttribute("paymentPlugins", paymentPlugins);
		}
		return "/shop/cart/cart";
	}
	
	@RequestMapping(value = "/get_quantity", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getQuantity() {
		Map<String, Object> data = new HashMap<String, Object>();
		Cart cart = cartService.getCurrent();
		data.put("quantity", null == cart ? 0 : cart.getQuantity());
		return data;
	}

	@RequestMapping(value = "/buy", method = RequestMethod.GET)
	public String buy(@RequestParam Long id,@RequestParam Integer quantity, ModelMap model) {
		if (quantity == null || quantity < 1) {
			return "redirect:/cart/list.jhtml";  
		}

		Product product = productService.find(id);
		if (product == null) {
			return "redirect:/cart/list.jhtml";  
		}
		if (!product.getIsMarketable()) {
			return "redirect:/cart/list.jhtml";  
		}
		if (product.getIsGift()) {
			return "redirect:/cart/list.jhtml";  
		}

		Member member = memberService.getCurrent();

		Cart cart = new Cart();
		cart.setKey(UUID.randomUUID().toString()
				+ DigestUtils.md5Hex(RandomStringUtils.randomAlphabetic(30)));
		cart.setMember(member);
		//cartService.save(cart);

		if (Cart.MAX_PRODUCT_COUNT != null
				&& cart.getCartItems().size() >= Cart.MAX_PRODUCT_COUNT) {
			return "redirect:/cart/list.jhtml";  
		}

		if (CartItem.MAX_QUANTITY != null && quantity > CartItem.MAX_QUANTITY) {
			return "redirect:/cart/list.jhtml";  
		}
		if (product.getStock() != null
				&& quantity > product.getAvailableStock()) {
			return "redirect:/cart/list.jhtml";  
		}
		CartItem cartItem = new CartItem();
		cartItem.setQuantity(quantity);
		cartItem.setProduct(product);
		cartItem.setCart(cart);
		//cartItemService.save(cartItem);
		cart.getCartItems().add(cartItem);

		model.addAttribute("cart", cart);
		return  "/shop/cart/list"; 
		//return new ModelAndView("redirect:/shop/cart/list",model);
	}

	/**
	 * 编辑
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public @ResponseBody
	Map<String, Object> edit(Long id, Integer quantity) {
		Map<String, Object> data = new HashMap<String, Object>();
		if (quantity == null || quantity < 1) {
			data.put("message", ERROR_MESSAGE);
			return data;
		}
		Cart cart = cartService.getCurrent();
		if (cart == null || cart.isEmpty()) {
			data.put("message", Message.error("shop.cart.notEmpty"));
			return data;
		}
		CartItem cartItem = cartItemService.find(id);
		Set<CartItem> cartItems = cart.getCartItems();
		if (cartItem == null || cartItems == null
				|| !cartItems.contains(cartItem)) {
			data.put("message", Message.error("shop.cart.cartItemNotExsit"));
			return data;
		}
		if (CartItem.MAX_QUANTITY != null && quantity > CartItem.MAX_QUANTITY) {
			data.put("message", Message.warn("shop.cart.maxCartItemQuantity",
					CartItem.MAX_QUANTITY));
			return data;
		}
		Product product = cartItem.getProduct();
		if (product.getStock() != null
				&& quantity > product.getAvailableStock()) {
			data.put("message", Message.warn("shop.cart.productLowStock"));
			return data;
		}
		cartItem.setQuantity(quantity);
		cartItemService.update(cartItem);

		data.put("message", SUCCESS_MESSAGE);
		data.put("subtotal", cartItem.getSubtotal());
		data.put("isLowStock", cartItem.getIsLowStock());
		data.put("quantity", cart.getQuantity());
		data.put("effectivePoint", cart.getEffectivePoint());
		data.put("effectivePrice", cart.getEffectivePrice());
		data.put("promotions", cart.getPromotions());
		data.put("giftItems", cart.getGiftItems());
		return data;
	}

	/**
	 * 删除
	 */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public @ResponseBody
	Map<String, Object> delete(Long id) {
		Map<String, Object> data = new HashMap<String, Object>();
		Cart cart = cartService.getCurrent();
		if (cart == null || cart.isEmpty()) {
			data.put("message", Message.error("shop.cart.notEmpty"));
			return data;
		}
		CartItem cartItem = cartItemService.find(id);
		Set<CartItem> cartItems = cart.getCartItems();
		if (cartItem == null || cartItems == null
				|| !cartItems.contains(cartItem)) {
			data.put("message", Message.error("shop.cart.cartItemNotExsit"));
			return data;
		}
		cartItems.remove(cartItem);
		cartItemService.delete(cartItem);

		data.put("message", SUCCESS_MESSAGE);
		data.put("quantity", cart.getQuantity());
		data.put("effectivePoint", cart.getEffectivePoint());
		data.put("effectivePrice", cart.getEffectivePrice());
		data.put("promotions", cart.getPromotions());
		data.put("isLowStock", cart.getIsLowStock());
		return data;
	}

	/**
	 * 清空
	 */
	@RequestMapping(value = "/clear", method = RequestMethod.POST)
	public @ResponseBody
	Message clear() {
		Cart cart = cartService.getCurrent();
		cartService.delete(cart);
		return SUCCESS_MESSAGE;
	}

}