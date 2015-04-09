package com.dearcom.customer.entity;
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

@Entity
@Table(name="com_MscoreLog")
@ClassConfig(title="会员积分日志", isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class MscoreLog extends BaseEntity{
	
    @FieldConfig(title="会员", valueField="cardId")
	@ManyToOne
	@JoinColumn(name="vip")
    private Mcard mcard;
    
    @FieldConfig(title="交易类型", enumType="com_MscoreLog_type")
    private Byte type;
    
	@FieldConfig(title="交易积分")
    private Integer score;
    
	@FieldConfig(title="剩余积分")
    private Integer totalScore;
    
	@FieldConfig(title="交易时间")
	@Temporal(TemporalType.TIMESTAMP)
    private Date time;
    
	@FieldConfig(title="交易说明",maxlength=32)
    private String action;

	public Mcard getMcard() {
		return mcard;
	}

	public void setMcard(Mcard mcard) {
		this.mcard = mcard;
	}

	public Byte getType() {
		return type;
	}

	public void setType(Byte type) {
		this.type = type;
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public Integer getTotalScore() {
		return totalScore;
	}

	public void setTotalScore(Integer totalScore) {
		this.totalScore = totalScore;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}
    
}
