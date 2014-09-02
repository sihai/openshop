package com.openteach.openshop.server.biz.api;

import java.math.BigDecimal;
import java.util.List;

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
}
