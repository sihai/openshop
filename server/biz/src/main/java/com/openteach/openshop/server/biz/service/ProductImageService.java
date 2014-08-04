/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.biz.service;

import com.openteach.openshop.server.biz.entity.ProductImage;

/**
 * Service - 商品图片
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
public interface ProductImageService {

	/**
	 * 生成商品图片
	 * 
	 * @param productImage
	 *            商品图片
	 */
	void build(ProductImage productImage);

}