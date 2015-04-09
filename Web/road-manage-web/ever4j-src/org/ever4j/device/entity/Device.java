package org.ever4j.device.entity;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.base4j.orm.hibernate.BaseEntity;

import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;

@Entity
@Table(name="sys_device")
@ClassConfig(title="设备信息", isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class Device extends BaseEntity{
	
	@FieldConfig(title="设备名称",validate="required")
    private String deviceName;
    
	@FieldConfig(title="设备编号",validate="required",childClass=DeviceState.class)
    private String deviceNum;
    
	@FieldConfig(title="设备类型",validate="required", enumType="deviceType")
	private String deviceType;
	@FieldConfig(title="是否受控",validate="required",enumType="isOrNot")
	private String controlledState;
	
	@FieldConfig(title="设备状态",isShowInput=false,enumType="device_state")
	private Integer deviceState;
	
	@FieldConfig(title="应用状态",isShowInput=false,enumType="device_state")
	private Integer appState;
	
	@FieldConfig(title="设备应用",maxlength=300,isShowList=false,isShowSearch=false)
	private String apps;
	
	@FieldConfig(title="设备IP",validate="required")
    private String deviceIp;
    
	@FieldConfig(title="登陆名",isShowList=false,isShowSearch=false)
    private String loginName;
    
	@FieldConfig(title="登陆密码",isShowList=false,isShowSearch=false)
    private String loginPwd;
	
	@FieldConfig(title="设备组别",validate="required", enumType="deviceGroup")
	private String deviceGroup;
    
	@FieldConfig(title="设备描述",maxlength=300,isShowList=false,isShowSearch=false)
    private String des;

	public String getDeviceName() {
		return deviceName;
	}

	public void setDeviceName(String deviceName) {
		this.deviceName = deviceName;
	}

	public String getDeviceNum() {
		return deviceNum;
	}

	public void setDeviceNum(String deviceNum) {
		this.deviceNum = deviceNum;
	}

	public String getControlledState() {
		return controlledState;
	}

	public void setControlledState(String controlledState) {
		this.controlledState = controlledState;
	}

	public String getApps() {
		return apps;
	}

	public void setApps(String apps) {
		this.apps = apps;
	}

	public String getDeviceIp() {
		return deviceIp;
	}

	public void setDeviceIp(String deviceIp) {
		this.deviceIp = deviceIp;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getLoginPwd() {
		return loginPwd;
	}

	public void setLoginPwd(String loginPwd) {
		this.loginPwd = loginPwd;
	}

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
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

	public String getDeviceType() {
		return deviceType;
	}

	public void setDeviceType(String deviceType) {
		this.deviceType = deviceType;
	}

	public String getDeviceGroup() {
		return deviceGroup;
	}

	public void setDeviceGroup(String deviceGroup) {
		this.deviceGroup = deviceGroup;
	}
}
