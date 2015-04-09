package com.dearcom.customer.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;
import org.ever4j.system.entity.SysUser;

import com.dearcom.mall.entity.Mall;
import com.dearcom.mall.entity.Shop;

@Entity
@Table(name="com_message")
@ClassConfig(title="站内信", isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class Message extends BaseEntity{
	
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
		
		@FieldConfig(title="操作用户", valueField="username")
		@ManyToOne
		@JoinColumn(name="user_id")
		private SysUser user;

	 	
	    
	    @FieldConfig(title="客户", valueField="mobile")
	 	@ManyToOne
	 	@JoinColumn(name="customer_id")
	    private Customer customer;
	   
	    
		@FieldConfig(title="标题",maxlength=200)
		@Column(name="title")
	    private String title;
		
		@FieldConfig(title="内容",maxlength=1000)
		@Column(name="content")
		private String msgContent;
	    
		@FieldConfig(title="发送时间")
		@Temporal(TemporalType.TIMESTAMP)
	    private Date sendTime;
		
		@FieldConfig(title="阅读时间")
		@Temporal(TemporalType.TIMESTAMP)
		private Date readTime;
		
		/**
		 * 0：未读  2：已读
		 */
		@FieldConfig(title="是否已读" ,enumType="customer_Message_isRead")
		private Byte isRead;

		public Byte getSender() {
			return sender;
		}

		public void setSender(Byte sender) {
			this.sender = sender;
		}

		public SysUser getUser() {
			return user;
		}

		public void setUser(SysUser user) {
			this.user = user;
		}

		

		public Customer getCustomer() {
			return customer;
		}

		public void setCustomer(Customer customer) {
			this.customer = customer;
		}

		public String getTitle() {
			return title;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public String getMsgContent() {
			return msgContent;
		}

		public void setMsgContent(String msgContent) {
			this.msgContent = msgContent;
		}

		public Date getSendTime() {
			return sendTime;
		}

		public void setSendTime(Date sendTime) {
			this.sendTime = sendTime;
		}

		public Date getReadTime() {
			return readTime;
		}

		public void setReadTime(Date readTime) {
			this.readTime = readTime;
		}

		public Byte getIsRead() {
			return isRead;
		}

		public void setIsRead(Byte isRead) {
			this.isRead = isRead;
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
