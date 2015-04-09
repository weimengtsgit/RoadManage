package com.dearcom.stat.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;

import com.dearcom.mall.entity.Mall;
import com.dearcom.mall.entity.Shop;

@Entity
@Table(name = "com_stat_shop")
@ClassConfig(title = "商铺的日统计信息", isShowMenu = true)
@JsonIgnoreProperties(value = { "hibernateLazyInitializer", "handler", "list" })
public class StatShop extends BaseEntity {

	@FieldConfig(title = "商场", valueField = "name")
	@ManyToOne
	@JoinColumn(name = "mall_id")
	private Mall mall;

	@FieldConfig(title = "商户", valueField = "name")
	@ManyToOne
	@JoinColumn(name = "shop_id")
	private Shop shop;

	@FieldConfig(title = "客流量")
	private Integer pv;

	@FieldConfig(title = "日期")
	private Date date;

	public Mall getMall() {
		return mall;
	}

	public void setMall(Mall mall) {
		this.mall = mall;
	}

	public Shop getShop() {
		return shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	public Integer getPv() {
		return pv;
	}

	public void setPv(Integer pv) {
		this.pv = pv;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
}
