package org.ever4j.system.entity;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.base4j.orm.hibernate.BaseEntity;

import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;

@Entity
@Table(name="SYS_SHEET")
@ClassConfig(title="分表配置", isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class SysSheet extends BaseEntity{
	
	@FieldConfig(title="基础表名",validate="required")
    @Column(length=64)
	private String tableName;
    
	@FieldConfig(title="分表周期",validate="required",enumType="sheetCycle")
	@Column(length=16)
	private String cycle;
    
	@FieldConfig(title="起始时间",validate="required")
	@Temporal(TemporalType.TIMESTAMP)
    private Date startTime;

	public String getTableName() {
		return tableName;
	}

	public String getCycle() {
		return cycle;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public void setCycle(String cycle) {
		this.cycle = cycle;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
}
