/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.service.service;

import java.util.List;

import com.openteach.openshop.server.service.Template;
import com.openteach.openshop.server.service.Template.Type;

/**
 * Service - 模板
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
public interface TemplateService {

	/**
	 * 获取所有模板
	 * 
	 * @return 所有模板
	 */
	List<Template> getAll();

	/**
	 * 获取模板
	 * 
	 * @param type
	 *            类型
	 * @return 模板
	 */
	List<Template> getList(Type type);

	/**
	 * 获取模板
	 * 
	 * @param id
	 *            ID
	 * @return 模板
	 */
	Template get(String id);

	/**
	 * 读取模板文件内容
	 * 
	 * @param id
	 *            ID
	 * @return 模板文件内容
	 */
	String read(String id);

	/**
	 * 读取模板文件内容
	 * 
	 * @param template
	 *            模板
	 * @return 模板文件内容
	 */
	String read(Template template);

	/**
	 * 写入模板文件内容
	 * 
	 * @param id
	 *            Id
	 * @param content
	 *            模板文件内容
	 */
	void write(String id, String content);

	/**
	 * 写入模板文件内容
	 * 
	 * @param template
	 *            模板
	 * @param content
	 *            模板文件内容
	 */
	void write(Template template, String content);

}