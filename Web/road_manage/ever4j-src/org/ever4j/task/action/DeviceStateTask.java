package org.ever4j.task.action;

import java.util.List;

import javax.annotation.Resource;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.ever4j.device.entity.Device;
import org.ever4j.device.entity.DeviceState;
import org.ever4j.device.service.DeviceService;
import org.ever4j.device.service.DeviceStateService;
import org.ever4j.utils.DeviceMonitor;

public class DeviceStateTask {

	@Resource
	private DeviceService deviceService;
	@Resource
	private DeviceStateService deviceStateService;
	public void getDeviceState(){
		
		List<Device> deviceList = deviceService.findAll();
		for (int i = 0; i < deviceList.size(); i++) {
			Device d = deviceList.get(i);
			JSONObject  jso = DeviceMonitor.getActiveState(d.getDeviceIp(), d.getLoginName(), d.getLoginPwd(), d.getApps());
			
			DeviceState ds = JSON.toJavaObject(jso, DeviceState.class);
			ds.setDevice(d);
			deviceStateService.save(ds);
			d.setDeviceState(ds.getDeviceState());
			d.setAppState(ds.getAppState());
			deviceService.update(d);
		}
	}
}
