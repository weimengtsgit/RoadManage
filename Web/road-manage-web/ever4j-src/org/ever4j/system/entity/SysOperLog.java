package org.ever4j.system.entity;

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
@Table(name = "SYS_OPER_LOG")
@ClassConfig(title = "操作日志")
@JsonIgnoreProperties(value = { "hibernateLazyInitializer", "handler" })
public class SysOperLog extends BaseEntity {

	/**
	 * 操作用户
	 */
	@FieldConfig(title = "用户", valueField = "name", validate="required")
	@ManyToOne
	@JoinColumn()
	private SysUser operUser;

	/**
	 * 操作动作:保存/修改/删除/查询***信息
	 */
	@FieldConfig(title = "操作动作")
	@Column(nullable = false, length = 32)
	private String operAction;
	/**
	 * 操作动作:保存/修改/删除/查询***信息
	 */
	@FieldConfig(title = "操作模块")
	@Column(nullable = false, length = 128)
	private String operModule;
	//插入时间
	@Temporal(TemporalType.TIMESTAMP )
	@Column(updatable=false,columnDefinition="TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
	protected Date createTime;
	/**
	 * 操作结果:成功,失败
	 */
	@FieldConfig(title = "操作结果")
	@Column(nullable = false, length = 8)
	private String operResult;

	@FieldConfig(title = "用户IP", validate="required")
	@Column(nullable = false, length = 32)
	private String ip;
	
	/**
	 * 操作内容
	 * 插入[id:x;姓名:y]
	 * 修改[id:x;姓名:y]
	 * 删除[id:x]
	 * 查询[id:x;姓名:y]
	 */
	@FieldConfig(title = "操作内容", isShowSearch = false, isShowList = false,maxlength=2000)
	@Column(nullable = false, length = 2000)
	private String operContent;

	public SysOperLog() {
		super();
	}

	public SysOperLog(SysUser operUser, String operAction, String operModule,
			String operResult, String ip, String operContent) {
		super();
		this.operUser = operUser;
		this.operAction = operAction;
		this.operModule = operModule;
		this.operResult = operResult;
		this.ip = ip;
		this.operContent = operContent;
		this.createTime = new Date();
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public SysUser getOperUser() {
		return operUser;
	}

	public void setOperUser(SysUser operUser) {
		this.operUser = operUser;
	}

	public String getOperAction() {
		return operAction;
	}

	public void setOperAction(String operAction) {
		this.operAction = operAction;
	}

	public String getOperResult() {
		return operResult;
	}

	public void setOperResult(String operResult) {
		this.operResult = operResult;
	}

	public String getOperContent() {
		return operContent;
	}

	public void setOperContent(String operContent) {
		this.operContent = operContent;
	}

	public String getOperModule() {
		return operModule;
	}

	public void setOperModule(String operModule) {
		this.operModule = operModule;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
}
