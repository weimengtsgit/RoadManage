package com.dearcom.customer.entity;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonIgnoreType;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;

@Entity
@Table(name="com_Terminal")
@ClassConfig(title="终端信息", isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class Terminal extends BaseEntity{
	
	@FieldConfig(title="终端MAC")
    private String mac;
    
	/**
	 * 1：Andriod设备 2：iOS设备 3：Windows设备
	 */
	@FieldConfig(title="终端类型" ,enumType="com_terminal_type")
    private Byte type;
    
	@FieldConfig(title="终端描述")
    private String memo;
    
    @FieldConfig(title="关联顾客", valueField="mobile")
	@ManyToOne
	@JoinColumn(name="customer_id")
    private Customer customer;
    
	@FieldConfig(title="最近使用时间")
	@Temporal(TemporalType.TIMESTAMP)
    private Date lastAccessTime;
    
	@FieldConfig(title="最近断开时间")
	@Temporal(TemporalType.TIMESTAMP)
    private Date lastExitTime;
    
	@FieldConfig(title="访问次数")
    private Integer accessPortalTimes;
    
	@FieldConfig(title="注册AP设备MAC")
    private String apMac;
    
	@FieldConfig(title="创建时间")
	@Temporal(TemporalType.TIMESTAMP)
    private Date createTime;
    
	/**
	 *  0=离线，1=在线
	 */
	@FieldConfig(title="是否在线",enumType="com_terminal_online")
	private Byte online;
	/**
	 *  0:失败 1:正在注册 2:注册成功
	 */
	@FieldConfig(title="注册状态" ,enumType="com_terminal_status")
    private Byte status;
    
	/**
	 * 注册类型 1 手机号 2 微信 3 QQ
	 */
	@FieldConfig(title="注册类型",enumType="com_terminal_regType")
    private Byte regType;

	public String getMac() {
		return mac;
	}

	public void setMac(String mac) {
		this.mac = mac;
	}

	public Byte getType() {
		return type;
	}

	public void setType(Byte type) {
		this.type = type;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Date getLastAccessTime() {
		return lastAccessTime;
	}

	public void setLastAccessTime(Date lastAccessTime) {
		this.lastAccessTime = lastAccessTime;
	}

	public Date getLastExitTime() {
		return lastExitTime;
	}

	public void setLastExitTime(Date lastExitTime) {
		this.lastExitTime = lastExitTime;
	}

	public Integer getAccessPortalTimes() {
		return accessPortalTimes;
	}

	public void setAccessPortalTimes(Integer accessPortalTimes) {
		this.accessPortalTimes = accessPortalTimes;
	}

	public String getApMac() {
		return apMac;
	}

	public void setApMac(String apMac) {
		this.apMac = apMac;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Byte getStatus() {
		return status;
	}

	public void setStatus(Byte status) {
		this.status = status;
	}

	public Byte getRegType() {
		return regType;
	}

	public void setRegType(Byte regType) {
		this.regType = regType;
	}

	public Byte getOnline() {
		return online;
	}

	public void setOnline(Byte online) {
		this.online = online;
	}


}
