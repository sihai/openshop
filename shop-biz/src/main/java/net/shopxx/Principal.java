/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package net.shopxx;

import java.io.Serializable;

import net.shopxx.AuthenticationToken.TokenType;

/**
 * 身份信息
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
public class Principal implements Serializable {

	private static final long serialVersionUID = 5798882004228239559L;

	/**
	 * Token type
	 */
	private TokenType type;
	
	/** ID */
	private Long id;

	/** 用户名 */
	private String username;

	/**
	 * @param type
	 *            type
	 * @param id
	 *            ID
	 * @param username
	 *            用户名
	 */
	public Principal(TokenType type, Long id, String username) {
		this.type = type;
		this.id = id;
		this.username = username;
	}
	
	/**
	 * @param id
	 *            ID
	 * @param username
	 *            用户名
	 */
	public Principal(Long id, String username) {
		this(TokenType.ADMIN, id, username);
	}

	/**
	 * 获取类型
	 * @return
	 */
	public TokenType getType() {
		return type;
	}

	/**
	 * 设置类型
	 * @param type
	 */
	public void setType(TokenType type) {
		this.type = type;
	}

	/**
	 * 获取ID
	 * 
	 * @return ID
	 */
	public Long getId() {
		return id;
	}

	/**
	 * 设置ID
	 * 
	 * @param id
	 *            ID
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * 获取用户名
	 * 
	 * @return 用户名
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * 设置用户名
	 * 
	 * @param username
	 *            用户名
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	@Override
	public String toString() {
		return username;
	}

}