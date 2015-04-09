package org.ever4j.sysconf.entity;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.base4j.orm.hibernate.BaseEntity;

import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;
import org.ever4j.system.entity.SysEnum;

@Entity
@Table(name="sys_conf_Iitem")
@ClassConfig(title="配置项", isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class SysConfIitem extends BaseEntity{
	
	@FieldConfig(title="配置类型",valueField="confName")
	@ManyToOne
	private SysConfType confType;
	
	@FieldConfig(title="配置项名称")
    private String itemName;
    
	@FieldConfig(title="配置项key")
    private String itemKey;
    
	@FieldConfig(title="配置项值")
    private String itemValue;
    
	@FieldConfig(title="值类型",enumType="sys_conf_value_type")
    private String valueType;
    
	@FieldConfig(title="值枚举类型",valueField="enumDesc")
	@ManyToOne
    private SysEnum enumType;
    
	@FieldConfig(title="配置项描述",maxlength=200)
	@Column(length=200)
    private String des;

	public SysConfType getConfType() {
		return confType;
	}

	public void setConfType(SysConfType confType) {
		this.confType = confType;
	}

	public String getValueType() {
		return valueType;
	}

	public void setValueType(String valueType) {
		this.valueType = valueType;
	}

	public SysEnum getEnumType() {
		return enumType;
	}

	public void setEnumType(SysEnum enumType) {
		this.enumType = enumType;
	}

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getItemKey() {
		return itemKey;
	}

	public void setItemKey(String itemKey) {
		this.itemKey = itemKey;
	}

	public String getItemValue() {
		return itemValue;
	}

	public void setItemValue(String itemValue) {
		this.itemValue = itemValue;
	}
	
	@Override
	public boolean equals(Object obj) {
		if(obj != null){
			SysConfIitem sys = (SysConfIitem)obj;
			if(sys.getItemKey() == this.itemKey){
				
			}
		}
		return super.equals(obj);
	}
}
