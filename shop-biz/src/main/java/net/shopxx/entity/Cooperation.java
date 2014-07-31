package net.shopxx.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

/**
 * <b>合作</b>
 * @author sihai
 *
 */
@Entity
@Table(name = "xx_cooperation")
@SequenceGenerator(name = "sequenceGenerator", sequenceName = "xx_cooperation_sequence")
public class Cooperation extends BaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5235201239206328394L;

	/**
	 * 
	 */
	public static enum Status {
		UNREADED,
		READED,
		ACCEPTED,
		REJECTED;
	}
	
	/**
	 * 姓名
	 */
	private String name;
	
	/**
	 * 电话
	 */
	private String phone;
	
	/**
	 * 邮箱
	 */
	private String email;
	
	/**
	 * 留言
	 */
	private String msg;
	
	/**
	 * 状态
	 */
	private Status status;
	
	/**
	 * 注释
	 */
	private String memo;

	@NotEmpty
	@Length(max = 32)
	@Column(nullable = false, updatable = false)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@NotEmpty
	@Length(max = 32)
	@Column(nullable = false, updatable = false)
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@NotEmpty
	@Length(max = 64)
	@Column(nullable = false, updatable = false)
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@NotEmpty
	@Length(max = 512)
	@Column(nullable = false, updatable = false)
	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	@NotEmpty
	@Column(nullable = false, updatable = true)
	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}
	
	@Length(max = 512)
	@Column(nullable = true, updatable = true)
	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}
}
