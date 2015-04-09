package com.dearcom.report.entity;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;

import com.dearcom.mall.entity.Shop;

@Entity
@Table(name="com_ReportDay")
@ClassConfig(title="日报表", isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class ReportDay extends BaseEntity{
	
	@FieldConfig(title="日期")
    private Date date;
    
	@FieldConfig(title="宣传页展示数(PV)")
    private int pv;
    
	@FieldConfig(title="无线网络客流量（UV）")
    private int uv;
    
	@FieldConfig(title="手机注册用户数")
    private int newUserCount;
    
    @FieldConfig(title="商铺", valueField="name")
	@ManyToOne
	@JoinColumn(name="shop_id")
    private Shop shopId;

	

	public int getPv() {
		return pv;
	}

	public void setPv(int pv) {
		this.pv = pv;
	}

	public int getUv() {
		return uv;
	}

	public void setUv(int uv) {
		this.uv = uv;
	}




	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getNewUserCount() {
		return newUserCount;
	}

	public void setNewUserCount(int newUserCount) {
		this.newUserCount = newUserCount;
	}

	public Shop getShopId() {
		return shopId;
	}

	public void setShopId(Shop shopId) {
		this.shopId = shopId;
	}
    
}
