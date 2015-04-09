package com.dearcom.queue.entity;
import javax.persistence.Column;
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
@Table(name="com_QueueConfigShop")
@ClassConfig(title="商铺排队设置", isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class QueueConfigShop extends BaseEntity{
	
    @FieldConfig(title="商场", valueField="name")
	@ManyToOne
	@JoinColumn(name="mall_id")
    private Mall mall;
    
    @FieldConfig(title="商铺", valueField="name")
	@ManyToOne
	@JoinColumn(name="shop_id")
    private Shop shop;
    
    /**
     *  1：小(2-4人)
	 *	2：中（6-8人）
	 *	3：大（8人以上）
	 *	4：包间
     */
	@FieldConfig(title="排队卡类型",enumType="queue_card_type")
    private Integer type;
    
	@FieldConfig(title="排位间隔（分钟）")
	@Column(name="interval_time")
    private Integer interval;
    
	/**
	 * 排位提醒开关 0:关闭 1:开启
	 */
    @FieldConfig(title="排位提醒开关 ", enumType="isOrNot")
    private Byte isCall;
    
    
    /**
     * 提醒方式  1:会员消息 2:短信
     */
    @FieldConfig(title="提醒方式", enumType="QueueConfigShop_callType")
    private Byte callType;
    
    
    /**
     * 状态： 0:正常 1:暂停排号 2:终止排号
     */
    @FieldConfig(title="状态", enumType="QueueConfigShop_status")
    private Byte status;


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


	public Integer getType() {
		return type;
	}


	public void setType(Integer type) {
		this.type = type;
	}


	public Integer getInterval() {
		return interval;
	}


	public void setInterval(Integer interval) {
		this.interval = interval;
	}


	public Byte getIsCall() {
		return isCall;
	}


	public void setIsCall(Byte isCall) {
		this.isCall = isCall;
	}


	public Byte getCallType() {
		return callType;
	}


	public void setCallType(Byte callType) {
		this.callType = callType;
	}


	public Byte getStatus() {
		return status;
	}


	public void setStatus(Byte status) {
		this.status = status;
	}
    
}
