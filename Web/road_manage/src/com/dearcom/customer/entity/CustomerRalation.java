package com.dearcom.customer.entity;
import java.util.Date;

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

import com.dearcom.mall.entity.Mall;
import com.dearcom.mall.entity.Shop;

@Entity
@Table(name="com_CustomerRelation")
@ClassConfig(title="商铺客户列表", isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class CustomerRalation extends BaseEntity{
	
    @FieldConfig(title="客户", valueField="mobile")
	@ManyToOne
	@JoinColumn(name="cust_id")
    private Customer customer;
    
    @FieldConfig(title="终端", valueField="mac")
	@ManyToOne
	@JoinColumn(name="term_id")
    private Terminal terminal;
    
    @FieldConfig(title="商铺", valueField="name")
    @ManyToOne
    @JoinColumn(name="shop_id")
    private Shop shop;
   
    @FieldConfig(title="商场", valueField="name")
	@ManyToOne
	@JoinColumn(name="mall_id")
    private Mall mall;
    
    
	@FieldConfig(title="创建时间")
	@Temporal(TemporalType.TIMESTAMP)
    private Date createTime;
    
	/**
	 * 0:未收藏  1:已收藏
	 */
	@FieldConfig(title="是否收藏" ,enumType="com_customerRalationType")
    private Byte keep;

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Terminal getTerminal() {
		return terminal;
	}

	public void setTerminal(Terminal terminal) {
		this.terminal = terminal;
	}

	public Shop getShop() {
		return shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	public Mall getMall() {
		return mall;
	}

	public void setMall(Mall mall) {
		this.mall = mall;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Byte getKeep() {
		return keep;
	}

	public void setKeep(Byte keep) {
		this.keep = keep;
	}
    
}
