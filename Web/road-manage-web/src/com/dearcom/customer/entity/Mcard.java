package com.dearcom.customer.entity;
import java.util.Date;

import javax.persistence.Column;
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

@Entity
@Table(name="com_Mcard")
@ClassConfig(title="会员卡", isShowMenu=true )
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class Mcard extends BaseEntity{
	
	@Column(updatable=false)
	private Boolean isDel;
	
	@FieldConfig(title="会员卡号", validate="required",maxlength=16)
    private String cardId;
    
	/**
	 * 会员卡类型，1:IGO系统会员卡,2:商场会员卡
	 */
    @FieldConfig(title="会员卡类型",enumType="Mcard_type",validate="required")
    private Byte type;
    
    
	@FieldConfig(title="创建时间")
	@Temporal(TemporalType.TIMESTAMP)
    private Date createTime;
    
	@FieldConfig(title="积分",validate="required " ,min=0)
    private Integer score;
    
    @FieldConfig(title="顾客", valueField="mobile",validate="required")
	@ManyToOne
	@JoinColumn(name="customer_id")
    private Customer customer;

	public String getCardId() {
		return cardId;
	}

	public void setCardId(String cardId) {
		this.cardId = cardId;
	}

	public Byte getType() {
		return type;
	}

	public void setType(Byte type) {
		this.type = type;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Boolean getIsDel() {
		return isDel;
	}

	public void setIsDel(Boolean isDel) {
		this.isDel = isDel;
	}
    
}
