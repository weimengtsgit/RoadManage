package org.ever4j.system.entity;

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
 * 枚举键值表
 * @author Administrator
 *
 */
@Entity
@Table(name = "SYS_ENUM_VALUE")
@ClassConfig(title="枚举值")
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler"})
public class SysEnumValue extends BaseEntity{

	/**
	 * 枚举-键
	 */
	@FieldConfig(title="枚举键", validate="required", maxlength=16)
	@Column(nullable = false, length = 16)
	private String enumKey;
	
	/**
	 * 枚举-值
	 */
	@FieldConfig(title="枚举值", validate="required", maxlength=32)
	@Column(nullable = false, length = 32)
	private String enumVal;

	/**
	 * 枚举序列
	 */
	@FieldConfig(title="枚举序列",isShowSearch=false, maxlength=3)
	@Column(columnDefinition="INTEGER default 0")
	private Integer enumSeq;
	
	/**
	 * 枚举对象
	 */
	@FieldConfig(title="枚举对象", valueField="enumDesc", validate="required")
	@ManyToOne
	@JoinColumn(nullable = false)
	private SysEnum enumId;
	
	public String getEnumKey() {
		return enumKey;
	}

	public void setEnumKey(String enumKey) {
		this.enumKey = enumKey;
	}

	public String getEnumVal() {
		return enumVal;
	}

	public void setEnumVal(String enumVal) {
		this.enumVal = enumVal;
	}

	public Integer getEnumSeq() {
		return enumSeq;
	}

	public void setEnumSeq(Integer enumSeq) {
		this.enumSeq = enumSeq;
	}

	public SysEnum getEnumId() {
		return enumId;
	}

	public void setEnumId(SysEnum enumId) {
		this.enumId = enumId;
	}
}
