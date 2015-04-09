package com.dearcom.stat.service;

import javax.annotation.Resource;

import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dearcom.stat.entity.StatShop;

@Service
@Transactional
public class StatShopService extends BaseService<StatShop> {
	@Override
	@Resource(name = "statShopDao")
	public void setBaseDao(BaseDao<StatShop> baseDao) {
		this.baseDao = baseDao;
	}
}
