package com.openteach.openshop.server.biz;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;

import com.openteach.openshop.server.service.Page;
import com.openteach.openshop.server.service.Pageable;
import com.openteach.openshop.server.service.ResourceNotFoundException;
import com.openteach.openshop.server.service.entity.Attribute;
import com.openteach.openshop.server.service.entity.Brand;
import com.openteach.openshop.server.service.entity.Product;
import com.openteach.openshop.server.service.entity.Product.OrderType;
import com.openteach.openshop.server.service.entity.ProductCategory;
import com.openteach.openshop.server.service.entity.Promotion;
import com.openteach.openshop.server.service.entity.Tag;
import com.openteach.openshop.server.service.service.BrandService;
import com.openteach.openshop.server.service.service.ProductCategoryService;
import com.openteach.openshop.server.service.service.ProductService;
import com.openteach.openshop.server.service.service.PromotionService;
import com.openteach.openshop.server.service.service.SearchService;
import com.openteach.openshop.server.service.service.TagService;

/**
 * 
 * @author sihai
 *
 */
@Component("productBO")
public class ProductBO extends BaseBO {

	@Resource(name = "productServiceImpl")
	private ProductService productService;
	@Resource(name = "productCategoryServiceImpl")
	private ProductCategoryService productCategoryService;
	@Resource(name = "brandServiceImpl")
	private BrandService brandService;
	@Resource(name = "promotionServiceImpl")
	private PromotionService promotionService;
	@Resource(name = "tagServiceImpl")
	private TagService tagService;
	@Resource(name = "searchServiceImpl")
	private SearchService searchService;
	
	/**
	 * 
	 * @param productCategoryId
	 * @param brandId
	 * @param promotionId
	 * @param tagIds
	 * @param startPrice
	 * @param endPrice
	 * @param orderType
	 * @param pageNumber
	 * @param pageSize
	 * @param request
	 * @return
	 */
	public Page<Product> list(Long productCategoryId, Long brandId, Long promotionId, Long[] tagIds, BigDecimal startPrice, BigDecimal endPrice, OrderType orderType, Integer pageNumber, Integer pageSize, HttpServletRequest request, ModelMap model) {
		ProductCategory productCategory = productCategoryService.find(productCategoryId);
		if (productCategory == null) {
			throw new ResourceNotFoundException();
		}
		Brand brand = brandService.find(brandId);
		Promotion promotion = promotionService.find(promotionId);
		List<Tag> tags = tagService.findList(tagIds);
		Map<Attribute, String> attributeValue = new HashMap<Attribute, String>();
		if (productCategory != null) {
			Set<Attribute> attributes = productCategory.getAttributes();
			for (Attribute attribute : attributes) {
				String value = request.getParameter("attribute_" + attribute.getId());
				if (StringUtils.isNotEmpty(value) && attribute.getOptions().contains(value)) {
					attributeValue.put(attribute, value);
				}
			}
		}
		
		Pageable pageable = new Pageable(pageNumber, pageSize);
		Page<Product> page = productService.findPage(productCategory, brand, promotion, tags, attributeValue, startPrice, endPrice, true, true, null, false, null, null, orderType, pageable);
		
		if(null != model) {
			model.addAttribute("orderTypes", OrderType.values());
			model.addAttribute("productCategory", productCategory);
			model.addAttribute("brand", brand);
			model.addAttribute("promotion", promotion);
			model.addAttribute("tags", tags);
			model.addAttribute("attributeValue", attributeValue);
			model.addAttribute("startPrice", startPrice);
			model.addAttribute("endPrice", endPrice);
			model.addAttribute("orderType", orderType);
			model.addAttribute("pageNumber", pageNumber);
			model.addAttribute("pageSize", pageSize);
			model.addAttribute("page", page);
		}
		return page;
	}
	
	/**
	 * 
	 * @param keyword
	 * @param catIds
	 * @param startPrice
	 * @param endPrice
	 * @param orderType
	 * @param pageable
	 * @return
	 */
	public Page<Product> search(String keyword, Long[] catIds, BigDecimal startPrice, BigDecimal endPrice, OrderType orderType, Pageable pageable) {
		return searchService.search(keyword, catIds, startPrice, endPrice, orderType, pageable);
	}
	
	/**
	 * 
	 * @param id
	 * @return
	 */
	public Product get(Long id) {
		return productService.find(id);
	}
}
