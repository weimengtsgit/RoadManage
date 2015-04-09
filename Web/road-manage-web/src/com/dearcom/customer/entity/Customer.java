package com.dearcom.customer.entity;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonBackReference;
import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonIgnoreType;
import org.codehaus.jackson.annotate.JsonManagedReference;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;

@Entity
@Table(name="com_Customer")
@ClassConfig(title="顾客信息", isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list","lastUseTerm"})
public class Customer extends BaseEntity{
	
	@FieldConfig(title="手机号")
    private String mobile;
    
	@FieldConfig(title="微信号")
    private String weixin;
    
	@FieldConfig(title="QQ号")
    private String qq;
    
	@FieldConfig(title="VIP号")
    private String vip;
    
	@FieldConfig(title="车牌号")
    private String carNum;
    
	@FieldConfig(title="年龄")
    private Integer age;
    
    @FieldConfig(title="性别", enumType="sex")
    private Byte sex;
    
	@FieldConfig(title="创建时间")
	@Temporal(TemporalType.TIMESTAMP)
    private Date createTime;
    
	@FieldConfig(title="密码",isShowInput=false,isShowList=false,isShowSearch=false)
    private String password;
    
	@FieldConfig(title="兴趣爱好",isShowList=false,isShowSearch=false)
    private String interest;
    
	@FieldConfig(title="轨迹",isShowList=false,isShowSearch=false)
    private Integer trackId;
    
    @FieldConfig(title="最近一次使用终端", valueField="mac")
	@ManyToOne
	@JoinColumn(name="lastUseTerm")
    private Terminal lastUseTerm;
    
	@FieldConfig(title="账户余额")
    private Integer acctBalance;

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getWeixin() {
		return weixin;
	}

	public void setWeixin(String weixin) {
		this.weixin = weixin;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getVip() {
		return vip;
	}

	public void setVip(String vip) {
		this.vip = vip;
	}

	public String getCarNum() {
		return carNum;
	}

	public void setCarNum(String carNum) {
		this.carNum = carNum;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public Byte getSex() {
		return sex;
	}

	public void setSex(Byte sex) {
		this.sex = sex;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getInterest() {
		return interest;
	}

	public void setInterest(String interest) {
		this.interest = interest;
	}

	public Integer getTrackId() {
		return trackId;
	}

	public void setTrackId(Integer trackId) {
		this.trackId = trackId;
	}

	public Terminal getLastUseTerm() {
		return lastUseTerm;
	}

	public void setLastUseTerm(Terminal lastUseTerm) {
		this.lastUseTerm = lastUseTerm;
	}

	public Integer getAcctBalance() {
		return acctBalance;
	}

	public void setAcctBalance(Integer acctBalance) {
		this.acctBalance = acctBalance;
	}
    
}
