package com.dearcom.customer.entity;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.base4j.orm.hibernate.BaseEntity;
import org.springframework.format.annotation.DateTimeFormat;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;
import org.ever4j.system.entity.SysUser;

import com.dearcom.mall.entity.Mall;
import com.dearcom.mall.entity.Shop;

import javax.persistence.Table;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="com_sms_log")
@ClassConfig(title="短信发送记录", isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class MsgLog extends BaseEntity{
	
	/**
	 * 发信人 1:portal系统 2:管理端系统 3:商场 4:商铺
	 */
	@FieldConfig(title="发送者" ,enumType="customer_Message_sender")
	private Byte sender;
	/**
	 *  消息业务类型： 0:其他消息 1:注册消息  2.排号提醒
	 */
	@FieldConfig(title="消息业务类型" ,enumType="customer_Message_type")
	private Byte type;
	private Integer shopId;
	
	
	private Integer mallId;
    
    @FieldConfig(title="客户", valueField="mobile")
 	@ManyToOne
 	@JoinColumn(name="customer_id")
     private Customer customer;
    
    @FieldConfig(title="操作用户", valueField="username")
    @ManyToOne
    @JoinColumn(name="user_id")
    private SysUser user;
    
    @FieldConfig(title="手机号")
    private String mobile;
    
	@FieldConfig(title="短信内容",maxlength=200)
	@Column(name="content")
    private String msgContent;
    
	@FieldConfig(title="发送时间")
	@Temporal(TemporalType.TIMESTAMP)
    private Date sendTime;
	/**
	 * 1：成功 2：失败
	 */
	@FieldConfig(title="发送状态" ,enumType="successful")
	private Byte status;
	
	@FieldConfig(title="发送结果代码",maxlength=200)
	private String result;
	
	

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getMsgContent() {
		return msgContent;
	}

	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}



	public Byte getStatus() {
		return status;
	}

	public void setStatus(Byte status) {
		this.status = status;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Date getSendTime() {
		return sendTime;
	}

	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}

	public SysUser getUser() {
		return user;
	}

	public void setUser(SysUser user) {
		this.user = user;
	}

	public Byte getSender() {
		return sender;
	}

	public void setSender(Byte sender) {
		this.sender = sender;
	}

	public Byte getType() {
		return type;
	}

	public void setType(Byte type) {
		this.type = type;
	}

	public Integer getShopId() {
		return shopId;
	}

	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}

	public Integer getMallId() {
		return mallId;
	}

	public void setMallId(Integer mallId) {
		this.mallId = mallId;
	}
    
}
