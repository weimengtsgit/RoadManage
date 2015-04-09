package com.dearcom.mall.entity;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;

@Entity
@Table(name="com_DeviceShop")
@ClassConfig(title="设备商铺关系", isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class DeviceShop extends BaseEntity{
	
    @FieldConfig(title="设备", valueField="sn")
	@ManyToOne
	@JoinColumn(name="device_id")
    private ApDevice device;
    
    @FieldConfig(title="商铺", valueField="name")
	@ManyToOne
	@JoinColumn(name="shop_id")
    private Shop shop;

	public ApDevice getDevice() {
		return device;
	}

	public void setDevice(ApDevice device) {
		this.device = device;
	}

	public Shop getShop() {
		return shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	} 
}
