package com.dearcom.queue.entity;
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
import com.dearcom.mall.entity.Shop;

@Entity
@Table(name="com_QueueCard")
@ClassConfig(title="排号卡", isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class QueueCard extends BaseEntity{
	
    @FieldConfig(title="所属商铺", valueField="name")
	@ManyToOne
	@JoinColumn(name="shop_id")
    private Shop shop;
    
	@FieldConfig(title="卡号")
    private Integer cardNo;
    
	@FieldConfig(title="卡类型", enumType="queue_card_type")
    private Integer cardType;
    
    @FieldConfig(title="顾客", valueField="mobile")
	@ManyToOne
	@JoinColumn(name="customer_id")
    private Customer customer;
    
	@FieldConfig(title="姓名")
    private String name;
    
	@FieldConfig(title="电话")
    private String phone;
    
	@FieldConfig(title="开始排号时间")
	@Temporal(TemporalType.TIMESTAMP)
    private Date startTime;
    
	@FieldConfig(title="结束排号时间")
	@Temporal(TemporalType.TIMESTAMP)
    private Date endTime;
    
	/**
	 * 状态： 0：未使用 1：已使用（已完成） 2:已作废
	 */
    @FieldConfig(title="状态", enumType="QueueCard_status")
    private Byte status;
    
	@FieldConfig(title="提醒次数")
    private Integer callTimes;

	public Shop getShop() {
		return shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	public Integer getCardNo() {
		return cardNo;
	}

	public void setCardNo(Integer cardNo) {
		this.cardNo = cardNo;
	}

	public Integer getCardType() {
		return cardType;
	}

	public void setCardType(Integer cardType) {
		this.cardType = cardType;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public Byte getStatus() {
		return status;
	}

	public void setStatus(Byte status) {
		this.status = status;
	}

	public Integer getCallTimes() {
		return callTimes;
	}

	public void setCallTimes(Integer callTimes) {
		this.callTimes = callTimes;
	}
    
}
