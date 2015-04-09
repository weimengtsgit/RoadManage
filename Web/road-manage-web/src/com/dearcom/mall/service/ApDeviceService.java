package com.dearcom.mall.service;

import javax.annotation.Resource;

import com.dearcom.mall.entity.ApDevice;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ApDeviceService extends BaseService<ApDevice> {
	@Override
	@Resource(name="apDeviceDao")
	public void setBaseDao(BaseDao<ApDevice> baseDao){
		this.baseDao = baseDao;
	}
}
