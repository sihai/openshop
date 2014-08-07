/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.biz;

import java.io.Serializable;

/**
 * 日志配置
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
public class LogConfig implements Serializable {

	private static final long serialVersionUID = -1108848647938408402L;

	/** 操作名称 */
	private String operation;

	/** 请求URL */
	private String urlPattern;

	/**
	 * 获取操作名称
	 * 
	 * @return 操作名称
	 */
	public String getOperation() {
		return operation;
	}

	/**
	 * 设置操作名称
	 * 
	 * @param operation
	 *            操作名称
	 */
	public void setOperation(String operation) {
		this.operation = operation;
	}

	/**
	 * 获取请求URL
	 * 
	 * @return 请求URL
	 */
	public String getUrlPattern() {
		return urlPattern;
	}

	/**
	 * 设置请求URL
	 * 
	 * @param urlPattern
	 *            请求URL
	 */
	public void setUrlPattern(String urlPattern) {
		this.urlPattern = urlPattern;
	}

}