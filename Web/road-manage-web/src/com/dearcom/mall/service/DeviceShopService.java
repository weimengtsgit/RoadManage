package com.dearcom.mall.service;

import javax.annotation.Resource;

import com.dearcom.mall.entity.DeviceShop;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class DeviceShopService extends BaseService<DeviceShop> {
	@Override
	@Resource(name="deviceShopDao")
	public void setBaseDao(BaseDao<DeviceShop> baseDao){
		this.baseDao = baseDao;
	}
}
