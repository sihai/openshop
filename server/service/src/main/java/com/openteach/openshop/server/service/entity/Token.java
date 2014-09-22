package com.openteach.openshop.server.service.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "xx_token")
@SequenceGenerator(name = "sequenceGenerator", sequenceName = "xx_tag_sequence")
public class Token extends BaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4201402342771685157L;

	public static enum Type {
		
		/**
		 * 
		 */
		RESET_PASSWORD;
	}
	
	private String content;
	
	private Type type;
	
	private String context;
	
	/**
	 * 
	 */
	private boolean isUsed;

	@NotEmpty
	@Length(max = 64)
	@Column(nullable = false)
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Type getType() {
		return type;
	}

	@NotEmpty
	@Length(max = 16)
	@Column(nullable = false)
	public void setType(Type type) {
		this.type = type;
	}
	
	public String getContext() {
		return context;
	}

	@NotEmpty
	@Length(max = 512)
	@Column(nullable = true)
	public void setContext(String context) {
		this.context = context;
	}
	
	@Column(nullable = false)
	public boolean isUsed() {
		return isUsed;
	}

	public void setUsed(boolean isUsed) {
		this.isUsed = isUsed;
	}
}
