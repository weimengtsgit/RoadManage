package com.dearcom.report.entity;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;

@Entity
@Table(name="com_ReportHour")
@ClassConfig(title="时段报表", isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class ReportHour extends BaseEntity{
	
	@FieldConfig(title="日期")
    private Date date;
    
	@FieldConfig(title="时段")
    private String time;
    
	@FieldConfig(title="在线用户数")
    private int onlineUserCount;

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getOnlineUserCount() {
		return onlineUserCount;
	}

	public void setOnlineUserCount(int onlineUserCount) {
		this.onlineUserCount = onlineUserCount;
	}

	
    
}
