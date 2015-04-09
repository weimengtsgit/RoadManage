package com.dearcom.mall.entity;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.base4j.orm.hibernate.BaseEntity;
import org.springframework.format.annotation.DateTimeFormat;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;
import javax.persistence.Table;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="com_Device")
@ClassConfig(title="无线AP设备", isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class ApDevice extends BaseEntity{
	
	
	@Column(updatable=false)
	private Boolean isDel;
	
	
	
    @FieldConfig(title="商场", valueField="name")
	@ManyToOne
	@JoinColumn(name="mall_id")
    private Mall mall;
    
	@FieldConfig(title="AP MAC")
    private String mac;
    
	@FieldConfig(title="设备位置")
    private String location;
    
	@FieldConfig(title="设备IP")
    private String ip;
    
	@FieldConfig(title="设备详细描述" , maxlength=31,isShowList=false,isShowSearch=false)
    private String description;
    
	/**
	 * 0:已关闭 1: 运行正常 2:配置维护中
	 */
	@FieldConfig(title="设备运行状态",enumType="deviceStatus",isShowInput=false)
    private Byte status;
    
	@FieldConfig(title="创建时间")
	@Temporal(TemporalType.TIMESTAMP)
    private Date createTime;
    
	@FieldConfig(title="设备出厂SN")
    private String sn;

	public Mall getMall() {
		return mall;
	}

	public void setMall(Mall mall) {
		this.mall = mall;
	}

	public String getMac() {
		return mac;
	}

	public void setMac(String mac) {
		this.mac = mac;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Byte getStatus() {
		return status;
	}

	public void setStatus(Byte status) {
		this.status = status;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getSn() {
		return sn;
	}

	public void setSn(String sn) {
		this.sn = sn;
	}

	public Boolean getIsDel() {
		return isDel;
	}

	public void setIsDel(Boolean isDel) {
		this.isDel = isDel;
	}
    
}
