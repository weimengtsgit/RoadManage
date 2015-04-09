package org.ever4j.device.entity;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;

@Entity
@Table(name="sys_device_state")
@ClassConfig(title="设备状态信息", isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class DeviceState extends BaseEntity{
    @FieldConfig(title="设备", valueField="deviceName")
	@ManyToOne
	@JoinColumn(name="device")
    private Device device;
    
	@FieldConfig(title="CPU(%)",isShowSearch=false)
    private Double cpu;
    
	@FieldConfig(title="内存(total)",isShowSearch=false)
    private Integer total;
	
	@FieldConfig(title="内存(used)",isShowSearch=false)
	private Integer used;
	
	@FieldConfig(title="内存(buffer)",isShowSearch=false)
	private Integer buffer;
	
	@FieldConfig(title="内存(free)",isShowSearch=false)
	private Integer free;
    
	@FieldConfig(title="流量(Kbps)",isShowSearch=false)
    private Integer flow;
    
	@FieldConfig(title="设备状态",enumType="device_state")
	private Integer deviceState;
	
	@FieldConfig(title="应用状态",enumType="device_state")
    private Integer appState;
    
    
	@FieldConfig(title="异常应用",isShowList=false,isShowSearch=false)
    private String errApps;
	
	@FieldConfig(title="异常信息",isShowList=false,isShowSearch=false)
	private String msg;


	public Device getDevice() {
		return device;
	}


	public void setDevice(Device device) {
		this.device = device;
	}


	public Double getCpu() {
		return cpu;
	}


	public void setCpu(Double cpu) {
		this.cpu = cpu;
	}


	public Integer getTotal() {
		return total;
	}


	public void setTotal(Integer total) {
		this.total = total;
	}


	public Integer getUsed() {
		return used;
	}


	public void setUsed(Integer used) {
		this.used = used;
	}


	public Integer getBuffer() {
		return buffer;
	}


	public void setBuffer(Integer buffer) {
		this.buffer = buffer;
	}


	public Integer getFree() {
		return free;
	}


	public void setFree(Integer free) {
		this.free = free;
	}


	public Integer getFlow() {
		return flow;
	}


	public void setFlow(Integer flow) {
		this.flow = flow;
	}


	public Integer getDeviceState() {
		return deviceState;
	}


	public void setDeviceState(Integer deviceState) {
		this.deviceState = deviceState;
	}


	public Integer getAppState() {
		return appState;
	}


	public void setAppState(Integer appState) {
		this.appState = appState;
	}


	public String getMsg() {
		return msg;
	}


	public void setMsg(String msg) {
		this.msg = msg;
	}


	public String getErrApps() {
		return errApps;
	}


	public void setErrApps(String errApps) {
		this.errApps = errApps;
	}
    
}
