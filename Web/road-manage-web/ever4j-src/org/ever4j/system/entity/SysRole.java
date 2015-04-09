package org.ever4j.system.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.base4j.orm.hibernate.BaseEntity;

import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

/**
 * 角色
 * 
 * @author 潘保涛
 * 
 */

@Entity
@Table(name = "SYS_ROLE")
@ClassConfig(title="角色")
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler","lastUpdateUser","insertUser"})
public class SysRole extends BaseEntity {

	
	@Column(updatable=false)
	private Boolean isDel;
	/**
	 * 角色名称
	 */
	@FieldConfig(title="角色名称", validate="required", maxlength=32)
	@Column(unique = true, nullable = false, length = 32)
	private String roleName;

	/**
	 * 创建用户
	 */
	@FieldConfig(title="创建用户",valueField="name")
	@ManyToOne
	@Fetch(FetchMode.JOIN)
	@JoinColumn(name = "insert_user",updatable=false)
	private SysUser insertUser;
	
	/**
	 * 角色描述
	 */
	@FieldConfig(title="角色描述", maxlength=64)
	@Column(unique = true, length = 64)
	private String roleDesc;

	/**
	 * 是否可用：0：否，1：是
	 */
	@FieldConfig(title="是否可用", enumType="isOrnot",isShowSearch=false,isShowInput=false,isShowList=false)
	@Column(length = 1,columnDefinition="varchar(1) default '1'")
	private String enabled;
	
	/**
	 * 角色类型：1：超级管理员，2：商场管理员，3：商铺管理员
	 */
	@FieldConfig(title="角色类型", enumType="userType",validate="required")
	@Column(name = "role_type", nullable = false, length = 1)
	private String roleType = "3";
	/**
	 * 是否公共角色：0：否  1：是 ，超级管理员和商场管理员创建的为公共角色，如果是公共角色，则商铺管理员不可修改
	 */
	@FieldConfig(title="是否公共角色", enumType="isOrnot",validate="required")
	@Column(name = "common",updatable=false)
	private String common = "0";

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRoleDesc() {
		return roleDesc;
	}

	public void setRoleDesc(String roleDesc) {
		this.roleDesc = roleDesc;
	}

	public String getEnabled() {
		return enabled;
	}

	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}

	public String getRoleType() {
		return roleType;
	}

	public void setRoleType(String roleType) {
		this.roleType = roleType;
	}

	public SysUser getInsertUser() {
		return insertUser;
	}

	public void setInsertUser(SysUser insertUser) {
		this.insertUser = insertUser;
	}

	public String getCommon() {
		return common;
	}

	public void setCommon(String common) {
		this.common = common;
	}

	public Boolean getIsDel() {
		return isDel;
	}

	public void setIsDel(Boolean isDel) {
		this.isDel = isDel;
	}
}
