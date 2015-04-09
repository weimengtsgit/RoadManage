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
import com.dearcom.mall.entity.MallPromotion;

@Entity
@Table(name = "com_show_mall_prom")
@ClassConfig(title = "商场活动浏览的详细日志", isShowMenu = true)
@JsonIgnoreProperties(value = { "hibernateLazyInitializer", "handler", "list" })
public class ShowMallProm extends BaseEntity {
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

	@FieldConfig(title = "活动", valueField = "intro")
	@ManyToOne
	@JoinColumn(name = "mall_prom_id")
	private MallPromotion promotion;

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

	public MallPromotion getPromotion() {
		return promotion;
	}

	public void setPromotion(MallPromotion promotion) {
		this.promotion = promotion;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}
}
