package com.dearcom.customer.entity;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;

@Entity
@Table(name="com_StatShow")
@ClassConfig(title="内容展示记录", isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class StatShow extends BaseEntity{
	
	@FieldConfig(title="终端MAC")
    private String termMac;
    
	@FieldConfig(title="AP设备MAC")
    private String apMac;
	
	@FieldConfig(title="AP设备MAC")
	private String shopUuid;
    
	@FieldConfig(title="终端IP")
    private String termIp;
    
	@FieldConfig(title="USER-AGENT")
    private String userAgent;
    
	
	/**
	 * 访问来源 1:Android Portal 2:iOS Portal 3: Windows Portal 4: Andriod APP 5: iOS APP 6:Windows APP
	 */
	@FieldConfig(title="访问来源",enumType="com_statShow_accessType")
    private Byte accessType;
    
	@FieldConfig(title="时间")
	@Temporal(TemporalType.TIMESTAMP)
    private Date statTime;
    
	/**
	 * 资源ID 1:未登录页面  2登陆页面
	 */
	@FieldConfig(title="资源ID",enumType="com_statShow_resourceId")
    private Integer resourceId;

	public String getTermMac() {
		return termMac;
	}

	public void setTermMac(String termMac) {
		this.termMac = termMac;
	}

	public String getApMac() {
		return apMac;
	}

	public void setApMac(String apMac) {
		this.apMac = apMac;
	}

	public String getTermIp() {
		return termIp;
	}

	public void setTermIp(String termIp) {
		this.termIp = termIp;
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

	public Date getStatTime() {
		return statTime;
	}

	public void setStatTime(Date statTime) {
		this.statTime = statTime;
	}

	public Integer getResourceId() {
		return resourceId;
	}

	public void setResourceId(Integer resourceId) {
		this.resourceId = resourceId;
	}

	public String getShopUuid() {
		return shopUuid;
	}

	public void setShopUuid(String shopUuid) {
		this.shopUuid = shopUuid;
	}
    
}
