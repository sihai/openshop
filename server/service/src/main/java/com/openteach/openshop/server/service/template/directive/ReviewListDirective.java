/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.service.template.directive;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.openteach.openshop.server.service.Filter;
import com.openteach.openshop.server.service.Order;
import com.openteach.openshop.server.service.entity.Member;
import com.openteach.openshop.server.service.entity.Product;
import com.openteach.openshop.server.service.entity.Review;
import com.openteach.openshop.server.service.entity.Review.Type;
import com.openteach.openshop.server.service.service.MemberService;
import com.openteach.openshop.server.service.service.ProductService;
import com.openteach.openshop.server.service.service.ReviewService;
import com.openteach.openshop.server.service.util.FreemarkerUtils;

import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

/**
 * 模板指令 - 评论
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Component("reviewListDirective")
public class ReviewListDirective extends BaseDirective {

	/** "会员ID"参数名称 */
	private static final String MEMBER_ID_PARAMETER_NAME = "memberId";

	/** "商品ID"参数名称 */
	private static final String PRODUCT_ID_PARAMETER_NAME = "productId";

	/** "类型"参数名称 */
	private static final String TYPE_PARAMETER_NAME = "type";

	/** 变量名称 */
	private static final String VARIABLE_NAME = "reviews";

	@Resource(name = "reviewServiceImpl")
	private ReviewService reviewService;
	@Resource(name = "memberServiceImpl")
	private MemberService memberService;
	@Resource(name = "productServiceImpl")
	private ProductService productService;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
		Long memberId = FreemarkerUtils.getParameter(MEMBER_ID_PARAMETER_NAME, Long.class, params);
		Long productId = FreemarkerUtils.getParameter(PRODUCT_ID_PARAMETER_NAME, Long.class, params);
		Type type = FreemarkerUtils.getParameter(TYPE_PARAMETER_NAME, Type.class, params);

		Member member = memberService.find(memberId);
		Product product = productService.find(productId);

		List<Review> reviews;
		if ((memberId != null && member == null) || (productId != null && product == null)) {
			reviews = new ArrayList<Review>();
		} else {
			boolean useCache = useCache(env, params);
			String cacheRegion = getCacheRegion(env, params);
			Integer count = getCount(params);
			List<Filter> filters = getFilters(params, Review.class);
			List<Order> orders = getOrders(params);
			if (useCache) {
				reviews = reviewService.findList(member, product, type, true, count, filters, orders, cacheRegion);
			} else {
				reviews = reviewService.findList(member, product, type, true, count, filters, orders);
			}
		}
		setLocalVariable(VARIABLE_NAME, reviews, env, body);
	}

}