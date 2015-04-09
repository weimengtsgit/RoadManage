package org.ever4j.system.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.base4j.orm.hibernate.BaseEntity;

import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;

/**
 * 登录、退出日志表
 * @author Administrator
 *
 */
@Entity
@Table(name = "SYS_LOG")
@ClassConfig(title="登录日志")
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler"})
public class SysLog extends BaseEntity{

	/**
	 * 用户
	 */
	@FieldConfig(title="用户",valueField="username", validate="required")
	@ManyToOne
	@JoinColumn(nullable = false)
	private SysUser logUser;
	
	/**
	 * 用户所在IP
	 */
	@FieldConfig(title="用户所在IP", validate="required", maxlength=32)
	@Column(nullable = false, length = 32)
	private String logIp;
	

	/**
	 * 登录类型 1:登录，2:退出
	 */
	@FieldConfig(title="登录类型", enumType="logType", maxlength=2)
	@Column(length = 2)
	private String logType;
	
	/**
	 * 登录结果类型 1:成功，2:失败
	 */
	@FieldConfig(title="登录结果", enumType="logResultType")
	@Column(nullable = false, length = 2)
	private String logResultType;
	
	/**
	 * 时间
	 */
	@FieldConfig(title="登录时间", validate="required")
	@Column(nullable = false)
	private Date logTime;
	
	public SysLog() {
		super();
	}

	public SysLog(SysUser logUser, String logIp, String logType, String logResultType, Date logTime) {
		super();
		this.logUser = logUser;
		this.logIp = logIp;
		this.logType = logType;
		this.logResultType = logResultType;
		this.logTime = logTime;
	}



	public String getLogType() {
		return logType;
	}

	public void setLogType(String logType) {
		this.logType = logType;
	}

	public String getLogResultType() {
		return logResultType;
	}

	public void setLogResultType(String logResultType) {
		this.logResultType = logResultType;
	}

	public SysUser getLogUser() {
		return logUser;
	}

	public void setLogUser(SysUser logUser) {
		this.logUser = logUser;
	}

	public String getLogIp() {
		return logIp;
	}

	public void setLogIp(String logIp) {
		this.logIp = logIp;
	}

	public Date getLogTime() {
		return logTime;
	}

	public void setLogTime(Date logTime) {
		this.logTime = logTime;
	}
}
