package com.openteach.openshop.server.biz.api;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;

import com.openteach.openshop.server.api.ExecutionContext;
import com.openteach.openshop.server.api.SysMappings;
import com.openteach.openshop.server.api.annotation.Api;
import com.openteach.openshop.server.api.annotation.Apis;
import com.openteach.openshop.server.api.annotation.Param;
import com.openteach.openshop.server.api.internal.parameter.ParameterType;
import com.openteach.openshop.server.biz.ProductBO;
import com.openteach.openshop.server.service.Page;
import com.openteach.openshop.server.service.Pageable;
import com.openteach.openshop.server.service.entity.Product;
import com.openteach.openshop.server.service.entity.Product.OrderType;

/**
 * 
 * @author sihai
 *
 */
@Component
@Apis
public class ProductApi {

	@Resource(name = "productBO")
	private ProductBO productBO;
	
	@Api(name = "com.openteach.openshop.server.product.list", version = "0.0.1")
	public Page<Product> list(
			@Param(type = ParameterType.BIZ, name = "cat_id", required = true) Long catId,
			@Param(type = ParameterType.BIZ, name = "brand_id", required = false) Long brandId,
			@Param(type = ParameterType.BIZ, name = "promotion_id", required = false) Long promotionId,
			@Param(type = ParameterType.BIZ, name = "tag_ids", required = false) Long[] tagIds,
			@Param(type = ParameterType.BIZ, name = "start_price", required = false) BigDecimal startPrice,
			@Param(type = ParameterType.BIZ, name = "end_price", required = false) BigDecimal endPrice,
			@Param(type = ParameterType.BIZ, name = "order_type", required = false) OrderType orderType,
			@Param(type = ParameterType.BIZ, name = "page_number", required = false) Integer pageNumber,
			@Param(type = ParameterType.BIZ, name = "page_size", required = false) Integer pageSize,
			@Param(type = ParameterType.SYS, name = SysMappings.HTTP_REQUEST, required = true) HttpServletRequest request, 
			@Param(type = ParameterType.SYS, name = SysMappings.HTTP_RESPONSE, required = true) HttpServletResponse response, 
			@Param(type = ParameterType.SYS, name = SysMappings.HTTP_SESSION, required = true) HttpSession session,
			@Param(type = ParameterType.SYS, name = SysMappings.EXECUTION_CONTEXT, required = true) ExecutionContext context) {
		return productBO.list(catId, brandId, promotionId, tagIds, startPrice, endPrice, orderType, pageNumber, pageSize, request, null);
	}
	
	@Api(name = "com.openteach.openshop.server.product.search", version = "0.0.1")
	public Page<Product> search(
			@Param(type = ParameterType.BIZ, name = "keyword", required = false) String keyword,
			@Param(type = ParameterType.BIZ, name = "cat_ids", required = false) Long[] catIds,
			@Param(type = ParameterType.BIZ, name = "start_price", required = false) BigDecimal startPrice,
			@Param(type = ParameterType.BIZ, name = "end_price", required = false) BigDecimal endPrice,
			@Param(type = ParameterType.BIZ, name = "order_type", required = false) OrderType orderType,
			@Param(type = ParameterType.BIZ, name = "page_number", required = false) Integer pageNumber,
			@Param(type = ParameterType.BIZ, name = "page_size", required = false) Integer pageSize,
			@Param(type = ParameterType.SYS, name = SysMappings.HTTP_REQUEST, required = true) HttpServletRequest request, 
			@Param(type = ParameterType.SYS, name = SysMappings.HTTP_RESPONSE, required = true) HttpServletResponse response, 
			@Param(type = ParameterType.SYS, name = SysMappings.HTTP_SESSION, required = true) HttpSession session,
			@Param(type = ParameterType.SYS, name = SysMappings.EXECUTION_CONTEXT, required = true) ExecutionContext context) {
		Pageable pageable = new Pageable(pageNumber, pageSize);
		return productBO.search(keyword, catIds, startPrice, endPrice, orderType, pageable);
	}
	
	@Api(name = "com.openteach.openshop.server.product.get", version = "0.0.1")
	public Map<String, Object> get(@Param(type = ParameterType.BIZ, name = "pid", required = true) Long pid) {
		Product p = productBO.get(pid);
		if(null == p) {
			return null;
		}
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("type", "Shoes");
		data.put("name", p.getName());
		data.put("family_id", "antai");
		data.put("fullName", p.getFullName());
		data.put("image", p.getImage());
		data.put("main_image_thumb", p.getThumbnail());
		data.put("price", p.getPrice());
		data.put("introduction", p.getIntroduction());
		data.put("size_num", "-");
		data.put("sizes_ids", "2466-2467-2468-2469-2470-2471-2472-2473-2474-2475-2476-2477-");
		data.put("sizes", "36-37-38-39-40-41-42-43-44-45-46-47-");
		data.put("sizes_quantities", "1-1-2-2-2-1-1-2-1-1-1-0-");
		
		// <li pos=0  class='active'>1</li><li pos=1  >2</li><li pos=2  >3</li><li pos=3  >4</li><li pos=4  >5</li><li pos=5  >6</li>
		int size = p.getProductImages().size();
		StringBuilder sb = new StringBuilder();
		StringBuilder sb2 = new StringBuilder();
		for(int i = 0; i < size; i++) {
			sb.append("<li pos=").append(i).append(0 == i ? " class='active'>" : ">").append(i+1).append("</li>");
			sb2.append("<li><div class='gallery-preloader'></div><img _height='1050' _width='1600' _src=").append(p.getProductImages().get(i).getLarge()).append(" /></li>");
		}
		data.put("gallery_indicator", sb.toString());
		data.put("gallery_images", sb2.toString());
		
		data.put("gallery_first_image", p.getProductImages().get(0).getLarge());
		
		data.put("recommend_reason", "我们的推荐，我们的推荐，我们的推荐，我们的推荐，我们的推荐，我们的推荐，我们的推荐，我们的推荐");
		data.put("recommend_items", sb2.toString());
	
		return data;
	}
}
