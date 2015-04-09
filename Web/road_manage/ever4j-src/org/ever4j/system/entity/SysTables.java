package org.ever4j.system.entity;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.base4j.orm.hibernate.BaseEntity;

import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;

@Entity
@Table(name="SYS_TABLES")
@ClassConfig(title="当前所有表", isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class SysTables extends BaseEntity{
	
	@FieldConfig(title="名称")
    private String tableName;

	@FieldConfig(title="描述")
	private String tableDesc;
	
	public SysTables() {
		super();
	}

	public SysTables(String tableName, String tableDesc) {
		super();
		this.tableName = tableName;
		this.tableDesc = tableDesc;
	}
	
	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getTableDesc() {
		return tableDesc;
	}

	public void setTableDesc(String tableDesc) {
		this.tableDesc = tableDesc;
	}
}
