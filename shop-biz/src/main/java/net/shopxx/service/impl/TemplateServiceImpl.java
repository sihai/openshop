/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package net.shopxx.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import net.shopxx.CommonAttributes;
import net.shopxx.Template;
import net.shopxx.Template.Type;
import net.shopxx.service.TemplateService;

import org.apache.commons.io.FileUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.web.context.ServletContextAware;

/**
 * Service - 模板
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Service("templateServiceImpl")
public class TemplateServiceImpl implements TemplateService, ServletContextAware {

	private static final Log logger = LogFactory.getLog(TemplateServiceImpl.class);
	
	/** servletContext */
	private ServletContext servletContext;

	@Value("${template.loader_path}")
	private String[] templateLoaderPaths;

	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}

	@SuppressWarnings("unchecked")
	@Cacheable("template")
	public List<Template> getAll() {
		try {
			List<Template> templates = new ArrayList<Template>();
			List<Element> elements = getTemplateElements();
			for (Element element : elements) {
				Template template = getTemplate(element);
				templates.add(template);
			}
			return templates;
		} catch (Exception e) {
			logger.error("errror", e);
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Cacheable("template")
	public List<Template> getList(Type type) {
		if (type != null) {
			try {
				List<Template> templates = new ArrayList<Template>();
				List<Element> elements = getTemplateElements(type);
				for (Element element : elements) {
					Template template = getTemplate(element);
					templates.add(template);
				}
				return templates;
			} catch (Exception e) {
				logger.error("errror", e);
				return null;
			}
		} else {
			return getAll();
		}
	}

	@Cacheable("template")
	public Template get(String id) {
		try {
			Element element = getTemplateElement(id);
			Template template = getTemplate(element);
			return template;
		} catch (Exception e) {
			logger.error("errror", e);
			return null;
		}
	}

	public String read(String id) {
		Template template = get(id);
		return read(template);
	}

	public String read(Template template) {
		String templatePath = servletContext.getRealPath(templateLoaderPaths[0] + template.getTemplatePath());
		File templateFile = new File(templatePath);
		String templateContent = null;
		try {
			templateContent = FileUtils.readFileToString(templateFile, "UTF-8");
		} catch (IOException e) {
			logger.error("errror", e);
		}
		return templateContent;
	}

	public void write(String id, String content) {
		Template template = get(id);
		write(template, content);
	}

	public void write(Template template, String content) {
		String templatePath = servletContext.getRealPath(templateLoaderPaths[0] + template.getTemplatePath());
		File templateFile = new File(templatePath);
		try {
			FileUtils.writeStringToFile(templateFile, content, "UTF-8");
		} catch (IOException e) {
			logger.error("errror", e);
		}
	}

	/**
	 * 
	 * @param type
	 * @return
	 * @throws DocumentException
	 */
	private List<Element> getTemplateElements(Type type) throws DocumentException {
		Document document = new SAXReader().read(this.getClass().getResourceAsStream(CommonAttributes.SHOPXX_XML_PATH));
		return document.selectNodes("/shopxx/template[@type='" + type + "']");
	}
	
	/**
	 * 
	 * @return
	 * @throws DocumentException
	 */
	private List<Element> getTemplateElements() throws DocumentException {
		Document document = new SAXReader().read(this.getClass().getResourceAsStream(CommonAttributes.SHOPXX_XML_PATH));
		return document.selectNodes("/shopxx/template");
	}
	
	/**
	 * 
	 * @param selector
	 * @return
	 */
	private Element getTemplateElement(String id) throws DocumentException {
		Document document = new SAXReader().read(this.getClass().getResourceAsStream(CommonAttributes.SHOPXX_XML_PATH));
		return (Element) document.selectSingleNode("/shopxx/template[@id='" + id + "']");
	}
	
	/**
	 * 获取模板
	 * 
	 * @param element
	 *            元素
	 */
	private Template getTemplate(Element element) {
		String id = element.attributeValue("id");
		String type = element.attributeValue("type");
		String name = element.attributeValue("name");
		String templatePath = element.attributeValue("templatePath");
		String staticPath = element.attributeValue("staticPath");
		String description = element.attributeValue("description");

		Template template = new Template();
		template.setId(id);
		template.setType(Type.valueOf(type));
		template.setName(name);
		template.setTemplatePath(templatePath);
		template.setStaticPath(staticPath);
		template.setDescription(description);
		return template;
	}

}