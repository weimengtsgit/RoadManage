package com.dearcom.mall.entity;
import java.io.Serializable;

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
import org.ever4j.system.entity.SysMenu;

@Entity
@Table(name="com_ShopClass")
@ClassConfig(title="商铺类别", isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class ShopClass extends BaseEntity {
	
	/**
	 * 1=一级分类  2=二级分类
	 */
	@FieldConfig(title="分类级别",enumType="shopClass_level")
    private Integer level;
    
	@FieldConfig(title="父类别",valueField="name")
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="parent_id")
	private ShopClass parentType;
    
	@FieldConfig(title="类别名称")
    private String name;
    
	@FieldConfig(title="类别描述")
    private String des;
    
	@FieldConfig(title="排序",isShowInput=false,isShowSearch=false)
    private Integer sort;
    
	@FieldConfig(title="排序",isShowInput=false,isShowSearch=false,isShowList=false)
	@Column(updatable=false)
	private Boolean isDel;

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	

	public ShopClass getParentType() {
		return parentType;
	}

	public void setParentType(ShopClass parentType) {
		this.parentType = parentType;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public Boolean getIsDel() {
		return isDel;
	}

	public void setIsDel(Boolean isDel) {
		this.isDel = isDel;
	}
    
}
