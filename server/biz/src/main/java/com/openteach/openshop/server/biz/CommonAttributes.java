/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.biz;

/**
 * 公共参数
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
public final class CommonAttributes {

	/** 日期格式配比 */
	public static final String[] DATE_PATTERNS = new String[] { "yyyy", "yyyy-MM", "yyyyMM", "yyyy/MM", "yyyy-MM-dd", "yyyyMMdd", "yyyy/MM/dd", "yyyy-MM-dd HH:mm:ss", "yyyyMMddHHmmss", "yyyy/MM/dd HH:mm:ss" };

	/** openshop.xml文件路径 */
	public static final String OPENSHOP_XML_PATH = "/openshop.xml";

	/** openshop.properties文件路径 */
	public static final String OPENSHOP_PROPERTIES_PATH = "/openshop.properties";

	/**
	 * 不可实例化
	 */
	private CommonAttributes() {
	}

}