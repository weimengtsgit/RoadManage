package com.dearcom.customer.entity;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;

import com.dearcom.mall.entity.Mall;
import com.dearcom.mall.entity.Shop;
import com.dearcom.mall.entity.ShopPromotion;

@Entity
@Table(name="com_MemberPromotion")
@ClassConfig(title="会员优惠", isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class MemberPromotion extends BaseEntity{
	
    @FieldConfig(title="会员", valueField="mobile")
	@ManyToOne
	@JoinColumn(name="member_id")
    private Customer customer;
    
    @FieldConfig(title="商场", valueField="name")
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="mall_id")
    private Mall mall;
    
    @FieldConfig(title="商铺", valueField="name")
    @ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="shop_id")
    private Shop shop;
    
    @FieldConfig(title="商铺优惠", valueField="intro")
	@ManyToOne
	@JoinColumn(name="promotion_id")
    private ShopPromotion shopPromotion;
    
	@FieldConfig(title="验证码")
    private String validation;
    
	/**
	 * 优惠券状态： 0.领取未消费 1.已消费 2.过期未消费
	 */
	@FieldConfig(title="状态",enumType="MemberPromotion_status")
    private Byte status;

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

	public Shop getShop() {
		return shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	public ShopPromotion getShopPromotion() {
		return shopPromotion;
	}

	public void setShopPromotion(ShopPromotion shopPromotion) {
		this.shopPromotion = shopPromotion;
	}

	public String getValidation() {
		return validation;
	}

	public void setValidation(String validation) {
		this.validation = validation;
	}

	public Byte getStatus() {
		return status;
	}

	public void setStatus(Byte status) {
		this.status = status;
	}
    
}
