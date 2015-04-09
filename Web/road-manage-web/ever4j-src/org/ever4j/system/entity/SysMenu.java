package org.ever4j.system.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;

/**
 * 菜单
 * @author 潘保涛
 *
 */


@Entity
@Table(name="SYS_MENU")
@ClassConfig(title="菜单")
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler","lastUpdateUser","insertUser"})
public class SysMenu extends BaseEntity{

	/**
	 * 菜单描述-->汉语
	 */
	@FieldConfig(title="菜单名称", validate="required", maxlength=20)
	@Column(nullable=false,length=32)
	private String menuDesc;
	
	/**
	 * 菜单类型--> 1：菜单  2:链接 3:按钮
	 */
	@FieldConfig(title="菜单类型",validate="required",enumType="menuType")
	@Column(nullable=false,length=1)
	private String menuType;
	
	/**
	 * 菜单名称-->英语
	 */
	@FieldConfig(title="菜单URL",isShowSearch=false, maxlength=128)
	@Column(length=128)
	private String menuName;
	
	/**
	 * 菜单序列
	 */
	@FieldConfig(title="菜单序列",isShowSearch=false, maxlength=3)
	@Column(length=3,columnDefinition="INTEGER default 0")
	private Integer menuSeq;
	
	/**
	 * 权限名称ROLE_
	 */
	@FieldConfig(title="权限名称", isShowSearch=false,isShowInput=false,isShowList=true,maxlength=128)
	@Column(length=128)
	private String authorityName;
	
	/**
	 * 是否可用：0：否，1：是  如果为否，则在菜单栏禁止的点击 （visible =0 则不显示）
	 */
	@FieldConfig(title="是否可用",enumType="isOrNot")
	@Column(length=1,columnDefinition="varchar(1) default '1'")
	private String enabled;
	/**
	 * 是否可用：0：否，1：是  如果为否，则在菜单栏禁止的点击 （visible =0 则不显示）
	 */
	@FieldConfig(title="是否可见",enumType="isOrNot")
	@Column(length=1,columnDefinition="varchar(1) default '1'")
	private String visible;
	
	@FieldConfig(title="是否IFRAME",enumType="isOrNot")
	@Column(length=1,columnDefinition="INTEGER default 2")
	private Integer external;
	
	@FieldConfig(title="打开目标",enumType="target")
	@Column(length=16,columnDefinition="varchar(16) default 'navTab'")
	private String target;
	
	@FieldConfig(title="图标")
	private String icon;
	@FieldConfig(title="简介")
	private String summary;
	
	@FieldConfig(title="上级菜单",valueField="menuDesc")
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="parent_id")
	private SysMenu parentId;
	
	public SysMenu() {
		super();
	}

	public SysMenu(Integer id,String menuDesc, String menuType, String menuName, Integer menuSeq, String authorityName, String enabled, SysMenu parentId) {
		this.id = id;
		this.menuDesc = menuDesc;
		this.menuType = menuType;
		this.menuName = menuName;
		this.menuSeq = menuSeq;
		this.authorityName = authorityName;
		this.enabled = enabled;
		this.parentId = parentId;
	}



	public SysMenu getParentId() {
		return parentId;
	}

	public void setParentId(SysMenu parentId) {
		this.parentId = parentId;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getMenuDesc() {
		return menuDesc;
	}

	public void setMenuDesc(String menuDesc) {
		this.menuDesc = menuDesc;
	}

	public String getMenuType() {
		return menuType;
	}

	public void setMenuType(String menuType) {
		this.menuType = menuType;
	}

	public Integer getMenuSeq() {
		return menuSeq;
	}

	public void setMenuSeq(Integer menuSeq) {
		this.menuSeq = menuSeq;
	}

	public String getAuthorityName() {
		return authorityName;
	}

	public void setAuthorityName(String authorityName) {
		this.authorityName = authorityName;
	}

	public String getEnabled() {
		return enabled;
	}

	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((this.id == null) ? 0 : this.id.hashCode());
		return result;
	}

	public Integer getExternal() {
		return external;
	}

	public void setExternal(Integer external) {
		this.external = external;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		final SysMenu other = (SysMenu) obj;
		if (id != other.id)
			return false;
		return true;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getVisible() {
		return visible;
	}

	public void setVisible(String visible) {
		this.visible = visible;
	}
}
