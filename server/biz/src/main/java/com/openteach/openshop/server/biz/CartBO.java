package com.openteach.openshop.server.biz;

import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang.RandomStringUtils;
import org.springframework.stereotype.Component;

import com.openteach.openshop.server.service.Message;
import com.openteach.openshop.server.service.entity.Cart;
import com.openteach.openshop.server.service.entity.CartItem;
import com.openteach.openshop.server.service.entity.Member;
import com.openteach.openshop.server.service.entity.Product;
import com.openteach.openshop.server.service.service.CartItemService;
import com.openteach.openshop.server.service.service.CartService;
import com.openteach.openshop.server.service.service.MemberService;
import com.openteach.openshop.server.service.service.ProductService;
import com.openteach.openshop.server.service.util.WebUtils;

/**
 * 
 * @author sihai
 *
 */
@Component("cartBO")
public class CartBO extends BaseBO {

	@Resource(name = "memberServiceImpl")
	private MemberService memberService;
	@Resource(name = "productServiceImpl")
	private ProductService productService;
	@Resource(name = "cartServiceImpl")
	private CartService cartService;
	@Resource(name = "cartItemServiceImpl")
	private CartItemService cartItemService;
	
	/**
	 * 
	 * @param id
	 * @param quantity
	 * @param request
	 * @param response
	 * @return
	 */
	public Message add(Long id, Integer quantity, HttpServletRequest request, HttpServletResponse response) {
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
		return Message.success("shop.cart.addSuccess", cart.getQuantity(), currency(cart.getEffectivePrice(), true, false));
	}
}
