package org.ever4j.system.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.base4j.orm.hibernate.BaseEntity;

import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;

/**
 * 枚举表
 * @author Administrator
 *
 */
@Entity
@Table(name = "SYS_ENUM")
@ClassConfig(title="枚举实体")
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler"})
public class SysEnum extends BaseEntity{

	/**
	 * 枚举标识
	 */
	@FieldConfig(title="枚举标识", validate="required")
	@Column(unique = true, nullable = false)
	private String enumName;
	
	/**
	 * 枚举名称
	 */
	@FieldConfig(title="枚举名称",isShowSearch=false,maxlength=64)
	@Column(length = 64)
	private String enumDesc;

	public String getEnumName() {
		return enumName;
	}

	public void setEnumName(String enumName) {
		this.enumName = enumName;
	}

	public String getEnumDesc() {
		return enumDesc;
	}

	public void setEnumDesc(String enumDesc) {
		this.enumDesc = enumDesc;
	}
}
