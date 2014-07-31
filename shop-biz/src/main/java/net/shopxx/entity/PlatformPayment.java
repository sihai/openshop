package net.shopxx.entity;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * 
 * @author sihai
 *
 */

@Entity
@Table(name = "xx_platform_payment")
@SequenceGenerator(name = "sequenceGenerator", sequenceName = "xx_platform_payment_sequence")
public class PlatformPayment extends BaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5401688821313440499L;
	
	/**
	 * 支付编号
	 */
	private String sn;

	/**
	 * 金额
	 */
	private BigDecimal money;
	
	/**
	 * 金额
	 */
	private BigDecimal rebate;
	
	/**
	 * 备注
	 */
	private String memo;
	
	/**
	 * 操作者
	 */
	private Admin operator;
	
	/**
	 * 收款人
	 */
	private String payee;
	
	/**
	 * 收款人帐号
	 */
	private String account;
	
	/**
	 * 收款供应商
	 */
	private Supplier supplier;

	@Column(nullable = false, updatable = false, unique = true, length = 100)
	public String getSn() {
		return sn;
	}

	public void setSn(String sn) {
		this.sn = sn;
	}

	@JsonProperty
	@NotNull
	@Min(0)
	@Digits(integer = 12, fraction = 3)
	@Column(nullable = false, precision = 21, scale = 6)
	public BigDecimal getMoney() {
		return money;
	}
	
	public void setMoney(BigDecimal money) {
		this.money = money;
	}
	
	@JsonProperty
	@NotNull
	@Min(0)
	@Digits(integer = 12, fraction = 3)
	@Column(nullable = false, precision = 21, scale = 6)
	public BigDecimal getRebate() {
		return rebate;
	}

	public void setRebate(BigDecimal rebate) {
		this.rebate = rebate;
	}
	
	@Column(nullable = true, updatable = false, unique = true, length = 255)
	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	public Admin getOperator() {
		return operator;
	}

	public void setOperator(Admin operator) {
		this.operator = operator;
	}

	@Column(nullable = true, updatable = false, unique = true, length = 100)
	public String getPayee() {
		return payee;
	}

	public void setPayee(String payee) {
		this.payee = payee;
	}

	@Column(nullable = true, updatable = false, unique = true, length = 100)
	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	public Supplier getSupplier() {
		return supplier;
	}

	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}
}
