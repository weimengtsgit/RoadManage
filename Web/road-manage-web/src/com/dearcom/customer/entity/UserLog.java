package com.dearcom.customer.entity;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;

@Entity
@Table(name="com_UserLog")
@ClassConfig(title="用户上网日志", isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class UserLog extends BaseEntity{
	
	@FieldConfig(title="终端MAC")
    private String termMac;
    
	@FieldConfig(title="认证名")
    private String authName;
    
	@FieldConfig(title="终端IP")
    private String termIp;
    
	@FieldConfig(title="AP设备MAC")
    private String apMac;
    
	@FieldConfig(title="上线时间")
	@Temporal(TemporalType.TIMESTAMP)
    private Date onlineTime;
    
	@FieldConfig(title="下线时间")
	@Temporal(TemporalType.TIMESTAMP)
    private Date offlineTime;
    
	@FieldConfig(title="上网总时长(秒)")
    private Integer totalTime;
    
	@FieldConfig(title="上网总流量(MB)")
    private Integer totalFlow;
    
	@FieldConfig(title="费用")
    private Integer totalFee;
    
	@FieldConfig(title="唯一标识")
    private String sessionId;

	public String getTermMac() {
		return termMac;
	}

	public void setTermMac(String termMac) {
		this.termMac = termMac;
	}

	public String getAuthName() {
		return authName;
	}

	public void setAuthName(String authName) {
		this.authName = authName;
	}

	public String getTermIp() {
		return termIp;
	}

	public void setTermIp(String termIp) {
		this.termIp = termIp;
	}

	public String getApMac() {
		return apMac;
	}

	public void setApMac(String apMac) {
		this.apMac = apMac;
	}

	public Date getOnlineTime() {
		return onlineTime;
	}

	public void setOnlineTime(Date onlineTime) {
		this.onlineTime = onlineTime;
	}

	public Date getOfflineTime() {
		return offlineTime;
	}

	public void setOfflineTime(Date offlineTime) {
		this.offlineTime = offlineTime;
	}

	public Integer getTotalTime() {
		return totalTime;
	}

	public void setTotalTime(Integer totalTime) {
		this.totalTime = totalTime;
	}

	public Integer getTotalFlow() {
		return totalFlow;
	}

	public void setTotalFlow(Integer totalFlow) {
		this.totalFlow = totalFlow;
	}

	public Integer getTotalFee() {
		return totalFee;
	}

	public void setTotalFee(Integer totalFee) {
		this.totalFee = totalFee;
	}

	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}


}
