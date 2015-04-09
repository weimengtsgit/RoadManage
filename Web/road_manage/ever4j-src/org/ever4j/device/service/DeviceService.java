package org.ever4j.device.service;

import javax.annotation.Resource;

import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import org.ever4j.device.entity.Device;

@Service
@Transactional
public class DeviceService extends BaseService<Device> {
	@Override
	@Resource(name="deviceDao")
	public void setBaseDao(BaseDao<Device> baseDao){
		this.baseDao = baseDao;
	}
}
