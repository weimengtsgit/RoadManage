package com.dearcom.stat.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;

import com.dearcom.customer.entity.Customer;
import com.dearcom.customer.entity.Terminal;
import com.dearcom.mall.entity.Mall;

@Entity
@Table(name = "com_show_mall")
@ClassConfig(title = "商场客流的详细日志", isShowMenu = true)
@JsonIgnoreProperties(value = { "hibernateLazyInitializer", "handler", "list" })
public class ShowMall extends BaseEntity {
	@FieldConfig(title = "终端", valueField = "memo")
	@ManyToOne
	@JoinColumn(name = "term_id")
	private Terminal terminal;

	@FieldConfig(title = "会员", valueField = "mobile")
	@ManyToOne
	@JoinColumn(name = "customer_id")
	private Customer customer;

	@FieldConfig(title = "商场", valueField = "name")
	@ManyToOne
	@JoinColumn(name = "mall_id")
	private Mall mall;

	@FieldConfig(title = "USER-AGENT")
	private String userAgent;

	/**
	 * 访问来源 1:Android Portal 2:iOS Portal 3: Windows Portal 4: Andriod APP 5:
	 * iOS APP 6:Windows APP
	 */
	@FieldConfig(title = "访问来源", enumType = "com_statShow_accessType")
	private Byte accessType;

	@FieldConfig(title = "时间")
	@Temporal(TemporalType.TIMESTAMP)
	private Date time;

	public Terminal getTerminal() {
		return terminal;
	}

	public void setTerminal(Terminal terminal) {
		this.terminal = terminal;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Mall getMall() {
		return mall;
	}

	public void setMall(Mall mall) {
		this.mall = mall;
	}

	public String getUserAgent() {
		return userAgent;
	}

	public void setUserAgent(String userAgent) {
		this.userAgent = userAgent;
	}

	public Byte getAccessType() {
		return accessType;
	}

	public void setAccessType(Byte accessType) {
		this.accessType = accessType;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}
}
