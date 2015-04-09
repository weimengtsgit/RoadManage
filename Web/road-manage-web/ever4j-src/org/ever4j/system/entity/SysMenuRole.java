package org.ever4j.system.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.base4j.orm.hibernate.BaseEntity;

import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;

/**
 * 角色权限表
 * 
 * @author 潘保涛
 * 
 */
@Entity
@Table(name = "SYS_MENU_ROLE")
@ClassConfig(title="角色权限", isShowMenu=false)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler"})
public class SysMenuRole extends BaseEntity {

	@FieldConfig(title="角色ID")
	@Column(name="role_id", nullable = false, length = 11)
	private Integer roleId;

	@FieldConfig(title="菜单ID", enumType="")
	@Column(name="menu_id", nullable = false, length = 11)
	private Integer menuId;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public Integer getMenuId() {
		return menuId;
	}

	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
	}
}
