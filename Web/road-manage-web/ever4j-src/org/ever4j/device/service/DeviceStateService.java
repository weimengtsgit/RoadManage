package org.ever4j.device.service;

import javax.annotation.Resource;

import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import org.ever4j.device.entity.DeviceState;

@Service
@Transactional
public class DeviceStateService extends BaseService<DeviceState> {
	@Override
	@Resource(name="deviceStateDao")
	public void setBaseDao(BaseDao<DeviceState> baseDao){
		this.baseDao = baseDao;
	}
}
